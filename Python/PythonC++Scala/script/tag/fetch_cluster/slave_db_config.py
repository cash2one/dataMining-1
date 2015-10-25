#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
import json

import ibbdlib

from slave_config import slave_config


re_conn = ibbdlib.get_redis_conn(**slave_config.get('default').get('redis'))
schedule_db_mapping = {
    'Schedule_topItemFullInfo': {
        'host': '223.4.155.152',
        'user': 'ibbd',
        'passwd': 'spider',
        'db': 'topspider',
        'charset': 'utf8'
    }
}
slave_db_server = json.loads(re_conn.get('slave_db_server'))
slave_db_server.update(schedule_db_mapping)
re_conn.set('slave_db_server', json.dumps(slave_db_server))
