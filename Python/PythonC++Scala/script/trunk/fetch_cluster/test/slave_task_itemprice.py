#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import re
import time
import threading
import json
import traceback

import dfhspider
import dfhspider.app


def _thread_top_bll(
    log,
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
    ex_re_command=None,
):
    """保存抓取结果并输出记录日志"""

    try:
        topbll(metadata, dbConnPool)
        reConn.hdel(schedule_process_name, schedule_id)
        log.info(
            schedule_name,
            'Success',
            schedule_id,
            'len',
            len(metadata),
            'req',
            '%.1f' % (t2 - t1),
            'save',
            '%3.1f' % (time.time() - t2),
        )
        if ex_re_command:
            reConn.execute_command(*ex_re_command)
    except:
        reConn.hset(schedule_error_name, schedule_id, json.dumps(
            {'SlaveID': SLAVEID, 'msg': traceback.format_exc()}))
        _slave_error(
            schedule_name,
            'Error',
            schedule_id,
            traceback.format_exc(),
            'req',
            '%.1f' % (t2 - t1),
            'save',
            '%.1f' % (time.time() - t2),
        )


def _dml_item_price(rows,
                    dbConnPool,
                    reConn,
                    schedule_set_name,
                    schedule_process_name,
                    schedule_error_name,
                    t1,
                    t2):
    pass


def executeItemPriceSchedule(
    reConn,
    dbConnPool,
    log,
    schedule_name='Schedule_itemprice_*',
    schedule_error_name='Schedule_itemprice_*_error',
    schedule_process_name='Schedule_itemprice_*_process',
):

    schedule_set_names = reConn.keys(schedule_name)
    for schedule_set_name in schedule_set_names:
        if schedule_set_name and re.match(r'Schedule_shopmonitor_\d+$',
                                          schedule_set_name):
            shop_uid = re.findall(r'\d+', schedule_set_name)[0]
            while 1:
                itemId = reConn.spop(schedule_set_name)
                if itemId:
                    t1 = t2 = time.time()
                    log.info(schedule_set_name, 'Start', itemId)
                    reConn.hset(schedule_process_name.replace(
                        '*', shop_uid), itemId, 1)
                    item_data = dfhspider.app.get_item()
                    t2 = time.time()
                    time.sleep(1)
                    if item_data['itemId']:
                        threading.Thread(target=_thread_top_bll, args=(
                            _dml_item_price,
                            item_data,
                            dbConnPool,
                            reConn,
                            schedule_set_name,
                            itemId,
                            schedule_process_name.replace('*', shop_uid),
                            schedule_error_name.replace('*', shop_uid),
                            t1,
                            t2,
                        )).start()
                    else:
                        reConn.hdel(schedule_process_name.replace(
                            '*', shop_uid), itemId)
                else:
                    break
