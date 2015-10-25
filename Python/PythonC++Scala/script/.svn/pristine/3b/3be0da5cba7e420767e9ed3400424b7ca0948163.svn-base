#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther  Cooper
date    2012.7.31
'''

import re
import time
import json
from lib import *
from topshop import TopShop
from topbll import saveTopAllitemInfo
import requests
from BeautifulSoup import BeautifulSoup
try:
    from pyquery import PyQuery
except:
    PyQuery = None

REGX = {
    r'siteId': [r'siteId\s*\=\s*(\d)', r'siteId\s*.+?(\d)'],
    'shopId': [r'shopId\=(\d+)', r'shopId.+?(\d+)'],
    'userId': [r'userid\=(\d+)', r'userId.+?(\d+)'],
    'itemlist': [{'items': r'\<ul\s+class\s*\=\s*\"shop\-list\"\s*\>.+?\<\/ul\>', 'item': r'<li\s*.*?>.+?<\s*.*?/li\s*>'}, {'items': None,
                 'item': r'<dl\s+class="item.+?<\s*/dl\s*>'}],
}

REGXOPTIONS = [{
    'items': r'\<ul\s+class\s*\=\s*\"shop\-list\"\s*\>.+?\<\/ul\>',
    'item': r'\\<li\\>.+?\\<\\/li\\>',
    'iid': r'id\=(\d+)',
    'itemName': r'\<div\s+class\s*\=\s*\"desc\"\s*\>\s*\<a\s+.+?\>\s*(.+?)\s*\<\/a\>',
    'itemLink': r'\<a\s+href\=\"(.+?)\"',
    'itemPic': r'\<img\s+data-ks-lazyload\=\"(.+?)\"',
    'itemPriceType': r'\<div\s+class\s*\=\s*\"price\"\s*\>\s*\<span\>\s*(.+?)\<\/span\s*\>',
    'itemPrice': r'\<div\s+class\s*\=\s*\"price\"\s*\>.+?\<strong\s*\>(\d+\.*\d*)',
    'itemSales': r'\<div\s+class\s*\=\s*\"sales\-amount\"\s*\>.+?\<em\>\s*(\d+)\s*\<',
    'itemRateNum': r'\<div\s+class\s*\=\s*\"rating\"\s*\>.+?\<a\s+.+?\>\D+(\d+).+?',
}, {
    'items': None,
    'item': r'<dl\s+class="items*.+?</dl>',
    'iid': r'id\=(\d+)',
    'itemName': r'<a\s+.*?class.+?item-name.+?>(.+?)<',
    'itemLink': None,
    'itemPic': None,
    'itemPriceType': None,
    'itemPrice': None,
    'itemSales': None,
    'itemRateNum': None,
}]


def _match(content, regxs):
    for regx in regxs:
        result = re.findall(regx, content)
        if result:
            return result[0]
        else:
            continue
    else:
        return None


def _matchallitems(content):
    for (i, regx) in enumerate(REGX['itemlist']):
        if regx['items']:
            items = re.findall(regx['items'], content, re.S)
            if not items:
                continue
            else:
                return (i, re.findall(regx['item'], '<br>'.join(items), re.S))
        else:
            return (i, re.findall(regx['item'], content, re.S))
    else:
        return (-1, [])


def getShopItemsOverview(url, page=10, count=200, reqinterval=0.2):
    '''
    [field] siteId
    [field] shopId
    [field] userId
    [filed] iid 商品ID
    [field] itemName
    [field] itemLink
    [field] itemPic
    [field] itemPriceType
    [field] itemPrice
    [field] itemSales
    [field] itemRateNum
    '''

    metadata = []
    shopLink = TopShop(url).getBasicInfo()['shopLink']
    url = shopLink + '?search=y&viewType=grid&orderType=_hotsell'
    siteId = shopId = userId = None
    page_cursor = count_cursor = 0
    iid_list = []
    while 1:
        if page_cursor >= page:
            break
        # r = request(url, requiredPropertyRegx=r'siteId', retries=10)
        r = requests.get(url, timeout=5)
        s = r.content
        if not siteId:
            siteId = _match(s, REGX[r'siteId'])
            shopId = _match(s, REGX['shopId'])
            userId = _match(s, REGX['userId'])
        for itemcontent in _matchallitems(s)[1]:
            if count_cursor >= count:
                break
            info = {
                'iid': re.findall(r'id\s*\=\s*(\d+)', itemcontent),
                'itemName': re.findall(r'\<div\s+class\s*\=\s*\"desc\"\s*\>\s*\<a\s+.+?\>\s*(.+?)\s*\<\/a\>', itemcontent, re.S),
                'itemLink': re.findall(r'\<a\s+href\=\"(.+?)\"', itemcontent,
                                       re.S),
                'itemPic': re.findall(r'\<img\s+data-ks-lazyload\=\"(.+?)\"',
                                      itemcontent, re.S),
                'itemPriceType': re.findall(r'\<div\s+class\s*\=\s*\"price\"\s*\>\s*\<span\>\s*(.+?)\<\/span\s*\>', itemcontent, re.S),
                'itemPrice': re.findall(r'\<div\s+class\s*\=\s*\"price\"\s*\>.+?\<strong\s*\>(\d+\.*\d*)', itemcontent, re.S),
                'itemSales': re.findall(r'\<div\s+class\s*\=\s*\"sales\-amount\"\s*\>.+?\<em\>\s*(\d+)\s*\<', itemcontent, re.S),
                'itemRateNum': re.findall(r'\<div\s+class\s*\=\s*\"rating\"\s*\>.+?\<a\s+.+?\>\D+(\d+).+?', itemcontent, re.S),
            }
            for (k, v) in info.items():
                if len(v) > 0:
                    info[k] = v[0].decode(r.encoding, 'ignore').encode('utf-8',
                                                                       'ignore')
                else:
                    info[k] = None
            if iid_list.count(info['iid']) > 0:
                continue
            metadata.append([siteId, shopId, userId] + [
                info['iid'],
                info['itemName'],
                info['itemLink'],
                info['itemPic'],
                info['itemPriceType'],
                info['itemPrice'],
                info['itemSales'],
                info['itemRateNum'],
            ])
            iid_list.append(info['iid'])
            count_cursor += 1
        page_cursor += 1
        hasNext = \
            re.findall(r'\<a\s+class\=\"J\_SearchAsync\s+next\"\s+href\=\"(\S+?)\".?\>', s)
        if not hasNext:
            soup = BeautifulSoup(s, fromEncoding=r.encoding)
            hasNext = soup.findAll('a', {'class': 'page-next'}) or \
                soup.findAll('a', {'class': re.compile(r'J\_SearchAsync\snext')})
            hasNext = [hasNext[0]['href']] if hasNext else []
        if len(hasNext) > 0:
            if url == hasNext[0]:
                break
            url = hasNext[0]
            url = re.sub(r'&amp;', r'&', url)
        else:
            break
        time.sleep(reqinterval)
    return metadata
