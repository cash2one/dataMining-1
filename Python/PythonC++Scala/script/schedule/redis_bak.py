#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import ibbdlib
re_conn = ibbdlib.get_redis_conn(host='223.4.155.152')
re_conn.save()
del re_conn
