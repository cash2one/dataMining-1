#!/bin/sh

if [ ! -d "/data/mysql_bak" ]; then
    mkdir /data/mysql_bak
fi

cd /data/mysql_bak


if [ ! -d "ibbd2" ]; then
    mkdir ibbd2
fi
if [ ! -d "ibbd2/20121228" ]; then
    mkdir ibbd2/20121228
fi



/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 user2 --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/user2_20121228.sql

echo $(date) 'ibbd2' 'user2' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 user_keywords --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/user_keywords_20121228.sql

echo $(date) 'ibbd2' 'user_keywords' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 user_privileges --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/user_privileges_20121228.sql

echo $(date) 'ibbd2' 'user_privileges' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 user_item_monitor --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/user_item_monitor_20121228.sql

echo $(date) 'ibbd2' 'user_item_monitor' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 user_keywords_ztc --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/user_keywords_ztc_20121228.sql

echo $(date) 'ibbd2' 'user_keywords_ztc' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 user_privileges_2 --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/user_privileges_2_20121228.sql

echo $(date) 'ibbd2' 'user_privileges_2' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 user_shop_monitor --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/user_shop_monitor_20121228.sql

echo $(date) 'ibbd2' 'user_shop_monitor' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 top_item1 --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/top_item1_20121228.sql

echo $(date) 'ibbd2' 'top_item1' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 top_item2 --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/top_item2_20121228.sql

echo $(date) 'ibbd2' 'top_item2' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 top_shop1 --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/top_shop1_20121228.sql

echo $(date) 'ibbd2' 'top_shop1' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 top_cat_items --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/top_cat_items_20121228.sql

echo $(date) 'ibbd2' 'top_cat_items' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 top_cat_search_result --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/top_cat_search_result_20121228.sql

echo $(date) 'ibbd2' 'top_cat_search_result' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 top_item_tradingtime --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/top_item_tradingtime_20121228.sql

echo $(date) 'ibbd2' 'top_item_tradingtime' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 top_tiny_shop --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/top_tiny_shop_20121228.sql

echo $(date) 'ibbd2' 'top_tiny_shop' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 top_ztc_sum --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/top_ztc_sum_20121228.sql

echo $(date) 'ibbd2' 'top_ztc_sum' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 history_topuser_rfmconfig --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/history_topuser_rfmconfig_20121228.sql

echo $(date) 'ibbd2' 'history_topuser_rfmconfig' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 lib_cat_industry_keyword_2 --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/lib_cat_industry_keyword_2_20121228.sql

echo $(date) 'ibbd2' 'lib_cat_industry_keyword_2' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 lib_datelist --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/lib_datelist_20121228.sql

echo $(date) 'ibbd2' 'lib_datelist' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 lib_industry_2 --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/lib_industry_2_20121228.sql

echo $(date) 'ibbd2' 'lib_industry_2' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 lib_industry_3 --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/lib_industry_3_20121228.sql

echo $(date) 'ibbd2' 'lib_industry_3' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 lib_numlist --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/lib_numlist_20121228.sql

echo $(date) 'ibbd2' 'lib_numlist' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 lib_province_map --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/lib_province_map_20121228.sql

echo $(date) 'ibbd2' 'lib_province_map' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 lib_rate_library --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/lib_rate_library_20121228.sql

echo $(date) 'ibbd2' 'lib_rate_library' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 quota_pct_keyword --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/quota_pct_keyword_20121228.sql

echo $(date) 'ibbd2' 'quota_pct_keyword' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 quota_sale_index --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/quota_sale_index_20121228.sql

echo $(date) 'ibbd2' 'quota_sale_index' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 quota_shop_credit --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/quota_shop_credit_20121228.sql

echo $(date) 'ibbd2' 'quota_shop_credit' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 quota_tradingtime_aly --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/quota_tradingtime_aly_20121228.sql

echo $(date) 'ibbd2' 'quota_tradingtime_aly' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_cat_dealprice --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_cat_dealprice_20121228.sql

echo $(date) 'ibbd2' 'ststc_cat_dealprice' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_cat_range_hotshops --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_cat_range_hotshops_20121228.sql

echo $(date) 'ibbd2' 'ststc_cat_range_hotshops' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_cat_shop_sales_detail --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_cat_shop_sales_detail_20121228.sql

echo $(date) 'ibbd2' 'ststc_cat_shop_sales_detail' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_cat_site_dealprice --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_cat_site_dealprice_20121228.sql

echo $(date) 'ibbd2' 'ststc_cat_site_dealprice' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_keyword_reporter --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_keyword_reporter_20121228.sql

echo $(date) 'ibbd2' 'ststc_keyword_reporter' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_keyword_shop_pct --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_keyword_shop_pct_20121228.sql

echo $(date) 'ibbd2' 'ststc_keyword_shop_pct' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_price_keyword --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_price_keyword_20121228.sql

echo $(date) 'ibbd2' 'ststc_price_keyword' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_shop_apriori --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_shop_apriori_20121228.sql

echo $(date) 'ibbd2' 'ststc_shop_apriori' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_shop_credit --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_shop_credit_20121228.sql

echo $(date) 'ibbd2' 'ststc_shop_credit' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_shop_recommend_items --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_shop_recommend_items_20121228.sql

echo $(date) 'ibbd2' 'ststc_shop_recommend_items' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_shop_sale_in --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_shop_sale_in_20121228.sql

echo $(date) 'ibbd2' 'ststc_shop_sale_in' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_shop_sales_keyword --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_shop_sales_keyword_20121228.sql

echo $(date) 'ibbd2' 'ststc_shop_sales_keyword' '20121228' >> bak_process.log


/usr/local/mysql/bin/mysqldump -uibbd -pspider ibbd2 ststc_ztc_shops --where "population_tsmp BETWEEN '2012-12-28 00:00:00'-INTERVAL 8 HOUR AND '2012-12-28 23:59:59'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/ibbd2/20121228/ststc_ztc_shops_20121228.sql

echo $(date) 'ibbd2' 'ststc_ztc_shops' '20121228' >> bak_process.log



if [ ! -d "topspider" ]; then
    mkdir topspider
fi
if [ ! -d "topspider/20121228" ]; then
    mkdir topspider/20121228
fi




if [ ! -d "topdata" ]; then
    mkdir topdata
fi
if [ ! -d "topdata/20121228" ]; then
    mkdir topdata/20121228
fi


