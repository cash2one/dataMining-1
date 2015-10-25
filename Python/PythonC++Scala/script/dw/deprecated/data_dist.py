#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
交易记录分布位置计算
"""

import re
from datetime import datetime, timedelta, date

import ibbdlib

db_server = {'223.4.155.152': {
    'host': '223.4.155.152',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }, '223.4.155.172': {
    'host': '223.4.155.172',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }, '223.4.146.232': {
    'host': '223.4.146.232',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }}


def _get_db_server():
    return ibbdlib.get_db_conn(**db_server['223.4.155.172'])


def _get_db_name():
    return 'topdata%s' % date.today.strftime('%Y%m')


def _verify_database(db_name):
    db_conn = _get_db_server()
    db_list = [row.Database for row in db_conn.iter('SHOW DATABASES')]
    if db_name not in db_list:
        db_conn.execute('CREATE DATABASE %s' % db_name)
    db_conn.close()


shop_group_num = 1000

db_conn = _get_db_server()
dist_info = list(db_conn.iter('SELECT * FROM topdata.top_trade_dist WHERE shop_id=%s', shop_id))
if dist_info:
    return '%s.%s' % (_get_db_name(), dist_info.table_name)
else:
    cmd_str = \
        'SELECT host, table_name, COUNT(DISTINCT(shop_id)) AS shop_count FROM topdata.top_trade_dist GROUP BY host, table_name'
    metadata = list(db_conn.iter(cmd_str))
    if metadata:
        pass
    else:
        table_name = 'top_item_trade_1'
        db_conn.execute('INSERT INTO topdata.top_trade_dist VALUES(%s, %s, %s, 0)', ('223.4.155.172', table_name,
                        shop_id))
        db_name = _get_db_name()
        _verify_database(db_name)
        db_conn.execute('CREATE TABLE %s.%s LIKE topdata.top_item_trade', _get_db_name(), table_name)
        return '%s.%s' % (db_name(), table_name)
db_conn.close()
