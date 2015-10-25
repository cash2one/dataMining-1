#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
import json
import ibbdlib

db_server = {
    'host': '223.4.155.152',
    'user': 'ibbdui',
    'passwd': 'ibbduiteam',
    'charset': 'utf8',
    'db': 'ibbd2'
}

redis_server = {
    'host': '121.199.16.12',
    'port': 6379,
    'password': 'ibbdooredisserver'
}

db_conn = ibbdlib.get_db_conn(**db_server)
re_conn = ibbdlib.get_redis_conn(**redis_server)
for user in ['152054329']:
    query = "SELECT user_num_id FROM ibbd2.user_shop_monitor WHERE user=%s"
    for shopmonitor in db_conn.iter(query, user):
        pub_msg = {
            'worker_type': 'shopmonitor',
            'user': user,
            'shop_uid': shopmonitor.user_num_id
        }
        re_conn.publish('worker_shopmonitor', json.dumps(pub_msg))
del re_conn
