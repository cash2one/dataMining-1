#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.6.7
'''

import re
import time
from lib import *
from topbll import saveTopItemsLink


def getItemsLink(url):
    metadata = dict()
    ids = []
    url = url + '?search=y&viewType=grid&orderType=hotsell'
    siteId = None
    while 1:
        r = request(url, requiredPropertyRegx=r'shopId\=(\d+)')
        s = r.content
        if not siteId:
            siteId = re.findall(r'siteId\=(\d)', s)[0]
            metadata['siteId'] = siteId
            metadata['shopId'] = re.findall(r'shopId\=(\d+)', s)[0]
            metadata['userId'] = re.findall(r'userid\=(\d+)', s)[0]
        ul = re.findall(r'\<ul\s+class\=\"shop\-list\"\>.+?\<\/ul\>', s,
                        re.S)[0]
        for li in re.findall(r'\<li\>.+?\<\/li\>', ul, re.S):
            ids.append(re.findall(r'id\=(\d+)', li)[0])
        hasNext = \
            re.findall(r'\<a\s+class\=\"J\_SearchAsync\s+next\"\s+href\=\"(\S+?)\".?\>'
                       , s)
        if len(hasNext) > 0:
            url = hasNext[0]
        else:
            break
    metadata['ids'] = ids
    return metadata
