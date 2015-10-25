/*换成可用的数据库名*/
use schema_no_exists;
CREATE TABLE `top_item_tradingtime_partition` (
  `item_id` varchar(20) NOT NULL DEFAULT '' COMMENT '商品ID',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `hour_0` int(11) NOT NULL DEFAULT '0' COMMENT '0时销量',
  `hour_1` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_2` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_3` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_4` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_5` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_6` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_7` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_8` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_9` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_10` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_11` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_12` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_13` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_14` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_15` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_16` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_17` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_18` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_19` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_20` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_21` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_22` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_23` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`item_id`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝-商品交易时段表' 
PARTITION BY RANGE COLUMNS(`date_of`)
(
PARTITION p2012_11 VALUES LESS THAN ('2012-12-01'),
PARTITION p2012_12 VALUES LESS THAN ('2013-01-01'),
PARTITION p2013_01 VALUES LESS THAN ('2013-02-01'),
PARTITION p2013_02 VALUES LESS THAN ('2013-03-01'),
PARTITION p2013_03 VALUES LESS THAN ('2013-04-01'),
PARTITION p2013_04 VALUES LESS THAN ('2013-05-01'),
PARTITION p2013_05 VALUES LESS THAN ('2013-06-01'),
PARTITION p2013_06 VALUES LESS THAN ('2013-07-01'),
PARTITION p2013_07 VALUES LESS THAN ('2013-08-01'),
PARTITION p2013_08 VALUES LESS THAN ('2013-09-01'),
PARTITION p2013_09 VALUES LESS THAN ('2013-10-01'),
PARTITION p2013_10 VALUES LESS THAN ('2013-11-01'),
PARTITION p2013_11 VALUES LESS THAN ('2013-12-01'),
PARTITION p2013_12 VALUES LESS THAN ('2014-01-01')
);

ALTER TABLE top_item_tradingtime
PARTITION BY RANGE COLUMNS(`date_of`)
subpartition by key(`item_id`) subpartitions 20(
PARTITION p2012_11 VALUES LESS THAN ('2012-12-01'),
PARTITION p2012_12 VALUES LESS THAN ('2013-01-01'),
PARTITION p2013_01 VALUES LESS THAN ('2013-02-01'),
PARTITION p2013_02 VALUES LESS THAN ('2013-03-01'),
PARTITION p2013_03 VALUES LESS THAN ('2013-04-01'),
PARTITION p2013_04 VALUES LESS THAN ('2013-05-01'),
PARTITION p2013_05 VALUES LESS THAN ('2013-06-01'),
PARTITION p2013_06 VALUES LESS THAN ('2013-07-01'),
PARTITION p2013_07 VALUES LESS THAN ('2013-08-01'),
PARTITION p2013_08 VALUES LESS THAN ('2013-09-01'),
PARTITION p2013_09 VALUES LESS THAN ('2013-10-01'),
PARTITION p2013_10 VALUES LESS THAN ('2013-11-01'),
PARTITION p2013_11 VALUES LESS THAN ('2013-12-01'),
PARTITION p2013_12 VALUES LESS THAN ('2014-01-01')
);

ALTER TABLE top_item2
PARTITION BY RANGE COLUMNS(`date_of`)
subpartition by key(`item_id`) subpartitions 20(
PARTITION p2012_11 VALUES LESS THAN ('2012-12-01'),
PARTITION p2012_12 VALUES LESS THAN ('2013-01-01'),
PARTITION p2013_01 VALUES LESS THAN ('2013-02-01'),
PARTITION p2013_02 VALUES LESS THAN ('2013-03-01'),
PARTITION p2013_03 VALUES LESS THAN ('2013-04-01'),
PARTITION p2013_04 VALUES LESS THAN ('2013-05-01'),
PARTITION p2013_05 VALUES LESS THAN ('2013-06-01'),
PARTITION p2013_06 VALUES LESS THAN ('2013-07-01'),
PARTITION p2013_07 VALUES LESS THAN ('2013-08-01'),
PARTITION p2013_08 VALUES LESS THAN ('2013-09-01'),
PARTITION p2013_09 VALUES LESS THAN ('2013-10-01'),
PARTITION p2013_10 VALUES LESS THAN ('2013-11-01'),
PARTITION p2013_11 VALUES LESS THAN ('2013-12-01'),
PARTITION p2013_12 VALUES LESS THAN ('2014-01-01')
);

ALTER TABLE ststc_item_rate1
PARTITION BY key(`item_id`)
partitions  100;

ALTER TABLE ststc_cat_shop_sales_detail
PARTITION BY RANGE COLUMNS(`date_of`)
subpartition by key(`keyword`) subpartitions 20(
PARTITION p2012_11 VALUES LESS THAN ('2012-12-01'),
PARTITION p2012_12 VALUES LESS THAN ('2013-01-01'),
PARTITION p2013_01 VALUES LESS THAN ('2013-02-01'),
PARTITION p2013_02 VALUES LESS THAN ('2013-03-01'),
PARTITION p2013_03 VALUES LESS THAN ('2013-04-01'),
PARTITION p2013_04 VALUES LESS THAN ('2013-05-01'),
PARTITION p2013_05 VALUES LESS THAN ('2013-06-01'),
PARTITION p2013_06 VALUES LESS THAN ('2013-07-01'),
PARTITION p2013_07 VALUES LESS THAN ('2013-08-01'),
PARTITION p2013_08 VALUES LESS THAN ('2013-09-01'),
PARTITION p2013_09 VALUES LESS THAN ('2013-10-01'),
PARTITION p2013_10 VALUES LESS THAN ('2013-11-01'),
PARTITION p2013_11 VALUES LESS THAN ('2013-12-01'),
PARTITION p2013_12 VALUES LESS THAN ('2014-01-01')
);

ALTER TABLE ststc_keyword_shop_pct
PARTITION BY RANGE COLUMNS(`date_of`)
subpartition by key(`wangwang`) subpartitions 20(
PARTITION p2012_11 VALUES LESS THAN ('2012-12-01'),
PARTITION p2012_12 VALUES LESS THAN ('2013-01-01'),
PARTITION p2013_01 VALUES LESS THAN ('2013-02-01'),
PARTITION p2013_02 VALUES LESS THAN ('2013-03-01'),
PARTITION p2013_03 VALUES LESS THAN ('2013-04-01'),
PARTITION p2013_04 VALUES LESS THAN ('2013-05-01'),
PARTITION p2013_05 VALUES LESS THAN ('2013-06-01'),
PARTITION p2013_06 VALUES LESS THAN ('2013-07-01'),
PARTITION p2013_07 VALUES LESS THAN ('2013-08-01'),
PARTITION p2013_08 VALUES LESS THAN ('2013-09-01'),
PARTITION p2013_09 VALUES LESS THAN ('2013-10-01'),
PARTITION p2013_10 VALUES LESS THAN ('2013-11-01'),
PARTITION p2013_11 VALUES LESS THAN ('2013-12-01'),
PARTITION p2013_12 VALUES LESS THAN ('2014-01-01')
);

ALTER TABLE ststc_shop_sales_keyword
PARTITION BY RANGE COLUMNS(`date_of`)
subpartition by key(`keyword`) subpartitions 20(
PARTITION p2012_11 VALUES LESS THAN ('2012-12-01'),
PARTITION p2012_12 VALUES LESS THAN ('2013-01-01'),
PARTITION p2013_01 VALUES LESS THAN ('2013-02-01'),
PARTITION p2013_02 VALUES LESS THAN ('2013-03-01'),
PARTITION p2013_03 VALUES LESS THAN ('2013-04-01'),
PARTITION p2013_04 VALUES LESS THAN ('2013-05-01'),
PARTITION p2013_05 VALUES LESS THAN ('2013-06-01'),
PARTITION p2013_06 VALUES LESS THAN ('2013-07-01'),
PARTITION p2013_07 VALUES LESS THAN ('2013-08-01'),
PARTITION p2013_08 VALUES LESS THAN ('2013-09-01'),
PARTITION p2013_09 VALUES LESS THAN ('2013-10-01'),
PARTITION p2013_10 VALUES LESS THAN ('2013-11-01'),
PARTITION p2013_11 VALUES LESS THAN ('2013-12-01'),
PARTITION p2013_12 VALUES LESS THAN ('2014-01-01')
);