#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.9.18
'''

import json

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(os.getcwd()), 'src'))

from dfhspider.topuserratelist import getUserRateList
from dfhspider.topitem import TopItem
from dfhspider.topbll import saveUserRateList


def main():
    metadata = getUserRateList('49180145', 20)
    for record in metadata:
        print json.dumps(record, ensure_ascii=False, indent=4).decode('utf-8')
        iid = record['aucNumId']
        try:
            item = TopItem('http://item.taobao.com/item.htm?id=%s'
                           % iid).getBasicInfo()
            print json.dumps(item, ensure_ascii=False, indent=4).decode('utf-8')
        except:
            pass
        raw_input('pause')
    pass


if __name__ == '__main__':
    main()
