#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest
import json

import sys
sys.path.insert(0, '../../')

import dfhspider
import dfhspider.topitemrelation


class TopItemTestCase(unittest.TestCase):

    def test_getZhitongcheResult(self):
        for iid in [
            '12803608134'
        ]:
            data = dfhspider.topitemrelation.get_item_relation(iid)
            print json.dumps(data, indent=4)

unittest.main()
