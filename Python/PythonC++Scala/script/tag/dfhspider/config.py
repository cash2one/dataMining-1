#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.6.7
'''

spider_header = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31',
    'DNT': '1',
    'Cache-Control': 'max-age=0',
    'Accept-Language': 'zh-CN,zh;q=0.8',
    'Accept-Encoding': 'gzip,deflate,sdch',
    'Accept-Charset': 'GBK,utf-8;q=0.7,*;q=0.3',
    'Connection': 'keep-alive'
}

cookies = {
    'cna': 'cauxCQAgVHwCAQ6WCLwoBlHg',
    'lzstat_uv': '15612795852278529133|2674749',
    'ck1': 'UoM%2BEhYHmiYtVgs%3D',
    '_tb_token_': 'eee4b7315dfed',
    'tracknick': 'gsavl',
    'cookie2': 'ae840d28ce122d79a71e20733440effd',
    't': '267839bd4a447c17ad64245e5cb4ee2f',
    'sec': 'Malldetail|14.150.9.162|1364211315|ff3087c9f27e252275a24c845e942e0d',
    'cq': 'ccp%3D1',
    'mpp': 't%3D0%26m%3D%26h%3D0%26l%3D0'
}

mysql_db_config = {
    'host': '223.4.155.152',
    'user': 'ibbd',
    'passwd': 'spider',
    'charset': 'utf8',
}
redis_config = {'host': '223.4.155.152'}

mysql_ip_config = {
    'lastest_ip': {
        'host': '223.4.155.152',
        'user': 'ibbd',
        'passwd': 'spider',
        'charset': 'utf8',
    },
    '152': {
        'host': '223.4.155.152',
        'user': 'ibbd',
        'passwd': 'spider',
        'charset': 'utf8',
    },
    '172': {
        'host': '223.4.155.172',
        'user': 'ibbd',
        'passwd': 'spider',
        'charset': 'utf8',
    }
}
