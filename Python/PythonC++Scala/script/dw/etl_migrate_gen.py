#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth    Cooper
date    2012-12-28
desc
    generate migrate sh script like etl_export_20121231.sh and etl_import_20121231.sh
"""

import sys
from datetime import datetime, timedelta

import ibbdlib
import ibbdlib.tornadolib

from dateutil.parser import parse

etl_date = '2013-01-05'
db_server = {
    '223.4.155.172': {
        'host': 'localhost',
        'user': 'ibbd_etl',
        'passwd': 'ibbd_etl_secure',
        'db': 'topspider'
    },
    '223.4.155.152': {
        'host': '223.4.155.152',
        'user': 'ibbd_site',
        'passwd': 'ibbd_site_152',
        'db': 'ibbd2'
    }
}

arg_date_str = '20130416'
if len(sys.argv) >= 2:
    arg_date_str = sys.argv[1]
arg_date = parse(arg_date_str)
etl_date = arg_date.strftime('%Y-%m-%d')

short_date = etl_date.replace('-', '')
# old_file_tsmp = (parse(etl_date) - timedelta(1)).strftime('%Y%m%d')

export_tables = [
    'top_item1', 'top_item2', 'top_item3', 'top_item4', 'top_shop1', 'top_shop2', 'top_cat_search_result',
    'top_cat_items', 'quota_shop_credit', 'ststc_cat_site_dealprice', 'ststc_cat_shop_sales_detail',
    'ststc_cat_dealprice', 'ststc_shop_sales_keyword', 'ststc_keyword_shop_pct', 'quota_pct_keyword',
    'top_item_tradingtime', 'ststc_cat_range_hotshops', 'ststc_keyword_reporter', 'ststc_shop_apriori',
    'ststc_item_rate1', 'ststc_top_item_price_num']
template = open('etl_export_template.sh').read()
with open('etl_script/etl_export_%s.sh' % short_date, 'w') as f:
    f.write(ibbdlib.tornadolib.render_string(template,
                                             tables=export_tables,
                                             user=db_server[
                                                 '223.4.155.172']['user'],
                                             passwd=db_server[
                                                 '223.4.155.172']['passwd'],
                                             etl_date=etl_date,
                                             short_date=short_date))

template = open('etl_import_template.sh').read()
with open('etl_script/etl_import_%s.sh' % short_date, 'w') as f:
    f.write(ibbdlib.tornadolib.render_string(template,
                                             etl_date=etl_date,
                                             short_date=short_date,
                                             user=db_server[
                                                 '223.4.155.152']['user'],
                                             passwd=db_server['223.4.155.152']['passwd']))
