#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import traceback
import json
from collections import Counter

import ibbdlib

db_conn = ibbdlib.get_db_conn(host='223.4.155.152', user='ibbd', passwd='spider')
# remote_db_conn = ibbdlib.get_db_conn(host='223.4.155.172', user='ibbd', passwd='spider')

def magic():
    query = """SELECT T1.user, T1.keyword, T2.cat, T2.industry
    FROM ibbd2.user_keywords T1
    LEFT JOIN ibbd2.lib_cat_industry_keyword_2 T2
    ON T1.keyword = T2.keyword
    WHERE T1.status='1'
    AND T1.industry=''
    AND T2.keyword IS NOT NULL"""
    user_industry = dict()
    for row in db_conn.iter(query):
        user = row.user.encode('utf-8')
        industry = '{0}-{1}'.format(row.cat.encode('utf-8'), row.industry.encode('utf-8'))
        if user_industry.get(user):
            user_industry[user].append(industry)
        else:
            user_industry[user] = [industry]
    for user in user_industry.keys():
        c = Counter()
        for enum_industry in user_industry[user]:
            c[enum_industry] += 1
        print user, c.most_common(1)[0][0]
        db_conn.execute("UPDATE ibbd2.user_keywords SET industry=%s, population_tsmp=population_tsmp WHERE user=%s", c.most_common(1)[0][0], user)
try:
    magic()
except:
    traceback.print_exc()
db_conn.close()
# remote_db_conn.close()
