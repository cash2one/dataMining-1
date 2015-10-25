#!/bin/sh
echo $(date) dump table backuphost in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 backuphost --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/backuphost.sql
echo $(date) dump table backupstatus in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 backupstatus --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/backupstatus.sql
echo $(date) dump table backuptables in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 backuptables --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/backuptables.sql
echo $(date) dump table history_topuser_rfmconfig in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 history_topuser_rfmconfig --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/history_topuser_rfmconfig.sql
echo $(date) dump table lib_cat_id in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_cat_id --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_cat_id.sql
echo $(date) dump table lib_cat_industry_keyword in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_cat_industry_keyword --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_cat_industry_keyword.sql
echo $(date) dump table lib_cat_industry_keyword_2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_cat_industry_keyword_2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_cat_industry_keyword_2.sql
echo $(date) dump table lib_datelist in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_datelist --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_datelist.sql
echo $(date) dump table lib_industry in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_industry --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_industry.sql
echo $(date) dump table lib_industry_2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_industry_2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_industry_2.sql
echo $(date) dump table lib_industry_3 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_industry_3 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_industry_3.sql
echo $(date) dump table lib_numlist in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_numlist --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_numlist.sql
echo $(date) dump table lib_province_map in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_province_map --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_province_map.sql
echo $(date) dump table lib_rate_library in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 lib_rate_library --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/lib_rate_library.sql
echo $(date) dump table quota_compete_index in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 quota_compete_index --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/quota_compete_index.sql
echo $(date) dump table quota_pct_keyword in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 quota_pct_keyword --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/quota_pct_keyword.sql
echo $(date) dump table quota_rate_evaluate in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 quota_rate_evaluate --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/quota_rate_evaluate.sql
echo $(date) dump table quota_ratescore_table in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 quota_ratescore_table --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/quota_ratescore_table.sql
echo $(date) dump table quota_sale_index in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 quota_sale_index --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/quota_sale_index.sql
echo $(date) dump table quota_shop_credit in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 quota_shop_credit --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/quota_shop_credit.sql
echo $(date) dump table quota_tradingtime_aly in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 quota_tradingtime_aly --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/quota_tradingtime_aly.sql
echo $(date) dump table schedule_shop_monitor in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 schedule_shop_monitor --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/schedule_shop_monitor.sql
echo $(date) dump table ststc_cat_dealprice in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_cat_dealprice --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_cat_dealprice.sql
echo $(date) dump table ststc_cat_range_hotshops in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_cat_range_hotshops --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_cat_range_hotshops.sql
echo $(date) dump table ststc_cat_shop_sales_detail in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_cat_shop_sales_detail --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_cat_shop_sales_detail.sql
echo $(date) dump table ststc_cat_site_dealprice in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_cat_site_dealprice --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_cat_site_dealprice.sql
echo $(date) dump table ststc_item_rate1 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_item_rate1 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_item_rate1.sql
echo $(date) dump table ststc_keyword_hot_items in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_hot_items --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_hot_items.sql
echo $(date) dump table ststc_keyword_reporter in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_reporter --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_reporter.sql
echo $(date) dump table ststc_keyword_shop_pct in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct.sql
echo $(date) dump table ststc_keyword_shop_pct_1 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_1 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_1.sql
echo $(date) dump table ststc_keyword_shop_pct_10 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_10 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_10.sql
echo $(date) dump table ststc_keyword_shop_pct_11 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_11 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_11.sql
echo $(date) dump table ststc_keyword_shop_pct_12 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_12 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_12.sql
echo $(date) dump table ststc_keyword_shop_pct_13 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_13 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_13.sql
echo $(date) dump table ststc_keyword_shop_pct_14 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_14 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_14.sql
echo $(date) dump table ststc_keyword_shop_pct_15 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_15 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_15.sql
echo $(date) dump table ststc_keyword_shop_pct_2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_2.sql
echo $(date) dump table ststc_keyword_shop_pct_6 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_6 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_6.sql
echo $(date) dump table ststc_keyword_shop_pct_7 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_7 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_7.sql
echo $(date) dump table ststc_keyword_shop_pct_8 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_8 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_8.sql
echo $(date) dump table ststc_keyword_shop_pct_9 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_keyword_shop_pct_9 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_keyword_shop_pct_9.sql
echo $(date) dump table ststc_price_keyword in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_price_keyword --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_price_keyword.sql
echo $(date) dump table ststc_shop_apriori in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_apriori --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_apriori.sql
echo $(date) dump table ststc_shop_credit in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_credit --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_credit.sql
echo $(date) dump table ststc_shop_monitor_reporter in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_monitor_reporter --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_monitor_reporter.sql
echo $(date) dump table ststc_shop_multi_buyer in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_multi_buyer --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_multi_buyer.sql
echo $(date) dump table ststc_shop_overview in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_overview --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_overview.sql
echo $(date) dump table ststc_shop_pct_nokeyword in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_pct_nokeyword --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_pct_nokeyword.sql
echo $(date) dump table ststc_shop_recommend_items in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_recommend_items --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_recommend_items.sql
echo $(date) dump table ststc_shop_sale_in in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_sale_in --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_sale_in.sql
echo $(date) dump table ststc_shop_sales_keyword in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_shop_sales_keyword --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_shop_sales_keyword.sql
echo $(date) dump table ststc_ztc_shops in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 ststc_ztc_shops --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/ststc_ztc_shops.sql
echo $(date) dump table top_cat_items in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_cat_items --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_cat_items.sql
echo $(date) dump table top_cat_search_result in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_cat_search_result --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_cat_search_result.sql
echo $(date) dump table top_item1 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item1 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item1.sql
echo $(date) dump table top_item2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2.sql
echo $(date) dump table top_item2_1 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_1 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_1.sql
echo $(date) dump table top_item2_10 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_10 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_10.sql
echo $(date) dump table top_item2_11 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_11 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_11.sql
echo $(date) dump table top_item2_12 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_12 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_12.sql
echo $(date) dump table top_item2_13 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_13 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_13.sql
echo $(date) dump table top_item2_14 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_14 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_14.sql
echo $(date) dump table top_item2_15 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_15 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_15.sql
echo $(date) dump table top_item2_2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_2.sql
echo $(date) dump table top_item2_3 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_3 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_3.sql
echo $(date) dump table top_item2_4 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_4 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_4.sql
echo $(date) dump table top_item2_5 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_5 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_5.sql
echo $(date) dump table top_item2_6 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_6 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_6.sql
echo $(date) dump table top_item2_7 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_7 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_7.sql
echo $(date) dump table top_item2_8 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_8 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_8.sql
echo $(date) dump table top_item2_9 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item2_9 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item2_9.sql
echo $(date) dump table top_item3 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item3 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item3.sql
echo $(date) dump table top_item4 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item4 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item4.sql
echo $(date) dump table top_item_buyer in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item_buyer --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item_buyer.sql
echo $(date) dump table top_item_tradingtime in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item_tradingtime --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item_tradingtime.sql
echo $(date) dump table top_item_tradingtime_2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_item_tradingtime_2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_item_tradingtime_2.sql
echo $(date) dump table top_itemsearchresult in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_itemsearchresult --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_itemsearchresult.sql
echo $(date) dump table top_shop1 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_shop1 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_shop1.sql
echo $(date) dump table top_shop2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_shop2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_shop2.sql
echo $(date) dump table top_tiny_shop in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_tiny_shop --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_tiny_shop.sql
echo $(date) dump table top_user in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_user --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_user.sql
echo $(date) dump table top_ztc_sum in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 top_ztc_sum --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/top_ztc_sum.sql
echo $(date) dump table user2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 user2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/user2.sql
echo $(date) dump table user_item_monitor in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 user_item_monitor --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/user_item_monitor.sql
echo $(date) dump table user_keywords in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 user_keywords --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/user_keywords.sql
echo $(date) dump table user_keywords_ztc in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 user_keywords_ztc --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/user_keywords_ztc.sql
echo $(date) dump table user_privileges in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 user_privileges --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/user_privileges.sql
echo $(date) dump table user_privileges_2 in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 user_privileges_2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/user_privileges_2.sql
echo $(date) dump table user_shop_monitor in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 user_shop_monitor --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/user_shop_monitor.sql
echo $(date) dump table user_shop_monitor_items in ibbd2
/usr/local/mysql/bin/mysqldump -u ibbd -pspider ibbd2 user_shop_monitor_items --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/user_shop_monitor_items.sql