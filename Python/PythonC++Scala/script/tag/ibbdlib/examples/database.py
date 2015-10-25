#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest

import sys
sys.path.insert(0, '../../')

from ibbdlib.connectionpool import ConnectionPool
from ibbdlib.database import Connection
from dfhspider.config import mysql_db_config


class TestDatabase(unittest.TestCase):

    def setUp(self):
        pass

    def test_conn(self):
        connpool = ConnectionPool(Connection, 10, **mysql_db_config)
        conn = connpool.get_connection()
        print conn.execute_rowcount('INSERT IGNORE INTO test.test values(%s,%s)'
                                    , 'gsavl', 'Cooper')
        print conn.executemany_rowcount('INSERT IGNORE INTO test.test values(%s,%s)'
                                        , [['liangj', 'pass'], ['zhangf', 'ff'
                                        ]])
        connpool.release(conn)
        connpool.disconnect()

    def tearDown(self):
        pass


unittest.main()
