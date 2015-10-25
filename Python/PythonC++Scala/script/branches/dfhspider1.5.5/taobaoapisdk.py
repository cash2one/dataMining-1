#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
author:Cooper
date:2012.4.4
'''

import json
import time
from datetime import datetime, date, timedelta

from lib import request, getDBConn, escapeSQLCommand
from taobaoapi import getURL, getItemCats, getItemProps, getTrades
from taobaoapibll import saveTrades

import redis


def updateItemCats():
    r = redis.StrictRedis(host='223.4.5.116')
    db = getDBConn('ibbd')
    r.lpush('itemCats', 0)
    while 1:
        if r.llen('itemCats') == 0:
            break
        cat = r.lpop('itemCats')
        metadata = json.loads(getItemCats(cat), encoding='utf-8'
                              )['itemcats_get_response']['item_cats']['item_cat'
                ]
        print json.dumps(metadata, indent=4, ensure_ascii=False)
        for t in metadata:
            cmdStr = \
                "INSERT INTO lib_topitemcats VALUES('{0}','{1}',{2},'{3}','{4}')".format(t['cid'
                    ], escapeSQLCommand(t['name'].encode('utf-8')),
                    t['is_parent'], t['parent_cid'], t['sort_order'])
            db.query(cmdStr)
            if t['is_parent']:
                r.lpush('itemCats', t['cid'])
    db.commit()
    db.close()


def updateItemProps():
    db = getDBConn('ibbd')
    c = db.cursor()
    c.execute('SELECT DISTINCT(cid) FROM ibbd.lib_topitemcats WHERE is_parent=0'
              )
    cidList = c.fetchall()
    c.close()
    for (i, cid) in enumerate(cidList):
        if i <= 5010:
            continue
        metadata = json.loads(getItemProps(cid[0]))
        if not metadata.has_key('itemprops_get_response'):
            print json.dumps(metadata, indent=4)
            break
        if not metadata['itemprops_get_response'].has_key('item_props'):
            continue
        metadata = metadata['itemprops_get_response']['item_props']['item_prop']
        for item_prop in metadata:
            print json.dumps(item_prop, indent=4, ensure_ascii=False)
            if not item_prop.has_key('prop_values'):
                continue
            for prop_value in item_prop['prop_values']['prop_value']:
                cmdStr = \
                    "INSERT INTO lib_topitem_props VALUES('{0}',CURDATE(),'{1}','{2}','{3}','{4}')".format(cid[0],
                        item_prop['pid'], escapeSQLCommand(item_prop['name'
                        ].encode('utf-8')), prop_value['vid'],
                        escapeSQLCommand(prop_value['name'].encode('utf-8')))
                db.query(cmdStr)
    db.commit()
    db.close()


def updateShopTrades(access_token):
    now = datetime.now()
    interval = 10
    for i in range(1, 91):
        if i % interval == 0:
            starts = now - timedelta(i)
            ends = now - timedelta(i - interval)
            metadata = getTrades(access_token,
                                 starts.strftime('%Y-%m-%d %H:%M:%S'),
                                 ends.strftime('%Y-%m-%d %H:%M:%S'))
            metadata = json.loads(metadata, encoding='GBK')
            if metadata['trades_sold_get_response']['total_results'] > 0:
                saveTrades(metadata['trades_sold_get_response']['trades'
                           ]['trade'])
    pass


def getShopTrades(access_token, fromTsmp, toTsmp):
    """根据授权码和时间戳获取交易数据
    """

    now = datetime.now()
    interval = 10
    info = []
    fromTsmp = datetime.strptime(fromTsmp, '%Y-%m-%d %H:%M:%S')
    toTsmp = datetime.strptime(toTsmp, '%Y-%m-%d %H:%M:%S')
    cursorTsmp = toTsmp
    while 1:
        if cursorTsmp < fromTsmp:
            break
        curFromTsmp = cursorTsmp - timedelta(interval)
        curFromTsmp = (fromTsmp if curFromTsmp < fromTsmp else curFromTsmp)
        curToTsmp = cursorTsmp
        if curToTsmp <= curFromTsmp:
            break
        metadata = getTrades(access_token,
                             curFromTsmp.strftime('%Y-%m-%d %H:%M:%S'),
                             curToTsmp.strftime('%Y-%m-%d %H:%M:%S'))
        if metadata['trades_sold_get_response']['total_results'] > 0:
            info.extend(metadata)
        cursorTsmp -= timedelta(interval)
    return info


def main():

    # updateItemProps()

    updateShopTrades('62005158d74d5fa66f8af8fhjdb95ef231fbb0a398e6ae4670923820')
    pass
