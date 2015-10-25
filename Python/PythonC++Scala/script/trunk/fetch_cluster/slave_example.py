#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import json
from urllib import quote, unquote

from slave import executeKeywordSearchResult
from dfhspider.connectionpool import ConnectionPool
from dfhspider.lib import getRedisConn2


def test_schedule_cat(reConn, connpool):
    keyword = '山地车'
    reConn.sadd('Schedule_keywordSearchResult', quote(keyword))
    reConn.hset('Schedule_keywordSearchResult_config', quote(keyword), json.dumps({'page': 1, 'price': [1000, 5000]}))


    # executeKeywordSearchResult(reConn, connpool)

def main():
    connpool = ConnectionPool(max_connections=20, **{
        'host': 'localhost',
        'user': 'root',
        'passwd': '',
        'db': 'ibbd2',
        })
    reConn = getRedisConn2()
    test_schedule_cat(reConn, connpool)
    del reConn
    connpool.disconnect()


if __name__ == '__main__':
    main()
