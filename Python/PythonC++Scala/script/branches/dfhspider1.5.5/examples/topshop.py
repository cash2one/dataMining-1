#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import json

import sys
sys.path.insert(0, '../')

import time

from topshop import TopShop
from topbll import saveTopShopData


def main():
    urls = [
        # 'http://djzone.taobao.com',
        # 'http://glorylife.taobao.com/',
        # 'http://sffs.tmall.com/',
        # 'http://yazhou.tmall.com/shop/view_shop.htm?frm=yiyao',
        # 'http://nansin.tmall.com/'
        # 'http://store.taobao.com/shop/view_shop.htm?user_number_id=1597546113',
        # 'http://store.taobao.com/shop/view_shop.htm?user_number_id=397259828',
        'http://sanke.taobao.com'
    ]
    for url in urls:
        t = TopShop(url)
        d = t.getFullInfo()
        # d = t.getBasicInfo()
        try:
            print json.dumps(d, ensure_ascii=False, indent=4)  # .decode('utf-8')
            print ''
        except:
            for (k, v) in d.items():
                print k, \
                    (v or '').decode(
                        'utf-8',
                        'ignore').encode('GBK', 'ignore')

        # saveTopShopData(d)

        del t
    pass


if __name__ == '__main__':
    main()
