#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auth: Cooper
date: 2012.12.11
'''

import time
from datetime import datetime, timedelta
import threading

from dateutil.parser import parse as dateparser
import ibbdlib
import ibbdlib.tornadolib

fetch_date = '2012-12-21'
cal_date = '2012-12-21'
reporter_date = (dateparser(cal_date) - timedelta(1)).strftime('%Y-%m-%d')
reporter_date_range = (dateparser(cal_date) - timedelta(7)).strftime('%Y-%m-%d')

his_trade_table = 'top_item_trade_his_%s' % fetch_date.replace('-', '')


def _get_db_conn_pool():
    return ibbdlib.get_db_pool()


def _generate_sql_template():
    with open('etl_template.sql') as f:
        s = f.read()
    sql_commands = ibbdlib.tornadolib.render_string(
        s,
        his_trade_table=his_trade_table,
        fetch_date=fetch_date,
        cal_date=cal_date,
        reporter_date=reporter_date,
        reporter_date_range=reporter_date_range,
        )
    with open('etl2.sql', 'w') as f:
        f.write(sql_commands)


def runProc(db_conn_pool, sp_name, param):
    db_conn = db_conn_pool.get_connection()
    c = db_conn.cursor()
    c.callproc(sp_name, param)
    c.close()
    db_conn.commit()
    db_conn_pool.release(db_conn)


def main():
    pass


if __name__ == '__main__':
    main()
    _generate_sql_template()
