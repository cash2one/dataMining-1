#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auth: Cooper
date: 2012.9.27
将任务队列中失败的任务再次执行
'''

from dfhspider.lib import getRedisConn2
import ibbdlib

# 任务-错误映射

MAPPING = {
    'Schedule_itemFullInfo': ['Schedule_itemFullInfoError', 'Schedule_itemFullInfo_process'],
    'Schedule_shopAllitemInfo': ['Schedule_shopAllitemInfoError', 'Schedule_shopAllitemInfo_process'],
    'Schedule_itemTrade2': ['Schedule_itemTradeError', 'Schedule_itemTrade_process'],
    'Schedule_shopFullInfo': ['Schedule_shopFullInfoError', 'Schedule_shopFullInfo_process'],
    'Schedule_itemRate_2': ['Schedule_itemRate_2Error', 'Schedule_itemRate_2_process'],
    'Schedule_keywordSearchResult': ['Schedule_keywordSearchResultError', 'Schedule_keywordSearchResult_process'],
}

exclude_key = ['Schedule_shopAllitemInfo', 'Schedule_itemRate_2', 'Schedule_keywordSearchResult']

re_server = {
    'host': 'localhost',
    'password': 'ibbdooredisserver'
}


def get_re_conn():
    return ibbdlib.get_redis_conn(**re_server)


def rollbackErrorSchedule(error_filter={}):
    """重新运行所有Error schedule
    """

    server = get_re_conn()
    for (k, v) in MAPPING.items():
        if k in exclude_key:
            continue
        for vi in v:
            if not server.exists(vi):
                break

            # no filter

            ids = server.hkeys(vi)
            server.delete(vi)
            server.sadd(k, *ids)
            print vi, len(ids), k

            # filter
            # vals = server.hgetall(vi)
            # ids = set()
            # for k,v in vals.items():
            #     for fit in error_filter[k]:
            #         if fit in v:
            #             ids.add(k)
            # server.delete(vi)
            # server.sadd(k, *ids)
            # print vi, len(ids), k

    del server


def rollbackErrorItemTradeSchedule():
    server = get_re_conn()
    vals = server.hgetall('Schedule_itemTradeError')
    iids = []
    for (iid, val) in vals.items():
        if val.find('None') != -1 or val.find('lost') != -1:
            iids.append(iid)
    server.sadd('Schedule_itemTrade', *iids)
    server.delete('Schedule_itemTradeError')
    del server


def rollbackKeywordSearchResultSchedule():
    server = get_re_conn()
    kids = []
    for schedule in ['Schedule_keywordSearchResultError', 'Schedule_keywordSearchResult_process']:
        kids.extend(server.hkeys(schedule))
        server.delete(schedule)
    server.sadd('Schedule_keywordSearchResult', *kids)
    del server


def rollbackShopAllitemSchedule():
    server = get_re_conn()
    uids = []
    for schedule in ['Schedule_shopAllitemInfo_process', 'Schedule_shopAllitemInfoError']:
        uids.extend(server.hkeys(schedule))
        server.delete(schedule)
    server.sadd('Schedule_shopAllitemInfo', *uids)
    del server


def rollbackNullSiteIdItemSchedule():
    print 'init...'
    server = get_re_conn()
    iids = []
    db_conn = ibbdlib.get_db_conn()
    for row in db_conn.iter("SELECT item_id FROM ibbd2.top_cat_items WHERE site_id=''"):
        iids.append(row.item_id)
    db_conn.close()
    print 'Schedule_itemFullInfo', len(iids)
    server.sadd('Schedule_itemFullInfo', *iids)
    del server


def clearAllErrorSchedule():
    """清除所有错误Schedule
    """

    server = get_re_conn()
    for (k, v) in MAPPING.items():
        for vi in v:
            print vi, server.hlen(vi)
            server.delete(vi)
    del server


def main():

    # rollbackErrorSchedule(error_filter={'Schedule_itemTrade': ['lost', 'connection']})

    rollbackErrorSchedule()

    # rollbackErrorItemTradeSchedule()
    # rollbackShopAllitemSchedule()

    # rollbackKeywordSearchResultSchedule()


    # rollbackNullSiteIdItemSchedule()

    # clearAllErrorSchedule()

if __name__ == '__main__':
    main()
