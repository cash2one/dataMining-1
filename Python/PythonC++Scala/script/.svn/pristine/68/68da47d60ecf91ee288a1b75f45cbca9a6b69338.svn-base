#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
@auth   Cooper
@date   2013.4.26
@desc   get item relation data
@see    http://favorite.taobao.com/collect_item_relation---13916401754-1-.htm
"""

import os
import re
import json
import time
import urllib

import requests
try:
    from pyquery import PyQuery
except:
    PyQuery = None
import yaml

def get_setting(key):
    return yaml.load(open(os.path.dirname(__file__) + '/setting.yaml')).get(key)


def _utf8(pre):
    return pre.encode('utf-8') if isinstance(pre, (unicode, str)) else pre


def get_item_relation(item_id,
                      same_cat=True,
                      other_cat=True,
                      cat_fav_item=True,
                      fav_shop=True,
                      interval=0.5):
    data = {
        'fav_num': 0,
        'img': None,
        'price': None,
        'title': None,
        'nick': None,
        'user_num_id': None,
        'location': None,
        'same_cat': [],
        'other_cat': [],
        'cat_fav_item': [],
        'fav_shop': []
    }
    url = 'http://favorite.taobao.com/collect_item_relation---%s-1-.htm' % item_id
    time.sleep(interval)
    content = requests.get(url,
                           timeout=10,
                           headers=get_setting('headers'),
                           cookies=get_setting('cookies')).content.decode('GBK')
    jq_obj = PyQuery(content)
    # fav_num
    data['fav_num'] = jq_obj.find('.add-fav-msg span strong').text()
    data['img'] = jq_obj.find('.add-fav-item img').attr('src')
    data['price'] = jq_obj.find('.add-fav-item .price').text()
    data['title'] = jq_obj.find('.add-fav-item li')[
        2].find('a').text.encode('utf-8')
    data['nick'] = jq_obj.find('.add-fav-item li')[
        3].find('a').text.encode('utf-8')
    data['user_num_id'] = re.search(
        r'user_number_id=(\d+)',
        jq_obj.find('.add-fav-item li')[3].find('a').attrib['href']).group(1)
    data['location'] = jq_obj.find('#location_main').text().encode('utf-8')
    fav_host = 'http://tui.taobao.com/api/item'
    params = {
        'p': 'i',
        'csk': 'atlantis',
        'from': ('favorite_samecat', 'favorite_nearcat'),
        'pid': item_id,
        'count': 8,
        'f': 'json',
        'jsonp': ('fav_same_cat', 'fav_near_cat')
    }
    if cat_fav_item:
        items = [PyQuery(item) for item in jq_obj.find('#mcs-list ul li')]
        imgs = [item.find('img').attr('src') for item in items]
        prices = [_utf8(item.find('.price').text()) for item in items]
        titles = [_utf8(item.find('.description a').text()) for item in items]
        iids = [re.search(r'&id=(\d+)', item.find(
            'a').attr('href')).group(1) for item in items]
        data['cat_fav_item'] = [{
                                'img': imgs[i],
                                'price': prices[i],
                                'title': titles[i],
                                'iid': iid
                                }
                                for i, iid in enumerate(iids)]
    if fav_shop:
        shops = [PyQuery(item) for item in jq_obj.find(
            '#mcc-related-shop ul li')]
        nicks = [_utf8(shop.find('.master a').text()) for shop in shops]
        uids = [re.search(r'user_number_id=(\d+)', shop.find(
            'a').attr('href')).group(1) for shop in shops]
        credits = [re.search(r'(\d+)', shop.find(
            '.rate').text()) for shop in shops]
        credits = [credit.group(1) if credit else '' for credit in credits]
        data['fav_shop'] = [{
                            'nick': nicks[i],
                            'uid': uid,
                            'credit': credits[i] or 0
                            } for i, uid in enumerate(uids)]
    if same_cat:
        url = fav_host + '?' + '&'.join(['%s=%s' % (k, v[0] if isinstance(v, tuple) else v)
                                         for k, v in params.items()])
        time.sleep(interval)
        content = requests.get(url,
                               timeout=10,
                               headers=get_setting('headers'),
                               cookies=get_setting('cookies')).json()
        data['same_cat'] = [dict((k, _utf8(
            v)) for k, v in li.items()) for li in content['list']]
    if other_cat:
        url = fav_host + '?' + '&'.join(['%s=%s' % (k, v[1] if isinstance(v, tuple) else v)
                                         for k, v in params.items()])
        time.sleep(interval)
        content = requests.get(url,
                               timeout=10,
                               headers=get_setting('headers'),
                               cookies=get_setting('cookies')).json()
        data['other_cat'] = [dict((k, _utf8(
            v)) for k, v in li.items()) for li in content['list']]
    return data


"""
example data
{
    "nick": "爱丽缇旗舰店",
    "location": "广东广州",
    "img": "http://img02.taobaocdn.com/bao/uploaded/i2/11584020942211200/T1X_4IXpdhXXXXXXXX_!!0-item_pic.jpg_b.jpg",
    "title": "爱丽缇 品质女装2013春夏装新款蕾丝雪纺连衣裙 韩版打底裙子 夏",
    "price": "198.00",
    "fav_num": "330475",
    "cat_fav_item": [
        {
            "iid": "14796646238",
            "price": "198.0",
            "img": "http://img.taobaocdn.com/bao/uploaded/http://img03.taobaocdn.com/bao/uploaded/i3/11584021057317585/T1g2hZXxVaXXXXXXXX_!!0-item_pic.jpg_sum.jpg",
            "title": "爱丽缇 女装2013韩版修身显瘦欧根纱娃娃领雪纺蕾丝连衣裙夏女"
        },
    ],
    "fav_shop": [
        {
            "nick": "尚都比拉服饰旗舰店",
            "uid": "712310323",
            "credit": ""
        },
    ],
    "other_cat": [
        {
            "scm": "1007.68.0.0",
            "commentTimes": 0,
            "isSameShop": false,
            "name": "任三件包邮 2012秋长袖T恤 女款潮爆纯棉泡泡袖长袖打底衫",
            "collectPopularity": 0,
            "discount": 0,
            "spuId": 0,
            "collectTimes": 207,
            "price": 22,
            "isCusGuar": false,
            "pic": "http://img02.taobaocdn.com/bao/uploaded/i2/T1w3_MXjdfXXaKeijb_124356.jpg",
            "id": 16103301848,
            "credit": 0,
            "promotionPrice": 0,
            "url": "http://ju.mmstat.com/?url=http://item.taobao.com/item.htm?scm=1007.68.0.0&id=16103301848&pvid=08e2306f-246e-4872-9c8e-8a86c9456327&ad_id=&am_id=&cm_id=&pm_id=1501045091eb4b020ccb",
            "monthSellCount": 20,
            "sellCount": 612,
            "ownerId": 0,
            "type": 0,
            "categoryId": 50000671
        },
    ],
    "same_cat": [
        {
            "scm": "1007.62.0.0",
            "commentTimes": 20726,
            "isSameShop": false,
            "name": "2013春款连衣裙春夏装新款雪纺裙女装打底裙雪纺五分袖百搭连衣裙",
            "collectPopularity": 0,
            "discount": 0,
            "spuId": 216249823,
            "collectTimes": 114018,
            "price": 138,
            "isCusGuar": false,
            "pic": "http://img04.taobaocdn.com/bao/uploaded/i4/12276022110145494/T1FWtTXDJaXXXXXXXX_!!0-item_pic.jpg",
            "id": 17523874622,
            "credit": 0,
            "promotionPrice": 138,
            "url": "http://ju.mmstat.com/?url=http://item.taobao.com/item.htm?scm=1007.62.0.0&id=17523874622&pvid=a8c82693-74a3-45b1-bdf2-d9756f8b3408&ad_id=&am_id=&cm_id=&pm_id=15010452468a7be2d004",
            "monthSellCount": 0,
            "sellCount": 54585,
            "ownerId": 735902276,
            "type": 0,
            "categoryId": 50010850
        },
    ]
}
"""
