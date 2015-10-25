#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""获取rate.taobao.com/rate.htm?user_id=****页面的数据
"""

import re
import json
from dfhspider.lib import request

ratepage = None
ratepageencoding = None


def _prepar(user_id):

    #

    r = request('http://rate.taobao.com/rate.htm?user_id=%s' % str(user_id))
    global ratepage
    ratepage = r.text
    global ratepageencoding
    ratepageencoding = r.encoding


def getSellerInfo(user_id):
    _prepar(user_id)
    info = {'industry': None, 'wangwang': None}

    # industry

    industry = re.findall(r'当前主营：'.decode('utf-8', 'ignore'
                          ).encode(ratepageencoding) + r'\s*\<a\s+.+?\>(.+?)\<'
                          , ratepage, re.S)
    industry = (industry[0].encode('utf-8') if len(industry) > 0 else None)


    # wangwang

def test():
    info = getSellerInfo('389647123')
    print json.dumps(info, ensure_ascii=False, indent=4)


def main():
    pass
