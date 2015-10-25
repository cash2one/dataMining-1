#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
重置B店商品的交易记录更新时间
"""

import ibbdlib
import ibbdlib.redislib

db_conn = ibbdlib.get_db_conn()

iids = set()
cmd_str ="""SELECT * FROM topspider.tmp_2"""

for row in db_conn.iter(cmd_str):
    iids.add(row.item_id)

re_conn = ibbdlib.get_redis_conn()

print 'deleting config'
ibbdlib.redislib.redis_pipe(re_conn, [['HDEL', 'TopItemShopId', iid] for iid in iids])
ibbdlib.redislib.redis_pipe(re_conn, [['HDEL', 'TopItemTradeUri', iid] for iid in iids])
print 'reseting config'
ibbdlib.redislib.redis_pipe(re_conn, [['HSET', 'TopItemTradeUpdateTime', iid, '1900/1/1'] for iid in iids])

print 'renaming schedule'
# re_conn.rename('Schedule_itemTrade', 'Schedule_itemTrade2')
print 'adding schedule'
re_conn.sadd('Schedule_itemTrade2', *iids)

del re_conn
db_conn.close()