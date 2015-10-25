#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther  Cooper
date    2012.7.19
desc    spider slave
'''

import time
import threading
import json
import os
import socket
from datetime import datetime, timedelta
from urllib import quote, unquote

from dateutil.parser import parse as datetimeparse

from dfhspider.lib import *
from dfhspider.topshop import TopShop
from dfhspider.topitemslink import getItemsLink
from dfhspider.topalliteminfo import getShopItemsOverview
from dfhspider.topitem import TopItem
from dfhspider.toptrade import getTrades2, getTrades3
from dfhspider.toprate import getRate2, getRate3
from dfhspider.topbll import *
from dfhspider.app import getItemRateLastUpdateTime, getItemsByKeyword
from dfhspider.connectionpool import ConnectionPool

import ibbdlib.redislib

from slave_config import slave_config

BUSYINTERVAL = ['20', '21', '22', '23']

SLAVEID = """"""
IP = """"""
PID = os.getpid()
HOST = socket.gethostname()

# logging handler

import logging
import logging.handlers
filehandler = logging.handlers.TimedRotatingFileHandler(filename='../log/slave %s %s.log' % (PID, time.strftime('%Y%m%d'
                                                        , time.localtime())), when='D', interval=1)
formatter = logging.Formatter('%(asctime)s\t%(name)s\t%(process)d\t%(levelname)s\t%(message)s', '%Y-%m-%d %H:%M:%S')
filehandler.setFormatter(formatter)
streamhandler = logging.StreamHandler()
streamhandler.setFormatter(formatter)
log = logging.getLogger('spider.slave')
log.addHandler(filehandler)
log.addHandler(streamhandler)
log.setLevel(logging.INFO)

SCHEDULE_PRIORITY = {
    0: ['Schedule_keywordSearchResult'],
    1: ['Schedule_shopAllitemInfo'],
    2: ['Schedule_itemTrade'],
    3: ['Schedule_itemFullInfo'],
    4: ['Schedule_shopFullInfo'],
    5: ['Schedule_itemRate_2'],
    }

# schedule target, call by name (globals())

THREAD_TARGET = {
    'Schedule_itemFullInfo': 'executeItemFullInfoSchedule',
    'Schedule_itemTrade': 'executeItemTradeSchedule',
    'Schedule_itemRate_2': 'executeItemRateSchedule',
    'Schedule_shopFullInfo': 'executeShopFullInfoSchedule',
    'Schedule_shopAllitemInfo': 'executeShopAllitemInfoSchedule',
    'Schedule_keywordSearchResult': 'executeKeywordSearchResult',
    }


def _slave_log(level='INFO', *arg):
    """log to logging and console
    """

    if level == 'INFO':
        log.info('\t'.join([str(t) for t in arg]))
    elif level == 'ERROR':
        log.error('\t'.join([str(t) for t in arg]))


    # print '%s\t%d\t%s\t%s' % (time.strftime('%Y-%m-%d %H:%M:%S',
    #                           time.localtime()), PID, level, '\t'.join([str(t)
    #                           for t in arg]))

def _slave_info(*arg):
    _slave_log('INFO', *arg)


def _slave_error(*arg):
    _slave_log('ERROR', *arg)


def main():
    _slave_info('initing...')

    # get slave ID

    global SLAVEID
    SLAVEID = getMacId()

    # get slave ID

    global IP
    IP = getMyIpInfo()['data']['ip']

    # connection pool

    conn_config = slave_config.get('IP') or slave_config.get('default')
    conn_config = slave_config.get('default')
    dbConnPool = ConnectionPool(max_connections=1000, **conn_config.get('mysql'))
    reConn = getRedisConn2(conn_config.get('redis'))
    _slave_info('init... complete')
    _slave_info('slave start to work')
    dbConnPool.disconnect()
    del reConn


if __name__ == '__main__':
    main()
