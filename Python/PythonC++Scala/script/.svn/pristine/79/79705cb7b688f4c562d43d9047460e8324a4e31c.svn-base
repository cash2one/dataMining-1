#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.6.7
version 1.0
'''

import re
import time
import json
import traceback
from urllib import unquote
from lib import *
from topbll import saveTopItem
from tornado.escape import xhtml_unescape

REGX_B = {  # 'itemTitle':r'\<h3\s+class\=\"tb\-tit\"\>\s*\<a\s+.+?\>(.+?)\<',
            # 'promoInfo':r'\<li\s+id\=\"J\_PromoPrice\".+?\>(.+?)\<\/li\>',
            # 'monthlyTrade':r'\<span\>\s*'+r'月\s*销\s*量：'.decode('UTF-8')+r'\s*\<\/span\>\<em\>(\d+)\<\/em\>',
    'charset': r'charset\=\"*(\S+?)\"*\W',
    'keywords': r'\<meta\s+name\=\"keywords\"\s+content\=\"(.+?)\"',
    'desc': r'\<meta\s+name\=\"description\"\s+content\=\"(.+?)\"',
    'siteId': r'siteId\=(\d)',
    'itemId': r'itemId\:\"(\S+?)\"',
    'pageId': r'pageId\:\"(\S+?)\"',
    'shopId': r'shopId\=(\d+?)\;',
    'userId': r'userid\=(\d+?)\;',
    'shopName': r'data\-shopName\=\'(.+?)\'',
    'shopUrl': r'data\-shopUrl\=\'(.+?)\'',
    'itemImg': r'\<img\s+id\=\"J_ImgBooth\"\s+src\=\"(.+?)\"',
    'itemTitle': r'\<input\s+type\=\"hidden\"\s+name\=\"title\"\s+value\=\"(.+?)\"',
    'initPrice': r'\<strong\s+.*?id\=\"J\_StrPrice\".*?\>\s*(\d+\.*\d*).+?\<',
    'bonus': r'\<em\s+id\=\"J\_EmPoint\"\>(\d+)\<\/em\>',
    'totalSoldOut': r'totalSQ\=(\d+)',
    'attrList': r'\<div\s+class\=\"attributes\-list\".*?\>.*?<ul>(.+?)</ul>',
    'starts': r'starts\=(\d+)',
    'ends': r'ends\=(\d+)',
    'userTag': r'user\_tag\=(\d+)',
    'cid': r'\s+catId\s*\=\s*\"(\d+)\"',
    'location': r'name\=\"region"\s+value\=\"(.+?)\"',
    'brand': r'b2c\_brand\=(\d+)',
}

REGX_C = {
    # 'itemTitle':r'\<div\s+class\=\"tb\-detail\-hd\"\>\s*\<h3\>(.+?)\<\/h3\>',
    'shopName': r'data\-nick\=\"(.+?)\"',
    'shopUrl': r'data\-action\=\"(.+?)\"',
    'itemTitle': r'\"title\"\:\"(.+?)\"',
    'initPrice': r'\<strong\s+.*?id\=\"J\_StrPrice\".*?\>(\d+\.*\d*).+\<',
    'monthlyTrade': r'',
    'totalSoldOut': r'sold_total_num\=(\d+)',
    'cid': r'\s+cid\s*\:\s*\'(\d+)\'',
    'location': r'\&il\=(.+?)\&',
    'attrList': r'\<ul\s+class\=\"attributes\-list\"\>(.+?)\<\/ul\>',
}


class TopItem:

    info = {  # New
        'charset': None,
        'keywords': None,
        'desc': None,
        'siteId': None,
        'itemId': None,
        'pageId': None,
        'shopId': None,
        'userId': None,
        'shopName': None,
        'shopUrl': None,
        'itemImg': None,
        'itemTitle': None,
        'initPrice': None,
        'promoInfo': None,
        'postageInfo': None,
        'monthlyTrade': None,
        'itemRate': None,
        'bonus': None,
        'favNum': None,
        r'totalSoldOut': None,
        'attrList': None,
        'reviewCount': None,
        'starts': None,
        'ends': None,
        'userTag': None,
        r'cid': None,
        'location': None,
        'brand': None,
        'gradeAvg': None,
        'peopleNum': None,
        'periodSoldQuantity': None,
        'rateTotal': None,
        'spuId': None,
        'totalSoldQuantity': None,
    }

    def __init__(self, url, reqinterval=0.5):

        # self.res=request(url,requiredPropertyRegx=r'shopId')

        # self.res = request(url, reqinterval=reqinterval)
        time.sleep(reqinterval)
        self.res = __import__('requests').get(url)
        self.content = self.res.content
        self.info = dict((k, None) for (k, v) in self.info.items())
        self.info['siteId'] = re.findall(REGX_B['siteId'], self.content)
        self.info['siteId'] = (self.info['siteId'][0]
                               if len(self.info['siteId']) > 0
                               else None)
        self.reqinterval = reqinterval

    def getBasicInfo(self):
        if self.info['siteId'] == '2':
            self.info['charset'] = re.findall(REGX_B['charset'], self.content)
            self.info['keywords'] = re.findall(
                REGX_B['keywords'], self.content)
            self.info['desc'] = re.findall(REGX_B['desc'], self.content)
            self.info['itemId'] = re.findall(REGX_B['itemId'], self.content)
            self.info['pageId'] = re.findall(REGX_B['pageId'], self.content)
            self.info['shopId'] = re.findall(REGX_B['shopId'], self.content)
            self.info['userId'] = re.findall(REGX_B['userId'], self.content)
            self.info['shopName'] = re.findall(REGX_B['shopName'],
                                               self.content, re.S)
            self.info['shopUrl'] = re.findall(REGX_B['shopUrl'], self.content,
                                              re.S)
            self.info['itemImg'] = re.findall(REGX_B['itemImg'], self.content,
                                              re.S)
            self.info['itemTitle'] = re.findall(REGX_B['itemTitle'],
                                                self.content, re.S)
            self.info['initPrice'] = re.findall(REGX_B['initPrice'],
                                                self.content, re.S)
            self.info['bonus'] = re.findall(REGX_B['bonus'], self.content)
            self.info['totalSoldOut'] = re.findall(REGX_B['totalSoldOut'],
                                                   self.content)
            self.info['attrList'] = re.findall(REGX_B['attrList'],
                                               self.content, re.S)
            self.info['starts'] = re.findall(REGX_B['starts'], self.content,
                                             re.S)
            self.info['ends'] = re.findall(REGX_B['ends'], self.content, re.S)
            self.info['userTag'] = re.findall(REGX_B['userTag'], self.content,
                                              re.S)
            self.info[r'cid'] = re.findall(REGX_B[r'cid'], self.content, re.S)
            self.info['location'] = re.findall(
                REGX_B['location'], self.content)
            self.info['brand'] = re.findall(REGX_B['brand'], self.content)
            for (k, v) in self.info.items():
                if v:
                    if len(v) > 0:
                        self.info[k] = v[0]
                        self.info[k] = self.info[k].decode(self.res.encoding,
                                                           'ignore').encode('utf-8')
                        if k == 'attrList':
                            for t in re.findall(r'\<\!\-\-.+?\-\-\>',
                                                self.info[k]) + re.findall(r'\s+',
                                                                           self.info[k]):
                                self.info[k] = self.info[k].replace(t, ' ')
                    else:
                        self.info[k] = None
                else:
                    self.info[k] = None
            if not self.info['itemTitle']:
                itemTitle = re.findall(r'title"\s*:\s*"(.+?)"', self.content)
                if itemTitle:
                    self.info['itemTitle'] = itemTitle[0].decode(
                        self.res.encoding, 'ignore').encode('utf-8')
            if not self.info['initPrice'] or self.info['initPrice'] == '0':
                price = re.findall(r'"price"\s*:\s*"(\d+)"', self.content)
                if price:
                    self.info['initPrice'] = '%s.%s' % (
                        price[0][:-2], price[0][-2:])
            if not self.info['initPrice'] or self.info['initPrice'] == '0':
                price = re.search(
                    r'defaultItemPrice\'\s*\:\s*\'(\d+\.*\d*).+?\'', self.content, re.S)
                if price:
                    self.info['initPrice'] = price.group(1)
            if not self.info['itemImg']:
                img = re.search(r'url\((\S+?item_pic\.jpg\S+?)\)', self.content, re.S) or re.search(
                    r'J_UlThumb.+?url\((.+?)\)', self.content, re.S)
                if img:
                    self.info['itemImg'] = img.group(1)
            if not self.info['cid']:
                cid = re.search(
                    r'\'categoryId\'\s*\:\s*\'(\d+)\'', self.content, re.S)
                if cid:
                    self.info['cid'] = cid.group(1)
            if not self.info['spuId']:
                spuId = re.search(
                    r'\'spuId\'\s*\:\s*\'(\d+)\'', self.content, re.S)
                self.info['spuId'] = spuId.group(1) if spuId else None
        else:
            self.info['charset'] = re.findall(REGX_B['charset'], self.content)
            self.info['keywords'] = re.findall(
                REGX_B['keywords'], self.content)
            self.info['desc'] = re.findall(REGX_B['desc'], self.content)
            self.info['itemId'] = re.findall(REGX_B['itemId'], self.content)
            self.info['pageId'] = re.findall(REGX_B['pageId'], self.content)
            self.info['shopId'] = re.findall(REGX_B['shopId'], self.content)
            self.info['userId'] = re.findall(REGX_B['userId'], self.content)
            self.info['shopName'] = re.findall(REGX_C['shopName'],
                                               self.content, re.S)
            self.info['shopUrl'] = re.findall(REGX_C['shopUrl'], self.content,
                                              re.S)
            self.info['itemImg'] = re.findall(REGX_B['itemImg'], self.content,
                                              re.S)
            self.info['itemTitle'] = re.findall(REGX_C['itemTitle'],
                                                self.content, re.S)
            self.info['initPrice'] = re.findall(REGX_C['initPrice'],
                                                self.content, re.S)
            self.info[r'totalSoldOut'] = re.findall(REGX_C[r'totalSoldOut'],
                                                    self.content)
            self.info['attrList'] = re.findall(REGX_C['attrList'],
                                               self.content, re.S)
            self.info['starts'] = re.findall(REGX_B['starts'], self.content,
                                             re.S)
            self.info['ends'] = re.findall(REGX_B['ends'], self.content, re.S)
            self.info['userTag'] = re.findall(REGX_B['userTag'], self.content,
                                              re.S)
            self.info[r'cid'] = re.findall(REGX_C[r'cid'], self.content, re.S)
            self.info['location'] = re.findall(
                REGX_C['location'], self.content)
            for (k, v) in self.info.items():
                if v:
                    if len(v) > 0:
                        self.info[k] = v[0]
                        self.info[k] = self.info[k].decode(self.res.encoding,
                                                           'ignore').encode('utf-8')
                        if k == 'attrList':
                            for t in re.findall(
                                r'\<\!\-\-.+?\-\-\>',
                                self.info[k]) + re.findall(
                                    r'\s+', self.info[k]):
                                self.info[k] = self.info[k].replace(t, ' ')
                    else:
                        self.info[k] = None
                else:
                    self.info[k] = None
            if self.info['location']:
                self.info['location'] = unquote(
                    self.info['location']
                ).decode(self.res.encoding, 'ignore').encode('utf-8')
        self.info['attrList'] = (xhtml_unescape(
            self.info['attrList']).encode('utf-8')
            if self.info['attrList'] else None)
        return self.info

    def getFullInfo(
        self,
        monthlyTrade=True,
        itemRate=True,
        favNum=True,
        reviewCount=True,
    ):

        self.getBasicInfo()
        if self.info['siteId'] in ['2']:
            self.getBShopData()
        else:
            if monthlyTrade:
                domain = re.findall(
                    r'\"apiItemInfo\"\s*\:\s*\"(.+?)\"', self.content)
                if domain:
                    domain = domain[0]
                    params = {'callback': 'TShop.mods.SKU.GetItemInfo.fire'}
                    tUrl = domain + '&' + '&'.join([k + '=' + v for (k, v) in
                                                    params.items()])
                    # r = request(tUrl)
                    time.sleep(self.reqinterval)
                    r = __import__('requests').get(tUrl)
                    self.info['monthlyTrade'] = re.findall(
                        r'quanity\:\s*(\d+)', r.content)
                    if not self.info['location']:
                        self.info['location'] = re.findall(
                            r'location\s*\:\s*\'(.+?)\'', r.content)
                        if self.info['location']:
                            self.info['location'] = self.info['location'][
                                0].decode(r.encoding).encode('utf-8')

            # itemRate

            if itemRate or favNum or reviewCount:
                domain = re.findall(r'counterApi\:\"(.+?)\"', self.content)
                if len(domain) > 0:
                    domain = domain[0]
                    params = \
                        {'callback': 'TShop.mods.SKU.CounterCenter.saveCounts'}
                    tUrl = domain + '&' + '&'.join([k + '=' + v for (k, v) in
                                                    params.items()])
                    # r = request(tUrl)
                    time.sleep(self.reqinterval)
                    r = __import__('requests').get(tUrl)
                    self.info['itemRate'] = \
                        re.findall(r'\"ICE_3\_feedcount\-.+?\"\:(\d+)',
                                   r.content)

                    # favNum

                    keys = \
                        re.findall(
                            r'\"apiItemCollects\"\:\s*\".+?keys\=(.+?)\"',
                            self.content)[0]
                    self.info['favNum'] = re.findall(
                        r'\"' + keys + r'\"\:(\d+)',
                        r.content)

                    # reviewCount

                    keys = \
                        re.findall(
                            r'\"apiItemViews\"\:\s*\".+?keys\=(.+?)\&.+?\"',
                            self.content)[0]
                    self.info['reviewCount'] = re.findall(
                        r'\"' + keys + r'\"\:(\d+)',
                        r.content)
                    for key in ['monthlyTrade', 'itemRate', 'favNum',
                                'reviewCount']:
                        if isinstance(self.info[key], list):
                            if self.info[key]:
                                self.info[key] = self.info[key][0]
                            else:
                                self.info[key] = None
        return self.info

    def getBShopData(self):
        # list_dsr_info
        domain = 'http://rate.tmall.com/list_dsr_info.htm'
        params = {
            'itemId': self.info['itemId'],
            'spuId': self.info['spuId'],
            'sellerId': self.info['userId'],
            '_ksTS': int(time.time()),
            'callback': 'jsonp182'
        }
        url = '%s?%s' % (domain, '&'.join(['%s=%s' % (k, v)
                         for k, v in params.items()]))
        time.sleep(self.reqinterval)
        content = requests.get(url).content
        if content.find('{') != -1:
            content = re.search(r'({.+})', content, re.S)
            if content:
                content = json.loads(content.group(1)).get('dsr')
                if content:
                    self.info['gradeAvg'] = content['gradeAvg']
                    self.info['peopleNum'] = content['peopleNum']
                    self.info['rateTotal'] = content['rateTotal']
        # apiBeans
        domain = re.search(r'"apiBeans"\s*:\s*"(.+?)"', self.content, re.S)
        if domain:
            domain = domain.group(1).replace('\/', '/')
            params = {
                '_ksTS': int(time.time()),
                'callback': 'jsonp233'
            }
            url = '%s&%s' % (
                domain,
                '&'.join(['%s=%s' % (k, v)for k, v in params.items()]))
            time.sleep(self.reqinterval)
            content = requests.get(url).content
            key = domain[domain.rindex(',') + 1:]
            val = re.search(r'"%s"\s*:\s*(\d+)' % key, content)
            self.info['favNum'] = val.group(1) if val else None
