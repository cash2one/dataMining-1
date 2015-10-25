/*
 *用来把应该分区的表的数据导出导入
 * 
 计划修改的表
 top_item_tradingtime           |   81750440 |         
| top_item2                      |   16801112 |
| ststc_cat_shop_sales_detail    |   11942449 |
| ststc_shop_sales_keyword       |   10646778 |
| ststc_keyword_shop_pct         |    9523628 |
| ststc_item_rate1               |    9420525 |
| top_itemsearchresult           |    5105782 |
| ststc_cat_range_hotshops       |    4246030 |
| quota_tradingtime_aly          |    2638418 |
| top_item_buyer                 |    2124433 |
| ststc_shop_sale_in             |    1960235 |

| top_item4                      |    1158487 
 */

select * from ibbd2.top_item_tradingtime 
	where population_tsmp<'2013-02-19 00:00:00' 
	into outfile '/home/liangj/mysql_partition/top_item_tradingtime_before2013-02-19.data';
/*	
load data infile '/home/liangj/mysql_partition/top_item_tradingtime_before2013-02-19.data' 
	into table ibbd2.top_item_tradingtime_partition;
	alter table top_item_tradingtime_partition
PARTITION BY RANGE  COLUMNS(date_of)
(PARTITION p2012_11 VALUES LESS THAN ('2012-12-01') ENGINE = InnoDB,
 PARTITION p2012_12 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p2013_01 VALUES LESS THAN ('2013-02-01') ENGINE = InnoDB,
 PARTITION p2013_02 VALUES LESS THAN ('2013-03-01') ENGINE = InnoDB,
 PARTITION p2013_03 VALUES LESS THAN ('2013-04-01') ENGINE = InnoDB,
 PARTITION p2013_04 VALUES LESS THAN ('2013-05-01') ENGINE = InnoDB,
 PARTITION p2013_05 VALUES LESS THAN ('2013-06-01') ENGINE = InnoDB,
 PARTITION p2013_06 VALUES LESS THAN ('2013-07-01') ENGINE = InnoDB,
 PARTITION p2013_07 VALUES LESS THAN ('2013-08-01') ENGINE = InnoDB,
 PARTITION p2013_08 VALUES LESS THAN ('2013-09-01') ENGINE = InnoDB,
 PARTITION p2013_09 VALUES LESS THAN ('2013-10-01') ENGINE = InnoDB,
 PARTITION p2013_10 VALUES LESS THAN ('2013-11-01') ENGINE = InnoDB,
 PARTITION p2013_11 VALUES LESS THAN ('2013-12-01') ENGINE = InnoDB,
 PARTITION p2013_12 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB); 
*
*
*/
/**************/
	
select * from ibbd2.top_item2
	where population_tsmp<'2013-02-19 00:00:00' 
	into outfile '/home/liangj/mysql_partition/top_top_item2_before2013-02-19.data';
	
/*	
load data infile '/home/liangj/mysql_partition/top_item2_before2013-02-19.data' into table ibbd2.top_item2_partition;
*/
/*
 * 
 CREATE TABLE `top_item2_partition2` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '属性更新时间',
  `price` float DEFAULT NULL COMMENT '初始价格',
  `volume` int(11) DEFAULT NULL COMMENT '商品销量',
  `trade_num` int(11) DEFAULT NULL COMMENT '成交笔数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `min_deal_price` float DEFAULT NULL COMMENT '商品最小成交价',
  `avg_deal_price` float DEFAULT NULL COMMENT '商品平均成交价',
  `buyer_num` int(11) DEFAULT NULL COMMENT '购买人数',
  `pct` float DEFAULT NULL COMMENT '客单价',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`item_id`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `shop_id` (`shop_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表2（统计表）'
/*!50500 PARTITION BY RANGE  COLUMNS(date_of)
(PARTITION p2012_11 VALUES LESS THAN ('2012-12-01') ENGINE = InnoDB,
 PARTITION p2012_12 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p2013_01 VALUES LESS THAN ('2013-02-01') ENGINE = InnoDB,
 PARTITION p2013_02 VALUES LESS THAN ('2013-03-01') ENGINE = InnoDB,
 PARTITION p2013_03 VALUES LESS THAN ('2013-04-01') ENGINE = InnoDB,
 PARTITION p2013_04 VALUES LESS THAN ('2013-05-01') ENGINE = InnoDB,
 PARTITION p2013_05 VALUES LESS THAN ('2013-06-01') ENGINE = InnoDB,
 PARTITION p2013_06 VALUES LESS THAN ('2013-07-01') ENGINE = InnoDB,
 PARTITION p2013_07 VALUES LESS THAN ('2013-08-01') ENGINE = InnoDB,
 PARTITION p2013_08 VALUES LESS THAN ('2013-09-01') ENGINE = InnoDB,
 PARTITION p2013_09 VALUES LESS THAN ('2013-10-01') ENGINE = InnoDB,
 PARTITION p2013_10 VALUES LESS THAN ('2013-11-01') ENGINE = InnoDB,
 PARTITION p2013_11 VALUES LESS THAN ('2013-12-01') ENGINE = InnoDB,
 PARTITION p2013_12 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB)
 */
 */	


select * from ibbd2.ststc_cat_shop_sales_detail where population_tsmp<'2013-02-19 00:00:00' into outfile '/home/liangj/mysql_partition/ststc_cat_shop_sales_detail_before2013-02-19.data';
/*	
load data infile '/home/liangj/mysql_partition/ststc_cat_shop_sales_detail_before2013-02-19.data' into table ibbd2.ststc_cat_shop_sales_detail_partition;
*/

select * from ibbd2.ststc_shop_sales_keyword where population_tsmp<'2013-02-19 00:00:00' into outfile '/home/liangj/mysql_partition/ststc_shop_sales_keyword_before2013-02-19.data';
/*	
load data infile '/home/liangj/mysql_partition/ststc_shop_sales_keyword_before2013-02-19.data' into table ibbd2.ststc_shop_sales_keyword_partition;
*/
/*
 * CREATE TABLE `ststc_shop_sales_keyword_partition` (
  `keyword` varchar(20) NOT NULL COMMENT '关键词',
  `user_num_id` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '当期',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易单数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`keyword`,`user_num_id`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `user_num_id` (`user_num_id`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词下店铺每日销售数据'
/*!50500 PARTITION BY RANGE  COLUMNS(date_of)
(PARTITION p2012_11 VALUES LESS THAN ('2012-12-01') ENGINE = InnoDB,
 PARTITION p2012_12 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p2013_01 VALUES LESS THAN ('2013-02-01') ENGINE = InnoDB,
 PARTITION p2013_02 VALUES LESS THAN ('2013-03-01') ENGINE = InnoDB,
 PARTITION p2013_03 VALUES LESS THAN ('2013-04-01') ENGINE = InnoDB,
 PARTITION p2013_04 VALUES LESS THAN ('2013-05-01') ENGINE = InnoDB,
 PARTITION p2013_05 VALUES LESS THAN ('2013-06-01') ENGINE = InnoDB,
 PARTITION p2013_06 VALUES LESS THAN ('2013-07-01') ENGINE = InnoDB,
 PARTITION p2013_07 VALUES LESS THAN ('2013-08-01') ENGINE = InnoDB,
 PARTITION p2013_08 VALUES LESS THAN ('2013-09-01') ENGINE = InnoDB,
 PARTITION p2013_09 VALUES LESS THAN ('2013-10-01') ENGINE = InnoDB,
 PARTITION p2013_10 VALUES LESS THAN ('2013-11-01') ENGINE = InnoDB,
 PARTITION p2013_11 VALUES LESS THAN ('2013-12-01') ENGINE = InnoDB,
 PARTITION p2013_12 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB) */ 
 */


select * from ibbd2.ststc_keyword_shop_pct where population_tsmp<'2013-02-19 00:00:00' into outfile '/home/liangj/mysql_partition/ststc_keyword_shop_pct_before2013-02-19.data';
/*
 CREATE TABLE `ststc_keyword_shop_pct_partition` (
  `keyword` varchar(30) NOT NULL DEFAULT '' COMMENT '关键词类目',
  `wangwang` varchar(50) NOT NULL DEFAULT '' COMMENT '旺旺昵称',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `item_count` int(11) DEFAULT NULL COMMENT '商品数量',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易记录数',
  `volume` int(11) DEFAULT NULL COMMENT '销售件数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `buyer_num` int(11) DEFAULT NULL COMMENT '买家数量',
  `pct` float DEFAULT NULL COMMENT '客单价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`wangwang`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `wangwang` (`wangwang`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词类目下店铺的客单价'
/*!50500 PARTITION BY RANGE  COLUMNS(date_of)
(PARTITION p2012_11 VALUES LESS THAN ('2012-12-01') ENGINE = InnoDB,
 PARTITION p2012_12 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p2013_01 VALUES LESS THAN ('2013-02-01') ENGINE = InnoDB,
 PARTITION p2013_02 VALUES LESS THAN ('2013-03-01') ENGINE = InnoDB,
 PARTITION p2013_03 VALUES LESS THAN ('2013-04-01') ENGINE = InnoDB,
 PARTITION p2013_04 VALUES LESS THAN ('2013-05-01') ENGINE = InnoDB,
 PARTITION p2013_05 VALUES LESS THAN ('2013-06-01') ENGINE = InnoDB,
 PARTITION p2013_06 VALUES LESS THAN ('2013-07-01') ENGINE = InnoDB,
 PARTITION p2013_07 VALUES LESS THAN ('2013-08-01') ENGINE = InnoDB,
 PARTITION p2013_08 VALUES LESS THAN ('2013-09-01') ENGINE = InnoDB,
 PARTITION p2013_09 VALUES LESS THAN ('2013-10-01') ENGINE = InnoDB,
 PARTITION p2013_10 VALUES LESS THAN ('2013-11-01') ENGINE = InnoDB,
 PARTITION p2013_11 VALUES LESS THAN ('2013-12-01') ENGINE = InnoDB,
 PARTITION p2013_12 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB)*/
 */
/*
 load data infile '/home/liangj/mysql_partition/ststc_keyword_shop_pct_before2013-02-19.data' into table ibbd2.ststc_keyword_shop_pct_partition;
 */
select * from ibbd2.ststc_item_rate1 where population_tsmp<'2013-02-19 00:00:00' into outfile '/home/liangj/mysql_partition/ststc_item_rate1_before2013-02-19.data';