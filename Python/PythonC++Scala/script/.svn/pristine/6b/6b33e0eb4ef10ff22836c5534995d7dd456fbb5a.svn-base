#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.7.19
desc:
crontab task
'''

import time
import json
import traceback
from urllib import quote, unquote

from dfhspider.lib import getRedisConn2, executeSQLCommand
from dfhspider.topshop import TopShop

from dfhspider.connectionpool import ConnectionPool
from dfhspider.config import mysql_db_config

import ibbdlib
import ibbdlib.migratetable
import ibbdlib.ibbdlog

log = ibbdlib.ibbdlog.get_logger(
    log_path='../log/', log_file='master.log', log_name='spider.master')

redis_server = {
    'host': 'localhost',
    'password': 'ibbdooredisserver'
}
db_server = {'223.4.155.152': {
    'host': '223.4.155.152',
    'user': 'ibbd_etl',
    'passwd': 'ibbd_etl_152',
    'port': 3306,
    'db': 'ibbd2',
    'charset': 'utf8'
}, '223.4.155.172': {
    'host': 'localhost',
    'user': 'ibbd_etl',
    'passwd': 'ibbd_etl_secure',
    'port': 3306,
    'db': 'topspider',
    'charset': 'utf8'
}}


def runKeywordsSchedule(reConn, dbConnPool):
    """将用户关键词列表搜索结果加入抓取队列
    """

    dbConn = dbConnPool.get_connection()
    cmdStr = \
        """SELECT keyword, MIN(min_price), MAX(max_price), location, MIN(min_sale)
        FROM ibbd2.user_keywords
        WHERE status='1'
        GROUP BY keyword"""
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    count = r.num_rows()
    rs = [list(r.fetch_row()[0]) for i in range(r.num_rows())]
    for (i, config) in enumerate(rs):
        log.info('KeywordNum %d', i + 1)

        # add keyword schedule and config

        reConn.sadd('Schedule_keywordSearchResult',
                    quote(config[0].encode('utf-8')))
        reConn.hset(
            'Schedule_keywordSearchResult_config', quote(config[0].encode('utf-8')), json.dumps({'page': 5,
                                                                                                 'price': [config[1], config[2]]}))
    dbConnPool.release(dbConn)
    return count


def migrateScheduleToRedis(reConn, dbConnPool):
    dbConn = dbConnPool.get_connection()
    cursor = dbConn.cursor()

    _schedule_count = 0

    # Schedule_itemTrade

    print 'Schedule_itemTrade',
    cmdStr = \
        """SELECT DISTINCT(item_id)
        FROM topspider.top_itemsearchresult
        WHERE population_tsmp>CURDATE()-INTERVAL 8 HOUR
        UNION
        SELECT DISTINCT item_id
        FROM ibbd2.user_shop_monitor_items
        WHERE status='1'"""
    cursor.execute(cmdStr)
    iids = [row[0] for row in cursor.fetchall()]
    print len(iids)
    reConn.sadd('Schedule_itemTrade2', *iids)
    if iids:
        _schedule_count += len(iids)

    # Schedule_itemFullInfo

    print 'Schedule_itemFullInfo',
    cmdStr = \
        """SELECT T1.item_id
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
    cursor.execute(cmdStr)
    iids = [row[0] for row in cursor.fetchall()]
    print len(iids)
    if iids:
        reConn.sadd('Schedule_itemFullInfo', *iids)

    # Schedule_shopFullInfo

    print 'Schedule_shopFullInfo',
    cmdStr = \
        """SELECT T1.user_num_id
        FROM(
            SELECT DISTINCT(user_num_id) AS user_num_id
            FROM topspider.top_itemsearchresult
            WHERE population_tsmp>CURDATE()-INTERVAL 1 DAY)T1
        LEFT JOIN ibbd2.top_shop1 T2
        ON T1.user_num_id=T2.user_num_id
        WHERE T2.user_num_id IS NULL"""
    cursor.execute(cmdStr)
    uids = [row[0] for row in cursor.fetchall()]
    print len(uids)
    if uids:
        reConn.sadd('Schedule_shopFullInfo', *uids)

    # end

    dbConnPool.release(dbConn)
    return _schedule_count


def _ensure_schedule_complete(reConn):
    name = 'Schedule_keywordSearchResult'
    process_name = '%s_process' % name
    error_name = '%sError' % name
    c = list()
    max_ninja = 4
    while True:
        try:
            if reConn.scard(name) == 0 and \
                reConn.hlen(error_name) == 0 and \
                    reConn.hlen(process_name) == 0:
                break
            else:
                while True:
                    if reConn.scard(name) == 0:
                        break
                    else:
                        print 'waiting for schedule to complete'
                        time.sleep(10)
                while True:
                    pre_count = reConn.hlen(process_name) + \
                        reConn.hlen(error_name)
                    if pre_count == 0:
                        break
                    else:
                        if len(c) == max_ninja and \
                                len(filter(lambda x: x not in c, c)) == 0:
                            reConn.delete(process_name)
                            reConn.delete(error_name)
                            break
                        re_keys = reConn.hkeys(process_name) + \
                            reConn.hkeys(error_name)
                        reConn.delete(process_name)
                        reConn.delete(error_name)
                        reConn.sadd(name, *re_keys)
                        if len(re_keys) <= 5:
                            c.append(','.join(re_keys))
                            c = c[-1 * max_ninja:]
                    time.sleep(10)
        except:
            traceback.print_exc()
            time.sleep(5)


def master():
    db_conn = ibbdlib.get_db_conn(**db_server['223.4.155.172'])
    db_conn.execute("TRUNCATE TABLE ibbd2.lib_cat_industry_keyword_2")
    db_conn.close()
    ibbdlib.migratetable.migrate_table(
        db_server['223.4.155.152'],
        db_server['223.4.155.172'],
        'ibbd2.user2')
    ibbdlib.migratetable.migrate_table(
        db_server['223.4.155.152'],
        db_server['223.4.155.172'],
        'ibbd2.user_keywords')
    ibbdlib.migratetable.migrate_table(
        db_server['223.4.155.152'],
        db_server['223.4.155.172'],
        'ibbd2.lib_cat_industry_keyword_2')
    ibbdlib.migratetable.migrate_table_by_query(
        db_server['223.4.155.152'],
        db_server['223.4.155.172'],
        'ibbd2.user_shop_monitor_items',
        """SELECT user, shop_type,
        (CASE WHEN shop_id='' THEN 0 ELSE shop_id END) shop_id,
        user_num_id, item_id, status,
        population_tsmp
        FROM ibbd2.user_shop_monitor_items"""
    )

    # keep connection

    dbConnPool = None
    reConn = None
    while True:
        try:
            dbConnPool = ConnectionPool(max_connections=1000,
                                        host='localhost',
                                        user='ibbd_etl',
                                        passwd='ibbd_etl_secure',
                                        db='topspider',
                                        charset='utf8')
            # reConn = getRedisConn2()
            reConn = ibbdlib.get_redis_conn(**redis_server)
            break
        except Exception as e:
            print e
    runKeywordsSchedule(reConn, dbConnPool)
    _ensure_schedule_complete(reConn)
    dbConnPool.disconnect()
    dbConnPool = ConnectionPool(max_connections=1000,
                                host='localhost',
                                user='ibbd_etl',
                                passwd='ibbd_etl_secure',
                                db='topspider',
                                charset='utf8')
    while True:
        try:
            # migrateScheduleToRedis(reConn, dbConnPool)
            break
        except:
            traceback.print_exc()
    dbConnPool.disconnect()
    del reConn


if __name__ == '__main__':
    master()
