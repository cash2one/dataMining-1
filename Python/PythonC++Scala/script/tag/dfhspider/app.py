#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
@auther     Cooper
@date       2012.6.19
'''

import traceback
import re
from topitem import TopItem
from lib import *
import topitemaddon

import requests
try:
    from pyquery import PyQuery
except:
    PyQuery = None


def getItemsByKeyword(
    keyword,
    encoding='utf-8',
    page=1,
    price=None,
    sort='sale-desc'
):
    """
    @params sort: renqi-desc/sale-desc/credit-desc/old_starts/price-asc/price-desc
    """
    if not PyQuery:
        return []
    items = []
    params = {
        'q': '$Q$',
        'style': 'grid',
        # 'bcoffset': 1,
        'tab': 'all',
        # 'cd': 'false',
        # 'v': 'auction',
        'sort': sort,
        's': '{0}',
        # 'p4poffset': '4',
        # 'bcoffset': '-4',
        'btab': 0
    }
    domain = 'http://s.taobao.com/search?' + \
        '&'.join(['%s=%s' % (k, v) for k, v in params.items()])
    domain = domain.replace('$Q$',
                            repr(keyword.decode(encoding).
                                 encode('GBK')).
                            replace('\\x', '%').upper()[1:-1])
    domain = domain.replace(' ', '%20')

    # price interval

    if price:
        domain = domain \
            + '&filter=reserve_price%5B{0}%2C{1}%5D'.format(price[0], price[1])

    # price interval end

    for i in range(page):
        url = domain.format(i * 40)
        r = requests.get(url, timeout=5, allow_redirects=True)
        # encoding = r.encoding
        content = eval(repr(r.content).replace('\\x86"', '"').replace('\\x90"', '"'))
        py = PyQuery(content.decode(r.encoding))
        page_num = 0
        for j, meta_item in enumerate(py.items("div[nid]")):
            page_num += 1
            try:
                info = {
                    'rank': i * 40 + j + 1,
                    'keyword': keyword.decode(encoding).encode('utf-8'),
                    'itemName': meta_item('h3 a').attr('title').encode('utf-8'),
                    'itemId': meta_item.attr('nid').encode('utf-8'),
                    'itemPic': meta_item('img').attr('src').encode('utf-8'),
                    'wangwang': meta_item('.seller a').html().encode('utf-8').strip(),
                    'userNumId': re.findall(r'id\=(\d+)', meta_item('.seller a').attr('href'))[0].encode('utf-8'),
                    'price': re.findall(r'\d+\.\d*', meta_item('.price').html().encode('utf-8'))[0],
                    'location': (meta_item('.loc div').html() or '').encode('utf-8'),
                    'tradeNum': re.findall(r'\d+', meta_item('.dealing div').html() or '0')[-1].encode('utf-8'),
                    'rateNum': re.findall(r'\d+', (meta_item('.count a').html() or '0').encode('utf-8'))[0],
                }
                items.append(info)
            except:
                traceback.print_exc()
                # continue
        # if page_num < 40:
            # break
    return items


def getShopsByKeyword(keyword, encoding='GBK', page=1):
    '''
    param page 页数，每页15个店铺
    return [[shopName,userId],]
    shopLink format: http://store.taobao.com/shop/view_shop.htm?user_number_id=$$
    return encoding:utf-8
    '''

    shops = []
    domain = \
        'http://s.taobao.com/search?q=$Q$&commend=all&sort=sale-desc&v=shop&s=$PAGE$'
    for i in range(page):
        url = domain.replace(
            '$Q$',
            repr(keyword.decode(encoding).
                 encode('GBK')).
            replace('\\x', '%').upper()[1:-1]).\
            replace('$PAGE$', str(i * 15))
        r = requests.get(url, timeout=5)
        s = r.content
        for shop in re.findall(r'\<li\s+class\=\"shop\-list\"\>.+?\<\/li\>', s,
                               re.S):
            shopInfo = \
                re.findall(
                    r'\<span\s+class\=\"shop\-name\"\>\s*\<a\s+href\=\"(.+?)\".+?\>(.+?)\<\/a\>\<\/span\>', shop, re.S)[0]
            shops.append([shopInfo[1].decode(r.encoding).encode('utf-8'),
                         re.findall(r'id\=(\d+)', shopInfo[0])[0]])
    return shops


def getShopsByBrand(brand, encoding='GBK'):
    metadata = []
    domain = \
        'http://s.taobao.com/search?q=$Q$&v=shopsearch&sort=sale-desc&fs=1&s=$PAGE$'
    domain = domain.replace(
        '$Q$',
        repr(brand.decode(encoding).
             encode('GBK')).
        replace('\\x', '%').upper()[1:-1])
    page = 1
    while 1:
        url = domain.replace('$PAGE$', str((page - 1) * 20))
        r = requests.get(url, timeout=5)
        s = r.content
        encoding = r.encoding
        for shop in \
                re.findall(r'\<li\s+class\=\"list\-item\"\>\s*\<ul\>(.+?)\<\/ul\>\s*\<\/li\>', s, re.S):
            info = {
                'shopName': re.findall(r'\<img\s+.+?\s+title\=\"(.+?)\".+?\>',
                                       shop,
                                       re.S)[0].
                decode(encoding).encode('utf-8'),
                'mainCat': re.findall(r'\<em\>(.+?)\<\/em\>',
                                      re.findall(
                                          r'\<p\s+class\=\"main\-cat\"\>(.+?)\<\/p\>', shop)[0], re.S),
                'itemCount': re.findall(r'\<p\s+class\=\"auction\-count\"\>.+?(\d+).+?\<\/p\>', shop, re.S),
                'tradeNum': re.findall(r'\<p\s+class\=\"buy\-count\"\>.+?\<b\>\s*(\d+)\s*\<\/b\>', shop, re.S),
                'place': re.findall(r'\<li\s+class\=\"list\-place\"\>\s*\<span\>(.+?)\s*\<\/span\>\s*\<\/li\>', shop, re.S),
            }
            if len(info['mainCat']) > 0:
                for (i, cat) in enumerate(info['mainCat']):
                    for t in re.findall(r'\<.+?\>', cat, re.S):
                        info['mainCat'][i] = info['mainCat'][i].replace(t, '')
                info['mainCat'] = ','.join(info['mainCat'
                                                ]).decode(encoding).encode('utf-8')
            for key in ['place', 'itemCount', 'tradeNum']:
                if len(info[key]) > 0:
                    info[key] = info[key][0].decode(encoding).encode('utf-8')
            metadata.append(info)
        if len(re.findall(r'\<a\s+class\=\"page\-next\".+?\>', s, re.S)) > 0:
            page += 1
        else:
            break
    return metadata


def getItemTitleSearcResulth(itemId=None, title=None, encoding='utf-8'):
    """fetch item by title, return a dict{
        itemName
        itemId
        itemPic
        wangwang
        userNumId
        price
        location
        tradeNum
        rateNum
    }
    """

    if itemId:
        try:
            title = TopItem('http://item.taobao.com/item.htm?id=%s'
                            % itemId).getBasicInfo().get('itemTitle')
        except:
            pass
    if title:
        result = getItemsByKeyword(title, encoding, 1)
        result = (result[0] if len(result) > 0 else {})
        return result
    else:
        return {}


def getItemRateLastUpdateTime(item_id):
    db = getDBConn('topspider')
    cmdStr = \
        """SELECT MAX(date) FROM topspider.top_item_rate WHERE auc_num_id='%s'"""
    db.query(cmdStr)
    r = db.store_result()
    updateDate = r.fetch_row()[0][0]
    updateDate = (updateDate.strftime('%Y-%m-%d %H:%M:%S'
                                      ) if updateDate else None)
    db.close()
    return updateDate


def get_item_ori_price(item_id, interval=0.5):
    """抓取商品的原始价格列表

    Returns:
        [
            {
                sku_key: '',
                sku_id: '',
                price: 0
            }
        ]
    """
    sku = topitemaddon.get_item_sku(item_id, interval=interval)
    return [{
            'sku_key': k,
            'sku_id': v.get('skuId'),
            'price': float(v.get('price'))
            } for k, v in sku.items() if v.get('price')]


def get_item_promo_price(item_id):
    """抓取商品的促销价格列表

    Returns:
        [
            {
                sku_key: '',
                sku_id: '',
                ori_price: 0,
                promo_type: '',
                promo_price: 0
            }
        ]
    """
    sku = topitemaddon.get_item_promo(item_id)
    price_list = []
    for promo_pair in [[{
                        'sku_key': k,
                        'sku_id': '',
                        'ori_price': float(v.get('price') or 0),
                        'promo_type': promo.get('type'),
                        'promo_price': float(promo.get('price'))
                        } for promo in v['promo']
                        if promo.get('price')]
                       for k, v in sku.items()
                       if k not in ['def', 'default']]:
                    price_list.extend(promo_pair)
    return price_list
