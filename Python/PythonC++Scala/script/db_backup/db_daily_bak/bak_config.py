#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

bak_path_prefix = '/data/mysql_bak'

db_server = {'223.4.155.172': {'host': '223.4.155.172', 'user': 'ibbd', 'passwd': 'spider'},
             '223.4.155.152': {'host': '223.4.155.152', 'user': 'ibbd', 'passwd': 'spider'}}

template_path = 'mysql_backup_template.sh'

bak_tables = {'ibbd2': [
    'user2',
    'user_keywords',
    'user_privileges',
    'user_item_monitor',
    'user_keywords_ztc',
    'user_privileges_2',
    'user_shop_monitor',
    'top_item1',
    'top_item2',
    'top_shop1',
    'top_cat_items',
    'top_cat_search_result',
    'top_item_tradingtime',
    'top_tiny_shop',
    'top_ztc_sum',
    'history_topuser_rfmconfig',
    'lib_cat_industry_keyword_2',
    'lib_datelist',
    'lib_industry_2',
    'lib_industry_3',
    'lib_numlist',
    'lib_province_map',
    'lib_rate_library',
    'quota_pct_keyword',
    'quota_sale_index',
    'quota_shop_credit',
    'quota_tradingtime_aly',
    'ststc_cat_dealprice',
    'ststc_cat_range_hotshops',
    'ststc_cat_shop_sales_detail',
    'ststc_cat_site_dealprice',
    'ststc_keyword_reporter',
    'ststc_keyword_shop_pct',
    'ststc_price_keyword',
    'ststc_shop_apriori',
    'ststc_shop_credit',
    'ststc_shop_recommend_items',
    'ststc_shop_sale_in',
    'ststc_shop_sales_keyword',
    'ststc_ztc_shops',
    ], 'topdata': [], 'topspider': []}

tb_bak_type = {
    'ibbd2.user2': 'full',
    'ibbd2.user_keywords': 'full',
    'user_privileges': 'full',
    'user_item_monitor': 'full',
    'user_keywords_ztc': 'full',
    'user_privileges_2': 'full',
    'user_shop_monitor': 'full',
    'lib_cat_industry_keyword_2': 'full',
    'lib_industry_3': 'full',
    'lib_province_map': 'full',
    }