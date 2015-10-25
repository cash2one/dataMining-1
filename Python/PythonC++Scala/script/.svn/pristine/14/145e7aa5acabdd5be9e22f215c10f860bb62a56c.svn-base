#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

from urllib import quote, unquote
import json
import traceback
import time
import sys

from dfhspider.lib import *
from dfhspider.app import getItemsByKeyword
from dfhspider.connectionpool import ConnectionPool
from dfhspider.topbll import saveKeywordSearchResult

from slave_config import slave_config

db_server = {'223.4.155.152': {
    'host': '223.4.155.152',
    'user': 'cooper',
    'passwd': 'lq00744601',
    'port': 3306,
    'db': 'topspider'
}, '223.4.155.172': {
    'host': '121.199.16.12',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    'db': 'topspider'
}}

conn = __import__('ibbdlib').get_db_conn(**db_server['223.4.155.172'])
# conn.execute("DELETE FROM ibbd2.user_keywords")

# ibbdlib.migratetable.migrate_table(db_server['223.4.155.152'], db_server['223.4.155.172'], 'ibbd2.user2')
# ibbdlib.migratetable.migrate_table(db_server['223.4.155.152'],
# db_server['223.4.155.172'], 'ibbd2.user_keywords')

re_conn = __import__('ibbdlib').get_redis_conn(**{'host': '223.4.155.152'})
query = """SELECT T2.keyword
FROM(
    SELECT DISTINCT(keyword) AS keyword
    FROM ibbd2.user_keywords T3
    WHERE T3.status='1'
    ORDER BY keyword
) T2
LEFT JOIN(
    SELECT DISTINCT(keyword) AS keyword
    FROM topspider.top_itemsearchresult T1
    WHERE T1.population_tsmp > curdate()
)T4
ON T2.keyword = T4.keyword
WHERE T4.keyword IS NULL"""
print 'querying'
# keywords = [quote(row.keyword.encode('utf-8')) for row in conn.iter(query)]
keywords = [1]
if keywords:
    print 'keywords num', len(keywords)
    # re_conn.sadd('Schedule_keywordSearchResult', *keywords)
else:
    print 'no keywords'
    sys.exit(0)


def ensure_complete(re_conn):
    while 1:
        if re_conn.scard('Schedule_keywordSearchResult') + \
            re_conn.hlen('Schedule_keywordSearchResultError') + \
                re_conn.hlen('Schedule_keywordSearchResult_process') == 0:
            break
        if re_conn.scard('Schedule_keywordSearchResult') > 0:
            print 'waiting'
            time.sleep(3)
            continue
        hkeys = re_conn.hkeys('Schedule_keywordSearchResultError') or []
        hkeys.extend(re_conn.hkeys('Schedule_keywordSearchResult_process') or [])
        re_conn.sadd('Schedule_keywordSearchResult', *hkeys)
        re_conn.delete('Schedule_keywordSearchResultError')
        re_conn.delete('Schedule_keywordSearchResult_process')
        time.sleep(10)

# ensure_complete(re_conn)

query = \
    """SELECT DISTINCT(item_id) AS item_id
    FROM topspider.top_itemsearchresult
    WHERE population_tsmp > '2013-4-22 03:00:00'
    -- AND keyword in ({})
    """# .format(','.join("'{}'".format(keyword) for keyword in keywords))

iids = [row.item_id for row in conn.iter(query)]
print len(iids)
conn.close()
re_conn.sadd('Schedule_itemTrade2', *iids)
del re_conn
