#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.6.11
'''

import re
import time
from lib import *

import requests
from dateutil.parser import parse


def getTrades(url, start='1900-1-1 00:00:00', maxPage=1000, reqinterval=0.3):
    t0 = time.strptime(start, '%Y-%m-%d %H:%M:%S')
    INFOS = []
    INFO = {  # 'rankPic':None,
        'siteId': None,
        'shopId': None,
        'itemId': None,
        'title': None,
        'nick': None,
        'rank': None,
        'vipLevel': None,
        'price': None,
        'promoTitle': None,
        'amount': None,
        'tradeTime': None,
        'sku': None,
    }
    r = request(url, requiredPropertyRegx=r'shopId\=\d+', reqinterval=reqinterval)
    s = r.content
    shopId = re.findall(r'shopId\=(\d+)', s)[0]
    siteId = re.findall(r'siteId\=(\d)', s)[0]
    itemId = re.findall(r'itemId\=(\d+)', s)[0]
    domain = 'http://detailskip.taobao.com/json/show_buyer_list.htm'
    params = dict()
    if siteId == '2':
        params = {
            'is_offline': '',
            'page_size': '15',
            'is_start': 'true',
            'item_type': 'b',
            'ends': re.findall(r'ends\=(\d+)', s)[0],
            'starts': re.findall(r'starts\=(\d+)', s)[0],
            'item_id': re.findall(r'item\_id\=(\d+)', s)[0],
            'user_tag': re.findall(r'user\_tag\=(\d+)', s)[0],
            'old_quantity': '0',
            'sold_total_num': None,
            'closed': 'false',
            'seller_num_id': re.findall(r'seller\_num\_id\=(\d+)', s)[0],
            'zhichong': 'true',
            'taohua': '',
            'is_from_detail': 'yes',
            'total_sq': re.findall(r'totalSQ\=(\d+)', s)[0],
            'bidPage': 1,
            'callback': 'TShop.mods.DealRecord.reload',
            't': '%.0f' % (time.time() * 1000),
        }

        # get sold_total_num

        tUrl = re.findall(r'\"initApi\"\s*\:\s*\"(.+?)\"', s)[0]
        callback = 'jsonpSkuInit'
        tUrl = tUrl + '&callback=' + callback
        st = request(tUrl, reqinterval=reqinterval)
        params['sold_total_num'] = re.findall(r'\"sellCount\"\:(\d+)',
                                              st.content)
        if params['sold_total_num'] == None:
            params['sold_total_num'] = ''

        # end

        tUrl = domain + '?' + '&'.join([k + '=' + str(v) for (k, v) in
                                       params.items()])
        page = 1
        while 1:
            if page > maxPage or page > 200:
                break
            stop = False
            r = request(tUrl, reqinterval=reqinterval)
            s = r.content.replace('\\', '')
            result0 = re.findall(r'\<tr\s*.*?\>.+?\<\/tr\>', s)
            if len(result0) <= 1:
                break
            for res in result0[1:]:
                metadata = []

                # [title,nick,rank,rankPic,vipLevel,price,promoTitle,amount,tradeTime,sku,status

                tds = re.findall(r'\<td.*?\>.+?\<\/td\>', res)
                if len(tds) < 5:
                    continue

                # title
                # metadata.append(re.findall(r'\<a\s+.+?\>\s*(.+?)\s*\<\/a\>',tds[1])[0])

                metadata.append(re.findall(r'\<span.+?data\-title\=\"(.+?)\"',
                                tds[4])[0].decode(r.encoding).encode('utf-8'))

                # nick

                nick = \
                    re.findall(
                        r'\<span\s+class\=\"tb\-sellnick\"\>\s*(.+?)\s*\<img', tds[0])
                if len(nick) < 1:
                    nick = \
                        re.findall(
                            r'\<span\s+class\=\"tb\-sellnick\"\>\s*(.+?)\s*\<\/td', tds[0])[0]
                else:
                    nick = nick[0]
                for t in re.findall(r'\<.+?\>', nick):
                    nick = nick.replace(t, '')
                metadata.append(nick.decode(r.encoding).encode('utf-8'))

                # rank

                rank = \
                    re.findall(
                        r'\<img\s+src\=\".+?\/(.+?)\.gif\".+?class\=\"rank\"\s*\/\>', tds[0])
                if len(rank) < 1:
                    rank = None
                else:
                    rank = rank[0]
                    rank = rank[rank.rindex('/') + 1:]

                # rank=re.findall(r'newrank\/(\S+?)\.gif', tds[0])[0]

                metadata.append(rank)

                # rankPic
                # metadata.append(None)
                # vipLevel

                vipLevel = \
                    re.findall(
                        r'\<a\s+.+?href\=\"http\:\/\/vip\.taobao\.com\"\s+title\=\"(\w\d+).+?\"', tds[0])
                if len(vipLevel) > 0:
                    vipLevel = vipLevel[0]
                else:
                    vipLevel = None
                metadata.append(vipLevel)

                # price
                # metadata.append(re.findall(r'\<em\>(.+?)\<\/em\>',tds[1])[0])

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-price\"\>(\d+\.*\d*)', tds[1])[0])

                # promoTitle
                # promoTitle=re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\"\s+class\=\"buyer\-cu\-icon\"\>',tds[1])

                promoTitle = \
                    re.findall(
                        r'\<a\s+title\="\s*(\S+?)\s*"\s+class\=\"tb\-promo\"\>', tds[1])
                if len(promoTitle) > 0:
                    promoTitle = promoTitle[0].decode(r.encoding).encode('utf-8'
                                                                         )
                else:
                    promoTitle = None
                metadata.append(promoTitle)

                # amount

                metadata.append(re.findall(r'\<td.*?\>\s*(\d+)\s*\<\/td\>',
                                tds[2])[0])

                # tradeTime

                metadata.append(re.findall(r'\<td.*?\>\s*(.+?)\s*\<\/td\>',
                                tds[3])[0])

                # sku

                sku = '\t'.join(re.findall(r'\<p\>\s*(.+?)\s*\<\/p\>', tds[4]))
                metadata.append(sku.decode(r.encoding).encode('utf-8'))

                # print '\t'.join([str(t2).decode('utf-8') for t2 in metadata if t2])

                if len(INFOS) > 2:
                    if metadata[7] == INFOS[0][10]:
                        stop = True
                        break
                if time.strptime(metadata[7], '%Y-%m-%d %H:%M:%S') < t0:
                    stop = True
                    break
                INFOS.append([siteId, shopId, itemId] + metadata)
            page += 1

            # t1=time.strptime(INFOS[-1][10],'%Y-%m-%d %H:%M:%S')
            # if t1<t0 or stop:
            # ....break

            tUrl = tUrl.replace(re.findall(r'bidPage\=\d+', tUrl)[0], 'bidPage='
                                + str(page))
    else:
        params = {
            'bid_page': 1,
            'page_sizename': 'pageSize',
            'is_start': 'true',
            'item_type': 'b',
            'ends': re.findall(r'ends\=(\d+)', s)[0],
            'starts': re.findall(r'starts\=(\d+)', s)[0],
            'item_id': re.findall(r'item\_id\=(\d+)', s)[0],
            'zhichong': 'true',
            'offer': 'null',
            'user_tag': re.findall(r'user\_tag\=(\d+)', s)[0],
            'seller_num_id': re.findall(r'seller\_num\_id\=(\d+)', s)[0],
            'title': re.findall(r'title\=(.+?)\,', s)[0],
            'callback': 'TShop.mods.DealRecord.reload',
            't': '%.0f' % (time.time() * 1000),
        }
        tUrl = domain + '?' + '&'.join([k + '=' + str(v) for (k, v) in
                                       params.items()])
        page = 1
        while 1:
            if page > maxPage:
                break
            stop = False
            r = request(tUrl, reqinterval=reqinterval)
            s = r.content.replace('\\', '')
            result0 = re.findall(r'\<tr\s*.*?\>.+?\<\/tr\>', s)
            if len(result0) <= 1:
                break
            for res in result0[1:]:
                tds = re.findall(r'\<td.*?\>.*?\<\/td\>', res)
                if len(tds) < 5:
                    continue
                metadata = [None]

                # [nick,rank,rankPic,vipLevel,price,promoTitle,amount,tradeTime,sku,status]
                # nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>(.+?)\<\/span\>\s*\<img',res)[0]

                nick = \
                    re.findall(
                        r'\<span\s+class\=\"tb\-sellnick\"\>(.+?)\<\/span\>\s*\<', res)
                if len(nick) > 0:
                    nick = nick[0]
                    for t in re.findall(r'\<.+?\>', nick):
                        nick = nick.replace(t, '')
                else:
                    nick = None
                metadata.append(nick.decode(r.encoding).encode('utf-8'))

                # rank

                rank = \
                    re.findall(
                        r'\<img\s+src\=\".+?\/(.+?)\.gif\".+?class\=\"rank\"\s*\/\>', res)
                if len(rank) > 0:
                    rank = rank[0]
                    rank = rank[rank.rindex('/') + 1:]
                else:
                    rank = None
                metadata.append(rank)

                # rankPic
                # metadata.append(None)
                # vipLevel

                vipLevel = \
                    re.findall(
                        r'\<a\s+.+?href\=\"http\:\/\/vip\.taobao\.com\"\s+title\=\"(\w\d+).+?\"', res)
                if len(vipLevel) > 0:
                    vipLevel = vipLevel[0]
                else:
                    vipLevel = None
                metadata.append(vipLevel)

                # price

                price = \
                    re.findall(
                        r'\<td\s+class\=\"tb\-price\"\>(\d+\.*\d*).*?\<\/td\>', res)[0]
                metadata.append(price)

                # promoTitle

                promoTitle = \
                    re.findall(
                        r'\<a\s+title\=\"\s*(.+?)\s*\"\s+class\=\"tb\-promo\"\>', res)
                if len(promoTitle) > 0:
                    promoTitle = promoTitle[0].decode(r.encoding).encode('utf-8'
                                                                         )
                else:
                    promoTitle = None
                metadata.append(promoTitle)

                # amount

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-amount\"\>\s*(\d+)\s*\<\/td\>', res)[0])

                # tradeTime

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-time\"\>\s*(.+?)\s*\<\/td\>', res)[0])

                # sku

                skus = \
                    re.findall(
                        r'\<td\s+class\=\"tb\-sku\"\>.*?\s*(\<p\>.+\<\/p\>)\s*.*?\<\/td\>', res)[0]
                metadata.append(
                    '\t'.join(re.findall(r'\<p\>\s*(.+?)\s*\<\/p\>', skus)).decode(r.encoding).encode('utf-8'))
                if len(INFOS) > 2:
                    if metadata[7] == INFOS[0][10]:
                        stop = True
                        break
                if time.strptime(metadata[7], '%Y-%m-%d %H:%M:%S') < t0:
                    stop = True
                    break
                INFOS.append([siteId, shopId, itemId] + metadata)

                # print '\t'.join([str(t2).decode('utf-8') for t2 in metadata if t2!=None])

            page += 1

            # t1=time.strptime(INFOS[-1][10],'%Y-%m-%d %H:%M:%S')
            # if t1<t0 or stop:
            # ....break

            tUrl = tUrl.replace(re.findall(r'bid\_page\=\d+', tUrl)[0],
                                'bid_page=' + str(page))
    return INFOS


def getTrades2(
    url,
    fromTsmp='1900/1/1',
    toTsmp='2012/9/1',
    maxPage=1000,
):

    fromTsmp = time.strptime(fromTsmp, '%Y/%m/%d')
    toTsmp = time.strptime(toTsmp, '%Y/%m/%d')
    if fromTsmp == toTsmp:
        return []
    INFOS = []
    INFO = {  # 'rankPic':None,
        'siteId': None,
        'shopId': None,
        'itemId': None,
        'title': None,
        'nick': None,
        'rank': None,
        'vipLevel': None,
        'price': None,
        'promoTitle': None,
        'amount': None,
        'tradeTime': None,
        'sku': None,
    }
    r = request(url, requiredPropertyRegx=r'shopId\s*\=\s*\d+')
    s = r.text
    shopId = re.findall(r'shopId\=(\d+)', s)[0].encode('utf-8')
    siteId = re.findall(r'siteId\=(\d)', s)[0].encode('utf-8')
    itemId = re.findall(r'itemId\=(\d+)', s)[0].encode('utf-8')
    domain = 'http://tbskip.taobao.com/json/show_buyer_list.htm'
    params = dict()
    if siteId == '2':
        params = {
            'is_offline': '',
            'page_size': '15',
            'is_start': 'true',
            'item_type': 'b',
            'ends': re.findall(r'ends\=(\d+)', s)[0],
            'starts': re.findall(r'starts\=(\d+)', s)[0],
            'item_id': re.findall(r'item\_id\=(\d+)', s)[0],
            'user_tag': re.findall(r'user\_tag\=(\d+)', s)[0],
            'old_quantity': '0',
            'sold_total_num': None,
            'closed': 'false',
            'seller_num_id': re.findall(r'seller\_num\_id\=(\d+)', s)[0],
            'zhichong': 'true',
            'taohua': '',
            'is_from_detail': 'yes',
            'total_sq': re.findall(r'totalSQ\=(\d+)', s)[0],
            'bidPage': 1,
            'callback': 'TShop.mods.DealRecord.reload',
            't': '%.0f' % (time.time() * 1000),
        }

        # get sold_total_num

        tUrl = re.findall(r'\"initApi\"\s*\:\s*\"(.+?)\"', s)[0]
        callback = 'jsonpSkuInit'
        tUrl = tUrl + '&callback=' + callback
        st = request(tUrl)
        params['sold_total_num'] = re.findall(r'\"sellCount\"\:(\d+)',
                                              st.content)
        if params['sold_total_num'] == []:
            params['sold_total_num'] = ''

        # end

        tUrl = domain + '?' + '&'.join([k + '=' + str(v) for (k, v) in
                                       params.items()])
        page = 1
        minCount = 20
        while 1:
            if page > maxPage or page > 200:
                break
            if minCount > 20:
                break
            if page >= 100:
                break
            r = request(tUrl)
            s = r.content.replace('\\', '')
            result0 = re.findall(r'\<tr\s*.*?\>.+?\<\/tr\>', s)
            if len(result0) <= 1:
                break
            for (i, res) in enumerate(result0[1:]):
                metadata = []

                # [title,nick,rank,rankPic,vipLevel,price,promoTitle,amount,tradeTime,sku,status

                tds = re.findall(r'\<td.*?\>.+?\<\/td\>', res)
                if len(tds) < 5:
                    continue

                # $title$
                # metadata.append(re.findall(r'\<a\s+.+?\>\s*(.+?)\s*\<\/a\>',tds[1])[0])
                # metadata.append(re.findall(r'\<span.+?data\-title\=\"(.+?)\"',tds[4])[0].decode(r.encoding).encode('utf-8'))

                metadata.append(re.findall(r'\<td\s+.+?\>\s*(.+?)\s*\<',
                                tds[1])[0].decode(r.encoding, 'ignore'
                                                  ).encode('utf-8', 'ignore'))

                # nick
                # nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>\s*(.+?)\s*\<img',tds[0])

                nick = ''.join(re.findall(r'\>\s*(.*?)\<', tds[0]))

                # if len(nick)<1:
                # ....nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>\s*(.+?)\s*\<\/td',tds[0])[0]
                # else:
                # ....nick=nick[0]
                # for t in re.findall(r'\<.+?\>',nick):
                # ....nick=nick.replace(t,'')

                metadata.append(nick.decode(r.encoding, 'ignore').encode('utf-8'
                                                                         ))

                # rank

                rank = \
                    re.findall(
                        r'\<img\s+src\=\".+?\/(.+?)\.gif\".+?class\=\"rank\"\s*\/\>', tds[0])
                if len(rank) < 1:
                    rank = None
                else:
                    rank = rank[0]
                    rank = rank[rank.rindex('/') + 1:]

                # rank=re.findall(r'newrank\/(\S+?)\.gif', tds[0])[0]

                metadata.append(rank)

                # rankPic
                # metadata.append(None)
                # vipLevel

                vipLevel = \
                    re.findall(
                        r'\<a\s+.+?href\=\"http\:\/\/vip\.taobao\.com\"\s+title\=\"(\w\d+).+?\"', tds[0])
                if len(vipLevel) > 0:
                    vipLevel = vipLevel[0]
                else:
                    vipLevel = None
                metadata.append(vipLevel)

                # price
                # metadata.append(re.findall(r'\<em\>(.+?)\<\/em\>',tds[1])[0])
                # metadata.append(re.findall(r'\<td\s+class\=\"tb\-price\"\>(\d+\.*\d*)',tds[1])[0])

                metadata.append(re.findall(r'\d+\.*\d*', tds[2])[0])

                # promoTitle
                # promoTitle=re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\"\s+class\=\"buyer\-cu\-icon\"\>',tds[1])

                promoTitle = re.findall(r'\<a\s+title\="\s*(\S+?)\s*".*?\>',
                                        tds[2])
                if len(promoTitle) > 0:
                    promoTitle = promoTitle[0].decode(r.encoding, 'ignore'
                                                      ).encode('utf-8')
                else:
                    promoTitle = None
                metadata.append(promoTitle)

                # amount

                metadata.append(re.findall(r'\<td.*?\>\s*(\d+)\s*\<\/td\>',
                                tds[3])[0])

                # tradeTime

                metadata.append(re.findall(r'\<td.*?\>\s*(.+?)\s*\<\/td\>',
                                tds[4])[0])

                # sku
                # sku='\t'.join(re.findall(r'\<p\>\s*(.+?)\s*\<\/p\>',tds[1]))

                sku = ''.join(re.findall(r'\<br\/\>\s*(.+?)\s*\<\/td', tds[1],
                              re.S))
                metadata.append(sku.decode(r.encoding, 'ignore').encode('utf-8'
                                                                        ))

                # print '\t'.join([str(t2).decode('utf-8') for t2 in metadata if t2])
                # if len(INFOS)>2:
                # ....if metadata[7]==INFOS[0][10]:
                # ........stop=2
                # ........break

                curTime = time.strptime(metadata[7], '%Y-%m-%d %H:%M:%S')
                if curTime >= fromTsmp and curTime < toTsmp:
                    INFOS.append([siteId, shopId, itemId] + metadata)
                elif curTime < fromTsmp:
                    minCount += 1
                    break
            page += 1
            tUrl = tUrl.replace(re.findall(r'bidPage\=\d+', tUrl)[0], 'bidPage='
                                + str(page))
    else:
        params = {
            'bidPage': 1,
            'page_sizename': 'pageSize',
            'is_start': 'true',
            'item_type': 'b',
            'ends': re.findall(r'ends\=(\d+)', s)[0],
            'starts': re.findall(r'starts\=(\d+)', s)[0],
            'item_id': re.findall(r'item\_id\=(\d+)', s)[0],
            'zhichong': 'true',
            'offer': 'null',
            'user_tag': re.findall(r'user\_tag\=(\d+)', s)[0],
            'seller_num_id': re.findall(r'seller\_num\_id\=(\d+)', s)[0],
            'title': re.findall(r'title\=(.+?)\,', s)[0],
            'callback': 'TShop.mods.DealRecord.reload',
            't': '%.0f' % (time.time() * 1000),
        }

        # tUrl=domain+'?'+'&'.join([k+'='+str(v) for k,v in params.items()])

        tUrl = 'http://detailskip.taobao.com/json/' \
            + re.findall(r'(show_buyer_list\.htm.+?)\,', s)[0]
        tUrl = tUrl.replace('step=false', 'step=null')
        tUrl = re.sub(r'bid_page\=\d+', r'bidPage=1', tUrl)
        tUrl = re.sub(r'old_quantity\=\d+', r'old_quantity=0', tUrl)
        tUrl = re.sub(r'sold_total_num\=\d+', r'sold_total_num=null', tUrl)
        tUrl = tUrl \
            + '&is_start=true&offer=null&closed=false&&callback=Hub.data._receive'
        page = 1
        minCount = 0
        while 1:
            if page > maxPage or page > 200:
                break
            if minCount > 20:
                break
            r = request(tUrl)
            s = r.content.replace('\\', '')
            result0 = re.findall(r'\<tr\s*.*?\>.+?\<\/tr\>', s)
            if len(result0) <= 1:
                break
            for res in result0[1:]:
                tds = re.findall(r'\<td.*?\>.*?\<\/td\>', res)
                if len(tds) < 5:
                    continue
                metadata = [None]

                # [nick,rank,rankPic,vipLevel,price,promoTitle,amount,tradeTime,sku,status]
                # nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>(.+?)\<\/span\>\s*\<img',res)[0]

                nick = \
                    re.findall(
                        r'\<span\s+class\=\"tb\-sellnick\"\>(.+?)\<\/span\>\s*\<', res)
                if len(nick) > 0:
                    nick = nick[0]
                    for t in re.findall(r'\<.+?\>', nick):
                        nick = nick.replace(t, '')
                else:
                    nick = None
                metadata.append(nick.decode(r.encoding, 'ignore').encode('utf-8'
                                                                         ))

                # rank

                rank = \
                    re.findall(
                        r'\<img\s+src\=\".+?\/(.+?)\.gif\".+?class\=\"rank\"\s*\/\>', res)
                if len(rank) > 0:
                    rank = rank[0]
                    rank = rank[rank.rindex('/') + 1:].encode('utf-8')
                else:
                    rank = None
                metadata.append(rank)

                # rankPic
                # metadata.append(None)
                # vipLevel

                vipLevel = \
                    re.findall(
                        r'\<a\s+.+?href\=\"http\:\/\/vip\.taobao\.com\"\s+title\=\"(\w\d+).+?\"', res)
                if len(vipLevel) > 0:
                    vipLevel = vipLevel[0].encode('utf-8')
                else:
                    vipLevel = None
                metadata.append(vipLevel)

                # price

                price = \
                    re.findall(
                        r'\<td\s+class\=\"tb\-price\"\>.+?(\d+\.*\d*).*?\<\/td\>', res)[0]
                metadata.append(price.encode('utf-8'))

                # promoTitle
                # promoTitle=re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\"\s+class\=\"tb\-promo\"\>',res)

                promoTitle = re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\".*?\>',
                                        res)
                if len(promoTitle) > 0:
                    promoTitle = promoTitle[0].decode(r.encoding, 'ignore'
                                                      ).encode('utf-8')
                else:
                    promoTitle = None
                metadata.append(promoTitle)

                # amount

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-amount\"\>\s*(\d+)\s*\<\/td\>', res)[0].encode('utf-8'))

                # tradeTime

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-time\"\>\s*(.+?)\s*\<\/td\>', res)[0].encode('utf-8'))

                # sku

                skus = \
                    re.findall(
                        r'\<td\s+class\=\"tb\-sku\"\>.*?\s*(\<p\>.+\<\/p\>)\s*.*?\<\/td\>', res)[0]
                metadata.append('\t'.join(re.findall(r'\<p\>\s*(.+?)\s*\<\/p\>', skus)).decode(r.encoding, 'ignore'
                                                                                               ).encode('utf-8'))

                # if len(INFOS)>2:
                # ....if metadata[7]==INFOS[0][10]:
                # ........stop=2
                # ........break

                curTime = time.strptime(metadata[7], '%Y-%m-%d %H:%M:%S')
                if curTime >= fromTsmp and curTime < toTsmp:
                    INFOS.append([siteId, shopId, itemId] + metadata)
                elif curTime < fromTsmp:
                    minCount += 1
                    break

                # print '\t'.join([str(t2).decode('utf-8') for t2 in metadata if t2!=None])

            page += 1

            # t1=time.strptime(INFOS[-1][10],'%Y-%m-%d %H:%M:%S')
            # if t1<t0 or stop:
            # ....break

            tUrl = tUrl.replace(re.findall(r'bidPage\=\d+', tUrl)[0], 'bidPage='
                                + str(page))
    return INFOS


def abnormalItem(url, text):
    '''processing the items without shopId'''
    pass
    return [], None, None


def getTrades3(
    url,
    fromTsmp='1900/1/1',
    toTsmp='2999/12/31',
    maxPage=1000,
    config={},
    reqUri={},
    reqinterval=0.3
):

    fromTsmp = time.strptime(fromTsmp, '%Y/%m/%d')
    toTsmp = time.strptime(toTsmp, '%Y/%m/%d')
    if fromTsmp == toTsmp:
        return [], None, None
    INFOS = []
    INFO = {  # 'rankPic':None,
        'siteId': None,
        'shopId': None,
        'itemId': None,
        'title': None,
        'nick': None,
        'rank': None,
        'vipLevel': None,
        'price': None,
        'promoTitle': None,
        'amount': None,
        'tradeTime': None,
        'sku': None,
    }
    if config:
        shopId = config.get('shopId')
        siteId = config.get('siteId')
        itemId = config.get('itemId')
        userNumId = config.get('userNumId')
    else:
        # r = request(url, requiredPropertyRegx=r'shopId\s*\=\s*\d+', retries=3, reqinterval=reqinterval)
        r = requests.get(url, timeout=5)
        s = r.text
        try:
            shopId = re.findall(r'shopId\=(\d+)', s)[0].encode('utf-8')
            siteId = re.findall(r'siteId\=(\d)', s)[0].encode('utf-8')
            itemId = re.findall(r'itemId\=(\d+)', s)[0].encode('utf-8')
            userNumId = re.findall(r'userid\s*=\s*(\d+)', s, re.I | re.S)[0].encode('utf-8')
        except:
            return abnormalItem(url, s)
        time.sleep(reqinterval)
    params = dict()
    if siteId == '2':
        if reqUri:
            params = reqUri
            params.update({
                't': '%.0f' % (time.time() * 1000)
            })
        else:
            params = {
                'is_offline': '',
                'page_size': '15',
                'item_type': 'b',
                'ends': re.findall(r'ends\=(\d+)', s)[0],
                'starts': re.findall(r'starts\=(\d+)', s)[0],
                'item_id': re.findall(r'item\_id\=(\d+)', s)[0],
                'user_tag': re.findall(r'user\_tag\=(\d+)', s)[0],
                'old_quantity': '0',
                'sold_total_num': 0,
                'closed': 'false',
                'seller_num_id': re.findall(r'seller\_num\_id\=(\d+)', s)[0],
                'zhichong': 'true',
                'taohua': '',
                'is_from_detail': 'yes',
                'total_sq': re.findall(r'totalSQ\=(\d+)', s)[0],
                'bid_page': 1,
                'callback': 'TShop.mods.DealRecord.reload',
                't': '%.0f' % (time.time() * 1000),
                'page_sizename': 'pageSize',
                'is_start': 'true',
                'title': 'null',
                'sbn': re.findall(r'sbn=(.+?),', s)[0]
            }

        domain = 'http://tbskip.taobao.com/json/show_buyer_list.htm'
        tUrl = domain + '?' + '&'.join([k + '=' + str(v) for (k, v) in
                                       params.items()])
        page = 0
        minCount = 20
        while 1:
            if page > maxPage or page > 200:
                break
            if minCount > 20:
                break
            if page >= 100:
                break
            # r = request(tUrl, retries=3, reqinterval=reqinterval)
            r = requests.get(tUrl, timeout=5)
            s = r.content.replace('\\', '')
            time.sleep(reqinterval)
            result0 = re.findall(r'\<tr\s*.*?\>.+?\<\/tr\>', s)
            if len(result0) <= 1:
                break
            for (i, res) in enumerate(result0[1:]):
                metadata = []

                # [title,nick,rank,rankPic,vipLevel,price,promoTitle,amount,tradeTime,sku,status

                tds = re.findall(r'\<td.*?\>.+?\<\/td\>', res)
                if len(tds) < 5:
                    continue

                # $title$
                # metadata.append(re.findall(r'\<a\s+.+?\>\s*(.+?)\s*\<\/a\>',tds[1])[0])
                # metadata.append(re.findall(r'\<span.+?data\-title\=\"(.+?)\"',tds[4])[0].decode(r.encoding).encode('utf-8'))

                metadata.append(re.findall(r'\<td\s+.+?\>\s*(.+?)\s*\<',
                                tds[1])[0].decode(r.encoding, 'ignore'
                                                  ).encode('utf-8', 'ignore'))

                # nick
                # nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>\s*(.+?)\s*\<img',tds[0])

                nick = ''.join(re.findall(r'\>\s*(.*?)\<', tds[0]))

                # if len(nick)<1:
                # ....nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>\s*(.+?)\s*\<\/td',tds[0])[0]
                # else:
                # ....nick=nick[0]
                # for t in re.findall(r'\<.+?\>',nick):
                # ....nick=nick.replace(t,'')

                metadata.append(nick.decode(r.encoding, 'ignore').encode('utf-8'
                                                                         ))

                # rank

                rank = \
                    re.findall(
                        r'\<img\s+src\=\".+?\/(.+?)\.gif\".+?class\=\"rank\"\s*\/\>', tds[0])
                if len(rank) < 1:
                    rank = None
                else:
                    rank = rank[0]
                    rank = rank[rank.rindex('/') + 1:]

                # rank=re.findall(r'newrank\/(\S+?)\.gif', tds[0])[0]

                metadata.append(rank)

                # rankPic
                # metadata.append(None)
                # vipLevel

                vipLevel = \
                    re.findall(
                        r'\<a\s+.+?href\=\"http\:\/\/vip\.taobao\.com\"\s+title\=\"(\w\d+).+?\"', tds[0])
                if len(vipLevel) > 0:
                    vipLevel = vipLevel[0]
                else:
                    vipLevel = None
                metadata.append(vipLevel)

                # price
                # metadata.append(re.findall(r'\<em\>(.+?)\<\/em\>',tds[1])[0])
                # metadata.append(re.findall(r'\<td\s+class\=\"tb\-price\"\>(\d+\.*\d*)',tds[1])[0])

                metadata.append(re.findall(r'\d+\.*\d*', tds[2])[0])

                # promoTitle
                # promoTitle=re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\"\s+class\=\"buyer\-cu\-icon\"\>',tds[1])

                promoTitle = re.findall(r'\<a\s+title\="\s*(\S+?)\s*".*?\>',
                                        tds[2])
                if len(promoTitle) > 0:
                    promoTitle = promoTitle[0].decode(r.encoding, 'ignore'
                                                      ).encode('utf-8')
                else:
                    promoTitle = None
                metadata.append(promoTitle)

                # amount

                metadata.append(re.findall(r'\<td.*?\>\s*(\d+)\s*\<\/td\>',
                                tds[3])[0])

                # tradeTime

                metadata.append(re.findall(r'\<td.*?\>\s*(.+?)\s*\<\/td\>',
                                tds[4])[0])

                # sku
                # sku='\t'.join(re.findall(r'\<p\>\s*(.+?)\s*\<\/p\>',tds[1]))

                sku = ''.join(re.findall(r'\<br\/\>\s*(.+?)\s*\<\/td', tds[1],
                              re.S))
                metadata.append(sku.decode(r.encoding, 'ignore').encode('utf-8'
                                                                        ))

                # print '\t'.join([str(t2).decode('utf-8') for t2 in metadata if t2])
                # if len(INFOS)>2:
                # ....if metadata[7]==INFOS[0][10]:
                # ........stop=2
                # ........break

                curTime = time.strptime(metadata[7], '%Y-%m-%d %H:%M:%S')
                if curTime >= fromTsmp and curTime < toTsmp:
                    INFOS.append([siteId, shopId, itemId] + metadata)
                elif curTime < fromTsmp:
                    minCount += 1
                    break
            page += 1
            tUrl = tUrl.replace(re.findall(r'bid_page\=\d+', tUrl)[0], 'bid_page='
                                + str(page))
    else:
        if reqUri:
            tUrl = 'http://detailskip.taobao.com/json/show_buyer_list.htm?' + '&'.join([k + '=' + str(v) for (k, v) in
                                                                                        reqUri.items()])
        else:
            tUrl = 'http://detailskip.taobao.com/json/' \
                + re.findall(r'(show_buyer_list\.htm.+?)\,', s)[0]
            tUrl = tUrl.replace('step=false', 'step=null')
            tUrl = re.sub(r'bid_page\=\d+', r'bidPage=1', tUrl)
            tUrl = re.sub(r'old_quantity\=\d+', r'old_quantity=0', tUrl)
            tUrl = re.sub(r'sold_total_num\=\d+', r'sold_total_num=null', tUrl)
            tUrl = tUrl \
                + '&is_start=true&offer=null&closed=false&callback=Hub.data._receive'
            params = dict(tuple(t.split('=')) for t in tUrl[tUrl.find('?') + 1:].split('&'))
        page = 1
        minCount = 0
        while 1:
            if page > maxPage or page > 200:
                break
            if minCount > 20:
                break
            # r = request(tUrl, retries=3, reqinterval=reqinterval)
            r = requests.get(tUrl, timeout=5)
            s = r.content.replace('\\', '')
            time.sleep(reqinterval)
            result0 = re.findall(r'\<tr\s*.*?\>.+?\<\/tr\>', s)
            if len(result0) <= 1:
                break
            for res in result0[1:]:
                tds = re.findall(r'\<td.*?\>.*?\<\/td\>', res)
                if len(tds) < 5:
                    continue
                metadata = [None]

                # [nick,rank,rankPic,vipLevel,price,promoTitle,amount,tradeTime,sku,status]
                # nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>(.+?)\<\/span\>\s*\<img',res)[0]

                nick = \
                    re.findall(
                        r'\<span\s+class\=\"tb\-sellnick\"\>(.+?)\<\/span\>\s*\<', res)
                if len(nick) > 0:
                    nick = nick[0]
                    for t in re.findall(r'\<.+?\>', nick):
                        nick = nick.replace(t, '')
                else:
                    nick = None
                metadata.append(nick.decode(r.encoding, 'ignore').encode('utf-8'
                                                                         ))

                # rank

                rank = \
                    re.findall(
                        r'\<img\s+src\=\".+?\/(.+?)\.gif\".+?class\=\"rank\"\s*\/\>', res)
                if len(rank) > 0:
                    rank = rank[0]
                    rank = rank[rank.rindex('/') + 1:].encode('utf-8')
                else:
                    rank = None
                metadata.append(rank)

                # rankPic
                # metadata.append(None)
                # vipLevel

                vipLevel = \
                    re.findall(
                        r'\<a\s+.+?href\=\"http\:\/\/vip\.taobao\.com\"\s+title\=\"(\w\d+).+?\"', res)
                if len(vipLevel) > 0:
                    vipLevel = vipLevel[0].encode('utf-8')
                else:
                    vipLevel = None
                metadata.append(vipLevel)

                # price

                price = \
                    re.findall(
                        r'\<td\s+class\=\"tb\-price\"\>.+?(\d+\.*\d*).*?\<\/td\>', res)[0]
                metadata.append(price.encode('utf-8'))

                # promoTitle
                # promoTitle=re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\"\s+class\=\"tb\-promo\"\>',res)

                promoTitle = re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\".*?\>',
                                        res)
                if len(promoTitle) > 0:
                    promoTitle = promoTitle[0].decode(r.encoding, 'ignore'
                                                      ).encode('utf-8')
                else:
                    promoTitle = None
                metadata.append(promoTitle)

                # amount

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-amount\"\>\s*(\d+)\s*\<\/td\>', res)[0].encode('utf-8'))

                # tradeTime

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-time\"\>\s*(.+?)\s*\<\/td\>', res)[0].encode('utf-8'))

                # sku

                skus = \
                    re.findall(
                        r'\<td\s+class\=\"tb\-sku\"\>.*?\s*(\<p\>.+\<\/p\>)\s*.*?\<\/td\>', res)[0]
                metadata.append('\t'.join(re.findall(r'\<p\>\s*(.+?)\s*\<\/p\>', skus)).decode(r.encoding, 'ignore'
                                                                                               ).encode('utf-8'))

                # if len(INFOS)>2:
                # ....if metadata[7]==INFOS[0][10]:
                # ........stop=2
                # ........break

                curTime = time.strptime(metadata[7], '%Y-%m-%d %H:%M:%S')
                if curTime >= fromTsmp and curTime < toTsmp:
                    INFOS.append([siteId, shopId, itemId] + metadata)
                elif curTime < fromTsmp:
                    minCount += 1
                    break

                # print '\t'.join([str(t2).decode('utf-8') for t2 in metadata if t2!=None])

            page += 1

            # t1=time.strptime(INFOS[-1][10],'%Y-%m-%d %H:%M:%S')
            # if t1<t0 or stop:
            # ....break

            tUrl = tUrl.replace(re.findall(r'bidPage\=\d+', tUrl)[0], 'bidPage='
                                + str(page))
    return INFOS, params, {'siteId': siteId, 'shopId': shopId, 'itemId': itemId, 'userNumId': userNumId}


def getTrades4(
    url,
    fromTsmp='1900/1/1',
    toTsmp='2999/12/31',
    maxPage=1000,
    config={},
    reqUri={},
    reqinterval=0.3
):

    fromTsmp = parse(fromTsmp)
    toTsmp = parse(toTsmp)
    if fromTsmp == toTsmp:
        return [], None, None
    INFOS = []
    INFO = {  # 'rankPic':None,
        'siteId': None,
        'shopId': None,
        'itemId': None,
        'title': None,
        'nick': None,
        'rank': None,
        'vipLevel': None,
        'price': None,
        'promoTitle': None,
        'amount': None,
        'tradeTime': None,
        'sku': None,
    }
    if config:
        shopId = config.get('shopId')
        siteId = config.get('siteId')
        itemId = config.get('itemId')
        userNumId = config.get('userNumId')
    else:
        # r = request(url, requiredPropertyRegx=r'shopId\s*\=\s*\d+', retries=3, reqinterval=reqinterval)
        r = requests.get(url, timeout=5)
        s = r.text
        try:
            shopId = re.findall(r'shopId\=(\d+)', s)[0].encode('utf-8')
            siteId = re.findall(r'siteId\=(\d)', s)[0].encode('utf-8')
            itemId = re.findall(r'itemId\=(\d+)', s)[0].encode('utf-8')
            userNumId = re.findall(r'userid\s*=\s*(\d+)', s, re.I | re.S)[0].encode('utf-8')
        except:
            return abnormalItem(url, s)
        time.sleep(reqinterval)
    params = dict()
    if siteId == '2':
        if reqUri:
            params = reqUri
            params.update({
                't': '%.0f' % (time.time() * 1000)
            })
        else:
            params = {
                'is_offline': '',
                'page_size': '15',
                'item_type': 'b',
                'ends': re.findall(r'ends\=(\d+)', s)[0],
                'starts': re.findall(r'starts\=(\d+)', s)[0],
                'item_id': re.findall(r'item\_id\=(\d+)', s)[0],
                'user_tag': re.findall(r'user\_tag\=(\d+)', s)[0],
                'old_quantity': '0',
                'sold_total_num': 0,
                'closed': 'false',
                'seller_num_id': re.findall(r'seller\_num\_id\=(\d+)', s)[0],
                'zhichong': 'true',
                'taohua': '',
                'is_from_detail': 'yes',
                'total_sq': re.findall(r'totalSQ\=(\d+)', s)[0],
                'bid_page': 1,
                'callback': 'TShop.mods.DealRecord.reload',
                't': '%.0f' % (time.time() * 1000),
                'page_sizename': 'pageSize',
                'is_start': 'true',
                'title': 'null',
                'sbn': re.findall(r'sbn=(.+?),', s)[0]
            }

        domain = 'http://tbskip.taobao.com/json/show_buyer_list.htm'
        tUrl = domain + '?' + '&'.join([k + '=' + str(v) for (k, v) in
                                       params.items()])
        page = 0
        minCount = 20
        while 1:
            if page > maxPage or page > 200:
                break
            if minCount > 20:
                break
            if page >= 100:
                break
            # r = request(tUrl, retries=3, reqinterval=reqinterval)
            r = requests.get(tUrl, timeout=5)
            s = r.content.replace('\\', '')
            time.sleep(reqinterval)
            result0 = re.findall(r'\<tr\s*.*?\>.+?\<\/tr\>', s)
            if len(result0) <= 1:
                break
            for (i, res) in enumerate(result0[1:]):
                metadata = []

                # [title,nick,rank,rankPic,vipLevel,price,promoTitle,amount,tradeTime,sku,status

                tds = re.findall(r'\<td.*?\>.+?\<\/td\>', res)
                if len(tds) < 5:
                    continue

                # $title$
                # metadata.append(re.findall(r'\<a\s+.+?\>\s*(.+?)\s*\<\/a\>',tds[1])[0])
                # metadata.append(re.findall(r'\<span.+?data\-title\=\"(.+?)\"',tds[4])[0].decode(r.encoding).encode('utf-8'))

                metadata.append(re.findall(r'\<td\s+.+?\>\s*(.+?)\s*\<',
                                tds[1])[0].decode(r.encoding, 'ignore'
                                                  ).encode('utf-8', 'ignore'))

                # nick
                # nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>\s*(.+?)\s*\<img',tds[0])

                nick = ''.join(re.findall(r'\>\s*(.*?)\<', tds[0]))

                # if len(nick)<1:
                # ....nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>\s*(.+?)\s*\<\/td',tds[0])[0]
                # else:
                # ....nick=nick[0]
                # for t in re.findall(r'\<.+?\>',nick):
                # ....nick=nick.replace(t,'')

                metadata.append(nick.decode(r.encoding, 'ignore').encode('utf-8'
                                                                         ))

                # rank

                rank = \
                    re.findall(
                        r'\<img\s+src\=\".+?\/(.+?)\.gif\".+?class\=\"rank\"\s*\/\>', tds[0])
                if len(rank) < 1:
                    rank = None
                else:
                    rank = rank[0]
                    rank = rank[rank.rindex('/') + 1:]

                # rank=re.findall(r'newrank\/(\S+?)\.gif', tds[0])[0]

                metadata.append(rank)

                # rankPic
                # metadata.append(None)
                # vipLevel

                vipLevel = \
                    re.findall(
                        r'\<a\s+.+?href\=\"http\:\/\/vip\.taobao\.com\"\s+title\=\"(\w\d+).+?\"', tds[0])
                if len(vipLevel) > 0:
                    vipLevel = vipLevel[0]
                else:
                    vipLevel = None
                metadata.append(vipLevel)

                # price
                # metadata.append(re.findall(r'\<em\>(.+?)\<\/em\>',tds[1])[0])
                # metadata.append(re.findall(r'\<td\s+class\=\"tb\-price\"\>(\d+\.*\d*)',tds[1])[0])

                metadata.append(re.findall(r'\d+\.*\d*', tds[2])[0])

                # promoTitle
                # promoTitle=re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\"\s+class\=\"buyer\-cu\-icon\"\>',tds[1])

                promoTitle = re.findall(r'\<a\s+title\="\s*(\S+?)\s*".*?\>',
                                        tds[2])
                if len(promoTitle) > 0:
                    promoTitle = promoTitle[0].decode(r.encoding, 'ignore'
                                                      ).encode('utf-8')
                else:
                    promoTitle = None
                metadata.append(promoTitle)

                # amount

                metadata.append(re.findall(r'\<td.*?\>\s*(\d+)\s*\<\/td\>',
                                tds[3])[0])

                # tradeTime

                metadata.append(re.findall(r'\<td.*?\>\s*(.+?)\s*\<\/td\>',
                                tds[4])[0])

                # sku
                # sku='\t'.join(re.findall(r'\<p\>\s*(.+?)\s*\<\/p\>',tds[1]))

                sku = ''.join(re.findall(r'\<br\/\>\s*(.+?)\s*\<\/td', tds[1],
                              re.S))
                metadata.append(sku.decode(r.encoding, 'ignore').encode('utf-8'
                                                                        ))

                # print '\t'.join([str(t2).decode('utf-8') for t2 in metadata if t2])
                # if len(INFOS)>2:
                # ....if metadata[7]==INFOS[0][10]:
                # ........stop=2
                # ........break

                curTime = parse(metadata[7])
                if curTime >= fromTsmp and curTime < toTsmp:
                    INFOS.append([siteId, shopId, itemId] + metadata)
                elif curTime < fromTsmp:
                    minCount += 1
                    break
            page += 1
            tUrl = tUrl.replace(re.findall(r'bid_page\=\d+', tUrl)[0], 'bid_page='
                                + str(page))
    else:
        if reqUri:
            tUrl = 'http://detailskip.taobao.com/json/show_buyer_list.htm?' + '&'.join([k + '=' + str(v) for (k, v) in
                                                                                        reqUri.items()])
        else:
            tUrl = 'http://detailskip.taobao.com/json/' \
                + re.findall(r'(show_buyer_list\.htm.+?)\,', s)[0]
            tUrl = tUrl.replace('step=false', 'step=null')
            tUrl = re.sub(r'bid_page\=\d+', r'bidPage=1', tUrl)
            tUrl = re.sub(r'old_quantity\=\d+', r'old_quantity=0', tUrl)
            tUrl = re.sub(r'sold_total_num\=\d+', r'sold_total_num=null', tUrl)
            tUrl = tUrl \
                + '&is_start=true&offer=null&closed=false&callback=Hub.data._receive'
            params = dict(tuple(t.split('=')) for t in tUrl[tUrl.find('?') + 1:].split('&'))
        page = 1
        minCount = 0
        while 1:
            if page > maxPage or page > 200:
                break
            if minCount > 20:
                break
            # r = request(tUrl, retries=3, reqinterval=reqinterval)
            r = requests.get(tUrl, timeout=5)
            s = r.content.replace('\\', '')
            time.sleep(reqinterval)
            result0 = re.findall(r'\<tr\s*.*?\>.+?\<\/tr\>', s)
            if len(result0) <= 1:
                break
            for res in result0[1:]:
                tds = re.findall(r'\<td.*?\>.*?\<\/td\>', res)
                if len(tds) < 5:
                    continue
                metadata = [None]

                # [nick,rank,rankPic,vipLevel,price,promoTitle,amount,tradeTime,sku,status]
                # nick=re.findall(r'\<span\s+class\=\"tb\-sellnick\"\>(.+?)\<\/span\>\s*\<img',res)[0]

                nick = \
                    re.findall(
                        r'\<span\s+class\=\"tb\-sellnick\"\>(.+?)\<\/span\>\s*\<', res)
                if len(nick) > 0:
                    nick = nick[0]
                    for t in re.findall(r'\<.+?\>', nick):
                        nick = nick.replace(t, '')
                else:
                    nick = None
                metadata.append(nick.decode(r.encoding, 'ignore').encode('utf-8'
                                                                         ))

                # rank

                rank = \
                    re.findall(
                        r'\<img\s+src\=\".+?\/(.+?)\.gif\".+?class\=\"rank\"\s*\/\>', res)
                if len(rank) > 0:
                    rank = rank[0]
                    rank = rank[rank.rindex('/') + 1:].encode('utf-8')
                else:
                    rank = None
                metadata.append(rank)

                # rankPic
                # metadata.append(None)
                # vipLevel

                vipLevel = \
                    re.findall(
                        r'\<a\s+.+?href\=\"http\:\/\/vip\.taobao\.com\"\s+title\=\"(\w\d+).+?\"', res)
                if len(vipLevel) > 0:
                    vipLevel = vipLevel[0].encode('utf-8')
                else:
                    vipLevel = None
                metadata.append(vipLevel)

                # price

                price = \
                    re.findall(
                        r'\<td\s+class\=\"tb\-price\"\>.+?(\d+\.*\d*).*?\<\/td\>', res)[0]
                metadata.append(price.encode('utf-8'))

                # promoTitle
                # promoTitle=re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\"\s+class\=\"tb\-promo\"\>',res)

                promoTitle = re.findall(r'\<a\s+title\=\"\s*(.+?)\s*\".*?\>',
                                        res)
                if len(promoTitle) > 0:
                    promoTitle = promoTitle[0].decode(r.encoding, 'ignore'
                                                      ).encode('utf-8')
                else:
                    promoTitle = None
                metadata.append(promoTitle)

                # amount

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-amount\"\>\s*(\d+)\s*\<\/td\>', res)[0].encode('utf-8'))

                # tradeTime

                metadata.append(
                    re.findall(r'\<td\s+class\=\"tb\-time\"\>\s*(.+?)\s*\<\/td\>', res)[0].encode('utf-8'))

                # sku

                skus = \
                    re.findall(
                        r'\<td\s+class\=\"tb\-sku\"\>.*?\s*(\<p\>.+\<\/p\>)\s*.*?\<\/td\>', res)[0]
                metadata.append('\t'.join(re.findall(r'\<p\>\s*(.+?)\s*\<\/p\>', skus)).decode(r.encoding, 'ignore'
                                                                                               ).encode('utf-8'))

                # if len(INFOS)>2:
                # ....if metadata[7]==INFOS[0][10]:
                # ........stop=2
                # ........break

                curTime = parse(metadata[7])
                if curTime >= fromTsmp and curTime < toTsmp:
                    INFOS.append([siteId, shopId, itemId] + metadata)
                elif curTime < fromTsmp:
                    minCount += 1
                    break

                # print '\t'.join([str(t2).decode('utf-8') for t2 in metadata if t2!=None])

            page += 1

            # t1=time.strptime(INFOS[-1][10],'%Y-%m-%d %H:%M:%S')
            # if t1<t0 or stop:
            # ....break

            tUrl = tUrl.replace(re.findall(r'bidPage\=\d+', tUrl)[0], 'bidPage='
                                + str(page))
    return INFOS, params, {'siteId': siteId, 'shopId': shopId, 'itemId': itemId, 'userNumId': userNumId}
