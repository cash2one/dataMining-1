#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
@auth   Cooper
@date   2013.3.26
@desc   get add on data like promotion info
@TODO   refactor
"""

import re
import json
import time
import urllib
import requests
import yaml

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


def get_item_addon(item_id, sku=True, promo=True, interval=0.4):
    """
    Returns:
    {
        'skuId1': {
            'price': 176.00
        },
        'skuId2': {
            'price': 178.00
        }
    },
    {
        'default': {
            'price': 0,
            'promo': [
                {
                    'price': '',
                    'type': ''
                }
            ]
        }
        'sku1': {           # 套餐ID
            'price': 0,     # 原价
            'promo': [
                {
                    'price': '',    # 促销价
                    'type': ''      # 促销类型
                }
            ]
        },
        'sku2': {
        }
    }
    """
    global headers, cookies
    item_url = 'http://item.taobao.com/item.htm?id=%s' % item_id
    time.sleep(interval)
    r = requests.get(item_url, cookies=cookies, headers=headers)
    response_content = r.content
    sku_dict = dict()
    promo_list = dict()
    if sku:
        if re.findall(r'siteId\=2', response_content):
            sku = re.findall(r'TShop\.Setup\(.+?\)', response_content, re.S)
            if sku:
                sku_j_str = re.findall(r'\{.+\}', sku[
                                       0].decode(r.encoding), re.S)[0]
                sku_j_str = _parse_json_str(re.findall(
                    r'\{.+\}', sku_j_str, re.S)[0])
                sku = yaml.load(sku_j_str)
                sku_dict = sku['valItemInfo'].get('skuMap') or {}
        elif re.findall(r'siteId\=\d', response_content):
            sku = re.findall(
                r'Hub.config.set\(\'sku\'.+?\)', response_content, re.S)
            if sku:
                sku_j_str = re.findall(r'\{.+\}', sku[
                                       0].decode(r.encoding), re.S)[0]
                sku_j_str = _parse_json_str(re.findall(
                    r'\{.+\}', sku_j_str, re.S)[0])
                sku = yaml.load(sku_j_str)
                sku_dict = sku['valItemInfo'].get('skuMap') or {}
        else:
            print response_content.decode('GBK').encode('utf-8')
            print 'undefined siteId'
    if promo:
        item_detail = {}
        sku_list = []
        has_promo = False
        if re.findall(r'siteId\=2', response_content):
            # tmall
            init_api = re.findall(
                r'\"initApi\"\s*\:\s*\"(.+?)\"', response_content)[0]
            has_promo = True
            sku_list = re.findall(
                r'\"skuId\"\s*\:\s*\"(\d+)\"', response_content, re.S)
            add_on_params = {'callback': 'onMdskip',
                             'ip': '',
                             'campaignId': '',
                             'key': '',
                             'abt': '',
                             'cat_id': '',
                             'q': '',
                             'u_channel': '',
                             'ref': 'http%3A%2F%2Fs.taobao.com%2Fsearch%3F'
                             }
        elif re.findall(r'siteId\=\d', response_content):
            init_api = re.findall(
                r'\"apiPromoData\"\s*\:\s*\"(.+?)\"', r.content)
            if init_api:
                has_promo = True
                init_api = init_api[0]
                headers.update({
                    'Host': 'ajax.tbcdn.cn',
                    'Referer': 'http://item.taobao.com/item.htm?id=7985997829'
                })
                add_on_params = {
                    'cna': 'cauxCQAgVHwCAQ6WCLwoBlHg',
                    'ref': '',
                    'buyerId': '0',
                    'nick': '',
                    'tg': '',
                    'tg2': '',
                    'tg3': '',
                    'tg4': ''
                }
        if has_promo:
            init_api = init_api + '&%s' % '&'.join(['%s=%s' % (
                k, v) for k, v in add_on_params.items()])
            cookies.update(r.cookies)
            time.sleep(interval)
            r2 = requests.get(init_api, headers=headers, cookies=cookies)
            item_meta_content = re.findall(r'\{.+\}', r2.content, re.S)[0]
            item_meta_content = re.sub(
                r'\t', r'', item_meta_content, flags=re.S)
            item_meta_content = re.sub(
                r'\n', r'', item_meta_content, flags=re.S)
            item_meta_content = re.sub(
                r'\r', r'', item_meta_content, flags=re.S)
            item_meta_content = re.sub(
                r',\s', r',', item_meta_content, flags=re.S)
            item_meta_content = re.sub(
                r',(\w+)\:', r',"\1":', item_meta_content, flags=re.S)
            item_meta_content = re.sub(
                r'{(\w+)\:', r'{"\1":', item_meta_content, flags=re.S)
            item_meta_content = re.sub(
                r'\n(\w+)\:', r'"\1":', item_meta_content, flags=re.S)
            item_detail = json.loads(item_meta_content, encoding=r2.encoding)
            item_detail.update({'sku_list': sku_list})
        if item_detail.get('isSuccess'):
            for sku_key in item_detail['defaultModel']['itemPriceResultDO']['priceInfo']:
                price_info = item_detail['defaultModel']\
                    ['itemPriceResultDO']['priceInfo'][sku_key]
                if price_info.get('promotionList'):
                    promo_data = {
                        'price': price_info['price'],
                        'promo': [dict((k,
                                        v.encode('utf-8') if isinstance(v, unicode) else v)
                        for k, v in promo.items())
                        for promo in price_info['promotionList']]
                    }
                    # promo_list[sku_id] = promo_data
                    promo_list[sku_key] = promo_data
        else:
            if item_detail:
                for k, v in item_detail.items():
                    if not v:
                        continue
                    promo_list[k] = {
                        'price': None,
                        'promo': [dict((kt,
                                        vt.encode('utf-8') if isinstance(vt, unicode) else vt)
                        for kt, vt in promo.items())
                        for promo in v]
                    }
                # promo_list['default'] = promo_list.get('def')
    # find sku title in page content
    # gengerate a {'sku_pair': 'title'} dict obj
    sku_title_map = {}
    for sku_id, sku_val in [(v['skuId'], k) for k, v in sku_dict.items()]:
        sku_pairs = [sku for sku in re.sub(
            r':\s*', r':', sku_val).split(';') if sku]
        for sku_pair in sku_pairs:
            sku_title = re.search(
                r'<li data-value="%s".*?>.+?<span>(.+?)</span>' % sku_pair,
                response_content,
                re.S
            )
            if sku_title:
                sku_title_map[sku_pair] = sku_title.group(1).\
                    decode('GBK').encode('utf-8')
    # apply sku_title_map to sku_dict obj
    for sku_pairs in sku_dict.keys():
        sku_title = re.sub(
            r'\d+:\s*\d+',
            lambda x: sku_title_map.get(x.group(0).replace(' ', ''), ''),
            sku_pairs).strip(';')
        sku_dict[sku_pairs]['title'] = sku_title
    return sku_dict, promo_list
