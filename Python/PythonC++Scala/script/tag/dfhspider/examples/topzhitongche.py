#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest

import sys
sys.path.insert(0, '../../')

import dfhspider
import dfhspider.topzhitongche


class TopItemTestCase(unittest.TestCase):

    def test_refreshdata(self):
        print 'test_zhitongche'
        # dfhspider.topzhitongche.refresh_data('女装 连衣裙')

    def test_getZhitongcheResult(self):
        data = dfhspider.topzhitongche.getZhitongcheResult('女装 连衣裙', 'utf-8', 1)
        dfhspider.topzhitongche.saveZhitongcheResult(data)

    def test_prettify(self):
        from ibbdlib import codeprettify
        # codeprettify.prettifyFile(__file__, False)


unittest.main()
