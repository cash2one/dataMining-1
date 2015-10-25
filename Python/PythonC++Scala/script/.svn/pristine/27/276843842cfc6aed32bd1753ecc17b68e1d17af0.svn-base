#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther  Cooper
date    2012.7.19
desc    spider slave
version 1.5.1
'''

import time
import threading
import json
import os
import socket
from datetime import datetime, timedelta, date
from urllib import quote, unquote
import traceback
from Queue import Queue
import logging

from dateutil.parser import parse as datetimeparse
import redis

from dfhspider.lib import *
from dfhspider.topshop import TopShop
from dfhspider.topitemslink import getItemsLink
from dfhspider.topalliteminfo import getShopItemsOverview
from dfhspider.topitem import TopItem
from dfhspider.toptrade import getTrades3
from dfhspider.toprate import getRate3
from dfhspider.topbll import *
from dfhspider.topbll import savePriceMonitorResult
from dfhspider.app import getItemRateLastUpdateTime, getItemsByKeyword
from dfhspider.connectionpool import ConnectionPool
from dfhspider.topitemaddon import get_item_addon
from dfhspider.topitemrelation import get_item_relation

import ibbdlib
import ibbdlib.ibbdlog
import ibbdlib.redislib

import topapi
import topapi.app
import topapi.api

from slave_config import slave_config, eth0_mapping
import slave_bll

version = '1.2.1'
SLAVEID = """"""
IP = """"""
PID = os.getpid()
HOST = '%s-%s' % (socket.gethostname(), version)

log = None

SCHEDULE_PRIORITY = {
    30: 'Schedule_topItemFullInfo',
    35: 'Schedule_topShopFullInfo',
    40: 'Schedule_itemRela',
    41: 'Schedule_topAPI',
    43: 'Schedule_shopmonitor_*',
    44: 'Schedule_itemprice_*',
    45: 'Schedule_keywordSearchResult',
    46: 'Schedule_shopAllitemInfo',
    47: 'Schedule_itemTrade3',
    48: 'Schedule_itempricemonitor',
    49: 'Schedule_itemTrade2',
    50: 'Schedule_itemFullInfo',
    51: 'Schedule_shopFullInfo',
    52: 'Schedule_itemRate2',
}

# schedule target, call by name (globals())

THREAD_TARGET = {
    'Schedule_itemFullInfo': 'executeItemFullInfoSchedule',
    'Schedule_itemTrade2': 'executeItemTradeSchedule',
    'Schedule_itemTrade3': 'executeItemTradeSchedule',
    'Schedule_itemRate2': 'executeItemRateSchedule',
    'Schedule_shopFullInfo': 'executeShopFullInfoSchedule',
    'Schedule_shopAllitemInfo': 'executeShopAllitemInfoSchedule',
    'Schedule_itempricemonitor': 'executeItemPriceMonitor',
    'Schedule_keywordSearchResult': 'executeKeywordSearchResult',
    'Schedule_shopmonitor_*': 'executeShopMonitor',
    'Schedule_itemprice_*': 'executeItemPrice',
    'Schedule_itemRela': 'executeItemRela',
    'Schedule_topAPI': 'executeTopAPI',
    'Schedule_topItemFullInfo': 'executeTopItemFullInfo',
    'Schedule_topShopFullInfo': 'executeTopShopFullInfo'
}

THREAD_ARGS = {
    'Schedule_itemTrade3': {
        'schedule_name': 'Schedule_itemTrade3',
        'schedule_error_name': 'Schedule_itemTrade3Error',
        'schedule_process_name': 'Schedule_itemTrade3_process'
    }
}


# end

global DB_POOLS, RE_CONN, INTERRUPT, IP_MAPPING, db_adapter
DB_POOLS = dict()
INTERRUPT = False
IP_MAPPING = dict()
db_adapter = None


from redis.exceptions import ConnectionError


def exeRedisCmd(cmd, *args, **kwargs):
    global RE_CONN
    while True:
        try:
            getattr(RE_CONN, cmd)(*args, **kwargs)
            break
        except ConnectionError:
            log.error('Redis ConnectionError, reconnecting ...')
            RE_CONN = getRedisConn2()
        except AttributeError:
            log.error('Error:Redis Client does not has attr %s ' % cmd)
            break
        except:
            log.error(traceback.format_exc())
            break


class DBServerAdapter(object):

    def __init__(self, schedule_name):
        self.schedule_name = schedule_name
        self.intervals = []
        self.table = None
        self.today = date.today()

    def get_table(self, userNumId):
        global RE_CONN
        if not self.intervals:
            log.info('HGET ScheduleConfig shop_interval')
            self.intervals = RE_CONN.hget("ScheduleConfig", "shop_interval")
            self.intervals = eval(self.intervals)
        if self.today != date.today():
            self.today = date.today()
        for i in range(len(self.intervals) - 1):
            if self.intervals[i] <= int(userNumId) < self.intervals[i + 1]:
                cursor = i + 1
                break
        else:
            cursor = 1
        self.table = 'top_item_trade_his_%s_%d' % (
            self.today.strftime('%Y%m%d'), cursor)
        return self.table


def worker(bll_queue):
    global db_adapter
    while True:
        bll_task = bll_queue.get()  # save result
        log.info('bll_queue start %s', bll_task[0].func_name)
        try:
            if bll_task[4] in [
                'Schedule_itemTrade2',
                'Schedule_itemTrade3'
            ]:
                userNumId = bll_task[11]['userNumId']
                if not db_adapter:
                    db_adapter = DBServerAdapter(bll_task[4])
                table_name = db_adapter.get_table(userNumId)
                log.info('bll_task db adapter %s %s', userNumId, table_name)
                bll_task[0](bll_task[1], bll_task[2], table_name)
            else:
                bll_task[0](bll_task[1], bll_task[2])
            log.info('bll_queue success %s', bll_task[0].func_name)
            _slave_info(
                bll_task[4],
                'Success',
                bll_task[5],
                'len',
                len(bll_task[1]),
                'req',
                '%.1f' % (bll_task[9] - bll_task[8]),
                'save',
                '%3.1f' % (time.time() - bll_task[9]),
            )

            # if ex_op:
            #     print ex_op
            #     exec ex_op
            if len(bll_task) > 10:
                if bll_task[10]:
                    exeRedisCmd('execute_command', *bll_task[10])
                    # RE_CONN.execute_command(*bll_task[10])
        except:
            log.error(traceback.format_exc())
            _slave_error(
                bll_task[4],
                'Error',
                bll_task[5],
                traceback.format_exc(),
                'req',
                '%.1f' % (bll_task[9] - bll_task[8]),
                'save',
                '%.1f' % (time.time() - bll_task[9]),
            )
            exeRedisCmd('hset', bll_task[7], bll_task[5], json.dumps({
                                                                     'SlaveID': SLAVEID, 'msg': traceback.format_exc()}))
        finally:  # delete itemId in process queue anyway
            exeRedisCmd('hdel', bll_task[6], bll_task[5])
        bll_queue.task_done()


bll_queue = Queue()


def executeItemPriceMonitor(
    schedule_name='Schedule_itempricemonitor',
    schedule_error_name='Schedule_itempricemonitor_error',
    schedule_process_name='Schedule_itempricemonitor_process'
):
    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    while True:
        if INTERRUPT:
            INTERRUPT = False
            break
        # slave config
        _slave_interval(n)

        # keep connection with Redis Server
        itemId = None
        while True:
            try:
                itemId = RE_CONN.spop(schedule_name)
                n = (n + 1) % 100
                break
            except:
                log.error(traceback.format_exc())
                RE_CONN = getRedisConn2()
        if itemId:
            _slave_info(schedule_name, 'Start', itemId)
            try:
                RE_CONN.hset(schedule_process_name, itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                t1 = t2 = time.time()
                item = TopItem(
                    'http://item.taobao.com/item.htm?id=%s' % itemId
                ).getBasicInfo()
                promo = get_item_addon(
                    itemId,
                    sku=False,
                    promo=True
                )[1]
                price = min([min([float(li['price'])
                             for li in v['promo']] or [item['initPrice']]) for k, v in promo.items()] or [item['initPrice']])
                if item['itemTitle'] is None:
                    log.error('faile to fetch item %s', itemId)
                    raise Exception('failed to fetch item')
                else:
                    t2 = time.time()
                    bll_queue.put((
                        savePriceMonitorResult,
                        {
                            'itemId': itemId,
                            'itemName': item['itemTitle'],
                            'price': price,
                            'itemPic': item['itemImg'],
                            'userNumId': item['userId'],
                            'wangwang': item['shopName']
                        },
                        dbConnPool,
                        None,
                        schedule_name,
                        itemId,
                        schedule_process_name,
                        schedule_error_name,
                        t1,
                        t2,
                    ))
            except:
                _slave_error(
                    schedule_name,
                    'Error',
                    itemId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hset(
                    schedule_error_name,
                    itemId,
                    json.dumps({'SlaveID': SLAVEID, 'msg': traceback.format_exc()}))
        else:
            break


def executeKeywordSearchResult(
    schedule_name='Schedule_keywordSearchResult',
    schedule_error_name='Schedule_keywordSearchResultError',
    schedule_process_name='Schedule_keywordSearchResult_process',
    schedule_config_name='Schedule_keywordSearchResult_config',
):
    """执行关键词更新任务

    根据提供的schedele_name等获取任务信息和配置，执行任务将结果保存到数据库

    Args:
        schedule_*  Redis中的schedule配置信息键名

    """

    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    for i in range(50):
        if INTERRUPT:
            INTERRUPT = False
            break

        # slave config
        _slave_interval(n)

        keyword = RE_CONN.spop(schedule_name)
        if keyword:
            keyword = unquote(keyword)
            keywordconfig = json.loads(RE_CONN.hget(
                schedule_config_name, quote(keyword)))

            if keyword:
                t1 = t2 = time.time()
                _slave_info(schedule_name, 'Start', quote(keyword))
                RE_CONN.hset(schedule_process_name, quote(keyword), {'SlaveID': SLAVEID, 'time': int(time.time())})
                try:
                    metadata = getItemsByKeyword(keyword,
                                                 'utf-8',
                                                 keywordconfig.get('page'),
                                                 keywordconfig.get('price'))
                    if len(metadata) == 0:
                        log.error('items not found of %s', repr(keyword))
                        raise Exception('items not found')
                    t2 = time.time()

                    bll_queue.put((
                        saveKeywordSearchResult,
                        metadata,
                        dbConnPool,
                        None,
                        schedule_name,
                        quote(keyword),
                        schedule_process_name,
                        schedule_error_name,
                        t1,
                        t2
                    ))
                except:
                    _slave_error(
                        schedule_name,
                        'Error',
                        quote(keyword),
                        traceback.format_exc(),
                        'req',
                        '%.1f' % (t2 - t1),
                        'save',
                        '%.1f' % (time.time() - t2),
                    )
                    RE_CONN.hset(
                        schedule_error_name,
                        quote(keyword),
                        json.dumps({
                                   'SlaveID': SLAVEID, 'msg': traceback.format_exc()})
                    )
        else:
            break


def executeItemFullInfoSchedule(
    schedule_name='Schedule_itemFullInfo',
    schedule_error_name='Schedule_itemFullInfoError',
    schedule_process_name='Schedule_itemFullInfo_process',
):
    '''执行itemFullInfo类型的任务
    '''

    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    for i in range(10):
        if INTERRUPT:
            INTERRUPT = False
            break
        # slave config
        _slave_interval(n)

        # keep connection with Redis Server
        itemId = None
        while True:
            try:
                itemId = RE_CONN.spop(schedule_name)
                RE_CONN.hset(schedule_process_name, itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                n = (n + 1) % 100
                break
            except:
                log.error(traceback.format_exc())
                RE_CONN = getRedisConn2()
        if itemId:
            _slave_info(schedule_name, 'Start', itemId)
            try:
                t1 = t2 = time.time()
                topItem = TopItem(
                    'http://item.taobao.com/item.htm?id=%s' % itemId,
                    reqinterval=0.3)
                topItem = topItem.getFullInfo()
                time.sleep(0.3)
                if topItem['itemId'] is None:
                    log.error('failed to fetch item of %s', itemId)
                    raise Exception('failed to fetch item')
                else:
                    t2 = time.time()

                    bll_queue.put((
                        saveTopItem,
                        topItem,
                        dbConnPool,
                        None,
                        schedule_name,
                        itemId,
                        schedule_process_name,
                        schedule_error_name,
                        t1,
                        t2,
                    ))
            except:
                _slave_error(
                    schedule_name,
                    'Error',
                    itemId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hset(
                    schedule_error_name,
                    itemId,
                    json.dumps({'SlaveID': SLAVEID, 'msg': traceback.format_exc(), 'time': time.time()}))
        else:
            break


def executeTopItemFullInfo(
    schedule_name='Schedule_topItemFullInfo',
    schedule_error_name='Schedule_topItemFullInfoError',
    schedule_process_name='Schedule_topItemFullInfo_process',
):
    '''执行itemFullInfo类型的任务
    '''

    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    for i in range(10):
        # slave config
        _slave_interval(n)

        # keep connection with Redis Server
        itemId = None
        while True:
            try:
                itemId = RE_CONN.spop(schedule_name)
                RE_CONN.hset(schedule_process_name, itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                n = (n + 1) % 100
                break
            except:
                log.error(traceback.format_exc())
                RE_CONN = getRedisConn2()
        if itemId:
            _slave_info(schedule_name, 'Start', itemId)
            try:
                t1 = t2 = time.time()
                topItem = TopItem(
                    'http://item.taobao.com/item.htm?id=%s' % itemId,
                    reqinterval=0.3)
                topItem = topItem.getFullInfo()
                time.sleep(0.3)
                if topItem['itemId'] is None:
                    log.error('failed to fetch item of %s', itemId)
                    raise Exception('failed to fetch item')
                else:
                    t2 = time.time()
                    dbConn = dbConnPool.get_connection()
                    c = dbConn.cursor()
                    fields = ("item_id, date_of, price, title, user_num_id, wangwang, "
                              "volume, trade_success, ends, score, shop_credit, shop_score")
                    query = """INSERT IGNORE INTO ibbd2.top_item5(%s) values(%s)""" % (
                        fields, ','.join(['%s' for t in fields.split(', ')]))
                    # print json.dumps(topItem, ensure_ascii=False, indent=4)
                    c.execute(
                        query,
                        (
                            topItem['itemId'],
                            date.today().strftime('%Y-%m-%d'),
                            topItem['initPrice'],
                            topItem['itemTitle'],
                            topItem['userId'],
                            topItem['shopName'],
                            topItem['monthlyTrade'],
                            topItem.get('confirmGoods'),
                            topItem['ends'],
                            topItem['gradeAvg'],
                            topItem.get('shopRank') if topItem['siteId'] != '2' else None,
                            topItem.get('shopGoodRate')
                        ))
                _slave_info(
                    schedule_name,
                    'Success',
                    itemId,
                    'len',
                    0,
                    'req',
                    '%.1f' % (t2 - t1),
                )
                RE_CONN.hdel(schedule_process_name, itemId)
            except:
                _slave_error(
                    schedule_name,
                    'Error',
                    itemId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hset(
                    schedule_error_name,
                    itemId,
                    json.dumps({'SlaveID': SLAVEID, 'msg': traceback.format_exc(), 'time': time.time()}))
        else:
            break


def executeTopShopFullInfo(
    schedule_name='Schedule_topShopFullInfo',
    schedule_error_name='Schedule_topShopFullInfoError',
    schedule_process_name='Schedule_topShopFullInfo_process',
):
    '''执行shopFullInfo类型的任务
    '''

    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    for i in range(10):
        # slave config
        _slave_interval(n)

        # keep connection with Redis Server
        user_num_id = None
        while True:
            try:
                user_num_id = RE_CONN.spop(schedule_name)
                RE_CONN.hset(schedule_process_name, user_num_id, {'SlaveID': SLAVEID, 'time': int(time.time())})
                n = (n + 1) % 100
                break
            except:
                log.error(traceback.format_exc())
                RE_CONN = getRedisConn2()
        if user_num_id:
            _slave_info(schedule_name, 'Start', user_num_id)
            try:
                t1 = t2 = time.time()
                topshop = TopShop(
                    'http://store.taobao.com/shop/view_shop.htm?user_number_id=%s' % user_num_id,
                    reqinterval=0.3)
                topshop = topshop.getFullInfo()
                time.sleep(0.3)
                if topshop['userId'] is None:
                    log.error('failed to fetch shop of %s', user_num_id)
                    raise Exception('failed to fetch shop')
                else:
                    t2 = time.time()
                    dbConn = dbConnPool.get_connection()
                    c = dbConn.cursor()
                    fields = "shop_id, user_num_id, shop_name, wangwang, shop_type, shop_rank, location, location2"
                    query = """INSERT IGNORE INTO ibbd2.top_shop1(%s) values(%s)""" % (
                        fields, ','.join(['%s' for t in fields.split(', ')]))
                    c.execute(
                        query,
                        (
                            topshop['shopId'],
                            topshop['userId'],
                            topshop['shopName'],
                            topshop['wangwangNick'],
                            topshop['shopType'],
                            topshop['shopRank'],
                            topshop['location'],
                            topshop['location2'],
                        ))
                _slave_info(
                    schedule_name,
                    'Success',
                    user_num_id,
                    'len',
                    0,
                    'req',
                    '%.1f' % (t2 - t1),
                )
                RE_CONN.hdel(schedule_process_name, user_num_id)
            except:
                _slave_error(
                    schedule_name,
                    'Error',
                    user_num_id,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hset(
                    schedule_error_name,
                    user_num_id,
                    json.dumps({'SlaveID': SLAVEID, 'msg': traceback.format_exc(), 'time': time.time()}))
        else:
            break


def executeShopFullInfoSchedule(
    schedule_name='Schedule_shopFullInfo',
    schedule_error_name='Schedule_shopFullInfoError',
    schedule_process_name='Schedule_shopFullInfo_process',
):

    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    for i in range(10):
        if INTERRUPT:
            INTERRUPT = False
            break
        # slave config

        _slave_interval(n, 3)

        # keep connection with Redis Server
        shopUserId = None
        while True:
            try:
                shopUserId = RE_CONN.spop(schedule_name)
                RE_CONN.hset(schedule_process_name, shopUserId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                n = (n + 1) % 100
                break
            except:
                RE_CONN = getRedisConn2()
        if shopUserId:
            _slave_info(schedule_name, 'Start', shopUserId)
            try:
                t1 = t2 = time.time()
                shop = TopShop(
                    'http://store.taobao.com/shop/view_shop.htm?user_number_id=%s' % shopUserId)

                # data = shop.getBasicInfo()

                data = shop.getFullInfo()
                t2 = time.time()

                bll_queue.put((
                    saveTopShopData,
                    data,
                    dbConnPool,
                    None,
                    schedule_name,
                    shopUserId,
                    schedule_process_name,
                    schedule_error_name,
                    t1,
                    t2,
                ))
            except:
                _slave_error(
                    schedule_name,
                    'Error',
                    shopUserId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hset(
                    schedule_error_name,
                    shopUserId,
                    json.dumps({'SlaveID': SLAVEID, 'msg': traceback.format_exc(), 'time': time.time()}))
        else:
            break


def executeShopAllitemInfoSchedule(
    schedule_name='Schedule_shopAllitemInfo',
    schedule_error_name='Schedule_shopAllitemInfoError',
    schedule_process_name='Schedule_shopAllitemInfo_process',
):

    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    for i in range(10):
        if INTERRUPT:
            INTERRUPT = False
            break
        # slave config
        _slave_interval(n, 3)

        # keep connection with Redis Server
        shopUserId = None
        while True:
            try:
                shopUserId = RE_CONN.spop(schedule_name)
                RE_CONN.hset(schedule_process_name, shopUserId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                n = (n + 1) % 100
                break
            except:
                log.error(traceback.format_exc())
                RE_CONN = getRedisConn2()
        if shopUserId:
            _slave_info(schedule_name, 'Start', shopUserId)
            try:
                t1 = t2 = time.time()
                shop = TopShop(
                    'http://store.taobao.com/shop/view_shop.htm?user_number_id=%s'
                    % shopUserId
                ).getBasicInfo()
                shopLink = shop['shopLink']
                data = getShopItemsOverview(shopLink)
                t2 = time.time()

                bll_queue.put((
                    saveTopAllitemInfo,
                    data,
                    dbConnPool,
                    None,
                    schedule_name,
                    shopUserId,
                    schedule_process_name,
                    schedule_error_name,
                    t1,
                    t2,
                ))
            except:
                _slave_error(
                    schedule_name,
                    'Error',
                    shopUserId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hset(
                    schedule_error_name,
                    shopUserId,
                    json.dumps({'SlaveID': SLAVEID, 'msg': traceback.format_exc(), 'time': time.time()}))
        else:
            break


def executeItemTradeSchedule(
    schedule_name='Schedule_itemTrade2',
    schedule_error_name='Schedule_itemTradeError',
    schedule_process_name='Schedule_itemTrade_process',
    schedule_update_name='TopItemTradeUpdateTime',
    schedule_config_uri_name='TopItemTradeUri',
    schedule_config_id_name='TopItemShopId',
):

    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    reqinterval = (slave_config.get(IP)['reqinterval']
                   if slave_config.get(IP)
                   else slave_config.get('default')['reqinterval'])

    for i in range(10):
        if INTERRUPT:
            INTERRUPT = False
            break
        # slave config
        _slave_interval(n, 1)

        # keep connection with Redis Server

        itemId = None
        while True:
            try:
                itemId = RE_CONN.spop(schedule_name)
                RE_CONN.hset(schedule_process_name, itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                n = (n + 1) % 100
                break
            except:
                log.error(traceback.format_exc())
                RE_CONN = getRedisConn2()
        toDate = datetime.strftime(datetime.today(), '%Y/%m/%d')
        if itemId:
            t1 = time.time()
            try:
                (fromDate,
                    param_uri_meta,
                    config_id_meta) = ibbdlib.redislib.redis_pipe(
                        RE_CONN,
                        [['hget',
                          schedule_update_name,
                          str(itemId)],
                         ['hget',
                          schedule_config_uri_name,
                          str(itemId)],
                         ['hget', schedule_config_id_name,
                          str(itemId)]])
                fromDate = fromDate or '1900/1/1'
                param_uri_meta = (json.loads(unquote(
                    param_uri_meta)) if param_uri_meta else {})
                config_id_meta = (json.loads(
                    config_id_meta) if config_id_meta else {})
                _slave_info(schedule_name, 'Start', itemId, fromDate, toDate)

                (data, param_uri, config_id) = getTrades3(
                    'http://item.taobao.com/item.htm?id=%s' % itemId,
                    fromDate,
                    toDate,
                    reqUri=param_uri_meta,
                    config=config_id_meta,
                    reqinterval=reqinterval,
                )
                _slave_info(schedule_name, 'fetched', itemId, fromDate, toDate)
                t2 = time.time()

                if len(data) > 0:

                    re_command = ['HSET',
                                  schedule_update_name,
                                  itemId,
                                  (datetimeparse(data[0][10]) + timedelta(1)).strftime('%Y/%m/%d')]

                    bll_queue.put((
                        saveTopTrade,
                        data,
                        dbConnPool,
                        None,
                        schedule_name,
                        itemId,
                        schedule_process_name,
                        schedule_error_name,
                        t1,
                        t2,
                        re_command,
                        config_id
                    ))
                    if not param_uri_meta:
                        RE_CONN.hset(
                            schedule_config_uri_name,
                            str(itemId),
                            quote(json.dumps(param_uri)))
                    if not config_id_meta:
                        RE_CONN.hset(
                            schedule_config_id_name,
                            str(itemId),
                            json.dumps(config_id))
                else:
                    _slave_info(
                        schedule_name,
                        'Success',
                        itemId,
                        'len',
                        0,
                        'req',
                        '%.1f' % (t2 - t1),
                    )
                    RE_CONN.hdel(schedule_process_name, str(itemId))
            except:
                RE_CONN.hdel(schedule_process_name, str(itemId))  # del
                t2 = time.time()
                _slave_error(
                    schedule_name,
                    'Error',
                    itemId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '0',
                )
                RE_CONN.hset(
                    schedule_error_name,
                    itemId,
                    json.dumps({'SlaveID': SLAVEID, 'msg': traceback.format_exc(), 'time': time.time()}))
        else:
            break


def executeItemRateSchedule(
    schedule_name='Schedule_itemRate2',
    schedule_error_name='Schedule_itemRate2Error',
    schedule_process_name='Schedule_itemRate2_process',
    schedule_update_name='TopItemRateUpdateTime',
):

    global RE_CONN, INTERRUPT
    dbConnPool = _reload_slave_db_pool(schedule_name)
    n = 0
    reqinterval = (slave_config.get(IP)['reqinterval']
                   if slave_config.get(IP)
                   else slave_config.get('default')['reqinterval'])

    for i in range(10):
        if INTERRUPT:
            INTERRUPT = False
            break
        # slave config
        _slave_interval(n, 1)
        itemId = None
        while True:
            try:
                itemId = RE_CONN.spop(schedule_name)
                RE_CONN.hset(schedule_process_name, itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                n = (n + 1) % 100
                break
            except:
                log.error(traceback.format_exc())
                RE_CONN = getRedisConn2()
        toDate = datetime.strftime(datetime.today(), '%Y-%m-%d')
        if itemId:
            fromDate = RE_CONN.hget(
                schedule_update_name, str(itemId)) or '1900-1-1'
            _slave_info(schedule_name, 'Start', itemId, fromDate, toDate)
            try:
                t1 = t2 = time.time()
                data = getRate3('http://item.taobao.com/item.htm?id=%s' %
                                itemId, fromDate, toDate, reqinterval=reqinterval)
                t2 = time.time()
                if len(data) > 0:
                    re_command = ['HSET',
                                  schedule_update_name,
                                  itemId,
                                  toDate]
                    bll_queue.put((
                        saveTopRate,
                        data,
                        dbConnPool,
                        None,
                        schedule_name,
                        itemId,
                        schedule_process_name,
                        schedule_error_name,
                        t1,
                        t2,
                        re_command
                    ))
                else:
                    _slave_info(
                        schedule_name,
                        'Success',
                        itemId,
                        'len',
                        0,
                        'req',
                        '%.1f' % (t2 - t1),
                    )
                    RE_CONN.hdel(schedule_process_name, str(itemId))
            except:
                _slave_error(
                    schedule_name,
                    'Error',
                    itemId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hdel(schedule_process_name, str(itemId))  # also del
                RE_CONN.hset(schedule_error_name,
                             itemId,
                             json.dumps({'SlaveID': SLAVEID, 'msg': traceback.format_exc(), 'time': time.time()}))
        else:
            break


def executeShopMonitor(
    schedule_name='Schedule_shopmonitor_*',
    schedule_error_name='Schedule_shopmonitor_*_error',
    schedule_process_name='Schedule_shopmonitor_*_process',
):

    global RE_CONN
    _slave_interval(10)
    schedule_set_names = RE_CONN.keys(schedule_name)
    for schedule_set_name in schedule_set_names:
        if schedule_set_name and re.match(schedule_name.rstrip('*') + r'\d+$', schedule_set_name):
            dbConnPool = _reload_slave_db_pool(schedule_set_name)
            shop_uid = re.findall(r'\d+', schedule_set_name)[0]
            while True:
                itemId = RE_CONN.spop(schedule_set_name)
                if itemId:
                    t1 = t2 = time.time()
                    _slave_info(schedule_set_name, 'Start', itemId)
                    RE_CONN.hset(schedule_process_name.replace(
                        '*', shop_uid), itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                    item_data = TopItem(
                        'http://item.taobao.com/item.htm?id=%s' % itemId, reqinterval=0.3).getFullInfo()
                    t2 = time.time()
                    time.sleep(0.3)
                    if item_data['itemId']:
                        bll_queue.put((
                            slave_bll.save_top_item,
                            item_data,
                            dbConnPool,
                            None,
                            schedule_set_name,
                            itemId,
                            schedule_process_name.replace('*', shop_uid),
                            schedule_error_name.replace('*', shop_uid),
                            t1,
                            t2,
                        ))
                    else:
                        RE_CONN.hdel(schedule_process_name.replace(
                            '*', shop_uid), itemId)
                else:
                    break


def executeItemPrice(
    schedule_name='Schedule_itemprice_*',
    schedule_error_name='Schedule_itemprice_*_error',
    schedule_process_name='Schedule_itemprice_*_process'
):
    _slave_interval(10)
    schedule_set_names = RE_CONN.keys(schedule_name)
    for schedule_set_name in schedule_set_names:
        if schedule_set_name and re.match(r'^Schedule_itemprice_\d+$', schedule_set_name):
            dbConnPool = _reload_slave_db_pool(schedule_set_name)
            shop_uid = re.findall(r'\d+', schedule_set_name)[0]
            while True:
                itemId = RE_CONN.spop(schedule_set_name)
                if itemId:
                    t1 = t2 = time.time()
                    _slave_info(schedule_set_name, 'Start', itemId)
                    RE_CONN.hset(schedule_process_name.replace(
                        '*', shop_uid), itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
                    try:
                        sku, promo = get_item_addon(itemId, interval=0.4)
                        cur_date = datetime.now().strftime('%Y-%m-%d')
                        sku = [[itemId,
                                cur_date,
                                sku_key,
                                sku_item['skuId'],
                                sku_item['price']]
                               for sku_key, sku_item in sku.items()
                               if sku_item.get('price')]
                        promo_list = []
                        for sku_id, promo_group in promo.items():
                            for promo_item in promo_group['promo']:
                                if not promo_item.get('price'):
                                    continue
                                promo_list.append([itemId,
                                                   cur_date,
                                                   '',
                                                   sku_id,
                                                   promo_group.get(
                                                       'price', '0'),
                                                   promo_item['type'],
                                                   promo_item['price']])
                        t2 = time.time()
                        bll_queue.put((
                            slave_bll.save_top_item_price,
                            (sku, promo_list),
                            dbConnPool,
                            None,
                            schedule_set_name,
                            itemId,
                            schedule_process_name.replace('*', shop_uid),
                            schedule_error_name.replace('*', shop_uid),
                            t1,
                            t2,
                        ))
                    except:
                        _slave_error(
                            schedule_error_name.replace('*', shop_uid),
                            'Error',
                            itemId,
                            traceback.format_exc(),
                            'req',
                            '%.1f' % (t2 - t1),
                            'save',
                            '%.1f' % (time.time() - t2),
                        )
                        RE_CONN.hset(
                            schedule_error_name.replace('*', shop_uid),
                            itemId,
                            json.dumps({
                                'SlaveID': SLAVEID,
                                'msg': traceback.format_exc()
                            }))
                else:
                    break


def executeItemRela(
    schedule_name='Schedule_itemRela',
    schedule_error_name='Schedule_itemRela_error',
    schedule_process_name='Schedule_itemRela_process'
):
    _slave_interval(10)
    dbConnPool = _reload_slave_db_pool(schedule_name)
    while True:
        schedule_data = RE_CONN.spop(schedule_name)
        if not schedule_data:
            # time.sleep(5)
            # continue
            break
        schedule_data = json.loads(schedule_data)
        itemId = schedule_data['iid']
        if itemId:
            t1 = t2 = time.time()
            _slave_info(schedule_name, 'Start', itemId)
            RE_CONN.hset(schedule_process_name, itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
            try:
                data = get_item_relation(
                    itemId,
                    same_cat=schedule_data['same_cat'],
                    other_cat=schedule_data['other_cat'],
                    interval=0.4)
                data['iid'] = itemId
                t2 = time.time()
                bll_queue.put((
                    slave_bll.save_top_item_rela,
                    data,
                    dbConnPool,
                    None,
                    schedule_name,
                    itemId,
                    schedule_process_name,
                    schedule_error_name,
                    t1,
                    t2,
                ))
            except:
                _slave_error(
                    schedule_error_name,
                    'Error',
                    itemId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hset(
                    schedule_error_name,
                    itemId,
                    json.dumps({
                        'SlaveID': SLAVEID,
                        'msg': traceback.format_exc()
                    }))
        else:
            break


def executeTopAPI(
    schedule_name='Schedule_topAPI',
    schedule_error_name='Schedule_topAPI_error',
    schedule_process_name='Schedule_topAPI_process'
):
    _slave_interval(10)
    dbConnPool = _reload_slave_db_pool(schedule_name)
    while True:
        itemId = RE_CONN.spop(schedule_name)
        if not itemId:
            break
        if itemId:
            t1 = t2 = time.time()
            _slave_info(schedule_name, 'Start', itemId)
            RE_CONN.hset(schedule_process_name, itemId, {'SlaveID': SLAVEID, 'time': int(time.time())})
            try:
                item = topapi.app.get_item(itemId)
                cat = topapi.app.get_catname_by_cid(item['cid'])['name']
                brand = topapi.app.get_item_brand(item)
                shop = topapi.api.taobao_shop_get(nick=item['nick'])
                scid = shop['cid']
                sid = shop['sid']
                data = {
                    'item': item,
                    'cat': cat,
                    'brand': brand,
                    'scid': scid,
                    'sid': sid,
                    'iid': itemId
                }
                t2 = time.time()
                bll_queue.put((
                    slave_bll.save_topapi_item,
                    data,
                    dbConnPool,
                    None,
                    schedule_name,
                    itemId,
                    schedule_process_name,
                    schedule_error_name,
                    t1,
                    t2,
                ))
            except:
                _slave_error(
                    schedule_error_name,
                    'Error',
                    itemId,
                    traceback.format_exc(),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                )
                RE_CONN.hset(
                    schedule_error_name,
                    itemId,
                    json.dumps({
                        'SlaveID': SLAVEID,
                        'msg': traceback.format_exc()
                    }))
        else:
            break


def _slave_interval(n, interval=10):
    """update slave informaton to redis
    update every n%interval activity
    """

    global RE_CONN
    if n % interval == 0:
        info = RE_CONN.hget('SlaveConfig', SLAVEID)
        if not info:
            info = {
                'pause': 0,
                'interval': 0,
                'name': None,
                'ip': IP,
                'host': HOST,
            }
            RE_CONN.hset('SlaveConfig', SLAVEID, json.dumps(info))
        _slave_activity()

        # slave sleep
        info = RE_CONN.get('SlaveSleep%s' % SLAVEID)
        if info:
            _slave_info('SlaveSleep', 'Pause', info)
            time.sleep(info)


def _slave_activity():
    """report slave activity time to redis server
    """

    global RE_CONN
    RE_CONN.hset(
        'SlaveActivity',
        SLAVEID,
        time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
    )


def _slave_log(level='INFO', *arg):
    """log to logging and console
    """

    if level == 'INFO':
        log.info('\t'.join([str(t) for t in arg]))
    elif level == 'ERROR':
        log.error('\t'.join([str(t) for t in arg]))


def _slave_info(*arg):
    _slave_log('INFO', *arg)


def _slave_error(*arg):
    _slave_log('ERROR', *arg)


def _reload_slave_db_pool(schedule_name):
    global RE_CONN, DB_POOLS
    host = None
    while True:
        try:
            db_server = json.loads(RE_CONN.get('slave_db_server'))
            db_server = db_server.get(schedule_name) or \
                db_server.get('default') or \
                dict((k, v)
                     for k, v in db_server.items() if not isinstance(v, dict))
            db_server = choose_eth0(db_server, 'mysql')
            host = db_server.get('host')
            if not DB_POOLS.get(db_server.get('host')):
                log.info('add slave db server %s' % db_server.get('host'))
                DB_POOLS[db_server.get('host')] = ConnectionPool(
                    max_connections=1000,
                    **db_server)
            break
        except:
            log.error(traceback.format_exc())
            time.sleep(10)
    return DB_POOLS.get(host)


def prepar():
    # get slave ID
    global SLAVEID
    SLAVEID = getMacId()

    # get slave ID
    global IP
    # IP = getMyIpInfo()['data']['ip']
    for device_id in ['eth1', 'eth0', 'wlan0', 'wlan1']:
        try:
            IP = getIfconfig(device_id)
            break
        except:
            pass
    IP = IP or 'unknow'

    global log
    log_output = (slave_config.get(IP)['slave_info_log']
                  if slave_config.get(IP)
                  else slave_config.get('default')['slave_info_log'])
    log = ibbdlib.ibbdlog.get_logger(
        log_path='../log/',
        log_file='slave %s %s.log' % (
            PID,
            time.strftime('%Y%m%d', time.localtime())
        ),
        log_name='spider.slave',
        msg_format='%(asctime)s\t%(name)s\t%(process)d\t%(levelname)s\t%(message)s',
        time_format='%m-%d %H:%M:%S',
        output=log_output,
        log_level=logging.DEBUG
    )

    _slave_info('initing...')

    # connection pool
    conn_config = slave_config.get(IP) or slave_config.get('default')
    conn_config = slave_config.get('default')
    conn_config['mysql'] = choose_eth0(conn_config['mysql'], 'mysql')
    conn_config['redis'] = choose_eth0(conn_config['redis'], 'redis')
    dbConnPool = ConnectionPool(max_connections=1000, **dict((k, v)
                                for k, v in conn_config.get('mysql').items() if not isinstance(v, dict)))
    reConn = getRedisConn2(conn_config.get('redis'))
    _slave_info('init... complete')
    _slave_info('slave start to work')

    global DB_POOLS, RE_CONN
    DB_POOLS[conn_config.get('mysql')['host']] = dbConnPool
    RE_CONN = reConn

    # return dbConnPool, reConn


def interrupt_runner():
    """
    a interrupt runner listen `slave_interrupt`
    when accepted, slave quit current work and restart
    """
    global INTERRUPT
    while True:
        try:
            conn_config = slave_config.get(IP) or slave_config.get('default')
            conn_config = slave_config.get('default')
            conn_config = choose_eth0(conn_config['redis'], 'redis')
            connection_pool = redis.ConnectionPool(**conn_config)
            client = redis.Redis(connection_pool=connection_pool)
            pubsub = client.pubsub()
            pubsub.subscribe('slave_interrupt')
            listener = pubsub.listen()
            while True:
                try:
                    msg = listener.next()
                    if msg['type'] == 'message':
                        INTERRUPT = True
                        log.info('slave interrupt accepted')
                        break
                except StopIteration:
                    INTERRUPT = False
                    break
                except:
                    INTERRUPT = False
                    log.error(traceback.format_exc())
        except:
            INTERRUPT = False
            log.error(traceback.format_exc())
            time.sleep(10)


def choose_eth0(server, servre_type='mysql'):
    return server
    global IP_MAPPING
    import re
    import subprocess

    def ping(addr):
        p = subprocess.Popen(
            ["ping -c 3 %s" % addr],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=True)
        out = p.stdout.read()
        p.stdout.close()
        per = re.search(r'(\d*)\% packet loss', out).group(1)
        if per >= 50:
            return False
        else:
            return True

    server_eth0 = dict((k, v) for k, v in server.items())
    if IP_MAPPING.get(server['host']):
        server_eth0['host'] = IP_MAPPING.get(server['host'])
    try:
        server_eth0['host'] = eth0_mapping.get(
            server['host']) or server['host']
        if not ping(server_eth0['host']):
            raise Exception('unreached %s' % server_eth0['host'])
        IP_MAPPING[server['host']] = server_eth0['host']
    except:
        log.error(traceback.format_exc())
        server_eth0['host'] = server['host']
        IP_MAPPING[server['host']] = server['host']
    return server_eth0


def main():
    # dbConnPool, reConn = prepar()
    prepar()
    global RE_CONN

    # thread pool
    while True:
        for priority in sorted(SCHEDULE_PRIORITY.keys()):

            schedule = SCHEDULE_PRIORITY[priority]
            log.debug('schedule %s', schedule)

            try:
                if RE_CONN.keys(schedule):
                    kwargs = THREAD_ARGS.get(schedule) or {}
                    globals()[THREAD_TARGET[schedule]](**kwargs)
                    break
            except:
                log.error(traceback.format_exc())
                while True:
                    try:
                        prepar()
                        break
                    except:
                        log.error(traceback.format_exc())
                        time.sleep(10)
        time.sleep(10)
        log.debug('thread waiting for %d', 30)


def prepar_thread():
    threading.Thread(target=interrupt_runner).start()
    for i in range(10):
        t = threading.Thread(target=worker, args=(bll_queue, ))
        t.daemon = True
        t.start()


def test_case():
    global RE_CONN
    prepar()
    # executeTopAPI()
    schedule_name = 'Schedule_topShopFullInfo'
    # RE_CONN.sadd(schedule_name.replace('*', '820708319'), '26781624246', '27169848455')
    RE_CONN.sadd('Schedule_topShopFullInfo', '55181575')
    import json
    slave_db_server = json.loads(RE_CONN.get('slave_db_server'))
    dest_server = {
        'host': '223.4.155.152',
        'user': 'ibbd',
        'passwd': 'spider',
        'db': 'topspider',
        'charset': 'utf8',
        'sql_mode': 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION',
        'connect_timeout': 1800
    }
    slave_db_server['Schedule_topShopFullInfo'] = dest_server
    RE_CONN.set('slave_db_server', json.dumps(slave_db_server))
    while 1:
        executeTopShopFullInfo(
            schedule_name=schedule_name,
            schedule_error_name=schedule_name + '_error',
            schedule_process_name=schedule_name + '_process'
        )


if __name__ == '__main__':
    prepar_thread()
    main()
    # test_case()
    bll_queue.join()
