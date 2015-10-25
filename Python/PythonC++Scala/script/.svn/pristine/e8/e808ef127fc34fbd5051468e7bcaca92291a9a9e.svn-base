#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.8.20
把指标计算结果保存到Redis
'''

import json
from datetime import datetime, date, timedelta

from dfhspider.lib import getDBConn, getRedisConn

import redis

import logging
import logging.handlers
filehandler = logging.handlers.TimedRotatingFileHandler(filename='../log/ibbdredis.log', when='D', interval=1)
formatter = logging.Formatter('%(asctime)s %(name)s %(levelname)s %(message)s', '%Y-%m-%d %H:%M:%S')
filehandler.setFormatter(formatter)
log = logging.getLogger('dw.ibbdredis')
log.addHandler(filehandler)
log.setLevel(logging.INFO)


def schedule_info(dbConn, redisConn):

    # IBBD user amount

    cmdStr = """SELECT COUNT(user) FROM ibbd2.user2"""
    dbConn.query(cmdStr)
    redisConn.hset('ibbd-ststc', 'user-count', dbConn.store_result().fetch_row()[0][0])

    # IBBD keywords amount

    cmdStr = "SELECT COUNT(DISTINCT(keyword)) FROM ibbd2.user_keywords WHERE status='1'"
    dbConn.query(cmdStr)
    redisConn.hset('ibbd-ststc', 'keyword-count', dbConn.store_result().fetch_row()[0][0])

    # schedule amount

    cmdStr = \
        "SELECT COUNT(DISTINCT(schedule_id)) FROM topspider.schedule_plan_log WHERE run_date=CURDATE() AND schedule='Schedule_itemFullInfo'"

    dbConn.query(cmdStr)
    redisConn.hset('ibbd-ststc', 'schedule-item-num', dbConn.store_result().fetch_row()[0][0])
    cmdStr = \
        "SELECT COUNT(DISTINCT(schedule_id)) FROM topspider.schedule_plan_log WHERE run_date=CURDATE() AND schedule='Schedule_shopFullInfo'"
    dbConn.query(cmdStr)
    redisConn.hset('ibbd-ststc', 'schedule-shop-num', dbConn.store_result().fetch_row()[0][0])


def page_index(dbConn, redisConn):

    # 监控指标:商品数量 店铺数量

    cmdStr = \
        "SELECT schedule,COUNT(DISTINCT(schedule_id)) FROM topspider.schedule_plan_log WHERE schedule IN ('Schedule_itemFullInfo','Schedule_shopFullInfo') GROUP BY schedule"
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    rs = [list(r.fetch_row()[0]) for i in range(r.num_rows())]
    rs = dict((t[0], int(t[1])) for t in rs)
    metadata = {'itemCount': rs['Schedule_itemFullInfo'], 'shopCount': rs['Schedule_shopFullInfo']}
    redisConn.hset('page-index', 'monitorscale', json.dumps(metadata))

    # 首页剩余试用名额

    cmdStr = """SELECT COUNT(user) FROM ibbd2.user2"""
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    rs = 100 - r.fetch_row()[0][0]
    redisConn.hset('page-index', 'remainfreeaccount', (rs if rs > 0 else 5))


def page_industry_overview_saletrend(
    dbConn,
    redisConn,
    fromDate,
    toDate,
    ):
    """销售额趋势"""

    cmdStr = \
        """SELECT T1.`user`,T2.date_of,SUM(T2.sales)
        FROM ibbd2.user_keywords T1
        LEFT JOIN ibbd2.ststc_cat_shop_sales_detail T2
        ON T1.keyword=T2.keyword
        AND T2.province<>'全国'
        WHERE T1.`status`='1' 
        AND T2.date_of BETWEEN '{0}' AND '{1}'
        GROUP BY T1.`user`,T2.date_of""".format(fromDate,
            toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    rs = {}
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        if rs.has_key(row[0]):
            rs[row[0]][row[1]] = row[2]
        else:
            rs[row[0]] = {row[1]: row[2]}
    for (user, sales) in rs.items():

        # generate user sale arr metadata

        metadata = {'fromDate': fromDate.strftime('%Y/%m/%d'), 'data': []}
        for i in range((toDate - fromDate).days + 1):
            curDate = fromDate + timedelta(i)
            if sales.has_key(curDate):
                metadata['data'].append(int(sales[curDate] or 0))
            else:
                metadata['data'].append(0)

        # check initialize outdated value

        outdatedTsmp = fromDate
        for i in range(len(metadata['data'])):
            if sum((metadata['data'])[:i]) > 0:
                outdatedTsmp = fromDate + timedelta(i - 2)
                break
        else:
            outdatedTsmp = toDate

        # fetch outdatedData

        if outdatedTsmp > fromDate:
            cmdStr = \
                """SELECT T4.date_of,CAST(SUM(T4.sales) AS SIGNED)
                FROM(
                  SELECT DISTINCT(T2.item_id) AS item_id
                  FROM ibbd2.user_keywords T1
                  LEFT JOIN topspider.top_itemsearchresult T2
                  ON T1.keyword = T2.keyword
                  WHERE T1.user='{0}'
                  AND T1.status='1')T3
                LEFT JOIN ibbd2.top_item2 T4
                ON T3.item_id=T4.item_id
                AND T4.date_of BETWEEN '{1}' AND '{2}'
                WHERE T4.date_of IS NOT NULL
                GROUP BY T4.date_of""".format(user,
                    fromDate, outdatedTsmp)
            dbConn.query(cmdStr)
            r = dbConn.store_result()
            for i in range(r.num_rows()):
                row = r.fetch_row()[0]
                rs[row[0].strftime('%Y/%m/%d')] = row[1]
            metadata2 = []
            for i in range((outdatedTsmp - fromDate).days + 1):
                curDate = (fromDate + timedelta(i)).strftime('%Y/%m/%d')
                metadata2.append(rs.get(curDate) or 0)
            metadata['data'] = metadata2 + (metadata['data'])[len(metadata2):]
        redisConn.hset('page-industry-overview-%s' % user, 'SalesChart', json.dumps(metadata))


def page_industry_overview_pricetrend(
    dbConn,
    redisConn,
    fromDate,
    toDate,
    ):
    """价格趋势"""

    cmdStr = \
        """SELECT T1.`user`,T2.date_of,AVG(T2.avg_dealprice)
        FROM ibbd2.user_keywords T1
        LEFT JOIN ibbd2.ststc_cat_dealprice T2
        ON T1.keyword=T2.keyword
        AND T2.date_of BETWEEN '{0}' AND '{1}'
        WHERE T1.status='1'
        GROUP BY T1.`user`,T2.date_of""".format(fromDate,
            toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    rs = {}
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        if rs.has_key(row[0]):
            rs[row[0]][row[1]] = row[2]
        else:
            rs[row[0]] = {row[1]: row[2]}
    for (user, sales) in rs.items():
        metadata = {'fromDate': fromDate.strftime('%Y/%m/%d'), 'data': []}
        for i in range((toDate - fromDate).days + 1):
            curDate = fromDate + timedelta(i)
            if sales.has_key(curDate):
                metadata['data'].append(int(sales[curDate] or 0))
            else:
                metadata['data'].append(0)

        # check initialize outdated value

        outdatedTsmp = fromDate
        for i in range(len(metadata['data'])):
            if sum((metadata['data'])[:i]) > 0:
                outdatedTsmp = fromDate + timedelta(i - 2)
                break
        else:
            outdatedTsmp = toDate

        # fetch outdatedData

        if outdatedTsmp > fromDate:
            cmdStr = \
                """SELECT T4.date_of,CAST(AVG(T4.avg_deal_price) AS SIGNED)
                FROM(
                  SELECT DISTINCT(T2.item_id) AS item_id
                  FROM ibbd2.user_keywords T1
                  LEFT JOIN topspider.top_itemsearchresult T2
                  ON T1.keyword = T2.keyword
                  WHERE T1.user='{0}'
                  AND T1.status='1')T3
                LEFT JOIN ibbd2.top_item2 T4
                ON T3.item_id=T4.item_id
                AND T4.date_of BETWEEN '{1}' AND '{2}'
                WHERE T4.date_of IS NOT NULL
                GROUP BY T4.date_of""".format(user,
                    fromDate, outdatedTsmp)
            dbConn.query(cmdStr)
            r = dbConn.store_result()
            for i in range(r.num_rows()):
                row = r.fetch_row()[0]
                rs[row[0].strftime('%Y/%m/%d')] = row[1]
            metadata2 = []
            for i in range((outdatedTsmp - fromDate).days + 1):
                curDate = (fromDate + timedelta(i)).strftime('%Y/%m/%d')
                metadata2.append(rs.get(curDate) or 0)
            metadata['data'] = metadata2 + (metadata['data'])[len(metadata2):]
        redisConn.hset('page-industry-overview-%s' % user, 'PriceChart', json.dumps(metadata))


def page_industry_hotregion(
    dbConn,
    redisConn,
    fromDate,
    toDate,
    ):
    """热卖地区"""

    cmdStr = \
        """SELECT T1.`user`,T2.province,SUM(T2.sales)
        FROM ibbd2.user_keywords T1
        LEFT JOIN ibbd2.quota_sale_index T2
        ON T1.keyword=T2.keyword
        AND T2.date_of BETWEEN '{0}' AND '{1}'
        WHERE T1.status='1'
        AND T2.province IS NOT NULL
        AND T2.province<>'全国'
        AND T2.province<>''
        GROUP BY T1.`user`,T2.province
        ORDER BY T1.`user`,SUM(T2.sales) DESC""".format(fromDate,
            toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    metadata = {}
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        if metadata.has_key(row[0]):
            if len(metadata[row[0]]) < 5:
                metadata[row[0]].append(list(row[1:]))
        else:
            metadata[row[0]] = [list(row[1:])]
    for (user, province) in metadata.items():
        redisConn.hset('page-industry-overview-%s' % user, 'HotRegion', json.dumps(province))


def page_industry_overview(
    dbConn,
    redisConn,
    fromDate,
    toDate,
    ):
    """行业概况"""

    # 行业概况 卖家数量

    cmdStr = \
        """SELECT T.user,
        SUM(CASE WHEN T.ShopType='Tmall' THEN T.ShopNum ELSE 0 END) AS TmallNum,
        SUM(CASE WHEN T.ShopType='C' THEN T.ShopNum ELSE 0 END) AS CNum
        FROM(
            SELECT T1.user,
                CASE WHEN T2.shop_rank IS NOT NULL THEN 'C' ELSE 'Tmall' END AS ShopType,
                COUNT(DISTINCT(T2.user_num_id)) AS ShopNum
            FROM(SELECT T1.`user`,T2.user_num_id
                FROM ibbd2.user_keywords T1
                LEFT JOIN topspider.top_itemsearchresult T2
                ON T1.keyword=T2.keyword
                AND DATE(T2.population_tsmp)='{0}'+INTERVAL 1 DAY
                WHERE T1.status='1'
                GROUP BY T1.user,T2.user_num_id )T1
            LEFT JOIN ibbd2.top_shop1 T2
            ON T1.user_num_id=T2.user_num_id
            GROUP BY T1.user,T2.shop_rank)T
        GROUP BY T.user""".format(toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        metadata = {'Tmall': int(row[1]), 'C': int(row[2])}
        redisConn.hset('page-industry-overview-%s' % row[0], 'ShopNum', json.dumps(metadata))

    # 行业概况 商品数量

    cmdStr = \
        """SELECT T.user,
        SUM(CASE WHEN T.shop_type ='2' THEN T.ItemNum END) AS TmallItemNum,
        SUM(CASE WHEN T.shop_type <>'2' THEN T.ItemNum END) AS CItemNum
        FROM(
          SELECT T1.user,T2.shop_type,COUNT(DISTINCT(T1.item_id)) AS ItemNum
          FROM(SELECT T1.user,T2.item_id
            FROM ibbd2.user_keywords T1
            LEFT JOIN topspider.top_itemsearchresult T2
            ON T1.keyword=T2.keyword
            AND DATE(T2.population_tsmp)='{0}'+INTERVAL 1 DAY
            WHERE T1.status='1')T1
          LEFT JOIN ibbd2.top_item1 T2
          ON T1.item_id=T2.item_id
          WHERE T2.shop_type IS NOT NULL
          GROUP BY T1.user,T2.shop_type)T
        GROUP BY T.user""".format(toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        metadata = {'Tmall': int(row[1] or 0), 'C': int(row[2] or 0)}
        redisConn.hset('page-industry-overview-%s' % row[0], 'ItemNum', json.dumps(metadata))

    # 行业概况 成交数量

    cmdStr = \
        """SELECT T1.user,SUM(T2.volume)
        FROM(SELECT T1.user,T2.item_id
          FROM ibbd2.user_keywords T1
          LEFT JOIN topspider.top_itemsearchresult T2
          ON T1.keyword=T2.keyword
          AND DATE(T2.population_tsmp)='{0}'+INTERVAL 1 DAY
          WHERE T1.status='1')T1
        LEFT JOIN ibbd2.top_item2 T2
        ON T1.item_id=T2.item_id
        AND T2.date_of='{0}'
        GROUP BY T1.user""".format(toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        redisConn.hset('page-industry-overview-%s' % row[0], 'ItemVolume', (int(row[1]) if row[1] else 0))

    # 行业概况 平均价格

    cmdStr = \
        """SELECT T1.`user`,
        AVG(CASE WHEN T2.date_of='{0}' THEN T2.avg_dealprice END),
        AVG(CASE WHEN T2.date_of='{0}'-INTERVAL 1 DAY THEN T2.avg_dealprice END)
        FROM ibbd2.user_keywords T1
        LEFT JOIN ibbd2.ststc_cat_dealprice T2
        ON T1.keyword=T2.keyword
        AND T2.date_of BETWEEN '{0}'-INTERVAL 1 DAY AND '{0}'
        WHERE T1.status='1'
        GROUP BY T1.`user`""".format(toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        metadata = {'today': int(row[1] or 0), 'yesterday': int(row[2] or 0), 'trend': '%0.2f' % ((row[1] or 0) * 1.0
                    / (row[2] or 1) - 1)}
        redisConn.hset('page-industry-overview-%s' % row[0], 'AvgPrice', json.dumps(metadata))

    # 行业概况 销售额

    cmdStr = \
        """SELECT T1.user,
        SUM(CASE WHEN T2.date_of='{0}' THEN T2.sales ELSE 0 END),
        SUM(CASE WHEN T2.date_of='{0}'-INTERVAL 1 DAY THEN T2.sales ELSE 0 END)
        FROM ibbd2.user_keywords T1
        LEFT JOIN ibbd2.ststc_cat_shop_sales_detail T2
        ON T1.keyword = T2.keyword
        AND T2.date_of IN ('{0}','{0}'-INTERVAL 1 DAY)
        AND T2.province<>'全国'
        WHERE T1.status='1'
        GROUP BY T1.user""".format(toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]

        # metadata={'today':int(row[1] or 0),'yesterday':int(row[2] or 0),'trend':'%0.2f'%(1-row[1]*1.0/row[2])}

        metadata = {'today': int(row[1] or 0), 'yesterday': int(row[2] or 0), 'trend': None}
        metadata['trend'] = ((row[1] or 0) * 1.0 / (row[2] or 1) - 1 if row[2] else 0)
        metadata['trend'] = '%0.2f' % metadata['trend']
        redisConn.hset('page-industry-overview-%s' % row[0], 'Sales', json.dumps(metadata))

    # 行业概况 客单价

    cmdStr = \
        """SELECT T3.user,
        MAX(CASE WHEN T3.date_of='{0}' THEN T3.pct END) AS yesterday,
        MAX(CASE WHEN T3.date_of='{0}'-INTERVAL 1 DAY THEN T3.pct END) AS beforeyesterday
        FROM(
          SELECT T1.user,T2.date_of,AVG(T2.pct) AS pct
          FROM ibbd2.user_keywords T1
          LEFT JOIN ibbd2.quota_pct_keyword T2
          ON T1.keyword = T2.keyword
          AND T2.date_of BETWEEN '{0}'-INTERVAL 1 DAY AND '{0}'
          WHERE T1.status='1'
          GROUP BY T1.user,T2.date_of
        )T3
        GROUP BY T3.user""".format(toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        metadata = {'yesterday': int(row[1] or 0), 'beforeyesterday': int(row[2] or 0), 'trend': None}
        metadata['trend'] = ((row[1] or 0) * 1.0 / (row[2] or 1) - 1 if row[2] else 0)
        metadata['trend'] = '%0.2f' % metadata['trend']
        redisConn.hset('page-industry-overview-%s' % row[0], 'Pct', json.dumps(metadata))


def page_industry_catsales(
    dbConn,
    redisConn,
    fromDate,
    toDate,
    ):
    """关键字销售量"""

    cmdStr = \
        """SELECT
        user,keyword,SUM(ItemNum),AVG(Price),SUM(Sales),Province
        FROM(
          SELECT
          T1.user,T1.keyword,
          COUNT(T2.item_id) AS ItemNum,
          SUBSTRING_INDEX(T2.location2,' ',1) AS Province,
          IFNULL(AVG(T1.price),0) AS Price,
          SUM(T3.sales) AS Sales
          FROM(SELECT T1.user,T2.keyword,T2.item_id,T2.price
            FROM ibbd2.user_keywords T1
            LEFT JOIN topspider.top_itemsearchresult T2
            ON T1.keyword=T2.keyword
            AND DATE(T2.population_tsmp)='{0}'+INTERVAL 1 DAY
            WHERE T1.status='1')T1
          LEFT JOIN ibbd2.top_item1 T2
          ON T1.item_id=T2.item_id
          LEFT JOIN ibbd2.top_item2 T3
          ON T1.item_id=T3.item_id
          AND T3.date_of='{0}'
          WHERE T1.keyword IS NOT NULL
          AND T2.location2<>''
          AND T2.location2 IS NOT NULL
          GROUP BY T1.user,T1.keyword,SUBSTRING_INDEX(T2.location2,' ',1)
          ORDER BY T1.user,T1.keyword,SUM(T3.sales) DESC)T
        GROUP BY T.user,T.keyword""".format(toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    d = {}
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        if d.has_key(row[0]):
            d[row[0]].append(list(row[1:]))
        else:
            d[row[0]] = [list(row[1:])]
    for (user, data) in d.items():
        data = [[t[0], int(t[1] or 0), '%0.2f' % t[2], int(t[3] or 0), t[4]] for t in data]
        redisConn.hset('page-industry-overview-%s' % user, 'KeywordSales', json.dumps(data))


def page_industry_shopsales(
    dbConn,
    redisConn,
    fromDate,
    toDate,
    ):
    """行业热销店铺"""

    cmdStr = \
        """SELECT T3.user,
        T3.user_num_id,
        T3.wangwang,
        COUNT(DISTINCT(T3.item_id)),
        CAST(SUM(T4.volume) AS SIGNED),
        CAST(SUM(T4.sales) AS SIGNED)
        FROM(
            SELECT T1.user,T2.item_id,T2.user_num_id,T2.wangwang
            FROM ibbd2.user_keywords T1
            LEFT JOIN topspider.top_itemsearchresult T2
            ON T1.keyword = T2.keyword
            WHERE DATE(T2.population_tsmp) BETWEEN '{0}' AND '{1}'+INTERVAL 1 DAY
            GROUP BY T1.user,T2.item_id)T3
        LEFT JOIN ibbd2.top_item2 T4
        ON T3.item_id=T4.item_id
        AND T4.date_of BETWEEN '{0}' AND '{1}'
        GROUP BY T3.user,T3.user_num_id
        ORDER BY T3.user,SUM(T4.sales) DESC""".format(fromDate,
            toDate)
    dbConn.query(cmdStr)
    r = dbConn.store_result()
    userDate = {}
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        if userDate.has_key(row[0]):
            userDate[row[0]].append(list(row[1:]))
        else:
            userDate[row[0]] = [list(row[1:])]


def parseRedisPageIndustryOverview():
    dbConn = getDBConn('ibbd2')
    redisConn = getRedisConn()
    toDate = date.today() - timedelta(2)
    fromDate = toDate - timedelta(15)

    # start

    schedule_info(dbConn, redisConn)
    page_index(dbConn, redisConn)
    page_industry_overview_saletrend(dbConn, redisConn, fromDate, toDate)
    page_industry_overview_pricetrend(dbConn, redisConn, fromDate, toDate)
    page_industry_hotregion(dbConn, redisConn, fromDate, toDate)
    page_industry_overview(dbConn, redisConn, fromDate, toDate)
    page_industry_catsales(dbConn, redisConn, fromDate, toDate)
    redisConn.set('ibbd-ststc-date', (toDate + timedelta(1)).strftime('%Y/%m/%d'))

    # end

    dbConn.close()
    del redisConn
    del dbConn


def main():
    pass


if __name__ == '__main__':

    # main()

    parseRedisPageIndustryOverview()
