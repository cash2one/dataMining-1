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
import warnings

import yaml
import requests
from pyquery import PyQuery

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
    'attrList': r'\<div\s+class\=\"attributes\-list\".*?\>.*?<ul.*?>(.+?)</ul>',
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


headers = {
    'Accept-Charset': 'GBK,utf-8;q=0.7,*;q=0.3',
    'Accept-Encoding': 'gzip,deflate,sdch',
    'Accept-Language': 'zh-CN,zh;q=0.8',
    'Cache-Control': 'max-age=0',
    'Connection': 'keep-alive',
    'DNT': '1',
    'Host': 'detail.tmall.com',
    'Referer': 'http://s.taobao.com/search',
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22'
}

cookies = {
    'cna': 'cauxCQAgVHwCAQ6WCLwoBlHg',
    'lzstat_uv': '15612795852278529133|2674749',
    'ck1': 'UoM%2BEhYHmiYtVgs%3D',
    '_tb_token_': 'eee4b7315dfed',
    'tracknick': 'gsavl',
    'cookie2': 'ae840d28ce122d79a71e20733440effd',
    't': '267839bd4a447c17ad64245e5cb4ee2f',
    'sec': 'Malldetail|14.150.9.162|1364211315|ff3087c9f27e252275a24c845e942e0d',
    'cq': 'ccp%3D1',
    'mpp': 't%3D0%26m%3D%26h%3D0%26l%3D0'
}


def _taobao_request(url):
    while 1:
        res = requests.get(url, timeout=5, allow_redirects=True)
        if res.url.find('noitem') > -1:
            return res
        if res.content.find('siteId') < 0 and re.search(r'location.href\s*=', res.content):
            url = re.search(r'location\.href\s*\=\s*\'(.+?)\'', res.content, re.S).group(
                1)
            url = url + (url[url.find('?'):] if url.find('?') > -1 else res.url[
                         res.url.find('?'):]) if url.find('id=') == -1 else url
        else:
            return res


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
        'offSale': False,
        'quanity': None,
        'paySuccess': None,
        'confirmGoods': None,
        'paySuccessItems': None,
        'confirmGoodsItems': None,
        'shopRank': None,
        'shopGoodRate': None,
        'created': None,
        'noitem': False,
        'host': None,
        'itemType': None
    }

    def __init__(self, url, reqinterval=0.5):

        # self.res=request(url,requiredPropertyRegx=r'shopId')

        # self.res = request(url, reqinterval=reqinterval)
        time.sleep(reqinterval)
        # self.res = requests.get(url, timeout=5)
        self.res = _taobao_request(url)
        self.url = self.res.url
        self.content = self.res.content
        # self.info = dict((k, None) for (k, v) in self.info.items())
        self.info['siteId'] = re.search(REGX_B['siteId'], self.content, re.S)
        self.info['siteId'] = (self.info['siteId'].group(1)
                               if self.info['siteId']
                               else None)
        self.cookies = self.res.cookies
        self.reqinterval = reqinterval
        if self.url.find('noitem') > -1:
            self.info['noitem'] = True
        host = re.search(r'http://(.+?\.com)', self.res.url, re.S)
        self.info['host'] = host.group(1).encode('utf-8') if host else None

    def getBasicInfo(self):
        if self.info['noitem']:
            return self.info
        pq_obj = PyQuery(self.content.decode('GBK'))
        detail = pq_obj.find('div#detail')
        detail = re.search(
            r'宝贝类型：\s*(\S+)', detail.text().encode('utf-8'), re.S)
        self.info['itemType'] = detail.group(1) if detail else None
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
                    if isinstance(v, list) and len(v) > 0:
                        self.info[k] = str(v[0])
                        self.info[k] = self.info[k].decode(self.res.encoding,
                                                           'ignore').encode('utf-8')
                        if k == 'attrList':
                            for t in re.findall(
                                r'\<\!\-\-.+?\-\-\>',
                                self.info[k]) + re.findall(
                                    r'\s+',
                                    self.info[k]):
                                self.info[k] = self.info[k].replace(t, ' ')
                    elif isinstance(v, list) and len(v) == 0:
                        self.info[k] = None
                    # else:
                    #     self.info[k] = self.info[k] or None
                else:
                    self.info[k] = None
            if not self.info['itemTitle']:
                itemTitle = re.findall(r'title"\s*:\s*"(.+?)"', self.content)
                if itemTitle:
                    self.info['itemTitle'] = itemTitle[0].decode(
                        self.res.encoding, 'ignore').encode('utf-8')
            if not self.info['itemTitle']:
                itemTitle = re.search(r'<title>(.+?)</title>', self.content)
                self.info['itemTitle'] = itemTitle.group(1).decode(
                    self.res.encoding, 'ignore'
                ).encode('utf-8').rstrip('-tmall.com天猫') if itemTitle else ''
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
                    r'J_UlThumb.+?url\((.+?)\)', self.content, re.S) or re.search(
                        r'J_ImgBooth"\s+src="(.+?)"', self.content, re.S)
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
            shopGoodRate = [float(t.text)
                            for t in pq_obj.find('em.count') if t]
            if shopGoodRate:
                self.info['shopGoodRate'] = '%.1f' % (
                    sum(shopGoodRate) / len(shopGoodRate))
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
            self.info['gradeAvg'] = [
                float(row)
                for row in re.findall(
                    r'\<em\sclass="count".+?\>(\d+\.*\d*)\<\/em\>', self.content, re.S)
            ]
            self.info['gradeAvg'] = [sum(
                self.info['gradeAvg']) / len(self.info['gradeAvg'])] if self.info['gradeAvg'] else None
            shopRank = pq_obj.find('a#shop-rank img')
            self.info['shopRank'] = re.sub(
                r'.+?(s\_\w+\_\d)\.gif', r'\1', shopRank.attr['src']) if shopRank else None
            self.info['shopGoodRate'] = pq_obj.find(
                'em#J_PositiveRating').text()
            for (k, v) in self.info.items():
                if v:
                    if isinstance(v, list) and len(v) > 0:
                        self.info[k] = v[0]
                        self.info[k] = self.info[k].decode(
                            self.res.encoding, 'ignore'
                        ).encode('utf-8') \
                            if isinstance(self.info[k], (str, unicode))\
                            else self.info[k]
                        if k == 'attrList':
                            for t in re.findall(
                                r'\<\!\-\-.+?\-\-\>',
                                self.info[k]) + re.findall(
                                    r'\s+', self.info[k]):
                                self.info[k] = self.info[k].replace(t, ' ')
                    elif isinstance(v, list) and len(v) == 0:
                        self.info[k] = None
                else:
                    self.info[k] = None
            if self.info['location']:
                self.info['location'] = unquote(
                    self.info['location']
                ).decode(self.res.encoding, 'ignore').encode('utf-8')
            if not self.info['itemImg']:
                img = re.search(
                    r'id="J_ImgBooth" data-src="(.+?)"', self.content, re.S)
                if img:
                    self.info['itemImg'] = img.group(1)
            self.info['shopName'] = eval(
                "'%s'" % (self.info['shopName'] or '').replace('%', '\\x'))
            created = re.search(r'dbst\s*:\s*(\d+)', self.content, re.S)
            self.info['created'] = created.group(1) if created else None
        self.info['attrList'] = (xhtml_unescape(
            self.info['attrList']).encode('utf-8')
            if self.info['attrList'] else None)
        self.info['attrList'] = re.sub(
            r'\s+', r' ', self.info['attrList'] or '')
        self.info['attrs'] = re.findall(
            r'<li.+?>(.+?)[:：]\s*(.*?)</li>'.decode('utf-8'),
            (self.info['attrList'] or '').decode('utf-8'),
            re.S)
        self.info['attrs'] = [[t[0].strip().encode('utf-8'), t[1].strip('\t\r ').encode('utf-8')]
                              for t in self.info['attrs']]
        self.info['offSale'] = True \
            if self.content.decode(self.res.encoding).encode('utf-8').find('已下架') > -1 \
            else False
        self.info['location'] = self.info['location'] or None
        self.deal_taobao_meal_basic()
        return self.info

    def is_taobao_meal(self):
        return True if self.url.find('meal.taobao.com') > -1 else False

    def deal_taobao_meal_basic(self):
        if not self.is_taobao_meal():
            return
        location = re.search(r'\&il\=(.+?)\&', self.content)
        if location:
            self.info['location'] = location.group(
                1).decode('GBK').encode('utf-8')

    def deal_taobao_meal_full(self):
        if not self.is_taobao_meal():
            return
        url = re.search(r'getDealQuantity\:\s*\"(.+?)\"', self.content)
        if url:
            url = url.group(1) + '&callback=DT.mods.SKU.SetDealCounts.render'
            time.sleep(self.reqinterval)
            txt = requests.get(url, timeout=5).content
            for key in ['quanity', 'paySuccess', 'confirmGoods', 'paySuccessItems', 'confirmGoodsItems']:
                val = re.search(r'%s:\s*(\d+)' % key, txt, re.S)
                if val:
                    self.info[key] = val.group(1)
        if not self.info['monthlyTrade']:
            self.info['monthlyTrade'] = self.info['quanity']

    def getFullInfo(
        self,
        monthlyTrade=True,
        itemRate=True,
        favNum=True,
        reviewCount=True,
    ):

        if self.info['noitem']:
            return self.info
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
                    r = requests.get(tUrl, timeout=5)
                    self.info['monthlyTrade'] = re.findall(
                        r'quanity\:\s*(\d+)', r.content)
                    for key in ['quanity', 'paySuccess', 'confirmGoods', 'paySuccessItems', 'confirmGoodsItems']:
                        rs = re.findall(r'%s\:\s*(\d+)' % key, r.content)
                        self.info[key] = rs[0] if rs else None
                    if not self.info['location']:
                        self.info['location'] = re.findall(
                            r'location\s*\:\s*\'(.+?)\'', r.content)
                        if self.info['location']:
                            self.info['location'] = self.info['location'][
                                0].decode(r.encoding).encode('utf-8')

            # itemRate

            if itemRate or favNum or reviewCount:
                domain = re.findall(r'counterApi\:\"(.+?)\"', self.content)
                if len(domain) > 0 and domain[0].find('count.tbcdn.cn') > -1:
                    domain = domain[0]
                    params = \
                        {'callback': 'TShop.mods.SKU.CounterCenter.saveCounts'}
                    tUrl = domain + '&' + '&'.join([k + '=' + v for (k, v) in
                                                    params.items()])
                    # r = request(tUrl)
                    time.sleep(self.reqinterval)
                    r = requests.get(tUrl, timeout=5)
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
        self.deal_taobao_meal_full()
        self.info['location'] = self.info['location'] or None
        return self.info

    def getBShopData(self):
        global headers, cookies
        # monthlyTrade
        try:
            init_api = re.findall(
                r'\"initApi\"\s*\:\s*\"(.+?)\"', self.content)[0]
            add_on_params = {
                'callback': 'onMdskip',
                'ip': '',
                'campaignId': '',
                'key': '',
                'abt': '',
                'cat_id': '',
                'q': '',
                'u_channel': '',
                'ref': 'http%3A%2F%2Fs.taobao.com%2Fsearch%3F'
            }
            init_api = init_api + '&%s' % '&'.join(['%s=%s' % (
                k, v) for k, v in add_on_params.items()])
            # cookies.update(self.cookies)
            init_data = requests.get(
                init_api, timeout=5, headers=headers, cookies=cookies).content.decode('GBK').encode('utf-8')
            init_data = init_data[init_data.find('{'):init_data.rfind('}') + 1]
            init_data = yaml.load(_parse_json_str(init_data))
            self.info['monthlyTrade'] = init_data[
                'defaultModel']['sellCountDO']['sellCount']
        except:
            warnings.warn('failed to fetch initApi\n%s' % traceback.format_exc())

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
        content = requests.get(url, timeout=5).content
        if content.find('{') != -1:
            content = re.search(r'({.+})', content, re.S)
            if content:
                content = json.loads(content.group(1)).get('dsr')
                if content:
                    self.info['gradeAvg'] = content.get('gradeAvg')
                    self.info['peopleNum'] = content.get('peopleNum')
                    self.info['rateTotal'] = content.get('rateTotal')
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
            content = requests.get(url, timeout=5).content
            key = domain[domain.rindex(',') + 1:]
            val = re.search(r'"%s"\s*:\s*(\d+)' % key, content)
            self.info['favNum'] = val.group(1) if val else None
