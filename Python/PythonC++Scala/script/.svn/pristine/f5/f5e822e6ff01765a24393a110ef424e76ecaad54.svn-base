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
        self.db_conn_pool = ConnectionPool(max_connections=1000, host='223.4.216.246', user='ibbd', passwd='spider', db='topspider')

    def test_topitem(self):
        for iid in [
            # '14175613296',
            '8264246386',
            # '10002994827',
            # '13746707210',
            # '10399774244'
            # '20807952786',
            # '10710811953',
            '12979720957'
        ]:
            link = 'http://item.taobao.com/item.htm?id=%s' % iid
            # link = 'http://detail.tmall.com/item.htm?id=%s' % iid
            d = TopItem(link).getFullInfo()
            print json.dumps(d, indent=4, ensure_ascii=False)  # .decode('utf-8')
            saveTopItem(d, self.db_conn_pool)
        pass

    def tearDown(self):
        self.db_conn_pool.disconnect()

unittest.main()
