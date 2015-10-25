#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest
import sys
sys.path.insert(0, '../')
import ibbdlib


class TestSlave(unittest.TestCase):

    def test_slave_db_server(self):
        from slave import _get_item_trade_save_table
        re_conn = ibbdlib.get_redis_conn()
        print _get_item_trade_save_table(re_conn, '10984795')
        del re_conn


unittest.main()
