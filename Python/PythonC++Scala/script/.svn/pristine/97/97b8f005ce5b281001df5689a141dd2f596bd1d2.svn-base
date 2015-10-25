#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import json

import sys
sys.path.insert(0, '../../')

from dfhspider.topalliteminfo import getShopItemsOverview
from dfhspider.topbll import saveTopAllitemInfo
from dfhspider.lib import getRedisConn2


def runSchedule():
    reConn = getRedisConn2()
    uids = reConn.hkeys('Schedule_shopAllitemInfoError')
    for i, uid in enumerate(uids):
        url = 'http://store.taobao.com/shop/view_shop.htm?user_number_id=%s' % uid
        try:
            metadata = getShopItemsOverview(url)
            saveTopAllitemInfo(metadata)
        except Exception, e:
            print uid


def main():
    urls = ['http://conba.tmall.com', 'http://hangxian.taobao.com']
    urls = [
        # 'http://glorylife.taobao.com',
        # 'http://cafetown.tmall.com',
        'http://gerun.tmall.com/'
    ]
    for url in urls:
        metadata = getShopItemsOverview(
            url, page=1000000, count=1000000, reqinterval=1)
        # saveTopAllitemInfo(metadata)
        for (i, tdata) in enumerate(metadata):
            print i + 1, json.dumps(tdata, indent=4, ensure_ascii=False)


if __name__ == '__main__':
    main()
