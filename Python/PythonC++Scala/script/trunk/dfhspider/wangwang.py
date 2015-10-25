# -*- coding: utf-8 -*-

from urllib import quote
import requests


def is_ww_online(nick, encoding='utf-8'):
    """check if wangwang is online

    @param nick: nick
    @param encoding: nick encoding
    @return: True/False
    """

    base_url = 'http://amos.im.alisoft.com/online.aw?v=2&uid=%s&site=cntaobao&s=2&charset=utf-8'
    res = requests.get(
        base_url % quote(nick.decode(encoding).encode('utf-8')),
        timeout=5
    )
    # 1994 online
    # 604 offline
    res_len = len(res.content)
    if res_len > 1000:
        return True
    else:
        return False
