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

from BeautifulSoup import BeautifulSoup
try:
    from pyquery import PyQuery
except:
    PyQuery = None


def getItemsByKeyword(
    keyword,
    encoding='GBK',
    page=1,
    price=None,
):
    '''淘宝宝贝搜索结果
    Returns:
        [
            itemName,
            itemId,
            itemPic,
            wangwang,
            userNumId,
            price,
            location,
            tradeNum,
            rateNum
        ]
    '''

    def findAllItem(
        s,
        name,
        prop,
        propvalue,
    ):

        lis = []
        tags = re.finditer(r'\<' + name + '\s+' + prop + '\s*\=\s*\".*?'
                           + propvalue + '.*?\"\s*\>', s, re.S)
        cursor = 0
        while 1:
            tag = None
            try:
                tag = tags.next()
            except:
                break
            cursor = tag.start()
            tag = tag.group()
            ter = re.finditer(r'(\<\s*li\s+.+?\>|\<\s*\/\s*li\s*\>)',
                              s[cursor:], re.S)
            startelement = 0
            endelement = 0
            endcursor = cursor
            while 1:
                ele = ter.next()
                if re.match(r'\<\s*li', ele.group()):
                    startelement += 1
                else:
                    endelement += 1
                if startelement == endelement:
                    endcursor = cursor + ele.end()
                    break
            lis.append(s[cursor:endcursor])
            cursor = endcursor
        return lis

    items = []
    domain = \
        'http://s.taobao.com/search?q=$Q$&style=list&bcoffset=1&cd=false&v=auction&sort=sale-desc&s={0}'
    domain = domain.replace('$Q$',
                            repr(keyword.decode(encoding).
                                 encode('GBK')).
                            replace('\\x', '%').upper()[1:-1])
    domain = domain.replace(' ', '%20')

    # init seach URI

    url = domain.format(0)
    r = __import__('requests').get(url)
    s = r.text
    for item in findAllItem(s, 'div', 'class', 'item'):
        if len(re.findall(r'id\=(\d+)', item)) > 0:
            break
    else:
        cat = re.findall(r'\&cat\=\d+', s)
        domain = (domain + cat[0] if len(cat) > 0 else domain)

    # init seach URI end
    # price interval

    if price:
        domain = domain \
            + '&filter=reserve_price%5B{0}%2C{1}%5D'.format(price[0], price[1])

    # price interval end

    for i in range(page):
        url = domain.format(i * 40)
        r = __import__('requests').get(url)
        s = r.content
        encoding = r.encoding
        for (i, item) in enumerate(findAllItem(s, 'div', 'class', 'item')):
            info = {  # 'tradepeople':re.findall(r'\<li\s+class\="sale\"\>.+?(\d+)',item)[0],
                'rank': i,
                'keyword': keyword,
                'itemName': re.findall(r'\<a\s+.*?title\=\"(.+?)\".*?\>',
                                       item),
                'itemId': re.findall(r'id\=(\d+)', item),
                'itemPic': re.findall(r'\<img\s+.*?data\-ks\-lazyload\=\"(.+?)\"', item),
                'wangwang': re.findall(r'\<a\s+href\=\".+?store\.taobao\.com.+?\>(.+?)\<\/a\>', item, re.S),
                'userNumId': re.findall(r'user\_number\_id\=(\d+)', item),
                'price': re.findall(r'\<li\s+class\=\"price\"\s*\>\s*\<em\>\s*(\d+\.*\d*)\s*\<\/em', item, re.S),
                'location': re.findall(r'\<li\s+class\=\"place\"\>\s*(.+?)\<',
                                       item, re.S),
                'tradeNum': re.findall(r'成交'.decode('utf-8') + r'(\d+)',
                                       item.decode(encoding)),
                'rateNum': re.findall(r'(\d+)' + r'条评价'.decode('utf-8'),
                                      item.decode(encoding)),
            }
            for key in ['itemName', 'wangwang', 'location']:
                if len(info[key]) > 0:
                    info[key] = info[key][0].decode(encoding).encode('utf-8')
            for key in [
                'itemId',
                'itemPic',
                'userNumId',
                'price',
                'rateNum',
                'tradeNum',
            ]:
                if len(info[key]) > 0:
                    info[key] = info[key][0]
                else:
                    info[key] = None
            info = dict((k, (v.encode('utf-8') if isinstance(v,
                        unicode) else v)) for (k, v) in info.items())
            if not info['itemId']:
                continue

            # if info['itemPic']:info['itemPic']=info['itemPic'].replace('sum.jpg','b.jpg')

            if not info['itemPic']:
                link = re.findall(r'<img\s+src\s*\=\s*\"(.+?)\"', item, re.S)
                info['itemPic'] = (link[0] if len(link) > 0 else None)
            items.append(info)
    return items


def getItemsByKeyword(
    keyword,
    encoding='GBK',
    page=1,
    price=None,
):
    if not PyQuery:
        return []
    items = []
    domain = \
        'http://s.taobao.com/search?q=$Q$&style=list&bcoffset=1&tab=all&cd=false&v=auction&sort=sale-desc&s={0}'
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
        r = __import__('requests').get(url)
        encoding = r.encoding
        py = PyQuery(r.content.decode(encoding))
        page_num = 0
        for i, meta_item in enumerate(py.items("div[nid]")):
            page_num += 1
            try:
                info = {
                    'rank': i + 1,
                    'keyword': keyword,
                    'itemName': meta_item('h3 a').attr('title').encode('utf-8'),
                    'itemId': meta_item.attr('nid'),
                    'itemPic': meta_item('img').attr('src'),
                    'wangwang': meta_item('.seller a').html().encode('utf-8').strip(),
                    'userNumId': re.findall(r'id\=(\d+)', meta_item('.seller a').attr('href'))[0],
                    'price': re.findall(r'\d+\.\d*', meta_item('.price').html().encode('utf-8'))[0],
                    'location': (meta_item('.loc div').html() or '').encode('utf-8'),
                    'tradeNum': re.findall(r'\d+', meta_item('.dealing div').html() or '0')[-1],
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
        r = __import__('requests').get(url)
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
        r = __import__('requests').get(url)
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
