#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest

import sys
sys.path.insert(0, '../')
import json

from topitem import TopItem
from topbll import saveTopItem
from connectionpool import ConnectionPool


class TopItemTestCase(unittest.TestCase):

    def setUp(self):
        self.db_conn_pool = ConnectionPool(
            max_connections=1000,
            host='223.4.155.152',
            user='ibbd',
            passwd='spider',
            db='topspider',
            charset='utf8'
        )

    def test_topitem(self):
        for iid in [
            '19480718829',      # 2
        ]:
            link = 'http://item.taobao.com/item.htm?id=%s' % iid
            # link = 'http://detail.tmall.com/item.htm?id=%s' % iid
            d = TopItem(link).getFullInfo()
            # d = TopItem(link).getBasicInfo()
            print json.dumps(d, indent=4, ensure_ascii=False)
            # saveTopItem(d, self.db_conn_pool)

    def tearDown(self):
        self.db_conn_pool.disconnect()

unittest.main()
