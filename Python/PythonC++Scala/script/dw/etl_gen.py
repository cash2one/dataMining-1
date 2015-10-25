#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth    Cooper
date    2012-12-28
desc
    run at start of new day
    save trade data as new table like top_item_trade_his_20121212
    generate etl sql script file in etl_script

    run
        >> python2.7 etl_gen.py 20121231
"""

import sys
import time
from datetime import datetime, timedelta
import traceback

import ibbdlib
import ibbdlib.tornadolib

from dateutil.parser import parse as dateparser

fetch_date = '2013-07-24'
if len(sys.argv) >= 2:
    arg_date = dateparser(sys.argv[1])
    fetch_date = arg_date.strftime('%Y-%m-%d')
fetch_date_short = fetch_date.replace('-', '')

db_server = {'host': 'localhost',
             'user': 'ibbd_etl',
             'passwd': 'ibbd_etl_secure',
             'db': 'topspider'}

his_db = 'topspider'
db = 'topdata'
split_tb_num = 30
cal_date = fetch_date
his_table = 'top_item_trade_his_%s' % fetch_date_short
reporter_date = (dateparser(cal_date) - timedelta(1)).strftime('%Y-%m-%d')
reporter_date_range = (dateparser(cal_date) - timedelta(7)).strftime('%Y-%m-%d')
his_trade_table = 'top_item_trade_his_%s' % fetch_date_short


def _prepar_trade_date():
    # rename schedule
    redis_conn = ibbdlib.get_redis_conn()
    if redis_conn.scard('Schedule_itemTrade2') > 0:
        redis_conn.rename('Schedule_itemTrade2', 'Schedule_itemTrade2_bak')

    # insert lock
    db_conn = ibbdlib.get_db_conn(**db_server)
    while 1:
        try:
            is_inserting = False
            for row in db_conn.iter("SHOW PROCESSLIST"):
                if row.Info:
                    if row.Info.encode('utf-8', 'ignore').find('top_item_trade') > -1:
                        is_inserting = True
            if is_inserting:
                print 'processing insert lock, wait for 10 seconds'
                time.sleep(10)
            else:
                print 'no insert lock'
                break
        except:
            traceback.print_exc()
    try:
        db_conn.execute(
            "ALTER TABLE topspider.top_item_trade RENAME topspider.top_item_trade_his_%s" % fetch_date_short)
        db_conn.execute(
            "CREATE TABLE topspider.top_item_trade LIKE topspider.top_item_trade_his_%s" % fetch_date_short)
    except:
        traceback.print_exc()
    db_conn.close()

    # rename schedule name
    if redis_conn.scard('Schedule_itemTrade2_bak') > 0:
        redis_conn.rename('Schedule_itemTrade2_bak', 'Schedule_itemTrade2')
    del redis_conn


def _get_shop_ids():
    db_conn = ibbdlib.get_db_conn(**db_server)
    cmd_str = 'SELECT DISTINCT(shop_id) AS shop_id FROM %s.%s' % (
        his_db, his_table)
    sids = list(db_conn.iter(cmd_str))
    db_conn.close()
    return [row.shop_id for row in sids]


def split_trade_data():
    sids = list(sorted(_get_shop_ids()))
    step = len(sids) / (split_tb_num - 1)
    interval = [sids[0]]
    for i in range(split_tb_num - 1):
        interval.append(sids[(i + 1) * step - 1])
    interval.append(sids[-1])
    return interval


def _generate_sql_template():
    # shop_id_interval = split_trade_data()
    sql_commands = ibbdlib.tornadolib.render_string(
        open('etl3_template.sql').read(),
        his_trade_table=his_trade_table,
        fetch_date=fetch_date,
        cal_date=cal_date,
        reporter_date=reporter_date,
        reporter_date_range=reporter_date_range,
        cache_table_num=split_tb_num,
        shop_id_interval=[],
    )
    open('etl_script/etl3_%s.sql' %
         fetch_date.replace('-', ''), 'w').write(sql_commands)


def main():
    _generate_sql_template()


if __name__ == '__main__':
    main()
