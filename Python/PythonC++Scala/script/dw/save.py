#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

from urllib import quote, unquote
import json
import traceback
import time
import sys

import ibbdlib
from dfhspider.lib import *
from dfhspider.app import getItemsByKeyword
from dfhspider.connectionpool import ConnectionPool
from dfhspider.topbll import saveKeywordSearchResult

from _mysql_exceptions import OperationalError

db_server = {
    'host': 'localhost',
    'user': 'ibbd_etl',
    'passwd': 'ibbd_etl_secure',
    'port': 3306,
    'db': 'topspider'
}

conn = ibbdlib.get_db_conn(**db_server)
re_conn = ibbdlib.get_redis_conn(**{
    'host': 'localhost',
    'port': 6379,
    'password': 'ibbdooredisserver'
})


def ensure_schedule(re_conn):
    query = """SELECT T2.*
    FROM(
        SELECT keyword, min_price, max_price, location, min_sale
        FROM ibbd2.user_keywords T3
        WHERE status='1'
        GROUP BY keyword
    ) T2
    LEFT JOIN(
        SELECT DISTINCT(keyword) AS keyword
        FROM topspider.top_itemsearchresult T1
        WHERE T1.population_tsmp > curdate()
    )T4
    ON T2.keyword = T4.keyword
    WHERE T4.keyword IS NULL"""
    print 'querying'
    keywords = [[quote(row.keyword.encode('utf-8')), row.min_price, row.max_price] for row in conn.iter(query)]
    if keywords:
        print 'keywords num', len(keywords)
        re_conn.sadd('Schedule_keywordSearchResult', *[t[0] for t in keywords])
        for row in keywords:
            re_conn.hset(
                'Schedule_keywordSearchResult_config',
                row[0],
                json.dumps({
                    'page': 5,
                    'price': [row[1], row[2]]
                })
            )
    else:
        print 'no keywords'


def ensure_complete(re_conn):
    c = list()
    max_ninja = 4
    while True:
        if re_conn.scard('Schedule_keywordSearchResult') + \
            re_conn.hlen('Schedule_keywordSearchResultError') + \
                re_conn.hlen('Schedule_keywordSearchResult_process') == 0:
            print 'schedule complete'
            break
        if re_conn.scard('Schedule_keywordSearchResult') > 0:
            print 'waiting'
            time.sleep(3)
            continue
        if len(c) == max_ninja and len(filter(lambda x: x not in c, c)) == 0:
            break
        hkeys = re_conn.hkeys('Schedule_keywordSearchResultError') or []
        hkeys.extend(re_conn.hkeys('Schedule_keywordSearchResult_process') or [])
        re_conn.delete('Schedule_keywordSearchResultError')
        re_conn.delete('Schedule_keywordSearchResult_process')
        re_conn.sadd('Schedule_keywordSearchResult', *hkeys)
        if len(hkeys) <= 5:
            c.append(','.join(hkeys))
            c = c[-1 * max_ninja:]
        time.sleep(10)

ensure_schedule(re_conn)
ensure_complete(re_conn)

split_tb_num = 30


def _get_shop_ids():
    cmd_str = """SELECT DISTINCT user_num_id
        FROM topspider.top_itemsearchresult"""
    while True:
        try:
            sids = list(conn.iter(cmd_str))
            break
        except OperationalError:
            print 'OperationalError, retrying'
        except:
            raise Exception(traceback.format_exc())
    return [int(row.user_num_id) for row in sids]


def split_trade_data():
    sids = list(sorted(_get_shop_ids()))
    step = len(sids) / (split_tb_num - 1)
    intervals = [sids[0]]
    for i in range(split_tb_num - 1):
        intervals.append(sids[(i + 1) * step - 1])
    intervals.append(sids[-1])
    return intervals

intervals = split_trade_data()
re_conn.hset('ScheduleConfig', 'shop_interval', intervals)


query = \
    """SELECT DISTINCT(item_id) AS item_id
    FROM topspider.top_itemsearchresult
    WHERE population_tsmp > curdate()
    UNION
    SELECT DISTINCT item_id
    FROM ibbd2.user_shop_monitor_items
    WHERE status='1'
    """
iids = [row.item_id for row in conn.iter(query)]
print 'Schedule_itemTrade2', len(iids)
re_conn.sadd('Schedule_itemTrade2', *iids)

query = """SELECT T1.item_id
    FROM(
        SELECT DISTINCT(item_id) AS item_id
        FROM topspider.top_itemsearchresult
        WHERE population_tsmp>CURDATE()-INTERVAL 1 DAY)T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    WHERE T2.item_id IS NULL OR T2.title=''
    UNION
    SELECT DISTINCT item_id
    FROM ibbd2.user_shop_monitor_items
    WHERE status='1'"""
iids = [row.item_id for row in conn.iter(query)]
print 'Schedule_itemFullInfo', len(iids)
re_conn.sadd('Schedule_itemFullInfo', *iids)

query = """SELECT T1.user_num_id
    FROM(
        SELECT DISTINCT(user_num_id) AS user_num_id
        FROM topspider.top_itemsearchresult
        WHERE population_tsmp>CURDATE()-INTERVAL 1 DAY)T1
    LEFT JOIN ibbd2.top_shop1 T2
    ON T1.user_num_id=T2.user_num_id
    WHERE T2.user_num_id IS NULL"""
uids = [row.user_num_id for row in conn.iter(query)]
print 'Schedule_shopFullInfo', len(uids)
re_conn.sadd('Schedule_shopFullInfo', *uids)

conn.close()
del re_conn
