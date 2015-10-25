#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.6.18
'''

__all__ = [
    'saveTopShopData',
    'saveTopItemsLink',
    'saveTopItem',
    'saveTopRate',
    'saveTopTrade',
    'saveTopAllitemInfo',
    'saveKeywordSearchResult',
]

import time
import MySQLdb
from lib import getDBConn, escapeSQLCommand
from config import mysql_ip_config
from connectionpool import ConnectionPool

connpool = ConnectionPool(max_connections=10, **mysql_ip_config.get('152'))

DB = 'topspider'
mapping_topshop = {'table': 'topspider.top_shop', 'fields': [
    'shopId',
    'userId',
    'shopLink',
    'shopName',
    'wangwangNick',
    'shopRank',
    'shopGrade',
    'shopRate',
    'shopKeeper',
    'company',
    'location',
    'goodsRate',
    'itemAmount',
    'setupTime',
    'collCount',
    'shopType',
]}
mapping_topitemslink = {'table': 'topspider.top_item_links'}

mapping_top_allitem_info = {'table': 'topspider.top_allitem_info'}

mapping_topitem = {'table': 'topspider.top_item', 'fields': [
    'siteId',
    'itemId',
    'pageId',
    'shopId',
    'userId',
    'charset',
    'keywords',
    'desc',
    'shopName',
    'shopUrl',
    'itemImg',
    'itemTitle',
    'initPrice',
    'promoInfo',
    'postageInfo',
    'monthlyTrade',
    'itemRate',
    'bonus',
    'favNum',
    'totalSoldOut',
    'reviewCount',
    'attrList',
    'starts',
    'ends',
    'userTag',
    'cid',
    'location',
    'brand',
]}
mapping_toprate = {'table': 'topspider.top_item_rate', 'fields': [
    'siteId',
    'shopId',
    'aucNumId',
    'sku',
    'title',
    'content',
    'date',
    'rateId',
    'anony',
    'nick',
    'nickUrl',
    'rank',
    'rankUrl',
    'userId',
    'vipLevel',
    'validscore',
    'appendId',
    'appendContent',
    'appendAfter',
    'appendTime',
    'appendReply',
]}
mapping_toptrade = {'table': 'topspider.top_item_trade', 'fields': [
    'siteId',
    'shopId',
    'itemId',
    'title',
    'nick',
    'rank',
    'vipLevel',
    'price',
    'promoTitle',
    'amount',
    'tradeTime',
    'sku',
]}
mapping_userratelist = {'table': 'topspider.top_user_ratelist', 'fields': [
    'uid',
    'aucNumId',
    'aucPrice',
    'aucSku',
    'aucTitle',
    'award',
    'content',
    'date',
    'from',
    'propertiesAvg',
    'rate',
    'rateId',
    'raterType',
    'tag',
    'tradeId',
    'useful',
    'userAvatar',
    'userNick',
    'userId',
    'validscore',
]}

mapping_topzhitongche = {'table': 'topspider.top_zhitongche', 'fields': [
    'ip',
    'keyword',
    'rank',
    'itemId',
    'itemLink',
    'itemImg',
    'itemPrompName',
    'itemTitle',
    'sellerId',
    'wangwang',
    'price',
    'location',
    'volume',
    'key',
    'keys',
    'time',
]}

mapping_top_ztc_simple = {
    'schema': 'topspider', 'table': 'top_ztc_simple',
    'fields': [
        'id',
        'ip',
        'keyword',
        'item_id',
        'rank',
        'shop_id',
        'key',
        'keys',
        'population_tsmp',
    ]}

mapping_top_ztc_item = {
    'schema': 'topspider', 'table': 'top_ztc_item',
    'fields': [
    'id',
    'zhitonghce_id',
    'link',
    'img',
    'zhitongche_id',
    'title',
    'shop_id',
    'price',
    'location',
    'volume',
    ]}

mapping_top_ztc_shop = {
    'schema': 'topspider', 'table': 'top_ztc_shop',
    'fields': ['id', 'shop_id', 'wangwang']}

mapping_top_keyword_searchresult = {
    'schema': 'topspider',
    'table': 'top_itemsearchresult', 'fields': [
    'keyword',
    'rank',
    'itemId',
    'itemName',
    'itemPic',
    'wangwang',
    'userNumId',
    'price',
    'location',
    'tradeNum',
    'rateNum',
    ]}


def saveTopShopData(d, connpool=connpool):
    dbConn = connpool.get_connection()
    cmd = 'INSERT IGNORE INTO %s values(%s ,NOW())' % (mapping_topshop['table'],
                                                       '$VALUE$')
    v = ''
    for key in mapping_topshop['fields']:
        if d[key]:
            v = v + "'%s', " % escapeSQLCommand(d[key])
        else:
            v = v + 'null, '
    cmd = cmd.replace('$VALUE$', v[:-2])
    dbConn.query(cmd)
    dbConn.commit()
    connpool.release(dbConn)


    # connpool.disconnect()

def saveTopItemsLink(d, connpool=connpool):
    dbConn = connpool.get_connection()
    t = time.time() * 1000
    for itemId in d['ids']:
        cmd = "INSERT IGNORE INTO %s values('%s', '%s', '%s', %d , NOW())" \
            % (mapping_topitemslink['table'], d['shopId'], d['siteId'], itemId,
               t)
        dbConn.query(cmd)
    dbConn.commit()
    connpool.release(dbConn)


    # connpool.disconnect()

def saveTopItem(d, connpool=connpool):
    dbConn = connpool.get_connection()
    cmd = 'INSERT INTO %s values(%s,NOW())' % (mapping_topitem['table'],
                                                      '$VALUE$')
    v = ''
    for key in mapping_topitem['fields']:
        if d[key]:
            v = v + "'%s', " % escapeSQLCommand(d[key])
        else:
            v = v + 'null, '
    cmd = cmd.replace('$VALUE$', v[:-2])
    dbConn.query(cmd)
    dbConn.commit()
    connpool.release(dbConn)


    # connpool.disconnect()

def saveTopRate(infos, connpool=connpool):
    dbConn = connpool.get_connection()
    for data in infos:
        cmd = 'INSERT IGNORE INTO %s values(%s,NOW())' % (mapping_toprate['table'],
                                                          '$VALUE$')
        v = ''
        for li in data:
            if li:
                v = v + "'%s', " % escapeSQLCommand(li)
            else:
                v = v + 'null, '
        cmd = cmd.replace('$VALUE$', v[:-2])
        dbConn.query(cmd)
    dbConn.commit()
    connpool.release(dbConn)


def saveTopTrade(infos, connpool=connpool, table=mapping_toptrade['table']):
    """save top item trade list

    args:
        infos   metadata
        connpool    connection pool
        table   topspider.top_item_trade
    """

    if len(infos) < 1:
        return
    dbConn = connpool.get_connection()
    cursor = dbConn.cursor()
    col_num = len(infos[0])
    insert_query = "INSERT INTO {0} values({1}, NOW())".format(table, ','.join(['%s'] * col_num))
    cursor.executemany(insert_query, infos)
    # for data in infos:
    #     cmd = 'INSERT IGNORE INTO %s values(%s,NOW())' % (table,
    #             '$VALUE$')
    #     v = ''
    #     for li in data:
    #         if li:
    #             v = v + "'%s', " % escapeSQLCommand(li)
    #         else:
    #             v = v + 'null, '
    #     cmd = cmd.replace('$VALUE$', v[:-2])
    #     dbConn.query(cmd)
    dbConn.commit()
    cursor.close()
    connpool.release(dbConn)


def saveTopAllitemInfo(metadata, connpool=connpool):
    dbConn = connpool.get_connection()
    cursor = dbConn.cursor()
    cursor.executemany('INSERT IGNORE INTO %s values(%s,NOW())'
                       % (mapping_top_allitem_info['table'], ','.join(['%s']
                       * 11)), metadata)
    dbConn.commit()
    cursor.close()
    connpool.release(dbConn)


    # connpool.disconnect()

def saveUserRateList(metadata, connpool=connpool):
    dbConn = connpool.get_connection()
    c = dbConn.cursor()
    for data in metadata:
        cmd = 'INSERT IGNORE INTO %s values(%s, NOW())' % (mapping_userratelist['table'
                                                                                ], '$VALUE$')
        v = ''
        for key in mapping_userratelist['fields']:
            if data[key]:
                v = v + "'%s'," % escapeSQLCommand(str(data[key]))
            else:
                v = v + 'null, '
        cmd = cmd.replace('$VALUE$', v[:v.rindex(',')])
        c.execute(cmd)
        for spuRate in data['spuRatting']:
            cmd = \
                "INSERT IGNORE INTO {0} values('{1}','{2}','{3}','{4}','{5}')".format(
                'top_user_rate_spurating',
                data['rateId'],
                spuRate['XID'],
                spuRate['name'],
                spuRate['value'],
                spuRate['desc'],
                )
            c.execute(cmd)
    dbConn.commit()
    c.close()
    connpool.release(dbConn)


    # connpool.disconnect()

def saveZhitongcheResult(metadata, connpool=connpool):
    dbConn = connpool.get_connection()
    c = dbConn.cursor()

#    command="INSERT IGNORE INTO %s values(%s)"%(mapping_topzhitongche['table'],('%s,'*len(mapping_topzhitongche['fields']))[:-1])
#    c.executemany(command,[[record.get(key) for key in mapping_topzhitongche['fields']] for record in metadata])

    # 插入item表

    base_item = [
        'itemId',
        'itemId',
        'itemLink',
        'itemImg',
        'itemPrompName',
        'itemTitle',
        'sellerId',
        'price',
        'location',
        'volume',
    ]
    items = [[record.get(key) for key in base_item] for record in metadata]
    order = \
        'id,zhitongche_id,link,img,zhitongche_name,title,shop_id,price,location,volume'
    insert_item_sql = 'replace into %s.%s(%s) values(%s)' \
        % (mapping_top_ztc_item['schema'], mapping_top_ztc_item['table'],
           order, ('%s,' * len(mapping_top_ztc_item['fields']))[:-1])
    c.executemany(insert_item_sql, items)

    # 插入wangwang店铺表

    base_shop = ['sellerId', 'sellerId', 'wangwang']
    order = 'id,shop_id,wangwang'
    shops = [[record.get(key) for key in base_shop] for record in metadata]
    insert_shop_sql = 'replace into %s.%s values(%s)' \
        % (mapping_top_ztc_item['schema'], mapping_top_ztc_shop['table'], ('%s,'
                                                                           * len(base_shop))[:-1])
    c.executemany(insert_shop_sql, shops)

    # 插入直通车记录表

    base_ztc = [
        'ip',
        'keyword',
        'itemId',
        'rank',
        'sellerId',
        'key',
        'keys',
        'time',
    ]
    order = 'ip,`keyword`,item_id,rank,shop_id,`key`,`keys`,population_tsmp'
    ztcs = [[record.get(key) for key in base_ztc] for record in metadata]
    insert_ztc_sql = 'insert into %s.%s(%s) values(%s)' \
        % (mapping_top_ztc_item['schema'], mapping_top_ztc_simple['table'],
           order, ('%s,' * len(base_ztc))[:-1])
#    print 'topblll.py '
#    print insert_ztc_sql

    delete_sql = "delete from %s.%s where `keyword`='%s'" % \
        (mapping_top_ztc_item['schema'],
         mapping_top_ztc_simple['table'],
         ztcs[0][1])
    c.execute(delete_sql)
    c.executemany(insert_ztc_sql, ztcs)

    dbConn.commit()
    c.close()
    connpool.release(dbConn)


    # connpool.disconnect()

def savePriceMonitorResult(result, connpool=connpool):
    if not result:
        return 0
    dbConn = connpool.get_connection()
    c = dbConn.cursor()
    cmdStr = 'INSERT IGNORE INTO topspider.top_price_monitor2 values(%s,NOW())' \
        % ','.join(['%s'] * 6)
    c.execute(cmdStr, (
        result['itemId'],
        result['itemName'],
        result['price'],
        result['itemPic'],
        result['userNumId'],
        result['wangwang'],
    ))
    c.close()
    dbConn.commit()
    connpool.release(dbConn)

    # connpool.disconnect()

    return 1


def saveKeywordSearchResult(result,
                            connpool=connpool,
                            table_schema='%s.%s' % (
                                mapping_top_keyword_searchresult['schema'],
                                mapping_top_keyword_searchresult['table'])):
    """保存关键词搜索结果
    """

    if not result or len(result) == 0:
        return 0
    dbConn = connpool.get_connection()
    c = dbConn.cursor()
    cmdStr = 'INSERT IGNORE INTO %s values(%s,NOW())' \
        % (table_schema, ','.join(['%s']
           * len(mapping_top_keyword_searchresult['fields'])))
    c.executemany(cmdStr, [[t.get(field) for field in
                  mapping_top_keyword_searchresult['fields']] for t in result])
    dbConn.commit()
    c.close()
    connpool.release(dbConn)
    return len(result)


def saveTopItemPriceInfo(result,
                         connpool=connpool,
                         table_schema='' % ()):
    pass
