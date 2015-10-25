#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import unittest
import sys
sys.path.insert(0, '../')
import tornadolib


def gen_sql_result(value):
    return value


class Testtornadolib(unittest.TestCase):
    """docstring for Testtornadolib"""

    def test_render_string(self):
        print tornadolib.render_string("<li>{{ gen_sql_result('{{p_a}}') }}, {{ max([1,2,3]) }}</li>", gen_sql_result=gen_sql_result, p_a='Oul')


unittest.main()
