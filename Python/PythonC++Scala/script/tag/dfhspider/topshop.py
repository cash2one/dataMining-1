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

import requests
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


headers = {
    # 'Host': 'chowtaifook.tmall.com',
    'Connection': 'keep-alive',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
    'User-Agent': 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/28.0.1500.71 Chrome/28.0.1500.71 Safari/537.36',
    'DNT': 1,
    'Accept-Encoding': 'gzip,deflate,sdch',
    'Accept-Language': 'zh-CN,zh;q=0.8'
}


cookies = {
    'cna': '40WGCmwufnECAQ6TxrvOMvWK',
    'x': '__ll%3D-1%26_ato%3D0',
    '_mr': '1',
    'lzstat_uv': '18630103433699095329|2934243@2674749@2244711',
    'otherx': 'e%3D1%26p%3D*%26s%3D0%26c%3D0%26f%3D0%26g%3D0%26t%3D0',
    'mall_fp_ab': '2012b',
    'tracknick': 'ggg',
    'cookie2': 'e22c1711e76a8a80fd50ee51c2d4f6b0',
    't': 'e1cc65f1165fc1ad7052aa35d05a1047',
    '_tb_token_': '5f6318fe3377e',
    'cq': 'ccp%3D1'
}


def _parse_loca(location):
    location2 = re.sub(r'(\S+),\s*(\S+)', r'\1 \2', location or '')
    location2 = re.sub(r'(\S+)省\s*(\S+)市', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)省\s*(\S+)自治州', r'\1 \2自治州', location2)
    location2 = re.sub(r'(\S+)壮族自治区\s*(\S+)市', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)回族自治区\s*(\S+)市', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)维吾尔族自治区\s*(\S+)市', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)维吾尔自治区\s*(\S+)市', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)自治区\s*(\S+)市', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)壮族自治区\s*(\S+)', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)回族自治区\s*(\S+)', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)维吾尔族自治区\s*(\S+)', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)维吾尔自治区\s*(\S+)', r'\1 \2', location2)
    location2 = re.sub(r'(\S+)自治区\s*(\S+)', r'\1 \2', location2)
    location2 = location2.decode('utf-8').rstrip('回族'.decode('utf-8')).encode('utf-8')
    location2 = location2.decode('utf-8').rstrip('朝鲜族'.decode('utf-8')).encode('utf-8')
    location2 = location2.replace('省', '')
    if location2.find(' ') == -1:
        offset = 3 \
            if (location2.startswith('黑龙江') or location2.startswith('内蒙古')) \
            else 2
        location2 = location2.decode('utf-8')
        location2 = ('%s %s' % (
            location2[:offset],
            location2[offset:]
        )).encode('utf-8')
    return location2.strip()


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
        'location2': None
    }

    def __init__(self, url, reqinterval=0.5):
        # self.res = request(url, requiredPropertyRegx=r'shopId', reqinterval=reqinterval, headers={})
        time.sleep(reqinterval)
        self.res = requests.get(url, headers=headers, cookies=cookies)
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
        self.INFO['location'] = re.findall(
            REGX['location'], self.content, re.S)
        self.INFO['goodsRate'] = re.findall(REGX['goodsRate'],
                                            self.content.decode(self.res.encoding, 'ignore'), re.S)
        self.INFO['itemAmount'] = re.findall(REGX['itemAmount'],
                                             self.content.decode(self.res.encoding, 'ignore'), re.S)
        self.INFO['setupTime'] = re.findall(REGX['setupTime'],
                                            self.content.decode(self.res.encoding, 'ignore'), re.S)
        self.INFO['shopType'] = re.findall(REGX['shopType'], self.content) or re.findall(
            r'"*siteId"*:\s*[\'\"](\d+)[\'\""]', self.content)
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
                            self.INFO[k] = self.INFO[
                                k].encode('utf-8', 'ignore')
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
        # print re.findall(r'<title>(.+?)</title>',
        # self.content.decode(self.res.encoding), re.S)[0].encode('utf-8')
        if not self.INFO['shopName']:
            for regx in [r'<div\s+class\=\"name\"\s*\>\s*\<span\>\s*(.+?)\<',
                         r'\<h3\s+class\=\"shop\-title\"\s*\>\s*\<a.+?.+?\>\s*(.+?)\<',
                         r'\<a\s+class\=\"shop-name\s*\"\s*href\=.+?\>(.+?)\<\/a\>',
                         r'<title>(.+?)</title>'
                         ]:
                shopName = re.findall(
                    regx, self.content.decode(self.res.encoding), re.S)
                if len(shopName) > 0:
                    self.INFO['shopName'] = shopName[0]
                    break
            self.INFO['shopName'] = re.sub(
                r'(\<span.*?\>).+?(\<\/span\>)', r'', self.INFO['shopName'] or '', re.S)
            self.INFO['shopName'] = self.INFO['shopName'].encode('utf-8').replace(
                '首页-', '').replace('-淘宝网', '') if self.INFO['shopName'] else None
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
            self.INFO['shopRank'] = re.findall(
                r'/newrank/(.+?)\.gif', self.content)
            self.INFO['shopRank'] = self.INFO['shopRank'][
                0] if self.INFO['shopRank'] else None
        pyjq_obj = PyQuery(self.content.decode(self.res.encoding))
        if not self.INFO['itemAmount'] and self.INFO['shopType'] != '2':
            shop_intro = pyjq_obj.find("div.shop-intro")
            if shop_intro:
                self.INFO['itemAmount'] = \
                    int(list(shop_intro.items("dl"))[2].find("dd span").html())
        if self.INFO['shopType'] == '2':
            if not self.INFO['shopLink']:
                shopLink = re.search(
                    r'href="(http://\S+?.tmall.com)"', self.content, re.S)
                if shopLink:
                    self.INFO['shopLink'] = shopLink.group(1)
            if not self.INFO['company']:
                company = pyjq_obj.find('div.extend ul li')
                if len(company) >= 3:
                    company = company[2].find(
                        'div').text.encode('utf-8').strip('\n\r\t ')
                    self.INFO['company'] = company if len(
                        company) < 200 else None
        else:
            pass
        if not self.INFO['location']:
            i = pyjq_obj.text().find('所在地区'.decode('utf-8'))
            j = pyjq_obj.text().find('宝贝'.decode('utf-8'), i)
            self.INFO['location'] = pyjq_obj.text()[i + 5:j].encode('utf-8')
        self.INFO['location'] = self.INFO['location'].strip('-').strip() \
            if self.INFO['location'] and len(self.INFO['location']) < 20 \
            else None
        if not self.INFO['location']:
            loca_html = pyjq_obj.find('.locus')
            if loca_html:
                loca = loca_html.text().lstrip(
                    '所 在 地：'.decode('utf-8')).lstrip('所 在 地:'.decode('utf-8'))
                self.INFO['location'] = loca.encode('utf-8')
        if self.INFO['location']:
            self.INFO['location'] = self.INFO['location'].strip('-')
        self.INFO['location2'] = _parse_loca(self.INFO['location'])
        return self.INFO

    def getRateInfo(self, interval=0.5):
        if self.INFO['shopType'] != '2':
            return
        url = 'http://rate.taobao.com/user-rate-%s.htm' % self.INFO['userId']
        content = request(url).content.decode('GBK')
        pyjq_obj = PyQuery(content)
        # setupTime
        setupTime = pyjq_obj.find('#J_showShopStartDate')
        if setupTime:
            self.INFO['setupTime'] = setupTime.attr('value').encode('utf-8')
        # company
        if not self.INFO['company']:
            company = pyjq_obj.find('.company')
            company = company.text().lstrip(
                '公司名称：'.decode('utf-8')).encode('utf-8') if company else None
            self.INFO['company'] = company
        time.sleep(interval)

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
                    data_info = (pyjq_obj.find('dl.collect-num dt') or pyjq_obj.find(
                        '.collect-num span')).attr('data-info')
                    if data_info:
                        count_url = re.sub(
                            r'param=(?P<param>.+?)\&countUrl=(?P<count>.+?)\&.+',
                            r'\g<count>?callback=jsonp357&t=%d&keys=\g<param>' % (
                                time.time() * 1000),
                            data_info,
                            re.S)
                        collCount = re.sub(
                            r'.+\:\s*(?P<coll>\d+).+',
                            r'\g<coll>',
                            request(count_url).content)
                        if collCount:
                            self.INFO['collCount'] = int(collCount)

        else:
            coll_url = 'http://favorite.taobao.com/collect_item_relation.htm?itemtype=0&itemNumid=%s' % self.INFO[
                'shopId']
            try:
                res = request(coll_url)
                pyjq_obj = PyQuery(res.content.decode(res.encoding))
                self.INFO['collCount'] = pyjq_obj.find(
                    "div.add-fav-msg strong").html().strip()
            except:
                pass
        time.sleep(interval)

        # itemAmount
        if self.INFO['shopType'] == '2':
            tUrl = self.INFO['shopLink'] + '?search=y&orderType=_hotsell'
            r = request(tUrl)
            try:
                self.INFO['itemAmount'] = \
                    str(re.findall(
                        r'\<div\s+class\=\"search\-result\"\s*\>.+?(\d+)', r.text, re.S)[0])
            except:
                pass
        time.sleep(interval)
        self.getRateInfo()
        return self.INFO

    pass


if __name__ == '__main__':
    print _parse_loca(None)
    print _parse_loca('黑龙江哈尔滨')
