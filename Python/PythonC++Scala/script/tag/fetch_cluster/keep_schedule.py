#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

from schedule_rollback import rollbackErrorSchedule

import time
import ibbdlib
from slave_config import slave_config

re_conn = ibbdlib.get_redis_conn(**slave_config['default']['redis'])

if re_conn.scard('Schedule_itemTrade2') == 0:
    print time.asctime(), "roll back schedules"
    try:
        rollbackErrorSchedule()
    except Exception, e:
        print e
else:
    print time.asctime(), "keep runing"

# clean error topshop schedule
# key Schedule_shopmonitor_*_process/Schedule_shopmonitor_*_error
for redis_k in ['Schedule_shopmonitor_*_process', 'Schedule_shopmonitor_*_error']:
    if re_conn.keys(redis_k):
        print 'delete key', redis_k
        re_conn.delete(redis_k)
del re_conn
