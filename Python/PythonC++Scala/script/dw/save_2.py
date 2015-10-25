# -*- coding: utf-8 -*-

import time
from datetime import datetime

import ibbdlib
from dfhspider.app import getItemsByKeyword
from dfhspider.connectionpool import ConnectionPool
from dfhspider.topbll import saveKeywordSearchResult

db_server = {
    'host': 'localhost',
    'user': 'ibbd_etl',
    'passwd': 'ibbd_etl_secure',
    'db': 'ibbd2',
    'charset': 'utf8'
}

now = datetime.now()

db_pool = ConnectionPool(**db_server)
db_conn_test = db_pool.get_connection()
db_conn_test.close()

db_conn = ibbdlib.get_db_conn(**db_server)
query = """SELECT DISTINCT T2.keyword
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
for row in db_conn.iter(query):
    keyword = row.keyword.encode('utf-8')
    items = getItemsByKeyword(keyword, 'utf-8', page=5)
    saveKeywordSearchResult(items, db_pool)
    time.sleep(1)
db_conn.close()
# db_pool.disconnect()


re_conn = ibbdlib.get_redis_conn(**{
    'host': 'localhost',
    'port': 6379,
    'password': 'ibbdooredisserver'
})
db_conn = ibbdlib.get_db_conn(**db_server)
iids = set()
uids = set()
query = """SELECT DISTINCT item_id, user_num_id
FROM topspider.top_itemsearchresult
WHERE population_tsmp > '%s'""" % now.strftime('%Y-%m-%d %H:%M:%S')
for row in db_conn.iter(query):
    iids.add(row.item_id)
    uids.add(row.user_num_id)
print 'iids', len(iids), 'uids', len(uids)
if iids:
    re_conn.sadd('Schedule_itemTrade2', *iids)
    re_conn.sadd('Schedule_itemFullInfo', *iids)
if uids:
    re_conn.sadd('Schedule_shopFullInfo', *uids)
db_conn.close()
del re_conn
