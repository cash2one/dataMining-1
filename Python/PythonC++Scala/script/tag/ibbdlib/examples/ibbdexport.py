#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest

import sys
sys.path.insert(0, '../../')
import ibbdlib.ibbdexport

class TestIBBDexport(unittest.TestCase):

    def setUp(self):
        self.exporter = ibbdlib.ibbdexport.MySQLXlsExporter('exporttext.xls', {'host': '223.4.155.172', 'user': 'ibbd', 'passwd': 'spider', 'charset': 'utf8'})

    def test_export1(self):
        self.exporter.set_query("SELECT * FROM topspider.top_item_trade_sid_73204722")
        self.exporter.save()

    def tearDown(self):
        del self.exporter


unittest.main()