#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.6.11
'''

import re
import time
import json

from lib import *
from topbll import saveTopRate

from dateutil.parser import parse as datetimeparse
import yaml


def _parse_json_str(j_str):
    j_str = j_str.replace('\t', '')
    j_str = j_str.replace(r'\/', '/')
    j_str = re.sub(r'\s+', r' ', j_str, re.S)
    j_str = re.sub(r':', r': ', j_str, re.S)
    j_str = re.sub(r':', r': ', j_str, re.S)
    j_str = j_str.replace(':', ': ')
    j_str = re.sub(
        r'(?P<pre>http:)\s+(?P<end>\/\/)', r'\g<pre>\g<end>', j_str, re.S)
    return j_str


def getRate3(
    url,
    start='1900-1-1',
    end='1900-1-1',
    maxPage=1000,
    reqinterval=0.3
):
    rows = getRate4(url, start, end, maxPage, reqinterval)
    return [row[:21] for row in rows]


def getRate4(
    url,
    start='1900-1-1',
    end='1900-1-1',
    maxPage=1000,
    reqinterval=0.3
):

    start = datetimeparse(start)
    end = datetimeparse(end)
    if start >= end:
        return []
    INFOS = []
    INFO = {
        'siteId': None,
        'shopId': None,
        'aucNumId': None,
        'sku': None,
        'title': None,
        'content': None,
        'date': None,
        'rateId': None,
        'anony': None,
        'nick': None,
        'nickUrl': None,
        'rank': None,
        'rankUrl': None,
        'userId': None,
        'vipLevel': None,
        'validscore': None,
        'appendId': None,
        'appendContent': None,
        'appendAfter': None,
        'appendTime': None,
        'appendReply': None,
        'spuRatting': None
    }
    r = request(url, requiredPropertyRegx=r'shopId\=\d+')
    s = r.content
    shopId = re.findall(r'shopId\=(\d+)', s)[0]
    siteId = re.findall(r'siteId\=(\d)', s)[0]
    itemId = re.findall(r'\"itemId\"\s*\:\s*\"(\d+)\"', s)[0]
    domain = ''
    page = 1
    if siteId == '2':
        try:
            domain = re.findall(r'\"apiTmallReview\"\:\"(.+?)\"', s)[0]
            domain = domain.replace('\\', '') + '&'
            domain = domain \
                + 'order=1&append=0&currentPage=1&forShop=1&ismore=1&callback=jsonp%d' \
                % (time.time() * 1000)
        except:
            domain = 'http://rate.tmall.com/list_detail_rate.htm'
            params = {
                'callback': 'jsonp%d' % (time.time() * 1000),
                'itemId': re.findall(r'item_id=(\d+)', s)[0],
                'spuId': re.findall(r'spu_id=(\d+)', s)[0],
                'sellerId': re.findall(r'user_num_id=(\d+)', s)[0],
                'order': '1',
                'append': '0',
                'currentPage': '1',
                'ismore': '1',
                'forShop': '1',
            }
            domain = domain + '?' + '&'.join(
                ['%s=%s' % (k, str(v))
                 for (k, v) in params.items()])
    else:
        domain = re.findall(r'data\-listApi\=\"(.+?)\"', s)[0]
        params = {
            'currentPageNum': 1,
            'rateType': '',
            'orderType': '',
            'showContent': '1',
            'attribute': '',
            'callback': 'jsonp_reviews_list',
        }
        domain = domain + '&' + '&'.join(
            [k + '=' + str(v) for (k, v) in
             params.items()]).replace('showContent=1', 'showContent=')
    rateIds = []
    while 1:
        if page > maxPage or page > 200:
            break
        stop = False
        if domain.find('currentPageNum') != -1:
            domain = domain.replace(
                re.findall(
                    r'currentPageNum\=\d+',
                    domain)[0],
                'currentPageNum=' + str(page)
            )
        else:
            domain = domain.replace(re.findall(r'currentPage\=\d+', domain)[0],
                                    'currentPage=' + str(page))
        time.sleep(reqinterval)
        r = request(domain)
        s = r.content
        if siteId == '2':
            result = re.findall(r'\{\"aliMallSeller\"\:.+?\"userVipPic\".+?\}',
                                s)
            keys = [
                'aucNumId',
                'auctionSku',
                'title',
                'rateContent',
                'rateDate',
                'id',
                'anony',
                'displayUserNick',
                'displayUserLink',
                'displayRateSum',
                'displayRatePic',
                'displayUserNumId',
                'userVipLevel',
                'rateResult',
            ]
        else:
            result = re.findall(r'\{\"append\"\:.+?\"validscore\".+?\}', s)
            keys = [
                'aucNumId',
                'sku',
                'title',
                'content',
                'date',
                'rateId',
                'anony',
                'nick',
                'nickUrl',
                'rank',
                'rankUrl',
                'userId',
                'vipLevel',
                'validscore',
            ]
        metadata = []
        for (i, t) in enumerate(result):
            metadata = []
            for key in keys:
                t2 = re.findall(r'\"' + key + r'\"\:\"*(.*?)\"*[\,\}]', t)
                if len(t2) > 0:
                    t2 = t2[0]
                    t2 = t2.decode(r.encoding, 'ignore').encode('utf-8')
                else:
                    t2 = None
                metadata.append(t2)
            if metadata[6] == 'true':
                metadata[8] = None
                metadata[10] = None

            # 追加评论

            if siteId == '2':
                appendComment = re.findall(
                    r'\"appendComment\"\s*\:\s*\{.+?\}',
                    t
                )
                appendComment = (appendComment[0]
                                 if len(appendComment) > 0
                                 else None)
                if appendComment:
                    metadata.extend(
                        [re.findall(r'\"commentId\"\s*\:\s*(\d+)',
                                    appendComment),
                         re.findall(r'\"content\"\s*\:\s*\"(.+?)\"',
                                    appendComment),
                         None,
                         re.findall(
                         r'\"commentTime\"\s*\:\s*\"(.+?)\"', appendComment),
                         re.findall(r'\"reply\"\s*\:\s*\"(.*?)\"',
                                    appendComment)
                         ]
                    )
                else:
                    metadata.extend([None] * 5)
            else:
                appendComment = re.findall(r'\"append\"\s*\:\s*\{.+?\}', t)
                appendComment = (appendComment[0] if len(appendComment)
                                 > 0 else None)
                if appendComment:
                    metadata.extend(
                        [None,
                         re.findall(r'\"content\"\s*\:\s*\"(.+?)\"',
                                    appendComment),
                         re.findall(r'\"dayAfterConfirm\"\s*\:\s*\"(.+?)\"',
                         appendComment),
                         None,
                         re.findall(r'\"reply\"\s*\:\s*\"(.*?)\"',
                                    appendComment)
                         ]
                    )
                else:
                    metadata.extend([None] * 5)

            # spuRatting
            spuRatting = re.search(
                r'("spuRatting"\:\[.+\])',
                t,
                re.S
            )
            if spuRatting:
                spuRatting = spuRatting.group(1).decode(r.encoding).encode('utf-8')
                spuRatting = yaml.load(_parse_json_str(spuRatting))
                spuRatting = ';'.join(
                    ['%s:%s' % (spu['name'], spu['desc'])
                     for spu in spuRatting['spuRatting']]
                )
                metadata.append(spuRatting.encode('utf-8'))
            else:
                metadata.append(None)

            # handle regx and encoding

            for i in range(12, 17):
                if not metadata[i]:
                    continue
                metadata[i] = (metadata[i][0] if len(
                    metadata[i]) > 0 else None)
                if metadata[i]:
                    metadata[i] = metadata[i].decode(
                        r.encoding,
                        'ignore'
                    ).encode('utf-8')

            # handle end
            metadata[4] = metadata[4].\
                replace('年', '-').\
                replace('月', '-').\
                replace('日', '')

            if datetimeparse(metadata[4]) < end:
                INFOS.append([siteId, shopId, itemId] + metadata[1:])
        page += 1
        if len(INFOS) > 0 and len(metadata) > 0:
            t1 = re.findall(r'\d+.+?\d+.+?\d+', metadata[4])[0]
            t1 = datetimeparse(t1)
            if t1 < start or stop:
                break
        if len(result) < 20:
            break
    return INFOS
