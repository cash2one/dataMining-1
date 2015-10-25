#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import re
import requests

import ibbdlib

site = 'http://www.taobao.com/'

req = requests.get(site)
site_encoding = req.encoding
site_content = req.text.encode('utf-8')
meta_category_items = re.findall(r'<div\s+class\="category-item\s+.+?">.+?</div>', site_content, re.S)
category_items = []
for category_item in meta_category_items:
    cat = re.findall(r'<img.+?alt\=\"(.+?)\"', category_item, re.S)[0]
    industrys = re.findall(r'<h5>\s*<a.+?>(.+?)<', category_item, re.S)
    category_items.extend([[cat, t] for t in industrys])

db_conn = ibbdlib.get_db_conn(**{'host': '223.4.155.152', 'user': 'ibbd', 'passwd': 'spider'})
try:
    db_conn.executemany("INSERT IGNORE INTO ibbd2.lib_industry_3 values(%s, %s)", category_items)
except Exception, e:
    print e
finally:
    db_conn.close()