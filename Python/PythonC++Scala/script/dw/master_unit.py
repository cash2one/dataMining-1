#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import traceback

import ibbdlib
import ibbdlib.connectionpool
from dfhspider.toptrade import getTrades3
from dfhspider.topbll import saveTopTrade, saveTopItem
from dfhspider.topitem import TopItem

import MySQLdb.connections

keyword = '香港虚拟主机'

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
    }}

if __name__ == '__main__':
    print 'start...'
    db_conn = ibbdlib.get_db_conn(**db_server['223.4.155.172'])
    db_dml_connpool = ibbdlib.connectionpool.ConnectionPool(connection_class=MySQLdb.connections.Connection, 
        max_connections=100, **db_server['223.4.155.172'])
    iids = [row.item_id for row in db_conn.iter("SELECT DISTINCT item_id FROM topspider.top_itemsearchresult WHERE keyword='{}'".format(keyword))]
    iids_errors = []
    for i, iid in enumerate(iids):
        print '%d of %d %s' % (i+1, len(iids), iid)
        try:
            
            # (data, t1, t2) = getTrades3('http://item.taobao.com/item.htm?id=%s' % iid, 
            #     fromTsmp='1900/1/1', 
            #     toTsmp='2013/1/18',
            #     reqinterval=0.2)
            # saveTopTrade(data, connpool=db_dml_connpool, table='topspider.top_item_trade_hongkongvps')
            # print len(data)
            topitem = TopItem('http://item.taobao.com/item.htm?id=%s' % iid).getFullInfo()
            saveTopItem(topitem, connpool=db_dml_connpool)
        except:
            traceback.print_exc()
            iids_errors.append(iid)
    print iids_errors
    db_conn.close()
    db_dml_connpool.disconnect()
