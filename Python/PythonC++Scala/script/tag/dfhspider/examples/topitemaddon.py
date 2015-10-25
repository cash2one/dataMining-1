#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest
import json

import sys
sys.path.insert(0, '../')

import lib
import topitemaddon


class DFHSpiderLibTestCase(unittest.TestCase):

    def setUp(self):
        self.items = [
            # '14654134394',
            # '14175613296',
            # '10906543806',
            # '12340669868',
            '13408314039'
        ]

    def test_api(self):
        for item_id in self.items:
            sku, promo = topitemaddon.get_item_addon(item_id, sku=True, promo=True)
            print json.dumps(sku, indent=4)
            print json.dumps(promo, indent=4)

unittest.main()
