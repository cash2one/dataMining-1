#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.6.11
'''

import re
import time
import json
from lib import request, getDBConn, escapeSQLCommand
from topbll import saveUserRateList


def getUserRateList(uid, maxCount=4000):
    domain = \
        'http://rate.taobao.com/member_rate.htm?content=&result=&from=rate&user_id=%s&identity=1&rater=3&direction=1&page=$PAGE$&callback=shop_rate_list' \
        % uid
    page = 1
    metadata = []
    rateIdDict = {}
    pageStop = False
    INFO = {
        'uid': None,
        'aucNumId': None,
        'aucPrice': None,
        'aucSku': None,
        'aucTitle': None,
        'award': None,
        'content': None,
        'date': None,
        'from': None,
        'propertiesAvg': None,
        'rate': None,
        'rateId': None,
        'raterType': None,
        'tag': None,
        'tradeId': None,
        'useful': None,
        'userAvatar': None,
        'userNick': None,
        'userId': None,
        'validscore': None,
        'spuRateuRatting': [{
            'XID': None,
            'name': None,
            'value': None,
            'desc': None,
            }],
        }

    while 1:
        if pageStop:
            break
        url = domain.replace('$PAGE$', str(page))
        rateList = None
        while 1:
            try:
                rateList = request(url).text
                break
            except:
                pass
        if not rateList:
            break
        if rateList.find('(') == -1 or rateList.find(')') == -1:
            break
        rateList = json.loads(rateList[rateList.index('(')
                              + 1:rateList.rindex(')')], encoding='utf-8')
        if len(rateList['rateListDetail']) == 0:
            break
        for (i, rate) in enumerate(rateList['rateListDetail']):
            if rateIdDict.has_key(rate['rateId']) or len(metadata) > maxCount:
                pageStop = True
                break
            rateIdDict[rate['rateId']] = 1
            metadata.append({
                'uid': uid,
                'aucNumId': rate['auction']['aucNumId'],
                'aucPrice': rate['auction']['auctionPrice'],
                'aucSku': rate['auction']['sku'].encode('utf-8'),
                'aucTitle': rate['auction']['title'].encode('utf-8'),
                'award': rate['award'].encode('utf-8'),
                'content': rate['content'].encode('utf-8'),
                'date': rate['date'],
                'from': rate['from'],
                'propertiesAvg': rate['propertiesAvg'],
                'rate': rate['rate'],
                'rateId': rate['rateId'],
                'raterType': rate['raterType'],
                'tag': rate['tag'],
                'tradeId': rate['tradeId'],
                'useful': rate['useful'],
                'userAvatar': rate['user']['avatar'],
                'userNick': rate['user']['nick'].encode('utf-8'),
                'userId': rate['user']['userId'],
                'validscore': rate['validscore'],
                'spuRatting': [],
                })
            metadata[-1] = dict((k, (v.encode('utf-8') if isinstance(v,
                                unicode) else v)) for (k, v) in
                                metadata[-1].items())
            for spuRate in rate['spuRatting']:
                metadata[-1]['spuRatting'].append({
                    'XID': spuRate['XID'].encode('utf-8'),
                    'name': spuRate['name'].encode('utf-8'),
                    'value': spuRate['value'].encode('utf-8'),
                    'desc': spuRate['desc'].encode('utf-8'),
                    })
        if rateList['maxPage'] == rateList['currentPageNum']:
            break
        page += 1
    return metadata


def main():
    metadata = getUserRateList('10057772', 20)

    # saveUserRateList(metadata)

    pass
