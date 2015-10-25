#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest

import sys
sys.path.insert(0, '../../')
import ibbdlib.ibbdmail

class TestIBBDmail(unittest.TestCase):

    def setUp(self):
        self.server = ibbdlib.ibbdmail.IBBDmail()

    def test_mail1(self):
        send_to = ['gsavl@qq.com', 'gsavl@ibbd.net']
        print 'sendding mail to', send_to
        self.server.set_content('来自IBBD的测试邮件，测试编码是否可以显示正确', 'utf-8')
        self.server.send(send_to, 'ibbd noticiation email')

    def test_mail2(self):
        send_to = 'lannikcooper@gmail.com'
        print 'sendding mail to', send_to
        self.server.set_content('来自IBBD的测试邮件，测试编码是否可以显示正确', 'utf-8')
        self.server.send(send_to, 'ibbd noticiation email')

    def tearDown(self):
        self.server.logout()
        del self.server


unittest.main()