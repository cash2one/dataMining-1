#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import datetime
import unittest

import sys;sys.path.insert(0, '../')

import __init__ as ibbdlib
import database

class TestConnectionPool(unittest.TestCase):
    def test_db_conn(self):
        # db_conn = ibbdlib.get_db_conn()
        # sql = "SELECT * FROM ibbd2.user2"
        # for row in db_conn.iter(sql):
        #     print row
        # db_conn.close()
        pass


class Testibbdlib(unittest.TestCase):
    def test_gen_sql_stm(self):
        db_conn = ibbdlib.get_db_conn()
        try:
            print ibbdlib.gen_sql_statement(db_conn, 
                "INSERT INTO user VALUES(%s,%s)", 
                [[1.11, datetime.datetime.now()]])
            pass
        except Exception, e:
            raise e
        finally:
            db_conn.close()
            pass

unittest.main()