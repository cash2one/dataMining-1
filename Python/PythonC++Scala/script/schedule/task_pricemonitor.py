#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.9.24
desc:价格监控任务
'''

import time
import os

from dfhspider.lib import getDBConn, spiderLog2
from dfhspider.app import getItemsByKeyword
from dfhspider.app import getItemTitleSearcResulth
from dfhspider.topbll import savePriceMonitorResult
from dfhspider.topitem import TopItem
from dfhspider.connectionpool import ConnectionPool
import ibbdlib

log_file = os.path.join(os.path.dirname(__file__), 'pricemonitor.log')

import logging
import logging.handlers
filehandler = \
    logging.handlers.TimedRotatingFileHandler(filename=log_file,
                                              when='D', interval=1)
formatter = logging.Formatter('%(asctime)s %(name)s %(levelname)s %(message)s',
                              '%Y-%m-%d %H:%M:%S')
filehandler.setFormatter(formatter)
streamhandler = logging.StreamHandler()
streamhandler.setFormatter(formatter)
log = logging.getLogger('spider.Zhitongche')
log.addHandler(filehandler)
log.addHandler(streamhandler)
log.setLevel(logging.INFO)

MONITOR_INTERVAL = [10, 18]

db_server = {
    'host': '223.4.155.152', 'user': 'ibbd', 'passwd': 'spider', 'db': 'topspider'
}
redis_server = {
    'host': '121.199.16.12',
    'port': 6379,
    'password': 'ibbdooredisserver'
}


def updatePrice():
    db_conn = ibbdlib.get_db_conn(**db_server)
    cmd_str = 'SELECT DISTINCT(item_id) AS item_id FROM ibbd2.user_item_monitor'
    iids = [row.item_id for row in list(db_conn.iter(cmd_str))]
    db_conn.close()
    re_conn = ibbdlib.get_redis_conn(**redis_server)
    re_conn.sadd('Schedule_itempricemonitor', *iids)
    del re_conn


def run():
    tag = 0
    while 1:
        hour = time.localtime().tm_hour
        if hour in MONITOR_INTERVAL and tag == 0:
            updatePrice()
            tag = 1
        elif hour == 0:
            tag = 0
        else:
            time.sleep(60 * 10)


def main():
    # run()
    updatePrice()
    pass


if __name__ == '__main__':
    main()
