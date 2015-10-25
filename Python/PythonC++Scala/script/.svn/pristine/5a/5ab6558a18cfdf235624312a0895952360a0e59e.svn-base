#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time

import requests
from BeautifulSoup import BeautifulSoup

urls = [
    'http://taobao.com/',
    'http://item.taobao.com/item.htm?id=12679721172',
    'http://item.taobao.com/item.htm?id=16832135562',
    'http://detail.tmall.com/item.htm?id=12963620851',
    'http://item.taobao.com/item.htm?id=19715740507',
    'http://bonnylover.taobao.com',
    ]


def test_req():
    t1 = time.time()
    for url in urls * 2:
        r = requests.request('GET', url)
        soup = BeautifulSoup(r.text, fromEncoding=r.encoding)
        s = soup.prettify()
        del r
        del soup
        del s

        # time.sleep(1)

    t2 = time.time()
    print '%fS' % (t2 - t1)


def main():
    for i in range(2):
        test_req()


if __name__ == '__main__':
    main()
