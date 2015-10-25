#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import sys
import traceback
from datetime import datetime

import ibbdlib

from dateutil.parser import parse as dateparser

db_server = {
    'host': 'localhost',
    'user': 'ibbd_etl',
    'passwd': 'ibbd_etl_secure',
    'db': 'topspider'
}
redis_server = {'host': 'localhost', 'password': 'ibbdooredisserver'}

fetch_date = '2013-01-02'
if len(sys.argv) >= 2:
    arg_date = dateparser(sys.argv[1])
    fetch_date = arg_date.strftime('%Y-%m-%d')
fetch_date_short = fetch_date.replace('-', '')

split_tb_num = 30

def _prepar_trade_date():
    # rename schedule
    redis_conn = ibbdlib.get_redis_conn(**redis_server)
    if redis_conn.scard('Schedule_itemTrade2') > 0:
        redis_conn.rename('Schedule_itemTrade2', 'Schedule_itemTrade2_bak')

    # insert lock
    db_conn = ibbdlib.get_db_conn(**db_server)
    # while True:
    #     try:
    #         is_inserting = False
    #         for row in db_conn.iter("SHOW PROCESSLIST"):
    #             if row.Info:
    #                 if row.Info.encode('utf-8', 'ignore').find('top_item_trade') > -1:
    #                     is_inserting = True
    #         if is_inserting:
    #             print 'processing insert lock, wait for 10 seconds'
    #             time.sleep(10)
    #         else:
    #             print 'no insert lock'
    #             break
    #     except:
    #         traceback.print_exc()
    try:
        # db_conn.execute(
        #     "ALTER TABLE topspider.top_item_trade RENAME topspider.top_item_trade_his_%s" % fetch_date_short)
        # db_conn.execute(
        #     "CREATE TABLE topspider.top_item_trade LIKE topspider.top_item_trade_his_%s" % fetch_date_short)
        for i in range(split_tb_num):
            table_name = 'top_item_trade_his_%s_%d' % (
                datetime.now().strftime('%Y%m%d'),
                i + 1)
            db_conn.execute("CREATE TABLE topspider.%s LIKE topspider.top_item_trade" % table_name)
        db_conn.execute("TRUNCATE TABLE topspider.top_itemsearchresult")
    except:
        traceback.print_exc()
    db_conn.close()

    # rename schedule name
    if redis_conn.scard('Schedule_itemTrade2_bak') > 0:
        redis_conn.rename('Schedule_itemTrade2_bak', 'Schedule_itemTrade2')
        pass
    del redis_conn


def clear_error_schedule():
    redis_conn = ibbdlib.get_redis_conn(**redis_server)
    for schedule_error_key in redis_conn.keys('Sche*Error'):
        if redis_conn.type(schedule_error_key) == 'hash':
            print 'delete', schedule_error_key, redis_conn.hlen(schedule_error_key)
            redis_conn.delete(schedule_error_key)
    for schedule_error_key in redis_conn.keys('Sche*process'):
        if redis_conn.type(schedule_error_key) == 'hash':
            print 'delete', schedule_error_key, redis_conn.hlen(schedule_error_key)
            redis_conn.delete(schedule_error_key)
    for schedule_error_key in redis_conn.keys('Sche*error'):
        if redis_conn.type(schedule_error_key) == 'hash':
            print 'delete', schedule_error_key, redis_conn.hlen(schedule_error_key)
            redis_conn.delete(schedule_error_key)
    del redis_conn

if __name__ == '__main__':
    _prepar_trade_date()
    clear_error_schedule()
