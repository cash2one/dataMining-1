#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

# Cooper
# 2012.12.11

# 同步备份表
# 表名支持用正则

sync_tables = {'db': 'ibbd2', 'tables': [
    'user2',
    'user_item_monitor',
    'user_keywords',
    'user_keywords_ztc',
    'user_privileges',
    'user_shop_monitor',
    'history_topuser_rfmconfig',
    ]}

# 异步备份表
# 备份频率：每天(预估)
# 启动方式：手动

async_tables = {'db': 'ibbd2', 'tables': [
    'top_cat_items',
    'top_item1',
    'top_item2',
    'top_item_tradingtime',
    'top_itemsearchresult',
    'top_shop1',
    'top_ztc_sum',
    'ststc_ztc_shops',
    'ststc_shop_sales_keyword',
    'ststc_shop_sale_in',
    'ststc_shop_pct_nokeyword',
    'ststc_shop_credit',
    'ststc_keyword_shop_pct',
    'ststc_keyword_reporter',
    'ststc_cat_shop_sales_detail',
    'ststc_cat_range_hotshops',
    'ststc_cat_dealprice',
    'quota_pct_keyword',
    'quota_tradingtime_aly',
    'quota_sale_index',
    'quota_shop_credit',
    ]}
