#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth   Cooper
date   2012.11.22
desc  MySQL Connection Pool
"""

import os
from itertools import chain
import threading

from MySQLdb.connections import Connection
import MySQLdb.cursors
import database

try:
    from dfhspider.config import mysql_db_config
except:
    mysql_db_config = {'host': '223.4.155.152', 'user': '', 'passwd': '', 'db': 'mysql'}


class ConnectionError(Exception):

    pass


class MySQLdbConnClass(Connection):
    """继承MySQLdb原生Connection，增加pid
    """

    def __init__(self, *arg, **kwargs):
        Connection.__init__(self, *arg, **kwargs)
        self.pid = os.getpid()


class ConnectionPool(object):

    def __init__(
        self,
        connection_class=database.Connection,
        max_connections=None,
        CursorClass=MySQLdb.cursors.Cursor,
        **connection_kwargs
    ):
        """init connection pool using tornado/database Class"""

        self.pid = os.getpid()
        self.connection_kwargs = {
            'host': '223.4.155.152',
            'port': 3306,
            'user': 'ibbd',
            'passwd': 'spider',
            'charset': 'utf8',
            'db': 'mysql',
        }
        self.connection_class = connection_class
        self.connection_kwargs.update(connection_kwargs)
        self.max_connections = max_connections or 100
        self.cursor_class = CursorClass
        self._created_connections = 0
        self._available_connections = []
        self._in_use_connections = set()
        self.lock = threading.Lock()

    def _checkpid(self):
        if self.pid != os.getpid():
            self.disconnect()
            self.__init__(self.max_connections, **self.connection_kwargs)

    def get_connection(self):
        self.lock.acquire()
        self._checkpid()
        try:
            connection = self._available_connections.pop()
            connection.ping(True)
        except IndexError:
            connection = self.make_connection()
        except AttributeError:
            connection = self.make_connection()
        self._in_use_connections.add(connection)
        self.lock.release()
        return connection

    def make_connection(self):
        '''Create a new connection'''

        if self._created_connections >= self.max_connections:
            raise ConnectionError('Too many connections')
        self._created_connections += 1
        if self.connection_class == Connection:
            return self.connection_class(**self.connection_kwargs)
        elif self.connection_class == database.Connection:
            return self.connection_class(CursorClass=self.cursor_class, **self.connection_kwargs)

    def release(self, connection):
        '''Releases the connection back to the pool'''

        self._checkpid()
        valid = (connection.pid == self.pid) if self.connection_class == database.Connection else True
        if valid:
            self._in_use_connections.remove(connection)
            self._available_connections.append(connection)

    def disconnect(self):
        '''Disconnects all connections in the pool'''

        all_conns = chain(self._available_connections, self._in_use_connections)
        for connection in all_conns:
            connection.close()
