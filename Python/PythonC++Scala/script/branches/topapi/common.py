#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time
import hashlib

from tornado.options import define, options
import requests

define("app", default={
    'app_key': '12543465',
    'app_secret': 'dd547d6090fd8973346d41f704a173db',
    'sign_method': 'md5',
    'v': '2.0',
    'format': 'json'
})


def top_api_url(params):
    timestamp = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
    params['timestamp'] = timestamp
    domain = 'http://gw.api.taobao.com/router/rest'
    params.update(dict((k, v) for k, v in options.app.items() if k != 'app_secret'))
    s = [key + str(params[key]) for key in params]
    s.sort()
    s = options.app['app_secret'] + ''.join(s) + options.app['app_secret']
    sign = hashlib.md5(s).hexdigest().upper()
    url = domain + '?sign=' + sign
    for para in params:
        url = url + '&%s=%s' % (para, params[para])
    return url


def top_api_get(url):
    pass
