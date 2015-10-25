#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther  Cooper
date    2012.7.19
desc    spider slave
'''

import locale
locale.setlocale(locale.LC_ALL, """""")

import time
import threading
import json
import os
import socket
from datetime import datetime, timedelta
from urllib import quote, unquote

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

import ibbdlib
import ibbdlib.redislib
import ibbdlib.ibbdlog

from slave_config import slave_config, db_server, db_server_master

BUSYINTERVAL = ['20', '21', '22', '23']

SLAVEID = """"""
IP = """"""
PID = os.getpid()
HOST = socket.gethostname()
log = None

# logging handler

import logging


def _get_log():
    log = ibbdlib.ibbdlog.get_logger(
        log_file='slave %s %s.log' % (PID, time.strftime('%Y%m%d', time.localtime())),
        log_name='spider.slave',
        msg_format='%(asctime)s\t%(name)s\t%(process)d\t%(levelname)s\t%(message)s',
        time_format='%Y-%m-%d %H:%M:%S',
        time_routate={'when': 'D', 'interval': 1},
        log_level=logging.INFO,
        )
    return log


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


# end

def _thread_top_bll(
    topbll,
    metadata,
    dbConnPool,
    reConn,
    schedule_name,
    schedule_id,
    schedule_process_name,
    schedule_error_name,
    t1,
    t2,
    ex_op=None,
    ):
    """保存抓取结果并输出记录日志"""

    while 1:
        try:
            topbll(metadata, dbConnPool)
            reConn.hdel(schedule_process_name, schedule_id)
            _slave_info(
                schedule_name,
                'Success',
                schedule_id,
                'len',
                len(metadata),
                'req',
                '%.1f' % (t2 - t1),
                'save',
                '%.1f' % (time.time() - t2),
                )
            if ex_op:
                exec ex_op
            break
        except Exception, e:
            if str(e).find('lost') != -1:
                continue
            else:
                break
            reConn.hset(schedule_error_name, schedule_id, json.dumps({'SlaveID': SLAVEID, 'msg': str(e)}))
            _slave_error(
                schedule_name,
                'Error',
                quote(keyword),
                str(e),
                'req',
                '%.1f' % (t2 - t1),
                'save',
                '%.1f' % (time.time() - t2),
                )


def executeKeywordSearchResult(
    reConn,
    dbConnPool,
    schedule_name='Schedule_keywordSearchResult',
    schedule_error_name='Schedule_keywordSearchResultError',
    schedule_process_name='Schedule_keywordSearchResult_process',
    schedule_config_name='Schedule_keywordSearchResult_config',
    ):
    """执行关键词更新任务
    
    根据提供的schedele_name等获取任务信息和配置，执行任务将结果保存到数据库
    
    Args:
        reConn  Redis连接
        dbConnPool  数据库连接池
        schedule_*  Redis中的schedule配置信息键名
    
    """

    n = 0
    for i in range(50):

        # slave config

        _slave_interval(reConn, n)

        # pipe

        keyword = reConn.spop(schedule_name)
        if keyword:
            keyword = unquote(keyword)
            keywordconfig = json.loads(reConn.hget(schedule_config_name, quote(keyword)))

            # end pipe

            if keyword:
                t1 = t2 = time.time()
                _slave_info(schedule_name, 'Start', quote(keyword))
                reConn.hset(schedule_process_name, quote(keyword), 1)
                try:
                    metadata = getItemsByKeyword(keyword, 'utf-8', keywordconfig.get('page'), keywordconfig.get('price'
                                                 ))
                    t2 = time.time()

                    threading.Thread(target=_thread_top_bll, args=(
                        saveKeywordSearchResult,
                        metadata,
                        dbConnPool['master'],
                        reConn,
                        schedule_name,
                        quote(keyword),
                        schedule_process_name,
                        schedule_error_name,
                        t1,
                        t2,
                        )).start()
                except Exception, e:
                    _slave_error(
                        schedule_name,
                        'Error',
                        quote(keyword),
                        str(e),
                        'req',
                        '%.1f' % (t2 - t1),
                        'save',
                        '%.1f' % (time.time() - t2),
                        )
                    reConn.hset(schedule_error_name, quote(keyword), json.dumps({'SlaveID': SLAVEID, 'msg': str(e)}))
        else:
            break


def executeItemFullInfoSchedule(
    reConn,
    dbConnPool,
    schedule_name='Schedule_itemFullInfo',
    schedule_error_name='Schedule_itemFullInfoError',
    schedule_process_name='Schedule_itemFullInfo_process',
    ):
    '''执行itemFullInfo类型的任务
    '''

    n = 0
    for i in range(50):

        # slave config

        _slave_interval(reConn, n)
        _busy_interval()

        # keep connection with Redis Server

        itemId = None
        while 1:
            try:
                itemId = reConn.spop(schedule_name)
                reConn.hset(schedule_process_name, itemId, 1)
                n = (n + 1) % 100
                break
            except:
                reConn = getRedisConn2()
        if itemId:
            _slave_info(schedule_name, 'Start', itemId)
            try:
                t1 = t2 = time.time()
                topItem = TopItem('http://item.taobao.com/item.htm?id=%s' % itemId)
                topItem = topItem.getFullInfo()
                t2 = time.time()

                threading.Thread(target=_thread_top_bll, args=(
                    saveTopItem,
                    topItem,
                    dbConnPool['master'],
                    reConn,
                    schedule_name,
                    itemId,
                    schedule_process_name,
                    schedule_error_name,
                    t1,
                    t2,
                    )).start()
            except Exception, e:
                _slave_error(
                    schedule_name,
                    'Error',
                    itemId,
                    str(e),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                    )
                reConn.hset(schedule_error_name, itemId, json.dumps({'SlaveID': SLAVEID, 'msg': str(e)}))
        else:
            break


def executeShopFullInfoSchedule(
    reConn,
    dbConnPool,
    schedule_name='Schedule_shopFullInfo',
    schedule_error_name='Schedule_shopFullInfoError',
    schedule_process_name='Schedule_shopFullInfo_process',
    ):

    n = 0
    for i in range(50):

        # slave config

        _slave_interval(reConn, n, 3)
        _busy_interval()

        # keep connection with Redis Server

        shopUserId = None
        while 1:
            try:
                shopUserId = reConn.spop(schedule_name)
                reConn.hset(schedule_process_name, shopUserId, 1)
                n = (n + 1) % 100
                break
            except:
                reConn = getRedisConn2()
        if shopUserId:
            _slave_info(schedule_name, 'Start', shopUserId)
            try:
                t1 = t2 = time.time()
                shop = TopShop('http://store.taobao.com/shop/view_shop.htm?user_number_id=%s' % shopUserId)
                data = shop.getBasicInfo()
                t2 = time.time()

                threading.Thread(target=_thread_top_bll, args=(
                    saveTopShopData,
                    data,
                    dbConnPool['master'],
                    reConn,
                    schedule_name,
                    shopUserId,
                    schedule_process_name,
                    schedule_error_name,
                    t1,
                    t2,
                    )).start()
            except Exception, e:
                _slave_error(
                    schedule_name,
                    'Error',
                    shopUserId,
                    str(e),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                    )
                reConn.hset(schedule_error_name, shopUserId, json.dumps({'SlaveID': SLAVEID, 'msg': str(e)}))
        else:
            break


def executeShopAllitemInfoSchedule(
    reConn,
    dbConnPool,
    schedule_name='Schedule_shopAllitemInfo',
    schedule_error_name='Schedule_shopAllitemInfoError',
    schedule_process_name='Schedule_shopAllitemInfo_process',
    ):

    n = 0
    for i in range(10):

        # slave config

        _slave_interval(reConn, n, 3)
        _busy_interval()

        # keep connection with Redis Server

        shopUserId = None
        while 1:
            try:
                shopUserId = reConn.spop(schedule_name)
                reConn.hset(schedule_process_name, shopUserId, 1)
                n = (n + 1) % 100
                break
            except:
                reConn = getRedisConn2()
        if shopUserId:
            _slave_info(schedule_name, 'Start', shopUserId)
            try:
                t1 = t2 = time.time()
                shop = TopShop('http://store.taobao.com/shop/view_shop.htm?user_number_id=%s'
                               % shopUserId).getBasicInfo()
                shopLink = shop['shopLink']
                data = getShopItemsOverview(shopLink)
                t2 = time.time()

                threading.Thread(target=_thread_top_bll, args=(
                    saveTopAllitemInfo,
                    data,
                    dbConnPool['master'],
                    reConn,
                    schedule_name,
                    shopUserId,
                    schedule_process_name,
                    schedule_error_name,
                    t1,
                    t2,
                    )).start()
            except Exception, e:
                _slave_error(
                    schedule_name,
                    'Error',
                    shopUserId,
                    str(e),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                    )
                reConn.hset(schedule_error_name, shopUserId, json.dumps({'SlaveID': SLAVEID, 'msg': str(e)}))
        else:
            break


def executeItemTradeSchedule(
    reConn,
    dbConnPool,
    schedule_name='Schedule_itemTrade',
    schedule_error_name='Schedule_itemTradeError',
    schedule_process_name='Schedule_itemTrade_process',
    schedule_update_name='TopItemTradeUpdateTime',
    schedule_config_uri_name='TopItemTradeUri',
    schedule_config_id_name='TopItemShopId',
    ):

    n = 0
    for i in range(10):

        # slave config

        _slave_interval(reConn, n, 1)
        _busy_interval()

        # keep connection with Redis Server

        itemId = None
        while 1:
            try:
                itemId = reConn.spop(schedule_name)
                reConn.hset(schedule_process_name, itemId, 1)
                n = (n + 1) % 100
                break
            except:
                reConn = getRedisConn2()
        toDate = datetime.strftime(datetime.today(), '%Y/%m/%d')
        if itemId:
            (fromDate, param_uri_meta, config_id_meta) = ibbdlib.redislib.redis_pipe(reConn, [['hget',
                    schedule_update_name, str(itemId)], ['hget', schedule_config_uri_name, str(itemId)], ['hget',
                    schedule_config_id_name, str(itemId)]])
            fromDate = fromDate or '1900/1/1'
            param_uri_meta = (json.loads(unquote(param_uri_meta)) if param_uri_meta else {})
            config_id_meta = (json.loads(config_id_meta) if config_id_meta else {})
            _slave_info(schedule_name, 'Start', itemId, fromDate, toDate)
            try:
                t1 = t2 = time.time()
                (data, param_uri, config_id) = getTrades3('http://item.taobao.com/item.htm?id=%s' % itemId, fromDate,
                                                          toDate, reqUri=param_uri_meta, config=config_id_meta)
                t2 = time.time()

                if data:

                    threading.Thread(target=_thread_top_bll, args=(
                        saveTopTrade,
                        data,
                        dbConnPool[_get_item_trade_save_table(reConn, config_id['shopId'])],
                        reConn,
                        schedule_name,
                        itemId,
                        schedule_process_name,
                        schedule_error_name,
                        t1,
                        t2,
                        "reConn.hset(schedule_update_name, str('%s'), toDate)" % itemId,
                        )).start()
                if not param_uri_meta:
                    reConn.hset(schedule_config_uri_name, str(itemId), quote(json.dumps(param_uri)))
                if not config_id_meta:
                    reConn.hset(schedule_config_id_name, str(itemId), json.dumps(config_id))
            except Exception, e:
                _slave_error(
                    schedule_name,
                    'Error',
                    itemId,
                    str(e),
                    'req',
                    '%.1f' % (t2 - t1),
                    'save',
                    '%.1f' % (time.time() - t2),
                    )
                reConn.hset(schedule_error_name, itemId, json.dumps({'SlaveID': SLAVEID, 'msg': str(e)}))
        else:
            break


def executeItemRateSchedule(
    reConn,
    dbConnPool,
    schedule_name='Schedule_itemRate_2',
    schedule_error_name='Schedule_itemRate_2Error',
    schedule_process_name='Schedule_itemRate_2_process',
    schedule_update_name='TopItemRateUpdateTime',
    ):

    n = 0
    for i in range(10):

        # slave config

        _slave_interval(reConn, n, 1)
        _busy_interval()

        # keep connection with Redis Server

        itemId = None
        while 1:
            try:
                itemId = reConn.spop(schedule_name)
                reConn.hset(schedule_process_name, itemId, 1)
                n = (n + 1) % 100
                break
            except:
                reConn = getRedisConn2()
        toDate = datetime.strftime(datetime.today(), '%Y-%m-%d')
        if itemId:
            fromDate = reConn.hget(schedule_update_name, str(itemId)) or '1900-1-1'
            _slave_info(schedule_name, 'Start', itemId, fromDate, toDate)
            try:
                data = getRate3('http://item.taobao.com/item.htm?id=%s' % itemId, fromDate, toDate)
                saveTopRate(data, dbConnPool['master'])
                reConn.hset(schedule_update_name, str(itemId), toDate)
                _slave_info(schedule_name, 'Success', itemId, 'Sum', len(data))
                reConn.hdel(schedule_process_name, itemId)
                del data
            except Exception, e:
                _slave_info(schedule_name, 'Error', itemId, str(e))
                reConn.hset(schedule_error_name, itemId, json.dumps({'SlaveID': SLAVEID, 'msg': str(e)}))
        else:
            break


def _busy_interval():
    """在BUSYINTERVAL范围内暂停抓取，一般是晚上8-12点"""

    now = time.localtime()
    if now.tm_hour in BUSYINTERVAL:

        # sleep for 10 min

        time.sleep(60 * 10)


def _slave_interval(reConn, n, interval=10):
    """update slave informaton to redis
    update every n%interval activity
    """

    if n % interval == 0:
        info = reConn.hget('SlaveConfig', SLAVEID)
        if info:
            info = json.loads(info)

            # check IP info

            if not info.get('ip'):
                global IP
                IP = getMyIpInfo()['data']['ip']
                info['ip'] = IP
                reConn.hset('SlaveConfig', SLAVEID, json.dumps(info))

            # check host name

            if not info.get('host'):
                info['host'] = HOST
                reConn.hset('SlaveConfig', SLAVEID, json.dumps(info))
        else:

            info = {
                'pause': 0,
                'interval': 0,
                'name': None,
                'ip': IP,
                'host': HOST,
                }
            reConn.hset('SlaveConfig', SLAVEID, json.dumps(info))
            _slave_activity(reConn)

        # slave sleep

        info = reConn.get('SlaveSleep%s' % SLAVEID)
        if info:
            _slave_info('SlaveSleep', 'Pause', info)
            time.sleep(info)


def _get_item_trade_save_table(reConn, shop_id):
    """pass"""

    # get hash shop_id db_server

    db_server_ip = reConn.hget('TopItemTradeSaveServer', shop_id)

    if db_server_ip:
        return db_server_ip
    else:

        # 得到所有可用DB服务器IP

        db_server_ips = db_server.keys()

        # 构建pipe命令，得到每个DB Server负责存储的shop_id数量

        commands = [['HLEN', ip] for ip in db_server_ips]
        db_server_load = list(ibbdlib.redislib.redis_pipe(reConn, commands))
        selected_ip = db_server_ips[db_server_load.index(min(db_server_load))]

        # 将属于shop_id的交易记录保存到redis供下次使用

        reConn.hset('TopItemTradeSaveServer', shop_id, selected_ip)
        return selected_ip


def _slave_activity(reConn):
    """report slave activity time to redis server
    """

    reConn.hset('SlaveActivity', SLAVEID, time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()))


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


def main():

    # get log

    global log
    log = _get_log()

    # slave info

    _slave_info('initing...')

    # get slave ID

    global SLAVEID
    SLAVEID = getMacId()

    # get slave ID

    global IP
    IP = getMyIpInfo()['data']['ip']

    # connection pool

    conn_config = slave_config.get('IP') or slave_config.get('default')

    # dbConnPool = ConnectionPool(max_connections=1000, **conn_config.get('mysql'))

    dbConnPoolList = dict()
    for (db_server_ip, db_server_config) in db_server.items():
        dbConnPoolList[db_server_ip] = ConnectionPool(max_connections=1000, **db_server_config)
    dbConnPoolList['master'] = ConnectionPool(max_connections=1000, **db_server_master)
    reConn = getRedisConn2(conn_config.get('redis'))
    _slave_info('init... complete')
    _slave_info('slave start to work')

    # thread pool

    threadPool = []
    while 1:
        while 1:
            try:
                _slave_activity(reConn)
                _slave_interval(reConn, 10, 10)
                break
            except Exception, e:
                pass
        for priority in sorted(SCHEDULE_PRIORITY.keys()):

            # clear inactive Thread

            threadPool = [childThread for childThread in threadPool if childThread.isAlive()]
            for schedule in SCHEDULE_PRIORITY[priority]:
                log.debug('schedule %s', schedule)

                # how schedule should run
                # 1.this schedule exists
                # 2.schedule not active
                # 3.current thread
                # final:call schedule function by name

                if reConn.exists(schedule) and schedule not in [t.name for t in threadPool] and sum(map(lambda t: t \
                        in [otherSchedule for otherSchedule in SCHEDULE_PRIORITY[priority] if otherSchedule
                        != schedule], [thread.name for thread in threadPool])) == len(threadPool):
                    threadPool.append(threading.Thread(target=globals()[THREAD_TARGET[schedule]], name=schedule,
                                      args=(reConn, dbConnPoolList)))
                    threadPool[-1].start()
        time.sleep(10)
        log.debug('thread waiting for %d', 30)


if __name__ == '__main__':
    main()
