#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import json

import sys
sys.path.insert(0, '../../')

from dfhspider.toptrade import getTrades2, getTrades3, getTrades4
from dfhspider.topbll import saveTopTrade
import MySQLdb
from dfhspider.connectionpool import ConnectionPool

mysql_db_config = {
    'host': '223.4.155.152',
    'user': 'ibbd',
    'passwd': 'spider',
    'db': 'ibbd2'
}

# connpool=ConnectionPool(20, **{
#     'host':'localhost',
#     'user':'root',
#     'passwd':'',
#     'db':'ibbd2'
# })

connpool = ConnectionPool(max_connections=20, **mysql_db_config)

local_db = {
    'host': 'localhost',
    'user': 'root',
    'passwd': 'LTs00744601',
    'db': 'topspider',
    'charset': 'utf8',
}


def getDBConn():
    dbConn = MySQLdb.connect(**local_db)
    return dbConn


def main():
    urls = ['http://item.taobao.com/item.htm?id=13134089542',
            'http://detail.tmall.com/item.htm?id=14404922902']
    urls = ['http://item.taobao.com/item.htm?id=19174529793']
    for url in urls:
        data = getTrades4(url, fromTsmp='2013-8-13 15:00:00', toTsmp='2013-10-13 16:00:00', reqinterval=0.4)
        for (i, t) in enumerate(data):
            print i + 1, json.dumps(t, indent=4, ensure_ascii=False)  # .decode('utf-8')

            # raw_input('pause')
        # saveTopTrade(data[0], connpool)

        connpool.disconnect()
    pass


if __name__ == '__main__':
    main()
