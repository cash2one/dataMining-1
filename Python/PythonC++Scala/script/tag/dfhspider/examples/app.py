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
            'FANCL 乳液'
        ]:
            metadata = getItemsByKeyword(keyword, 'utf-8', page=1, sort='sale-desc')
            print json.dumps(metadata, indent=4, ensure_ascii=False)

    def test_prettify(self):
        # from ibbdlib import codeprettify
        # codeprettify.prettifyFile(__file__, False)
        pass


unittest.main()
