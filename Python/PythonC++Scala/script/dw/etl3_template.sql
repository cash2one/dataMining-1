-- @block=1 sync=1
REPLACE INTO ibbd2.top_cat_search_result
SELECT *
FROM topspider.top_itemsearchresult
WHERE population_tsmp > '{{fetch_date}}';

REPLACE INTO ibbd2.top_item1
SELECT item_id,
      user_id,
      shop_id,
      site_id,
      DATE(population_tsmp),
      IFNULL(init_price, 0),
      IFNULL(item_title, ''),
      IFNULL(location, ''),
      SUBSTRING(ibbd2.func_parse_loca(IFNULL(location, '')), 1, 10),
      IFNULL(brand, ''),
      IFNULL(item_img, ''),
      IFNULL(monthly_trade, 0),
      IFNULL(total_sold_out, 0),
      IFNULL(cid, ''),
      NOW()
 FROM topspider.top_item T
WHERE T.population_tsmp > '{{fetch_date}}';

REPLACE INTO ibbd2.top_shop1
SELECT shop_id, user_id, shop_name, wangwang, shop_type, shop_rank, 
location, 
SUBSTRING(ibbd2.func_parse_loca(IFNULL(location, '')), 1, 10),
NOW()
FROM topspider.top_shop
WHERE population_tsmp > '{{fetch_date}}';

UPDATE ibbd2.top_shop1 T1,
(SELECT T3.shop_id, T4.location, T4.location2
  FROM ibbd2.top_shop1 T3
  LEFT JOIN ibbd2.top_item1 T4
  ON T3.shop_id=T4.shop_id
  AND (T4.location IS NOT NULL OR T4.location<>'') 
  WHERE T3.population_tsmp > '{{fetch_date}}'
  AND (T3.location IS NULL OR T3.location='')
  AND T4.shop_id IS NOT NULL
)T2
SET T1.location=T2.location, T1.location2=T2.location2
WHERE T1.shop_id = T2.shop_id;

INSERT IGNORE INTO ibbd2.top_cat_items
 SELECT keyword,
        item_id,
        '',
        user_num_id,
        NOW()
   FROM topspider.top_itemsearchresult
  WHERE population_tsmp > '{{fetch_date}}'
 GROUP BY keyword, item_id;
DELETE FROM ibbd2.top_cat_items
WHERE keyword IN(
    SELECT DISTINCT T1.keyword
    FROM(
        SELECT DISTINCT keyword
        FROM ibbd2.top_cat_items
    )T1
    LEFT JOIN ibbd2.user_keywords T2
    ON T1.keyword = T2.keyword
    WHERE T2.keyword IS NULL
);
UPDATE ibbd2.top_cat_items T3,
     (SELECT T1.item_id, MAX(T2.shop_type) AS shop_type
        FROM    ibbd2.top_cat_items T1
             LEFT JOIN
                ibbd2.top_item1 T2
             ON T1.item_id = T2.item_id
       WHERE T1.population_tsmp > '{{fetch_date}}'
       AND T1.site_id = '') T4
 SET T3.site_id = T4.shop_type
WHERE T3.item_id = T4.item_id;
-- @end

-- @block=29 async=1
REPLACE INTO ibbd2.top_item3
  SELECT item_id,attr_list, NOW()
  FROM topspider.top_item
  WHERE population_tsmp > '{{fetch_date}}'
  AND attr_list <> '' AND attr_list IS NOT NULL;
REPLACE INTO ibbd2.top_item4
  SELECT item_id, page_id, shop_id, user_id, DATE(population_tsmp), fav_num, review_count, starts, ends, IFNULL(user_tag, ''), NOW()
  FROM topspider.top_item
  WHERE item_id<>'' AND population_tsmp > '{{fetch_date}}'
  AND starts IS NOT NULL AND fav_num IS NOT NULL;
INSERT IGNORE INTO ibbd2.top_shop2
  SELECT shop_id, user_id, DATE(population_tsmp), coll_count, item_amount, NOW()
  FROM topspider.top_shop
  WHERE population_tsmp > '{{fetch_date}}';
-- @end

-- @block=19 async=1
{% for i in range(cache_table_num) %}
DROP TABLE IF EXISTS ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=20 async=1 requires=19
{% for i in range(cache_table_num) %}
CREATE TABLE ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}} LIKE ibbd2.top_item2;
{% end %}
-- @end

-- @block=3 async=1 requires=20
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}}
  SELECT item_id,
      shop_id,
      DATE(trade_time),
      MAX(price),
      SUM(amount),
      COUNT(1),
      SUM(amount * price),
      MIN(price),
      AVG(price),
      COUNT(1),
      SUM(amount * price) / COUNT(1),
      NOW()
  FROM topspider.top_item_trade_his_{{fetch_date.replace('-', '')}}_{{i+1}}
  GROUP BY item_id, DATE(trade_time);
{% end %}
-- @end

-- @block=4 sync=1 requires=1
INSERT IGNORE INTO ibbd2.quota_shop_credit
        SELECT *
            FROM (SELECT T1.keyword,
                      SUBSTRING_INDEX(T2.location2, ' ', 1) AS province,
                      SUBSTRING_INDEX(T2.location2, ' ', -1) AS city,
                      SUBSTRING_INDEX(T2.shop_rank, '_', 2) AS shop_grade,
                      T2.shop_id,
                      T2.user_num_id,
                      T2.shop_name,
                      T2.shop_type,
                      NOW()
                 FROM    ibbd2.top_cat_items T1
                      LEFT JOIN
                         ibbd2.top_shop1 T2
                      ON T1.user_num_id = T2.user_num_id
                WHERE     T2.user_num_id IS NOT NULL
               GROUP BY T1.keyword,
                        SUBSTRING_INDEX(T2.location2, ' ', 1),
                        SUBSTRING_INDEX(T2.location2, ' ', -1),
                        SUBSTRING_INDEX(T2.shop_rank, '_', 2),
                        T2.user_num_id) T
            ON DUPLICATE KEY UPDATE credit_level = T.shop_grade;
-- @end

-- @block=5 sync=1 requires=1,3
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.ststc_cat_shop_sales_detail
  SELECT T1.keyword,
      T2.date_of,
      T1.user_num_id,
      T4.wangwang,
   SUBSTRING_INDEX(T3.location2, ' ', 1),
      SUBSTRING_INDEX(T3.location2, ' ', -1),
      SUM(T2.volume),
      SUM(T2.trade_num),
      SUM(T2.sales),
      NOW()
  FROM    ibbd2.top_cat_items T1
      LEFT JOIN
         ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}} T2
      ON     T1.item_id = T2.item_id
      LEFT JOIN
         ibbd2.top_item1 T3
      ON T1.item_id = T3.item_id
      LEFT JOIN ibbd2.top_shop1 T4
      ON T1.user_num_id = T4.user_num_id
  WHERE     T2.volume IS NOT NULL
      AND T2.item_id IS NOT NULL
  GROUP BY T1.keyword, T2.date_of, T1.user_num_id;
{% end %}
-- @end

-- @block=6 sync=1 requires=1,3
{% for i in range(cache_table_num) %}
REPLACE INTO ibbd2.ststc_cat_dealprice
SELECT T3.keyword, T3.date_of,
(T3.avg_deal_price * T3.item_count + IFNULL(T4.avg_dealprice, 0) * IFNULL(T4.item_count, 0)) / (T3.item_count + IFNULL(T4.item_count, 0)),
IFNULL(LEAST(T3.min_deal_price, T4.min_dealprice), T3.min_deal_price),
GREATEST(T3.max_dealprice, IFNULL(T4.max_dealprice, 0)),
T3.item_count + IFNULL(T4.item_count, 0),
NOW()
FROM(
  SELECT T1.keyword,
      T2.date_of,
      AVG(T2.avg_deal_price) avg_deal_price,
      MIN(T2.min_deal_price) min_deal_price,
      MAX(T2.price) max_dealprice,
      COUNT(DISTINCT (T1.item_id)) item_count
  FROM    ibbd2.top_cat_items T1
      LEFT JOIN
         ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}} T2
      ON     T1.item_id = T2.item_id
  WHERE T2.item_id IS NOT NULL
      GROUP BY T1.keyword, T2.date_of
)T3
LEFT JOIN ibbd2.ststc_cat_dealprice T4
ON T3.keyword = T4.keyword
AND T3.date_of = T4.date_of;
{% end %}
-- @end

-- @block=7 sync=1 requires=1
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.ststc_cat_site_dealprice
   SELECT T1.keyword,
          CASE WHEN T1.site_id = '2' THEN 'B' ELSE 'C' END AS site,
          T2.date_of,
          AVG(T2.avg_deal_price),
          MIN(T2.min_deal_price),
          MAX(T2.price),
          COUNT(DISTINCT (T1.item_id)),
          NOW()
     FROM    ibbd2.top_cat_items T1
          LEFT JOIN
             ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}} T2
          ON     T1.item_id = T2.item_id
    WHERE T2.item_id IS NOT NULL
   GROUP BY T1.keyword,
            CASE WHEN T1.site_id = '2' THEN 'B' ELSE 'C' END,
            T2.date_of;
{% end %}
-- @end

-- @block=8 sync=1 requires=1,3
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.ststc_shop_sales_keyword
  SELECT T1.keyword,
      T1.user_num_id,
      T2.date_of,
      SUM(T2.volume),
      SUM(T2.trade_num),
      SUM(T2.sales),
      NOW()
  FROM    ibbd2.top_cat_items T1
      LEFT JOIN
         ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}} T2
      ON T1.item_id = T2.item_id
  WHERE T2.item_id IS NOT NULL
      AND T2.volume IS NOT NULL
  GROUP BY T1.keyword, T1.user_num_id, T2.date_of;
{% end %}
-- @end

-- @block=21 async=1
{% for i in range(cache_table_num) %}
DROP TABLE IF EXISTS ibbd2.ststc_keyword_shop_pct_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=22 async=1 requires=20
{% for i in range(cache_table_num) %}
CREATE TABLE ibbd2.ststc_keyword_shop_pct_{{cal_date.replace('-', '')}}_{{i+1}} LIKE ibbd2.ststc_keyword_shop_pct;
{% end %}
-- @end

-- @block=9 async=1 requires=1,22
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.ststc_keyword_shop_pct_{{cal_date.replace('-', '')}}_{{i+1}}
  SELECT T3.keyword,
      T3.wangwang,
      T3.date_of,
      COUNT(DISTINCT (T3.item_id)),
      COUNT(1),
      SUM(T3.amount),
      SUM(T3.price * T3.amount),
      -1,
      SUM(T3.price * T3.amount)/ COUNT(1),
      NOW()
  FROM (SELECT T1.keyword,
              T3.wangwang,
              DATE(T2.trade_time) AS date_of,
              T2.*
         FROM    ibbd2.top_cat_items T1
              LEFT JOIN
                 topspider.top_item_trade_his_{{fetch_date.replace('-', '')}}_{{i+1}} T2
              ON     T1.item_id = T2.item_id
              LEFT JOIN
                 ibbd2.top_shop1 T3
              ON T1.user_num_id=T3.user_num_id
        WHERE    T2.item_id IS NOT NULL
              AND T3.user_num_id IS NOT NULL) T3
  GROUP BY T3.keyword, T3.wangwang, T3.date_of;
{% end %}
-- @end

-- @block=23 sync=1 requires=9
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.ststc_keyword_shop_pct
  SELECT * FROM ibbd2.ststc_keyword_shop_pct_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=10 async=1 requires=23
{% for i in range(cache_table_num) %}
DROP TABLE ibbd2.ststc_keyword_shop_pct_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=11 sync=1 requires=1,3
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.quota_pct_keyword
  SELECT T1.keyword,
      T2.date_of,
      SUM(T2.trade_num),
      SUM(T2.volume),
      SUM(T2.sales),
      AVG(T2.pct),
      NOW()
  FROM    ibbd2.top_cat_items T1
      LEFT JOIN
         ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}} T2
      ON     T1.item_id = T2.item_id
  WHERE T2.item_id IS NOT NULL
    AND T2.pct IS NOT NULL
  GROUP BY T1.keyword, T2.date_of;
{% end %}
-- @end

-- @block=12 sync=1 requires=1,3
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.top_item2
  SELECT * FROM ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=13 sync=1 requires=1,12
call ibbd2.sp_ststc_cat_range_hotshops(DATE('{{reporter_date_range}}'), DATE('{{reporter_date}}'));
-- @end

-- @block=15 async=1
{% for i in range(cache_table_num) %}
DROP TABLE IF EXISTS ibbd2.top_item_tradingtime_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=25 async=1 requires=15
{% for i in range(cache_table_num) %}
CREATE TABLE ibbd2.top_item_tradingtime_{{cal_date.replace('-', '')}}_{{i+1}} LIKE ibbd2.top_item_tradingtime;
{% end %}
-- @end

-- @block=26 async=1 requires=25
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.top_item_tradingtime_{{cal_date.replace('-', '')}}_{{i+1}}
  SELECT item_id,
      DATE(trade_time),
      SUM(CASE WHEN HOUR(trade_time) = 0 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 1 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 2 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 3 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 4 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 5 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 6 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 7 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 8 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 9 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 10 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 11 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 12 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 13 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 14 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 15 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 16 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 17 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 18 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 19 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 20 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 21 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 22 THEN amount ELSE 0 END),
      SUM(CASE WHEN HOUR(trade_time) = 23 THEN amount ELSE 0 END),
      NOW()
  FROM topspider.top_item_trade_his_{{fetch_date.replace('-', '')}}_{{i+1}}
  GROUP BY item_id, DATE(trade_time);
{% end %}
-- @end

-- @block=27 sync=1 requires=1,26
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.top_item_tradingtime
  SELECT * FROM ibbd2.top_item_tradingtime_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=28 sync=1 requires=1,27
{% for i in range(cache_table_num) %}
DROP TABLE ibbd2.top_item_tradingtime_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=24 async=1 requires=1,3,5,6,7,8,11,12,13
{% for i in range(cache_table_num) %}
DROP TABLE ibbd2.top_item2_{{cal_date.replace('-', '')}}_{{i+1}};
{% end %}
-- @end

-- @block=29 async=1
INSERT IGNORE INTO ibbd2.ststc_item_rate1
SELECT auc_num_id, rate_id, `date`, nick, user_id, NOW()
FROM topspider.top_item_rate
WHERE population_tsmp > '{{fetch_date}}';
-- @end

-- @block=30 sync=1
{% for i in range(cache_table_num) %}
INSERT IGNORE INTO ibbd2.ststc_top_item_price_num
SELECT item_id, date(trade_time), price, group_concat(distinct promo_title), sum(amount), now()
FROM topspider.top_item_trade_his_{{fetch_date.replace('-', '')}}_{{i+1}}
GROUP BY item_id, date(trade_time), price;
{% end %}
-- @end