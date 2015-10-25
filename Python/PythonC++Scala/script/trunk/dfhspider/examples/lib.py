#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest

import sys;sys.path.insert(0, '../')

import lib
import ibbdlib.tornadolib

class DFHSpiderLibTestCase(unittest.TestCase):
    
    def setup(self):
        pass
    
    def test_sendmail(self):
        print 'test_sendmail'
        lib.sendMail('gsavl@qq.com', 'IBBD通知', ibbdlib.tornadolib.render_string(open('../../../tbi/ibbd/templates/welcome-email.html').read(), email='email', passwd='passwd'))
    
    def tearDown(self):
        pass

unittest.main()
