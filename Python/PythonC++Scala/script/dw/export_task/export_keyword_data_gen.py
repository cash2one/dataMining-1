#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import sys
import traceback
from datetime import datetime, timedelta

import ibbdlib
import ibbdlib.tornadolib

from dateutil.parser import parse as dateparser

keyword = '香港虚拟主机'
keyword_en = 'hongkongvirtualhost'
from_date_str = '2012-12-09'
to_date_str = '2012-12-20'
from_date = dateparser(from_date_str)
to_date = dateparser(to_date_str)
date_range_str = [(from_date + timedelta(i)).strftime('%Y%m%d') for i in range((to_date - from_date).days + 1)]

db_server = {'host': '223.4.155.152', 'user': 'ibbd', 'passwd': 'spider'}
db_conn = ibbdlib.get_db_conn(**db_server)

try:
    trade_source_table_list = []
    for date_str in date_range_str:
        select_query = \
            "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA='topdata' AND TABLE_NAME LIKE %s ORDER BY TABLE_NAME"
        for table_name in db_conn.iter(select_query, 'top_item_trade_his_%s%%' % date_str):
            print table_name.TABLE_NAME
            trade_source_table_list.append(table_name.TABLE_NAME)
    if db_server['host'].find('152') != -1:
        trade_source_table_list.extend(['top_item_trade_his_%d' % (i+1) for i in range(26)])
except Exception, e:
    traceback.print_exc()
db_conn.close()

render_kwargs = {'keyword': keyword, 'target_table': 'keyword_trade_%s' % keyword_en,
                 'trade_source_table_list': trade_source_table_list}

open('export_%s_%s.sql' % (keyword_en, date_range_str[-1]), 'w').write(ibbdlib.tornadolib.render_string(open('export_keyword_template.sql').read(), **render_kwargs))
