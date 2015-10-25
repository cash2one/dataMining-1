#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.9.18
'''

import json

import sys
sys.path.insert(0, '../')

from toprate import getRate3, getRate4


def main():
    for iid in [
        # '15336564878',
        # '8264246386',
        # '22831832116',
        '13984677615'
    ]:
        url = 'http://item.taobao.com/item.htm?id=%s' % iid
        DATA = getRate4(url, '2013-09-20', '2013-10-01')

        for (i, t) in enumerate(DATA):
            print i + 1,
            print json.dumps(t, indent=4, ensure_ascii=False)  # .decode('utf-8')

            # raw_input('pause')

    pass


if __name__ == '__main__':
    main()
