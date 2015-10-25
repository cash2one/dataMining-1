#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth    Cooper
date    2012.12.2
desc    缓存行业调研首页数据
"""

import sys
from urllib import quote, unquote
import json
from datetime import datetime, date, timedelta

from ibbdlib.connectionpool import ConnectionPool
from dfhspider.config import mysql_db_config
import ibbdlib


redis_server = {
    'host': '115.29.192.207',
    'password': '0vojhW70jwDosQS1qqCQ2wxnxsNVljfq'
}


def _getReConn():
    """获取Redis连接"""

    return ibbdlib.get_redis_conn(**redis_server)


def _get_user_db_pool():
    return ConnectionPool(
        max_connections=100,
        host='112.124.60.13',
        user='ibbdui',
        passwd='2dhrXbOdZ8VfSPyM3ChJKE8ogQWbUmXl',
        db='ibbd_user',
        charset='utf8')


def _get_ststc_db_pool():
    """获取数据库连接池"""

    return ConnectionPool(
        max_connections=100,
        host='localhost',
        user='root',
        passwd='oXlU1s0KzQHGUAbwDFxKalYm6YLEnxqE',
        db='taobao',
        charset='utf8')


def cacheCatReporter(dbConnPool, reConn, date):
    """缓存行业调研报表数据

    以类目为单位保存报表数据
    Args:
        dbConnPool  数据库连接池
        reConn      Redis连接
        date        指标日期(适用于MySQL的日期格式)
    """

    dbConn = dbConnPool.get_connection()
    query = """INSERT ignore into taobao.reporter
        select t4.keyword, t4.date_of, t5.volume, t4.trade_num, t4.trade_num, t5.sales, t4.pct,
        t4.avg_dealprice, t6.i_num, t4.item_count, t6.u_num, t4.seller_count,
        t7.hour_0, t7.hour_1, t7.hour_2, t7.hour_3, t7.hour_4, t7.hour_5, t7.hour_6, t7.hour_7,
        t7.hour_8, t7.hour_9, t7.hour_10, t7.hour_11, t7.hour_12, t7.hour_13, t7.hour_14, t7.hour_15,
        t7.hour_16, t7.hour_17, t7.hour_18, t7.hour_19, t7.hour_20, t7.hour_21, t7.hour_22, t7.hour_23
        from(
            select keyword, count(distinct user_num_id) u_num, count(item_id) i_num
            from taobao.top_cat_items
            group by keyword
        )t6
        left join (
            SELECT t1.keyword, count(distinct t1.wangwang) seller_count, sum(t1.item_count) item_count,
            sum(t1.trade_num) trade_num,
            sum(t1.sales) / sum(trade_num) pct,
            t2.avg_dealprice,
            t1.date_of
            from {ststc_tb}.ststc_keyword_shop_pct t1
            left join {ststc_tb}.ststc_cat_dealprice t2
            on t1.keyword = t2.keyword
            and t1.date_of = t2.date_of
            where t1.date_of = '{date_of}'
            group by t1.keyword
        )t4 on t6.keyword = t4.keyword
        left join(
            select keyword, sum(sales) sales, sum(volume) volume
            from {ststc_tb}.ststc_cat_shop_sales_detail
            where date_of = '{date_of}'
            group by keyword
        )t5 on t6.keyword = t5.keyword
        left join(
            select t1.keyword,
            sum(t2.hour_0) hour_0,
            sum(t2.hour_1) hour_1,
            sum(t2.hour_2) hour_2,
            sum(t2.hour_3) hour_3,
            sum(t2.hour_4) hour_4,
            sum(t2.hour_5) hour_5,
            sum(t2.hour_6) hour_6,
            sum(t2.hour_7) hour_7,
            sum(t2.hour_8) hour_8,
            sum(t2.hour_9) hour_9,
            sum(t2.hour_10) hour_10,
            sum(t2.hour_11) hour_11,
            sum(t2.hour_12) hour_12,
            sum(t2.hour_13) hour_13,
            sum(t2.hour_14) hour_14,
            sum(t2.hour_15) hour_15,
            sum(t2.hour_16) hour_16,
            sum(t2.hour_17) hour_17,
            sum(t2.hour_18) hour_18,
            sum(t2.hour_19) hour_19,
            sum(t2.hour_20) hour_20,
            sum(t2.hour_21) hour_21,
            sum(t2.hour_22) hour_22,
            sum(t2.hour_23) hour_23
            from taobao.top_cat_items t1
            left join {ststc_tb}.top_item_tradingtime t2
            on t1.item_id = t2.item_id
            and t2.date_of = '{date_of}'
            group by keyword
        )t7 on t6.keyword = t7.keyword
        where t4.date_of is not null""".format(
            ststc_tb='taobao_%s' % date.strftime('%Y%m'),
            date_of=date.strftime('%Y%m%d'))
    dbConn.execute(query.encode('utf-8'))
    dbConnPool.release(dbConn)


def schedule_info(dbConnPool, reConn):

    # IBBD user amount

    dbConn = dbConnPool.get_connection()
    cmdStr = """SELECT COUNT(user) AS num FROM ibbd_user.user2"""
    reConn.hset('ibbd-ststc', 'user-count',
                dbConn.query(cmdStr)[0].num)

    # IBBD keywords amount
    cmdStr = \
        "SELECT COUNT(DISTINCT(keyword)) AS num FROM ibbd_user.user_keywords WHERE status='1'"

    reConn.hset('ibbd-ststc', 'keyword-count',
                dbConn.query(cmdStr)[0].num)
    dbConnPool.release(dbConn)


def page_index(dbConnPool, reConn):

    # 监控指标:商品数量 店铺数量

    dbConn = dbConnPool.get_connection()
    cmdStr = \
        "SELECT COUNT(item_id) AS num FROM taobao.top_item1 UNION SELECT COUNT(shop_id) AS num FROM taobao.top_shop1"
    rs = dbConn.query(cmdStr)
    metadata = {'itemCount': rs[0].num,
                'shopCount': rs[1].num}
    dbConnPool.release(dbConn)
    reConn.hset('page-index', 'monitorscale', json.dumps(metadata))


def main():

    from dateutil.parser import parse as dateparser

    reporter_date = datetime.today() - timedelta(2)
    if len(sys.argv) >= 2:
        reporter_date = dateparser(sys.argv[1])

    dbConnPool = _get_user_db_pool()
    dbStstcPool = _get_ststc_db_pool()
    reConn = _getReConn()
    toDate = date.today() - timedelta(2)
    toDate = reporter_date

    try:
        cacheCatReporter(dbStstcPool, reConn, toDate)
    except UnicodeEncodeError:
        pass
    schedule_info(dbConnPool, reConn)
    # page_index(dbStstcPool, reConn)

    reConn.set('ibbd-ststc-date', (toDate + timedelta(1)).strftime('%Y/%m/%d'
                                                                   ))
    del reConn
    dbConnPool.disconnect()
    dbStstcPool.disconnect()
    del dbConnPool


if __name__ == '__main__':
    main()
