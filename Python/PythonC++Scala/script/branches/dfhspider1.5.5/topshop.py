#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.6.7
'''

import re
import time
import json
from urllib import unquote
from lib import *
from topbll import saveTopShopData

try:
    from pyquery import PyQuery
except:
    PyQuery = None

REGX = {
    'pageId': r'pageId\=(\d+)',
    r'shopId': r'shopId\=(\d+)',
    'userId': r'userid\=(\d+)',
    'title': r'\<title\>\s+?\t+(.+?)\t+\s+?\<\/title\>',
    'shopname': r'\"name\"\:\"(.+?)\"',
    'shopLink': r'\"link\"\:\"(http\:\/\/.+?)\/.+?\"',
    'wangwang': r'\<a\sclass\=\"hCard\sfn\s*\"\s*href\=.+?\>(.+?)\<\/a\>',
    'shopRank': r'\<img\ssrc\=.+?newrank\/(.+?)\.gif.+?class\=\"rank\"\s*\/\>',
    'shopGrade': r'\<p\s+class\=\"shop\-grade\"\>.+?\<\/span\>\s*(\d+\.*\d*)\s*\<\/a\>',
    'shopKeeper': r'\<li\s+class\=\"shopkeeper\"\>.+?\<a\s+.+?\>\s*(\S+)\s*\<\/a\>',
    'shopRate': r'\<em\s+class\=\"count\".+?\>(\d+\.*\d*)\<\/em\>',
    'rateinfo': r'\<span\s+class\=\"rateinfo\"\s.+?\>.*?\<b\>(.+?)\<\/b\>.*?\<em\>(.+?)\<\/em\>.+?\<\/span\>',
    'company': r'\<label\>\s*' + '公 司 名：'.decode('UTF-8')
    + r'\s*\<\/label\>\s*(\S+?)\s*\<',
    'location': r'\<li\s+class\=\"locus\"\>.*?\<\/label\>\s*(.+?)\s*\<\/li\>',
    'goodsRate': r'\<span\>\s*' + '好评率：'.decode('utf-8')
    + r'\s*\<\/span\>\s*(\S+?)\s*\<',
    'itemAmount': r'\<span\>\s*' + '宝贝数量：'.decode('utf-8')
    + r'\s*\<\/span\>\s*(\d+?)\s*\<',
    'setupTime': r'\<span\>\s*' + '创店时间：'.decode('utf-8')
    + r'\s*\<\/span\>\s*(\S+?)\s*\<',
    'shopType': r'shoptype\=(\d)',
}

REGX_4 = {r'shopId': r'shopId\s*\:\s*\'(\d+)\'',
          'userId': r'userId\s*\:\s*\'(\d+)\''}


def _trim_html(content):
    content = re.sub(r'(<.+?>)', r'', content)
    content = re.sub(r'[\n\r\t]', r'', content)
    return content


class TopShop:

    INFO = {
        r'shopId': None,
        'userId': None,
        'shopName': None,
        'shopLink': None,
        'wangwangNick': None,
        'shopRank': None,
        'shopGrade': None,
        'shopRate': None,
        'shopKeeper': None,
        'company': None,
        'location': None,
        'goodsRate': None,
        'itemAmount': None,
        'setupTime': None,
        'collCount': None,
        'shopType': None,
    }

    def __init__(self, url, reqinterval=0.5):
        # self.res = request(url, requiredPropertyRegx=r'shopId', reqinterval=reqinterval, headers={})
        time.sleep(reqinterval)
        self.res = __import__('requests').get(url)
        self.content = self.res.content

    def getBasicInfo(self):
        self.INFO['shopId'] = re.findall(REGX['shopId'], self.content)
        self.INFO['userId'] = re.findall(REGX['userId'], self.content)
        self.INFO['shopName'] = re.findall(REGX['shopname'], self.content)
        self.INFO['shopLink'] = re.findall(REGX['shopLink'], self.content)
        self.INFO['wangwangNick'] = re.findall(REGX['wangwang'], self.content)
        self.INFO['shopRank'] = re.findall(REGX['shopRank'], self.content)
        self.INFO['shopGrade'] = re.findall(REGX['shopGrade'], self.content,
                                            re.S)
        self.INFO['shopRate'] = re.findall(REGX['shopRate'], self.content)
        self.INFO['shopKeeper'] = re.findall(REGX['shopKeeper'], self.content,
                                             re.S)
        self.INFO['company'] = re.findall(REGX['company'],
                                          self.content.decode(self.res.encoding, 'ignore'), re.S)
        self.INFO['location'] = re.findall(REGX['location'], self.content, re.S)
        self.INFO['goodsRate'] = re.findall(REGX['goodsRate'],
                                            self.content.decode(self.res.encoding, 'ignore'), re.S)
        self.INFO['itemAmount'] = re.findall(REGX['itemAmount'],
                                             self.content.decode(self.res.encoding, 'ignore'), re.S)
        self.INFO['setupTime'] = re.findall(REGX['setupTime'],
                                            self.content.decode(self.res.encoding, 'ignore'), re.S)
        self.INFO['shopType'] = re.findall(REGX['shopType'], self.content)
        if self.INFO['shopType'][0] in ['4']:
            self.INFO['shopId'] = re.findall(REGX_4[r'shopId'], self.content)
            self.INFO['userId'] = re.findall(REGX_4['userId'], self.content)
        for (k, v) in self.INFO.items():
            if v:
                if isinstance(v, list):
                    if k == 'shopRate':
                        self.INFO[k] = ','.join(self.INFO[k])
                    elif k == 'shopLink':
                        if len(re.findall(r'http\:\/\/store\.taobao\.com',
                               self.INFO[k][0])) == 1:
                            try:
                                self.INFO[k] = \
                                    (re.findall(
                                        r'\<a\s+class\=\"hCard\sfn\"\s+href\=\"(.+?)\"', self.content)[0])[:-1]
                            except:
                                self.INFO[k] = self.INFO[k][0]
                        else:
                            self.INFO[k] = self.INFO[k][0]
                    else:
                        self.INFO[k] = _trim_html(v[0])
                        if k in ['company', 'goodsRate', 'itemAmount',
                                 'setupTime']:
                            self.INFO[k] = self.INFO[k].encode('utf-8', 'ignore')
                        else:
                            self.INFO[k] = \
                                self.INFO[k].\
                                decode(self.res.encoding, 'ignore').\
                                encode('utf-8', 'ignore')
                else:
                    self.INFO[k] = None
            else:
                self.INFO[k] = None
        if not self.INFO['userId']:
            for regx in [r'userId\s*\=\s*(\d+)']:
                regxrs = re.findall(regx, self.content, re.S)
                if len(regxrs) > 0:
                    self.INFO['userId'] = regxrs[0]
                    break
        if not self.INFO['shopLink']:
            for regx in \
                [r'\<h3\s+class\=\"shop\-title\"\s*\>\s*\<a.+?href\=\"(.+?)\"',
                 r'\<a\sclass\=\"hCard\sfn\s*\"\shref\s*\=\s*\"(.+?)\"',
                 r'\<a\s+class\=\"shop-name\s*\"\s+href\s*\=\s*\"(.+?)\"']:
                regxrs = re.findall(regx, self.content, re.S)
                if len(regxrs) > 0:
                    self.INFO['shopLink'] = regxrs[0]
                    break
        if not self.INFO['shopName']:
            for regx in [r'<div\s+class\=\"name\"\s*\>\s*\<span\>\s*(.+?)\<',
                         r'\<h3\s+class\=\"shop\-title\"\s*\>\s*\<a.+?.+?\>\s*(.+?)\<',
                         r'\<a\s+class\=\"shop-name\s*\"\s*href\=.+?\>(.+?)\<\/a\>'
                         ]:
                shopName = re.findall(regx, self.content, re.S)
                if len(shopName) > 0:
                    self.INFO['shopName'] = \
                        shopName[0].decode(self.res.encoding).encode('utf-8')
                    break
        if not self.INFO['wangwangNick']:
            for regx in [r'data-nick\s*=\s*"(.+?)"']:
                wangwangNick = re.findall(regx, self.content, re.S)
                if len(wangwangNick) > 0:
                    self.INFO['wangwangNick'] = unquote(wangwangNick[0])
                    break
        if not self.INFO['wangwangNick']:
            self.INFO['wangwangNick'] = self.INFO['shopName']
        if not self.INFO['shopKeeper']:
            self.INFO['shopKeeper'] = self.INFO['wangwangNick']
        if not self.INFO['shopName']:
            self.INFO['shopName'] = self.INFO['wangwangNick']
        if not self.INFO['shopRank']:
            self.INFO['shopRank'] = re.findall(r'/newrank/(.+?)\.gif', self.content)
            self.INFO['shopRank'] = self.INFO['shopRank'][0] if self.INFO['shopRank'] else None
        pyjq_obj = PyQuery(self.content)
        if not self.INFO['itemAmount'] and self.INFO['shopType'] != '2':
            shop_intro = pyjq_obj.find("div.shop-intro")
            if shop_intro:
                self.INFO['itemAmount'] = \
                    int(list(shop_intro.items("dl"))[2].find("dd span").html())
        if self.INFO['shopType'] == '2':
            if not self.INFO['shopLink']:
                shopLink = re.search(r'href="(http://\S+?.tmall.com)"', self.content, re.S)
                if shopLink:
                    self.INFO['shopLink'] = shopLink.group(1)
            if not self.INFO['company']:
                company = pyjq_obj.find('div.extend ul li')[3].find('div').text.encode('utf-8').strip('\n')
                self.INFO['company'] = company
        else:
            pass
        return self.INFO

    def getFullInfo(self, interval=0.5):
        self.getBasicInfo()

        # collCount
        if self.INFO['shopType'] in ['7', '1', '3', '4']:
            regxrs = re.findall(
                r'J_SCollCount\"\s+data\-info\=\"param\=(.+?)\&',
                self.content)
            if regxrs:
                params = {'keys': regxrs[0], 't': '%.0f' % (time.time()
                          * 1000), 'callback': 'TShop.setShopStat'}
                domain = 'http://count.tbcdn.cn/counter3'
                tUrl = domain + '?' + '&'.join([k + '=' + v for (k, v) in
                                                params.items()])
                r = request(tUrl)
                self.INFO['collCount'] = str(re.findall(r'\"\S+\"\:(\d+)',
                                                        r.text, re.S)[0])
            else:
                if PyQuery:
                    pyjq_obj = PyQuery(self.content.decode(self.res.encoding))
                    data_info = (pyjq_obj.find('dl.collect-num dt') or pyjq_obj.find('.collect-num span')).attr('data-info')
                    count_url = re.sub(
                        r'param=(?P<param>.+?)\&countUrl=(?P<count>.+?)\&.+',
                        r'\g<count>?callback=jsonp357&t=%d&keys=\g<param>' % (time.time()*1000),
                        data_info,
                        re.S)
                    collCount = re.sub(
                        r'.+\:\s*(?P<coll>\d+).+',
                        r'\g<coll>',
                        request(count_url).content)
                    if collCount:
                        self.INFO['collCount'] = int(collCount)

        else:
            coll_url = 'http://favorite.taobao.com/collect_item_relation.htm?itemtype=0&itemNumid=%s' % self.INFO['shopId']
            try:
                res = request(coll_url)
                pyjq_obj = PyQuery(res.content.decode(res.encoding))
                self.INFO['collCount'] = pyjq_obj.find("div.add-fav-msg strong").html().strip()
            except:
                pass
        time.sleep(interval)

        # itemAmount
        if self.INFO['shopType'] == '2':
            tUrl = self.INFO['shopLink'] + '?search=y&orderType=_hotsell'
            r = request(tUrl)
            try:
                self.INFO['itemAmount'] = \
                    str(re.findall(r'\<div\s+class\=\"search\-result\"\s*\>.+?(\d+)', r.text, re.S)[0])
            except:
                pass
        time.sleep(interval)
        return self.INFO

    pass
