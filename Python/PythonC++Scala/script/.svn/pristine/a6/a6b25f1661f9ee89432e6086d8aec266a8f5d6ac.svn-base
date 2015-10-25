#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
@auth   Cooper
@date   2012.11.22
@intro  MySQL Connection Pool
"""

import os
from itertools import chain

from MySQLdb.connections import Connection
from config import mysql_db_config


class ConnectionError(Exception):

    pass


class MySQLdbConnClass(Connection):

    def __init__(self, *arg, **kwargs):
        while 1:
            try:
                Connection.__init__(self, *arg, **kwargs)
                self.pid = os.getpid()
                break
            except:
                pass


class ConnectionPool(object):

    def __init__(self, max_connections=None, **connection_kwargs):
        self.pid = os.getpid()
        self.connection_kwargs = {
            'host': '223.4.155.152',
            'port': 3306,
            'user': 'ibbd',
            'passwd': 'spider',
            'charset': 'utf8',
            'db': 'mysql',
        }
        self.connection_kwargs.update(connection_kwargs)
        self.max_connections = max_connections or 100
        self._created_connections = 0
        self._available_connections = []
        self._in_use_connections = set()

    def _checkpid(self):
        if self.pid != os.getpid():
            self.disconnect()
            self.__init__(self.max_connections, **self.connection_kwargs)

    def get_connection(self):
        self._checkpid()
        try:
            connection = self._available_connections.pop()
            connection.ping(True)
        except IndexError:
            connection = self.make_connection()
        self._in_use_connections.add(connection)
        return connection

    def make_connection(self):
        '''Create a new connection'''

        if self._created_connections >= self.max_connections:
            raise ConnectionError('Too many connections')
        self._created_connections += 1
        return MySQLdbConnClass(**self.connection_kwargs)

    def release(self, connection):
        '''Releases the connection back to the pool'''

        self._checkpid()
        if connection.pid == self.pid:
            self._in_use_connections.remove(connection)
            self._available_connections.append(connection)

    def disconnect(self):
        '''Disconnects all connections in the pool'''

        all_conns = chain(self._available_connections, self._in_use_connections)
        for connection in all_conns:
            connection.close()
