/*
223.4.155.152
*/

-- migrate topspider.top_item to 152
SELECT *
FROM ibbd2.top_item2
WHERE population_tsmp > '2012-12-23';

SELECT *
FROM ibbd2.quota_shop_credit
WHERE population_tsmp > '2012-12-23';

SELECT *
FROM ibbd2.ststc_cat_shop_sales_detail
WHERE population_tsmp > '2012-12-23';

SELECT *
FROM ibbd2.ststc_cat_dealprice
WHERE population_tsmp > '2012-12-23';

SELECT *
FROM ibbd2.ststc_shop_sales_keyword
WHERE population_tsmp > '2012-12-23';

SELECT *
FROM ibbd2.ststc_keyword_shop_pct
WHERE population_tsmp > '2012-12-23';

SELECT *
FROM ibbd2.quota_pct_keyword
WHERE population_tsmp > '2012-12-23';

SELECT *
FROM ibbd2.quota_tradingtime_aly
WHERE population_tsmp > '2012-12-23';

SELECT *
FROM ibbd2.top_item_tradingtime
WHERE population_tsmp > '2012-12-23';