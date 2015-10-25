#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import ibbdlib
import ibbdlib.redislib
from datetime import datetime, timedelta

cmd_str = "SELECT item_id, MAX(date_of) AS date_of FROM ibbd2.top_item2 GROUP BY item_id"

commands = []
db_conn = ibbdlib.get_db_conn()
for row in db_conn.iter(cmd_str):
    commands.append(['HSET', 'TopItemTradeUpdateTime', str(row.item_id), (row.date_of+timedelta(1)).strftime('%Y/%m/%d')])
print commands[0]
db_conn.close()
re_conn = ibbdlib.get_redis_conn()
ibbdlib.redislib.redis_pipe(re_conn, commands)
del re_conn