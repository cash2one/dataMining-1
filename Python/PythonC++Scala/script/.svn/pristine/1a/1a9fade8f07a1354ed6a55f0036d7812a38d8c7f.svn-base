#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time

from schedule_rollback import rollbackErrorSchedule

import ibbdlib

re_conn = ibbdlib.get_redis_conn()

while 1:
    try:
        if re_conn.scard('Schedule_itemTrade2') == 0:
            try:
                rollbackErrorSchedule()
            except Exception, e:
                print e
        else:
            print 'not yet'
            time.sleep(60 * 10)
    except Exception, e:
        print e
        time.sleep(60 * 10)
