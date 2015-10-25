#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time

import ibbdlib
redis_server = {
    'host': 'localhost',
    'password': 'ibbdooredisserver'
}
re_conn = ibbdlib.get_redis_conn(**redis_server)
while 1:
    if re_conn.scard('Schedule_itemFullInfo') + \
        re_conn.scard('Schedule_itemTrade2') + \
            re_conn.scard('Schedule_shopFullInfo') == 0:
        break
    else:
        print 'waiting for schedule complete'
        time.sleep(60)

del re_conn
