#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import requests
import time

iids = ['14085630111', '19870996961', '15453249843', '16940335659',
        '15796982509']

urls = ['http://item.taobao.com/item.htm?id=%s' % iid for iid in iids] * 5


def main():

    # no keep-alive

    print 'no keep-alive'
    print 'start', time.asctime()
    for url in urls:
        s = requests.get(url).text
    print 'end', time.asctime()

    # keep-alive

    session = requests.session()
    session.config['prefetch'] = True
    print 'using keep-alive'
    print 'start', time.asctime()
    for url in urls:
        s = session.get(url).content
    print 'end', time.asctime()


if __name__ == '__main__':
    main()
