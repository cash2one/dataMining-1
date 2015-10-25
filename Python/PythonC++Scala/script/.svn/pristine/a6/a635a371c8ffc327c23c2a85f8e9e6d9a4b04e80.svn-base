#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.9.19
'''

import json
import unittest
import sys
sys.path.insert(0, '../../')

from dfhspider.app import getItemsByKeyword


class DFHSpiderLibTestCase(unittest.TestCase):

    def test_getitemsbykeyword(self):
        for keyword in [
            '山地车',
            # 'i9300'
        ]:
            metadata = getItemsByKeyword(keyword, 'utf-8', page=1)
            for i, item in enumerate(metadata):
                print json.dumps(item, indent=4)

    def test_prettify(self):
        # from ibbdlib import codeprettify
        # codeprettify.prettifyFile(__file__, False)
        pass


unittest.main()
