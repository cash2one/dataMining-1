#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import ibbdlib

re_conn = ibbdlib.get_redis_conn(**{'host': '223.4.155.152'})
schedules = ['Schedule_itemTrade2', 'Schedule_itemFullInfo']
schedule_sum = 0
for sche in schedules:
    schedule_sum += re_conn.scard(sche)
del re_conn
if schedule_sum == 0:
    open('status', 'w').write('1')
else:
    open('status', 'w').write('0')
