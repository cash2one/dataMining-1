#!/bin/sh

# Cooper
# 2012-12-27
# run on 172
cd /usr/local/mysql/bin

# top_item1
'./mysqldump' -uroot -pLTs00744601 ibbd2 top_item1 --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/top_item1_20121227.sql
# top_item2
'./mysqldump' -uroot -pLTs00744601 ibbd2 top_item2 --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/top_item2_20121227.sql
# top_shop1
'./mysqldump' -uroot -pLTs00744601 ibbd2 top_shop1 --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/top_shop1_20121227.sql
# top_itemsearchresult
'./mysqldump' -uroot -pLTs00744601 ibbd2 top_itemsearchresult --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/top_itemsearchresult_20121227.sql

# top_cat_search_result
'./mysqldump' -uroot -pLTs00744601 ibbd2 top_cat_search_result --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/top_cat_search_result_20121227.sql

# top_cat_items
'./mysqldump' -uroot -pLTs00744601 ibbd2 top_cat_items --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/top_cat_items_20121227.sql

# quota_shop_credit
'./mysqldump' -uroot -pLTs00744601 ibbd2 quota_shop_credit --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/quota_shop_credit_20121227.sql

# ststc_cat_site_dealprice
'./mysqldump' -uroot -pLTs00744601 ibbd2 ststc_cat_site_dealprice --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/ststc_cat_site_dealprice_20121227.sql

# ststc_cat_shop_sales_detail
'./mysqldump' -uroot -pLTs00744601 ibbd2 ststc_cat_shop_sales_detail --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/ststc_cat_shop_sales_detail_20121227.sql

# ststc_cat_dealprice
# TODO
'./mysqldump' -uroot -pLTs00744601 ibbd2 ststc_cat_dealprice --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/ststc_cat_dealprice_20121227.sql

# ststc_shop_sales_keyword
# TODO
'./mysqldump' -uroot -pLTs00744601 ibbd2 ststc_shop_sales_keyword --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/ststc_shop_sales_keyword_20121227.sql

# ststc_keyword_shop_pct
'./mysqldump' -uroot -pLTs00744601 ibbd2 ststc_keyword_shop_pct --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/ststc_keyword_shop_pct_20121227.sql

# quota_pct_keyword
'./mysqldump' -uroot -pLTs00744601 ibbd2 quota_pct_keyword --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/quota_pct_keyword_20121227.sql

# quota_tradingtime_aly
'./mysqldump' -uroot -pLTs00744601 ibbd2 quota_tradingtime_aly --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/quota_tradingtime_aly_20121227.sql

# top_item_tradingtime
'./mysqldump' -uroot -pLTs00744601 ibbd2 top_item_tradingtime --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/top_item_tradingtime_20121227.sql

# ststc_cat_range_hotshops
'./mysqldump' -uroot -pLTs00744601 ibbd2 ststc_cat_range_hotshops --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/ststc_cat_range_hotshops_20121227.sql

# ststc_keyword_reporter
'./mysqldump' -uroot -pLTs00744601 ibbd2 ststc_keyword_reporter --where "population_tsmp>'2012-12-27'" --no-create-info --default-character-set=utf8 -q --extended-insert=false --replace --no-autocommit> /data/migrate/ststc_keyword_reporter_20121227.sql

# run on 152
# rsync -r -a -v -e "ssh -l root" --delete 223.4.155.172:/data/migrate/ /data/migrate
# mv /data/migrate/top_item2_20121227.sql /usr/local/mysql/bin
# cd /usr/local/mysql/bin
for file in *.sql
do
mysql -uroot -pLTs00744601 ibbd2 < $file
done