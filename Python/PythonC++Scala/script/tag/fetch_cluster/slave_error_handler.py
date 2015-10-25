#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth: Cooper
date: 2012.10.5
save Redis Plan Log
save Redis Spider Error Log
"""

import json
import re
import time

from dfhspider.lib import getDBConn, getRedisConn2

SCHEDULES = ['Schedule_itemFullInfo', 'Schedule_itemTrade', 'Schedule_itemRate', 'Schedule_shopFullInfo',
             'Schedule_shopAllitemInfo']
SCHEDULE_ERROR_MAP = {
    'Schedule_itemFullInfo': 'Schedule_itemFullInfoError',
    'Schedule_itemTrade': 'Schedule_itemTradeError',
    'Schedule_itemRate': 'Schedule_itemRateError',
    'Schedule_shopFullInfo': 'Schedule_shopFullInfoError',
    'Schedule_shopAllitemInfo': 'Schedule_shopAllitemInfoError',
    }


def saveRedisSchedulePlan():
    rdSvr = getRedisConn2()
    db = getDBConn('ibbd2')
    dbCursor = db.cursor()
    for schedule in SCHEDULES:
        ids = rdSvr.smembers(schedule)
        dbCursor.executemany('INSERT INTO topspider.schedule_plan_log VALUES(%s,CURDATE(),%s)', [[schedule, iid]
                             for iid in ids])
    db.commit()
    dbCursor.close()
    db.close()
    del rdSvr


def saveRedisScheduleError(runDate):
    rdSvr = getRedisConn2()
    db = getDBConn('ibbd2')
    dbCursor = db.cursor()

    def parseLog(val):
        j = {}
        try:
            j = json.loads(val)
            return [j['msg'], j['SlaveID']]
        except:
            try:
                j = json.loads(re.sub(r'(\d+)L', r'\1', val.replace("'", '"')))
            except:
                j = {'msg': None, 'SlaveID': None}
        return [j['msg'], j['SlaveID']]

    def resort(arr):

        # resort [schedule,k,schedule_error,msg,slaveid] to [schedule,slaveid,k,schedule_error,msg]

        arr.insert(2, arr[-1])
        return arr[:-1]

    for (schedule, schedule_error) in SCHEDULE_ERROR_MAP.items():
        print schedule, schedule_error, rdSvr.hlen(schedule_error)
        if rdSvr.hlen(schedule_error) > 0:
            dbCursor.executemany('INSERT INTO topspider.schedule_error_log VALUES(%s,%s,%s,%s,%s,%s,NOW())',
                                 [resort([schedule, runDate, k, schedule_error] + parseLog(v)) for (k, v) in
                                 rdSvr.hgetall(schedule_error).items()])

        # rdSvr.delete(schedule_error)

    db.commit()
    dbCursor.close()
    db.close()
    del rdSvr


def main():
    pass


if __name__ == '__main__':

    # main()

    saveRedisScheduleError(time.strftime('%Y-%m-%d', time.localtime()))
