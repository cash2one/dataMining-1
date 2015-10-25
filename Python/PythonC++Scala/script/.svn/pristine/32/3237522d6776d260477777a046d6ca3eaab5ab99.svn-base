#执行很慢的语句

/*

mysql> SELECT t2.hour_of,cast(SUM(t2.volume) AS signed) 
    -> FROM ibbd2.top_item_tradingtime t2, ibbd2.top_cat_search_result t1 
    -> WHERE t2.item_id =t1.item_id 
    -> AND t1.keyword='资生堂' 
    -> AND t2.date_of BETWEEN '2012-01-12' AND '2013-01-14' GROUP BY t2.hour_of;
+---------+--------------------------------+
| hour_of | cast(SUM(t2.volume) AS signed) |
+---------+--------------------------------+
|       0 |                          11490 |
|       1 |                           5962 |
|       2 |                           2185 |
|       3 |                            838 |
|       4 |                            524 |
|       5 |                            427 |
|       6 |                            867 |
|       7 |                           2241 |
|       8 |                           6036 |
|       9 |                          16050 |
|      10 |                          27075 |
|      11 |                          23952 |
|      12 |                          23079 |
|      13 |                          26599 |
|      14 |                          28902 |
|      15 |                          27786 |
|      16 |                          25535 |
|      17 |                          19214 |
|      18 |                          16706 |
|      19 |                          21649 |
|      20 |                          27185 |
|      21 |                          30834 |
|      22 |                          32312 |
|      23 |                          24334 |
+---------+--------------------------------+
24 rows in set (19.23 sec)


mysql> SELECT t2.hour_of,cast(SUM(t2.volume) AS signed) 
    -> FROM ibbd2.top_item_tradingtime_partition t2, ibbd2.top_cat_search_result t1 
    -> WHERE t2.item_id =t1.item_id 
    -> AND t1.keyword='资生堂' 
    -> AND t2.date_of BETWEEN '2012-01-12' AND '2013-01-14' GROUP BY t2.hour_of;
+---------+--------------------------------+
| hour_of | cast(SUM(t2.volume) AS signed) |
+---------+--------------------------------+
|       0 |                          11459 |
|       1 |                           5954 |
|       2 |                           2180 |
|       3 |                            837 |
|       4 |                            523 |
|       5 |                            426 |
|       6 |                            866 |
|       7 |                           2239 |
|       8 |                           6033 |
|       9 |                          16037 |
|      10 |                          27032 |
|      11 |                          23896 |
|      12 |                          23023 |
|      13 |                          26553 |
|      14 |                          28843 |
|      15 |                          27723 |
|      16 |                          25467 |
|      17 |                          19170 |
|      18 |                          16673 |
|      19 |                          21608 |
|      20 |                          27134 |
|      21 |                          30766 |
|      22 |                          32249 |
|      23 |                          24283 |
+---------+--------------------------------+
24 rows in set (32.72 sec)

*/

explain SELECT t2.hour_of,cast(SUM(t2.volume) AS signed) 
FROM ibbd2.top_item_tradingtime t2, ibbd2.top_cat_search_result t1 
WHERE t2.item_id =t1.item_id 
AND t1.keyword='果蔬机' 
AND t2.date_of BETWEEN '2012-01-12' AND '2013-01-14' GROUP BY t2.hour_of; 

explain SELECT t2.hour_of,2.volume
FROM ibbd2.top_item_tradingtime t2, ibbd2.top_cat_search_result t1 
WHERE t2.item_id =t1.item_id 
AND t1.keyword='果蔬机' 
AND t2.date_of BETWEEN '2012-01-12' AND '2013-01-14' ; 

表太大了
#############################################
explain partitions SELECT cast(t2.avg_deal_price AS signed), cast(SUM(t2.volume) AS signed) 
FROM ibbd2.top_item2 t2,ibbd2.top_cat_items t1 
 
WHERE t1.item_id = t2.item_id 
AND t2.date_of BETWEEN '2012-11-25' AND '2012-12-10' 
AND t1.keyword='珍珠毛衣链' AND t2.item_id IS NOT NULL 
GROUP BY cast(t2.avg_deal_price AS signed) 
ORDER BY cast(t2.avg_deal_price AS signed);

表太大了
#############################################
--SELECT T3.user_num_id,
--        T3.wangwang,
--        COUNT(DISTINCT(T3.item_id)),
--        CAST(SUM(T4.volume) AS SIGNED),
--        CAST(SUM(T4.sales) AS SIGNED)
--        FROM(
--            SELECT T2.item_id,T2.user_num_id,T2.wangwang
--            FROM ibbd2.user_keywords T1
--            LEFT JOIN topspider.top_itemsearchresult T2
--            ON T1.keyword = T2.keyword
--            WHERE DATE(T2.population_tsmp) BETWEEN '2013-01-01' AND '2013-01-14' +INTERVAL 1 DAY
--            AND T1.user='baojianpin'
--            GROUP BY T2.item_id)T3
--        LEFT JOIN ibbd2.top_item2 T4
--        ON T3.item_id=T4.item_id
--        AND T4.date_of BETWEEN '2013-01-01' AND '2013-01-14' 
--        GROUP BY T3.user_num_id
--        ORDER BY SUM(T4.sales) DESC
--        LIMIT 10;
--        
--表已经废弃不用了
#############################################
SELECT
        T3.item_pic, T3.item_id, T3.item_name, T3.user_num_id,T3.wangwang,
        CAST(SUM(T4.volume) AS SIGNED),
        CAST(SUM(T4.sales) AS SIGNED),
        MAX(CASE WHEN T4.date_of = '2012/11/19' THEN T4.sales ELSE 0 end)
        FROM(
          SELECT T2.item_pic, T2.item_id, T2.item_name, T2.user_num_id,T2.wangwang
          FROM ibbd2.user_keywords T1
          LEFT JOIN ibbd2.top_itemsearchresult T2
          ON T1.keyword = T2.keyword
          AND DATE(T2.population_tsmp) BETWEEN '2012/11/19'-INTERVAL 1 DAY AND '2012/11/19'+INTERVAL 1 DAY
          WHERE T1.user='Micky'
          AND T1.status='1'
          GROUP BY T2.item_id)T3
        LEFT JOIN ibbd2.top_item2 T4
        ON T3.item_id=T4.item_id
        AND T4.date_of BETWEEN '2012/11/19'-INTERVAL 1 DAY AND '2012/11/19'
        GROUP BY T3.item_id
        ORDER BY SUM(T4.volume) DESC
        LIMIT 10;
        
可在top_itemsearchresult添加联合索引(keyword,population_tsmp)
并把 DATE(T2.population_tsmp) BETWEEN '2012/11/19'-INTERVAL 1 DAY AND '2012/11/19'+INTERVAL 1 DAY
改为T2.population_tsmp BETWEEN '2012/11/18' AND '2012/11/21'形式
表太大了
##########################################
SELECT T1.`user`,T2.date_of,SUM(T2.sales)
        FROM ibbd2.user_keywords T1
        LEFT JOIN ibbd2.ststc_cat_shop_sales_detail T2
        ON T1.keyword=T2.keyword
        AND T2.province<>'全国'
        WHERE T1.`status`='1'
        AND T2.date_of BETWEEN '2012-11-05' AND '2012-11-19'
        GROUP BY T1.`user`,T2.date_of;
 
这个语句对全表进行了直接查询，而不是利用索引，原因是在mysql中，它查询的列>10%时候，因为列在硬盘中离散分布，
直接查询反而比较快
因为影响行数很多，速度不快无可避免，不过这个是把运行结果已经保存在Redis中的。
表太大了。


/*
 *
 **************************** 1. row ***************************
             Field_name: ibbd2.top_item2.item_id
              Min_value: 10000001294
              Max_value: 9999970638
             Min_length: 6
             Max_length: 11
       Empties_or_zeros: 0
                  Nulls: 0
Avg_value_or_avg_length: 10.8225
                    Std: NULL
      Optimal_fieldtype: CHAR(11) NOT NULL
*************************** 2. row ***************************
             Field_name: ibbd2.top_item2.shop_id
              Min_value: 100000159
              Max_value: 996882
             Min_length: 4
             Max_length: 9
       Empties_or_zeros: 0
                  Nulls: 0
Avg_value_or_avg_length: 8.0271
                    Std: NULL
      Optimal_fieldtype: INT(8) UNSIGNED NOT NULL
*************************** 3. row ***************************
             Field_name: ibbd2.top_item2.date_of
              Min_value: 2012-08-03
              Max_value: 2013-02-24
             Min_length: 10
             Max_length: 10
       Empties_or_zeros: 0
                  Nulls: 0
Avg_value_or_avg_length: 10.0000
                    Std: NULL
      Optimal_fieldtype: ENUM('2012-08-03','2012-08-04','2012-08-05','2012-08-06','2012-08-07','2012-08-08','2012-08-09','2012-08-10','2012-08-11','2012-08-12','2012-08-13','2012-08-14','2012-08-15','2012-08-16','2012-08-17','2012-08-18','2012-08-19','2012-08-20','2012-08-21','2012-08-22','2012-08-23','2012-08-24','2012-08-25','2012-08-26','2012-08-27','2012-08-28','2012-08-29','2012-08-30','2012-08-31','2012-09-01','2012-09-02','2012-09-03','2012-09-04','2012-09-05','2012-09-06','2012-09-07','2012-09-08','2012-09-09','2012-09-10','2012-09-11','2012-09-12','2012-09-13','2012-09-14','2012-09-15','2012-09-16','2012-09-17','2012-09-18','2012-09-19','2012-09-20','2012-09-21','2012-09-22','2012-09-23','2012-09-24','2012-09-25','2012-09-26','2012-09-27','2012-09-28','2012-09-29','2012-09-30','2012-10-01','2012-10-02','2012-10-03','2012-10-04','2012-10-05','2012-10-06','2012-10-07','2012-10-08','2012-10-09','2012-10-10','2012-10-11','2012-10-12','2012-10-13','2012-10-14','2012-10-15','2012-10-16','2012-10-17','2012-10-18','2012-10-19','2012-10-20','2012-10-21','2012-10-22','2012-10-23','2012-10-24','2012-10-25','2012-10-26','2012-10-27','2012-10-28','2012-10-29','2012-10-30','2012-10-31','2012-11-01','2012-11-02','2012-11-03','2012-11-04','2012-11-05','2012-11-06','2012-11-07','2012-11-08','2012-11-09','2012-11-10','2012-11-11','2012-11-12','2012-11-13','2012-11-14','2012-11-15','2012-11-16','2012-11-17','2012-11-18','2012-11-19','2012-11-20','2012-11-21','2012-11-22','2012-11-23','2012-11-24','2012-11-25','2012-11-26','2012-11-27','2012-11-28','2012-11-29','2012-11-30','2012-12-01','2012-12-02','2012-12-03','2012-12-04','2012-12-05','2012-12-06','2012-12-07','2012-12-08','2012-12-09','2012-12-10','2012-12-11','2012-12-12','2012-12-13','2012-12-14','2012-12-15','2012-12-16','2012-12-17','2012-12-18','2012-12-19','2012-12-20','2012-12-21','2012-12-22','2012-12-23','2012-12-24','2012-12-25','2012-12-26','2012-12-27','2012-12-28','2012-12-29','2012-12-30','2012-12-31','2013-01-01','2013-01-02','2013-01-03','2013-01-04','2013-01-05','2013-01-06','2013-01-07','2013-01-08','2013-01-09','2013-01-10','2013-01-11','2013-01-12','2013-01-13','2013-01-14','2013-01-15','2013-01-16','2013-01-17','2013-01-18','2013-01-19','2013-01-20','2013-01-21','2013-01-22','2013-01-23','2013-01-24','2013-01-25','2013-01-26','2013-01-27','2013-01-28','2013-01-29','2013-01-30','2013-01-31','2013-02-01','2013-02-02','2013-02-03','2013-02-04','2013-02-05','2013-02-06','2013-02-07','2013-02-08','2013-02-09','2013-02-10','2013-02-11','2013-02-12','2013-02-13','2013-02-14','2013-02-15','2013-02-16','2013-02-17','2013-02-18','2013-02-19','2013-02-20','2013-02-21','2013-02-22','2013-02-23','2013-02-24') NOT NULL
*************************** 4. row ***************************
             Field_name: ibbd2.top_item2.price
              Min_value: 0.009999999776482582
              Max_value: 298000
             Min_length: 1
             Max_length: 7
       Empties_or_zeros: 173
                  Nulls: 0
Avg_value_or_avg_length: 203.35777377393188
                    Std: 587.9455167051708
      Optimal_fieldtype: FLOAT NOT NULL
*************************** 5. row ***************************
             Field_name: ibbd2.top_item2.volume
              Min_value: 1
              Max_value: 459564
             Min_length: 1
             Max_length: 6
       Empties_or_zeros: 0
                  Nulls: 0
Avg_value_or_avg_length: 22.0395
                    Std: 243.8435
      Optimal_fieldtype: MEDIUMINT(6) UNSIGNED NOT NULL
*************************** 6. row ***************************
             Field_name: ibbd2.top_item2.trade_num
              Min_value: 1
              Max_value: 1500
             Min_length: 1
             Max_length: 4
       Empties_or_zeros: 0
                  Nulls: 0
Avg_value_or_avg_length: 13.1076
                    Std: 45.0813
      Optimal_fieldtype: SMALLINT(4) UNSIGNED NOT NULL
*************************** 7. row ***************************
             Field_name: ibbd2.top_item2.sales
              Min_value: 0.009999999776482582
              Max_value: 11359300
             Min_length: 1
             Max_length: 11
       Empties_or_zeros: 173
                  Nulls: 0
Avg_value_or_avg_length: 2029.4448224896912
                    Std: 17570.094967721132
      Optimal_fieldtype: FLOAT NOT NULL
*************************** 8. row ***************************
             Field_name: ibbd2.top_item2.min_deal_price
              Min_value: 0.009999999776482582
              Max_value: 298000
             Min_length: 1
             Max_length: 7
       Empties_or_zeros: 209
                  Nulls: 0
Avg_value_or_avg_length: 178.89328664864206
                    Std: 545.5177373765389
      Optimal_fieldtype: FLOAT NOT NULL
*************************** 9. row ***************************
             Field_name: ibbd2.top_item2.avg_deal_price
              Min_value: 0.009999999776482582
              Max_value: 298000
             Min_length: 1
             Max_length: 9
       Empties_or_zeros: 173
                  Nulls: 0
Avg_value_or_avg_length: 188.26022772313328
                    Std: 559.0204077691805
      Optimal_fieldtype: FLOAT NOT NULL
*************************** 10. row ***************************
             Field_name: ibbd2.top_item2.buyer_num
              Min_value: 1
              Max_value: 1396
             Min_length: 1
             Max_length: 4
       Empties_or_zeros: 0
                  Nulls: 0
Avg_value_or_avg_length: 12.6479
                    Std: 41.5135
      Optimal_fieldtype: SMALLINT(4) UNSIGNED NOT NULL
*************************** 11. row ***************************
             Field_name: ibbd2.top_item2.pct
              Min_value: 0.009999999776482582
              Max_value: 4999740
             Min_length: 1
             Max_length: 11
       Empties_or_zeros: 173
                  Nulls: 0
Avg_value_or_avg_length: 233.60317411982766
                    Std: 3071.7641406111384
      Optimal_fieldtype: FLOAT NOT NULL
*************************** 12. row ***************************
             Field_name: ibbd2.top_item2.population_tsmp
              Min_value: 2012-11-02 11:42:55
              Max_value: 2013-02-26 00:50:40
             Min_length: 19
             Max_length: 19
       Empties_or_zeros: 0
                  Nulls: 0
Avg_value_or_avg_length: 19.0000
                    Std: NULL
      Optimal_fieldtype: TIMESTAMP NOT NULL

 */

10000001294	64661829	2012-10-28	128	6	6	326.4	39.68	54.4	6	54.4	2012-11-30 17:44:30