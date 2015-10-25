USE ibbd2;
DROP TABLE IF EXISTS `ststc_shop_sale_in`;
DROP TABLE IF EXISTS `ststc_keyword_hot_items`;
DROP TABLE IF EXISTS `ststc_shop_sales_keyword`;
DROP TABLE IF EXISTS `quota_compete_index`;
DROP TABLE IF EXISTS `ststc_cat_dealprice`;
DROP TABLE IF EXISTS `quota_pricesale_index`;
DROP TABLE IF EXISTS `ststc_shop_customers`;
DROP TABLE IF EXISTS `user_privileges`;
DROP TABLE IF EXISTS `user_keywords`;
DROP TABLE IF EXISTS `top_itemsearchresult`;
DROP TABLE IF EXISTS `quota_sale_index`;
DROP TABLE IF EXISTS `ststc_keyword_shop_pct`;
DROP TABLE IF EXISTS `quota_ratescore_table`;
DROP TABLE IF EXISTS `top_shop1`;
DROP TABLE IF EXISTS `top_cat_search_result`;
DROP TABLE IF EXISTS `top_shop2`;
DROP TABLE IF EXISTS `top_item_search_result`;
DROP TABLE IF EXISTS `history_topuser_rfmconfig`;
DROP TABLE IF EXISTS `top_item_pic`;
DROP TABLE IF EXISTS `lib_numlist`;
DROP TABLE IF EXISTS `top_ztc_sum`;
DROP TABLE IF EXISTS `lib_industry_2`;
DROP TABLE IF EXISTS `quota_rate_evaluate`;
DROP TABLE IF EXISTS `ststc_shop_credit`;
DROP TABLE IF EXISTS `log_call_proc`;
DROP TABLE IF EXISTS `lib_rate_library`;
DROP TABLE IF EXISTS `user_keywords_ztc`;
DROP TABLE IF EXISTS `ststc_user_hostitems_7`;
DROP TABLE IF EXISTS `top_item_tradingtime`;
DROP TABLE IF EXISTS `ststc_cat_range_hotshops`;
DROP TABLE IF EXISTS `quota_pct_keyword`;
DROP TABLE IF EXISTS `lib_cat_id`;
DROP TABLE IF EXISTS `ststc_item_rate1`;
DROP TABLE IF EXISTS `ststc_cat_shop_sale`;
DROP TABLE IF EXISTS `lib_industry`;
DROP TABLE IF EXISTS `top_cat_items`;
DROP TABLE IF EXISTS `v_get_cats`;
DROP TABLE IF EXISTS `ststc_ztc_shops`;
DROP TABLE IF EXISTS `ststc_cat_hotshops`;
DROP TABLE IF EXISTS `top_item2`;
DROP TABLE IF EXISTS `ststc_keyword_shop_pct_outdated`;
DROP TABLE IF EXISTS `top_item1`;
DROP TABLE IF EXISTS `top_tiny_shop`;
DROP TABLE IF EXISTS `user_shop_monitor`;
DROP TABLE IF EXISTS `user_item_monitor`;
DROP TABLE IF EXISTS `user2`;
DROP TABLE IF EXISTS `ststc_user_hot_items`;
DROP TABLE IF EXISTS `ststc_shop_pct_nokeyword`;
DROP TABLE IF EXISTS `ststc_shop_multi_buyer`;
DROP TABLE IF EXISTS `ststc_keyword_reporter`;
DROP TABLE IF EXISTS `top_user`;
DROP TABLE IF EXISTS `top_item_buyer`;
DROP TABLE IF EXISTS `quota_shop_credit`;
DROP TABLE IF EXISTS `v_verify_master_keywords_plan`;
DROP TABLE IF EXISTS `lib_province_map`;
DROP TABLE IF EXISTS `quota_tradingtime_aly`;
DROP TABLE IF EXISTS `ststc_shop_recommend_items`;
DROP TABLE IF EXISTS `ststc_cat_shop_sales_detail`;
DROP TABLE IF EXISTS `lib_datelist`;
DROP TABLE IF EXISTS `ststc_price_keyword`;
DROP PROCEDURE IF EXISTS `sp_top_shop1`;
DROP PROCEDURE IF EXISTS `sp_top_shop2`;
DROP PROCEDURE IF EXISTS `sp_quota_sale_index`;
DROP PROCEDURE IF EXISTS `sp_top_tiny_shop`;
DROP PROCEDURE IF EXISTS `sp_ststc_cat_shop_sales_detail`;
DROP PROCEDURE IF EXISTS `sp_quota_compete_index`;
DROP PROCEDURE IF EXISTS `sp_insert_top_tiny_shop`;
DROP PROCEDURE IF EXISTS `sp_top_item_buyer`;
DROP PROCEDURE IF EXISTS `sp_quota_pricesale_index`;
DROP PROCEDURE IF EXISTS `sp_clear_ibbd2_etl`;
DROP PROCEDURE IF EXISTS `sp_top_item_search_result`;
DROP PROCEDURE IF EXISTS `sp_quota_tradingtime_aly`;
DROP PROCEDURE IF EXISTS `sp_top_itemsearchresult`;
DROP PROCEDURE IF EXISTS `sp_ststc_cat_shop_sale`;
DROP PROCEDURE IF EXISTS `sp_ststc_cat_hotshops`;
DROP PROCEDURE IF EXISTS `sp_ststc_keyword_shop_pct`;
DROP PROCEDURE IF EXISTS `sp_ststc_shop_multi_buyer`;
DROP PROCEDURE IF EXISTS `sp_ststc_user_hostitems_7`;
DROP PROCEDURE IF EXISTS `sp_insert_date`;
DROP PROCEDURE IF EXISTS `sp_insert_num`;
DROP PROCEDURE IF EXISTS `sp_quota_pct_keyword`;
DROP PROCEDURE IF EXISTS `sp_ststc_price_keyword`;
DROP PROCEDURE IF EXISTS `sp_ststc_keyword_shop_pct_outdated`;
DROP PROCEDURE IF EXISTS `sp_ststc_cat_dealprice`;
DROP PROCEDURE IF EXISTS `sp_top_item2`;
DROP PROCEDURE IF EXISTS `sp_top_item1`;
DROP PROCEDURE IF EXISTS `sp_top_item_tradingtime`;
DROP PROCEDURE IF EXISTS `sp_select_table_size`;
DROP PROCEDURE IF EXISTS `sp_ststc_cat_range_hotshops`;
DROP PROCEDURE IF EXISTS `sp_ststc_shop_pct_nokeyword`;
DROP PROCEDURE IF EXISTS `sp_ststc_keyword_hot_items`;
DROP PROCEDURE IF EXISTS `sp_top_cat_items`;
DROP PROCEDURE IF EXISTS `sp_ststc_shop_sale_in`;
DROP PROCEDURE IF EXISTS `sp_top_cat_search_result`;
DROP PROCEDURE IF EXISTS `sp_top_shop_items`;
DROP PROCEDURE IF EXISTS `sp_ibbd2_etl`;
DROP PROCEDURE IF EXISTS `sp_lib_cat_id`;
DROP PROCEDURE IF EXISTS `sp_ststc_item_rate1`;
DROP PROCEDURE IF EXISTS `sp_ststc_shop_sales_keyword`;
DROP PROCEDURE IF EXISTS `sp_quota_shop_credit`;
CREATE TABLE `ststc_shop_sale_in` (
  `user_num_id` varchar(30) NOT NULL COMMENT '店铺用户ID',
  `shop_id` varchar(30) DEFAULT '' COMMENT '店铺ID',
  `wangwang` varchar(100) DEFAULT '' COMMENT '旺旺昵称',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `volume` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `sales` float(10,1) NOT NULL DEFAULT '0.0' COMMENT '销售额',
  `trade_num` int(11) NOT NULL DEFAULT '0' COMMENT '交易单数',
  `pct` float(10,1) NOT NULL DEFAULT '0.0' COMMENT '客单价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user_num_id`,`date_of`),
  KEY `user_num_id` (`user_num_id`),
  KEY `shop_id` (`shop_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——店铺每日销售数据(商品为监控列表中的商品)';

CREATE TABLE `ststc_keyword_hot_items` (
  `keyword` varchar(30) DEFAULT NULL COMMENT '关键词类目',
  `from_date` date DEFAULT NULL COMMENT '日期区间',
  `to_date` date DEFAULT NULL COMMENT '日期区间',
  `item_id` varchar(30) DEFAULT NULL COMMENT '商品ID',
  `user_num_id` varchar(30) DEFAULT NULL COMMENT '店铺用户ID',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易次数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `keyword` (`keyword`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `item_id` (`item_id`),
  KEY `user_num_id` (`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——关键词下热销商品列表';

CREATE TABLE `ststc_shop_sales_keyword` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词下店铺每日销售数据';

CREATE TABLE `quota_compete_index` (
  `keyword` varchar(20) DEFAULT NULL COMMENT '关键词',
  `date_of` date DEFAULT NULL COMMENT '当期',
  `compete_index` float DEFAULT NULL COMMENT '竞争指数',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  KEY `keyword` (`keyword`,`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-竞争指数(暂时弃用)';

CREATE TABLE `ststc_cat_dealprice` (
  `keyword` varchar(50) NOT NULL COMMENT '关键词',
  `date_of` date NOT NULL COMMENT '日期',
  `avg_dealprice` float(10,2) NOT NULL COMMENT '平均成交价',
  `min_dealprice` float(10,2) NOT NULL COMMENT '最低成交价',
  `max_dealprice` float(10,2) NOT NULL COMMENT '最高成交价',
  `item_count` int(11) NOT NULL COMMENT '商品数量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目下商品的平均成交价';

CREATE TABLE `quota_pricesale_index` (
  `keyword` varchar(20) DEFAULT NULL COMMENT '关键词',
  `date_of` date DEFAULT NULL COMMENT '当期',
  `base_date` date DEFAULT NULL COMMENT '基期',
  `price_index` float DEFAULT NULL COMMENT '价格指数',
  `sale_index` float DEFAULT NULL COMMENT '销售指数',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  KEY `keyword` (`keyword`,`date_of`,`base_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-价格销售指数表(暂时弃用)';

CREATE TABLE `ststc_shop_customers` (
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '旺旺昵称',
  `buyer_id` varchar(20) DEFAULT NULL COMMENT '买家ID',
  `buyer_nick` varchar(50) DEFAULT NULL COMMENT '买家昵称',
  `lastest_trade_time` datetime DEFAULT NULL COMMENT '最近一次交易时间',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易次数',
  `trade_sales` float DEFAULT NULL COMMENT '交易金额（不准确）',
  KEY `user_num_id` (`user_num_id`),
  KEY `buyer_id` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-店铺的买家列表';

CREATE TABLE `user_privileges` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `account_type` varchar(10) NOT NULL DEFAULT 'S' COMMENT '账户类型（公共用户P、私人用户S，管理员A）',
  `level` varchar(5) NOT NULL DEFAULT '' COMMENT '级别',
  `vip` int(11) NOT NULL DEFAULT '0' COMMENT 'VIP级别',
  `cats_limit` int(11) NOT NULL DEFAULT '5' COMMENT '自定义类目数量限制',
  `shop_limit` int(11) NOT NULL DEFAULT '3' COMMENT '监控店铺数量限制',
  `item_limit` int(11) NOT NULL DEFAULT '10' COMMENT '监控商品数量限制',
  `ztc_limit` int(11) NOT NULL DEFAULT '-1',
  `balance` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`),
  KEY `level` (`level`),
  KEY `vip` (`vip`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表-权限';

CREATE TABLE `user_keywords` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `keyword` varchar(50) NOT NULL DEFAULT '' COMMENT '关键词',
  `min_price` float DEFAULT NULL COMMENT '最低价格',
  `max_price` float DEFAULT NULL COMMENT '最高价格',
  `location` varchar(200) DEFAULT NULL COMMENT '商品所在地区',
  `min_sale` float DEFAULT NULL COMMENT '最小销售额筛选',
  `status` varchar(5) DEFAULT NULL COMMENT '状态',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`keyword`),
  KEY `user` (`user`),
  KEY `keyword` (`keyword`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表-关键词配置表';

CREATE TABLE `top_itemsearchresult` (
  `keyword` varchar(20) NOT NULL COMMENT '搜索关键词',
  `rank` int(11) DEFAULT NULL COMMENT '排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(250) NOT NULL COMMENT '商品名称',
  `item_pic` varchar(200) DEFAULT 'NULL' COMMENT '商品图片',
  `wangwang` varchar(100) NOT NULL COMMENT '旺旺昵称',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `price` float NOT NULL COMMENT '商品标价',
  `location` varchar(50) NOT NULL COMMENT '商品所在地',
  `volume` int(11) NOT NULL COMMENT '最近销量',
  `rate_num` int(11) NOT NULL COMMENT '商品评论量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `population_tsmp` (`population_tsmp`),
  KEY `keyword` (`keyword`),
  KEY `rank` (`rank`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品搜索结果表';

CREATE TABLE `quota_sale_index` (
  `keyword` varchar(20) NOT NULL DEFAULT '' COMMENT '关键词',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '城市',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '指标时间戳',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`province`,`city`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `province` (`province`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-销售额';

CREATE TABLE `ststc_keyword_shop_pct` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词类目下店铺的客单价';

CREATE TABLE `quota_ratescore_table` (
  `keyword` varchar(20) NOT NULL COMMENT '关键词',
  `date_of` date NOT NULL COMMENT '当期',
  `rank` int(11) DEFAULT NULL COMMENT '关键词下排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(250) NOT NULL COMMENT '商品名称',
  `item_pic` varchar(200) NOT NULL COMMENT '商品图片地址',
  `wangwang` varchar(200) NOT NULL COMMENT '店铺旺旺',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `score` float NOT NULL COMMENT '加权得分',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `keyword` (`keyword`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词下商品评论得分';

CREATE TABLE `top_shop1` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `shop_name` varchar(100) DEFAULT 'NULL' COMMENT '店铺名称',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '旺旺昵称',
  `shop_type` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_rank` varchar(10) DEFAULT NULL COMMENT '店铺信用评级',
  `location` varchar(15) DEFAULT NULL COMMENT '所在地',
  `location2` varchar(20) DEFAULT NULL COMMENT '修正地区',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `location` (`location`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `shop_name` (`shop_name`),
  KEY `wangwang` (`wangwang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝店铺表1';

CREATE TABLE `top_cat_search_result` (
  `keyword` varchar(20) NOT NULL COMMENT '搜索关键词',
  `rank` int(11) DEFAULT NULL COMMENT '排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(250) NOT NULL COMMENT '商品名称',
  `item_pic` varchar(200) DEFAULT 'NULL' COMMENT '商品图片',
  `wangwang` varchar(100) NOT NULL COMMENT '旺旺昵称',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `price` float NOT NULL COMMENT '商品标价',
  `location` varchar(50) NOT NULL COMMENT '商品所在地',
  `volume` int(11) NOT NULL COMMENT '最近销量',
  `rate_num` int(11) NOT NULL COMMENT '商品评论量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`item_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `keyword` (`keyword`),
  KEY `rank` (`rank`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品搜索结果表';

CREATE TABLE `top_shop2` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `date_of` date DEFAULT NULL,
  `item_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `lastest_trade_num` int(11) DEFAULT NULL COMMENT '最近订单数',
  `lastest_sale` float DEFAULT NULL COMMENT '最近销售额',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  KEY `population_tsmp` (`population_tsmp`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `item_num` (`item_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝店铺表2';

CREATE TABLE `top_item_search_result` (
  `keyword` varchar(20) NOT NULL COMMENT '搜索关键词',
  `rank` int(11) DEFAULT NULL COMMENT '排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(250) NOT NULL COMMENT '商品名称',
  `item_pic` varchar(200) DEFAULT 'NULL' COMMENT '商品图片',
  `wangwang` varchar(100) NOT NULL COMMENT '旺旺昵称',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `price` float NOT NULL COMMENT '商品标价',
  `location` varchar(50) NOT NULL COMMENT '商品所在地',
  `volume` int(11) NOT NULL COMMENT '最近销量',
  `rate_num` int(11) NOT NULL COMMENT '商品评论量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`item_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `keyword` (`keyword`),
  KEY `rank` (`rank`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品搜索结果表';

CREATE TABLE `history_topuser_rfmconfig` (
  `top_nick` varchar(50) NOT NULL COMMENT '淘宝昵称',
  `r` int(11) NOT NULL COMMENT 'R值',
  `f` int(11) NOT NULL COMMENT 'F值',
  `m` int(11) NOT NULL COMMENT 'M值',
  `rw` float NOT NULL COMMENT 'R权重',
  `fw` float NOT NULL COMMENT 'F权重',
  `mw` float NOT NULL COMMENT 'M权重',
  `lmin` int(11) NOT NULL COMMENT 'L最小值',
  `lmax` int(11) NOT NULL COMMENT 'L最大值',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `top_nick` (`top_nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史表——淘宝用户最后一次RFM计算表';

CREATE TABLE `top_item_pic` (
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `item_img` varchar(100) DEFAULT NULL COMMENT '宝贝图片',
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lib_numlist` (
  `num` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `top_ztc_sum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '暂定使用item_id',
  `keyword` varchar(30) NOT NULL COMMENT '关键词',
  `key` varchar(50) NOT NULL COMMENT '搜索词',
  `item_id` bigint(20) NOT NULL COMMENT '商品id',
  `avg_rank` int(11) NOT NULL COMMENT '评价排名',
  `lastest_tsmp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `shop_id` varchar(255) DEFAULT NULL COMMENT '卖家用户ID',
  PRIMARY KEY (`id`),
  KEY `index_item` (`item_id`),
  KEY `index_test` (`keyword`,`lastest_tsmp`,`shop_id`,`item_id`,`avg_rank`),
  KEY `index_keyword_tsmp` (`keyword`,`lastest_tsmp`)
) ENGINE=InnoDB AUTO_INCREMENT=21538228097 DEFAULT CHARSET=utf8 COMMENT='直通车排名';

CREATE TABLE `lib_industry_2` (
  `cat` varchar(50) NOT NULL DEFAULT '' COMMENT '行业类目',
  `industry` varchar(100) NOT NULL DEFAULT '' COMMENT '行业名称',
  PRIMARY KEY (`cat`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库——类目行业表';

CREATE TABLE `quota_rate_evaluate` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `rate_id` varchar(30) DEFAULT NULL COMMENT '评价ID',
  `rate_time` datetime DEFAULT NULL COMMENT '评论时间',
  `content` varchar(500) NOT NULL COMMENT '评价内容',
  `theme` varchar(20) DEFAULT NULL COMMENT '评论主题',
  `appraisal` varchar(20) DEFAULT NULL COMMENT '评价词',
  `score` int(11) DEFAULT NULL COMMENT '主题得分',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `shop_id` (`shop_id`,`user_num_id`,`item_id`,`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计算结果表-评论得分评估表';

CREATE TABLE `ststc_shop_credit` (
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `shop_name` varchar(100) DEFAULT 'NULL' COMMENT '店铺名称',
  `shop_type` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `credit_level` varchar(10) DEFAULT NULL COMMENT '信用级别',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  KEY `province` (`province`),
  KEY `user_num_id` (`user_num_id`),
  KEY `credit_level` (`credit_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-店铺信用级别表';

CREATE TABLE `log_call_proc` (
  `db_name` varchar(20) DEFAULT NULL COMMENT '数据库名称',
  `sp_name` varchar(100) DEFAULT NULL COMMENT 'SP名称',
  `param_type` varchar(20) DEFAULT NULL COMMENT '参数类型',
  `param_val` varchar(20) DEFAULT NULL COMMENT '参数值',
  `start_time` datetime DEFAULT NULL COMMENT '调用开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '调用结束时间',
  `status` varchar(5) DEFAULT NULL COMMENT '运行状态 R S F',
  `rows` int(11) DEFAULT NULL COMMENT '受影响的行数',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  KEY `db_name` (`db_name`),
  KEY `sp_name` (`sp_name`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SP调用日志';

CREATE TABLE `lib_rate_library` (
  `industry` varchar(20) NOT NULL COMMENT '关键词',
  `theme` varchar(20) DEFAULT NULL COMMENT '主题',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `appraisal` varchar(20) DEFAULT NULL COMMENT '评论词',
  `score` int(11) DEFAULT NULL COMMENT '评价词得分',
  KEY `industry` (`industry`,`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库-评论关键词得分表';

CREATE TABLE `user_keywords_ztc` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户',
  `keyword` varchar(50) NOT NULL DEFAULT '' COMMENT '关键词',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户直通车监控配置';

CREATE TABLE `ststc_user_hostitems_7` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `date_of` date DEFAULT NULL COMMENT '日期',
  `item_id` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `item_name` varchar(250) DEFAULT NULL COMMENT '商品名称',
  `item_pic` varchar(200) DEFAULT 'NULL' COMMENT '商品图片',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `wangwang` varchar(100) DEFAULT NULL COMMENT '旺旺昵称',
  `volume` int(32) DEFAULT NULL COMMENT '销量',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户监控列表最近7天热销商品';

CREATE TABLE `top_item_tradingtime` (
  `item_id` varchar(20) NOT NULL DEFAULT '' COMMENT '商品ID',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `hour_of` int(11) NOT NULL DEFAULT '0' COMMENT '小时',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`,`date_of`,`hour_of`),
  KEY `item_id` (`item_id`),
  KEY `date_of` (`date_of`),
  KEY `hour_of` (`hour_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表-交易时段表';

CREATE TABLE `ststc_cat_range_hotshops` (
  `keyword` varchar(30) NOT NULL DEFAULT '' COMMENT '类目',
  `from_date` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `to_date` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `wangwang` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺旺旺昵称',
  `item_amount` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `volume` int(11) NOT NULL DEFAULT '0' COMMENT '销售量',
  `trade_num` int(11) NOT NULL DEFAULT '0' COMMENT '交易单数',
  `sales` float(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`from_date`,`to_date`,`shop_id`),
  KEY `keyword` (`keyword`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目下时间区间内的热销店铺';

CREATE TABLE `quota_pct_keyword` (
  `keyword` varchar(20) NOT NULL COMMENT '关键词',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '当期',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易单数',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `pct` float DEFAULT NULL COMMENT '客单价',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`keyword`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-关键词客单价';

CREATE TABLE `lib_cat_id` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `cat_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类目名称',
  PRIMARY KEY (`cat_id`),
  KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8 COMMENT='知识库-类目ID表';

CREATE TABLE `ststc_item_rate1` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `rate_id` varchar(40) NOT NULL COMMENT '评论ID',
  `rate_date` datetime NOT NULL COMMENT '评论时间',
  `nick` varchar(20) NOT NULL COMMENT '评论人昵称',
  `user_id` varchar(20) NOT NULL DEFAULT '' COMMENT '评论人ID',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`item_id`,`rate_id`),
  KEY `rate_date` (`rate_date`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-商品评价统计';

CREATE TABLE `ststc_cat_shop_sale` (
  `keyword` varchar(30) NOT NULL DEFAULT '' COMMENT '关键词类目',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `user_num_id` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `volume` int(11) DEFAULT NULL COMMENT '销售件数',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易次数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`,`user_num_id`),
  KEY `date_of` (`date_of`),
  KEY `user_num_id` (`user_num_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目搜索范围内店铺的销售情况';

CREATE TABLE `lib_industry` (
  `industry` varchar(100) DEFAULT NULL COMMENT '行业名称',
  KEY `industry` (`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库——行业表';

CREATE TABLE `top_cat_items` (
  `keyword` varchar(30) NOT NULL DEFAULT '' COMMENT '类目',
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '卖家用户ID',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`item_id`),
  KEY `keyword` (`keyword`),
  KEY `item_id` (`item_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目下商品列表';

CREATE ALGORITHM=UNDEFINED DEFINER=`ibbd`@`%` SQL SECURITY DEFINER VIEW `v_get_cats` AS select distinct `top_cat_items`.`keyword` AS `keyword` from `top_cat_items`;

CREATE TABLE `ststc_ztc_shops` (
  `keyword` varchar(20) DEFAULT NULL COMMENT '关键词',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '卖家用户ID',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '掌柜昵称',
  KEY `keyword` (`keyword`),
  KEY `user_num_id` (`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品表';

CREATE TABLE `ststc_cat_hotshops` (
  `keyword` varchar(30) NOT NULL DEFAULT '' COMMENT '类目',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `wangwang` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺旺旺昵称',
  `item_amount` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `volume` int(11) NOT NULL DEFAULT '0' COMMENT '销售量',
  `trade_num` int(11) NOT NULL DEFAULT '0' COMMENT '交易单数',
  `sales` float(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`,`shop_id`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目下的热销店铺Top20';

CREATE TABLE `top_item2` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表2（统计表）';

CREATE TABLE `ststc_keyword_shop_pct_outdated` (
  `keyword` varchar(30) NOT NULL COMMENT '关键词类目',
  `wangwang` varchar(50) NOT NULL COMMENT '旺旺昵称',
  `date_of` date NOT NULL COMMENT '日期',
  `item_count` int(11) NOT NULL COMMENT '商品数量',
  `trade_num` int(11) NOT NULL COMMENT '交易记录数',
  `volume` int(11) NOT NULL COMMENT '销售件数',
  `sales` float NOT NULL COMMENT '销售额',
  `buyer_num` int(11) NOT NULL COMMENT '买家数量',
  `pct` float NOT NULL COMMENT '客单价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `keyword` (`keyword`),
  KEY `wangwang` (`wangwang`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词类目下店铺的客单价';

CREATE TABLE `top_item1` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `shop_id` varchar(20) NOT NULL COMMENT '店铺ID',
  `shop_type` varchar(20) NOT NULL COMMENT '所属店铺类型',
  `date_of` datetime NOT NULL COMMENT '属性更新时间',
  `price` float NOT NULL DEFAULT '0' COMMENT '商品发布价格',
  `title` varchar(250) NOT NULL COMMENT '商品标题',
  `location` varchar(20) NOT NULL COMMENT '商品所在地',
  `location2` varchar(20) NOT NULL COMMENT '修正地址',
  `brand` varchar(30) NOT NULL COMMENT '商品品牌',
  `item_img` varchar(100) NOT NULL COMMENT '商品图片',
  `volume_month` int(11) NOT NULL DEFAULT '0' COMMENT '月销量',
  `volume_all` int(11) NOT NULL DEFAULT '0' COMMENT '总销量',
  `cid` varchar(20) NOT NULL COMMENT '类目',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`item_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `shop_id` (`shop_id`),
  KEY `date_of` (`date_of`),
  KEY `location` (`location`),
  KEY `location2` (`location2`),
  KEY `brand` (`brand`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表1';

CREATE TABLE `top_tiny_shop` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `user_num_id` varchar(20) NOT NULL DEFAULT '',
  `wangwang` varchar(255) DEFAULT NULL COMMENT '店铺旺旺',
  PRIMARY KEY (`id`,`user_num_id`),
  KEY `wangwang_id` (`wangwang`,`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单的店铺表，可能数据不全';

CREATE TABLE `user_shop_monitor` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `shop_link` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺链接',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `user_num_id` varchar(30) DEFAULT NULL COMMENT '店铺用户ID',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user`,`shop_link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-店铺监控表';

CREATE TABLE `user_item_monitor` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `item_title` varchar(250) DEFAULT NULL COMMENT '商品名称',
  `item_pic` varchar(300) DEFAULT NULL COMMENT '商品图片',
  `wangwang` varchar(100) DEFAULT NULL COMMENT '卖家',
  `source` varchar(50) DEFAULT NULL COMMENT '监控来源',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`item_id`),
  KEY `wangwang` (`wangwang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户商品监控配置';

CREATE TABLE `user2` (
  `user` varchar(20) NOT NULL COMMENT '用户名',
  `passwd` varchar(30) NOT NULL COMMENT '登陆密码',
  `nick` varchar(30) NOT NULL COMMENT '用户昵称',
  `email` varchar(50) NOT NULL COMMENT '用户注册邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系信息',
  `shop_link` varchar(50) DEFAULT NULL COMMENT '店铺域名',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '用户店铺旺旺',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `shop_uid` varchar(30) DEFAULT NULL COMMENT '用户淘宝店铺ID',
  `location` varchar(20) DEFAULT NULL COMMENT '用户所在地',
  `industry` varchar(50) DEFAULT NULL COMMENT '用户所在行业',
  `create_time` datetime NOT NULL COMMENT '用户注册时间',
  `status` varchar(5) NOT NULL COMMENT '账户状态',
  `unused` varchar(200) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='IBBD-用户表';

CREATE TABLE `ststc_user_hot_items` (
  `user` varchar(30) DEFAULT NULL COMMENT '用户',
  `from_date` date DEFAULT NULL COMMENT '日期区间',
  `to_date` date DEFAULT NULL COMMENT '日期区间',
  `item_id` varchar(30) DEFAULT NULL COMMENT '商品ID',
  `user_num_id` varchar(30) DEFAULT NULL COMMENT '店铺用户ID',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易次数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `keyword` (`user`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `item_id` (`item_id`),
  KEY `user_num_id` (`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——关键词下热销商品列表';

CREATE TABLE `ststc_shop_pct_nokeyword` (
  `shop_id` varchar(20) NOT NULL DEFAULT '',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `sales` int(11) DEFAULT NULL,
  `buyer_num` int(11) DEFAULT NULL,
  `trade_num` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `item_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量（多少商品当天有销量）',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`shop_id`,`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客单价店铺统计表，不具有关键词信息';

CREATE TABLE `ststc_shop_multi_buyer` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `date_of` date DEFAULT NULL COMMENT '日期',
  `identifier` varchar(30) DEFAULT NULL COMMENT '买家识别标志',
  `buyer_id` varchar(20) DEFAULT NULL COMMENT '买家ID',
  `iids` varchar(300) NOT NULL COMMENT '购买ID列表',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `shop_id` (`shop_id`,`user_num_id`,`identifier`,`buyer_id`,`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-店铺内组合买家购买列表';

CREATE TABLE `ststc_keyword_reporter` (
  `keyword` varchar(30) NOT NULL DEFAULT '' COMMENT '类目',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `b_shop_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'B店店铺数量',
  `c_shop_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'C点店铺数量',
  `b_item_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'B店商品数量',
  `c_item_amount` int(11) NOT NULL DEFAULT '0' COMMENT 'C店商品数量',
  `volume` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `trade_num` int(11) NOT NULL DEFAULT '0' COMMENT '交易单数',
  `avg_price` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '平均价格',
  `sales` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售额',
  `pct` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '客单价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目统计报表';

CREATE TABLE `top_user` (
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户公开ID',
  `nick` varchar(20) DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `state` varchar(20) DEFAULT NULL COMMENT '用户所在省市',
  `city` varchar(20) DEFAULT NULL COMMENT '用户所在地',
  `created` datetime DEFAULT NULL COMMENT '用户创建时间',
  `last_visit` datetime DEFAULT NULL COMMENT '用户最后访问时间',
  `buyer_credit_good_num` int(11) DEFAULT NULL COMMENT '收到的好评总条数',
  `buyer_credit_level` int(11) DEFAULT NULL COMMENT '买家信用等级',
  `buyer_credit_score` int(11) DEFAULT NULL COMMENT '买家信用总分',
  `buyer_credit_total_num` int(11) DEFAULT NULL COMMENT '收到的评价总条数',
  `update_status` varchar(5) DEFAULT NULL COMMENT '更新计划状态',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  KEY `user_id` (`user_id`),
  KEY `update_status` (`update_status`),
  KEY `nick` (`nick`),
  KEY `gender` (`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝用户表';

CREATE TABLE `top_item_buyer` (
  `item_id` varchar(20) NOT NULL COMMENT '..ID',
  `date_of` date DEFAULT NULL COMMENT '..',
  `nick` varchar(20) DEFAULT NULL COMMENT '..',
  `rank` varchar(20) DEFAULT NULL COMMENT '....',
  `identifier` varchar(20) DEFAULT NULL COMMENT '.....',
  `trade_num` int(11) DEFAULT NULL COMMENT '....',
  `volume` int(11) DEFAULT NULL COMMENT '....',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '...',
  KEY `item_id` (`item_id`,`date_of`,`nick`,`rank`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品买家列表';

CREATE TABLE `quota_shop_credit` (
  `keyword` varchar(20) NOT NULL DEFAULT '' COMMENT '关键词',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '城市',
  `credit_level` varchar(10) NOT NULL DEFAULT '' COMMENT '信用级别',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `shop_name` varchar(100) DEFAULT 'NULL' COMMENT '店铺名称',
  `shop_type` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`province`,`city`,`credit_level`,`user_num_id`),
  KEY `keyword` (`keyword`),
  KEY `province` (`province`),
  KEY `credit_level` (`credit_level`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-店铺信用级别表';

CREATE ALGORITHM=UNDEFINED DEFINER=`ibbd`@`%` SQL SECURITY DEFINER VIEW `v_verify_master_keywords_plan` AS select 'userdefined_keywords_num' AS `userdefined_keywords_num`,count(distinct `ibbd2`.`user_keywords`.`keyword`) AS `COUNT(DISTINCT (keyword))`,curdate() AS `CURDATE()` from `ibbd2`.`user_keywords` where (`ibbd2`.`user_keywords`.`status` = '1') union select 'plan_keywords_num' AS `plan_keywords_num`,count(distinct `topspider`.`top_itemsearchresult`.`keyword`) AS `COUNT(DISTINCT (keyword))`,cast(`topspider`.`top_itemsearchresult`.`population_tsmp` as date) AS `DATE(population_tsmp)` from `topspider`.`top_itemsearchresult` where (cast(`topspider`.`top_itemsearchresult`.`population_tsmp` as date) = curdate());

CREATE TABLE `lib_province_map` (
  `province_en` varchar(20) NOT NULL COMMENT '省份英文名',
  `province_cn` varchar(20) DEFAULT NULL COMMENT '省份中文名',
  `province_cn2` varchar(20) DEFAULT NULL COMMENT '省份中文简写',
  KEY `province_en` (`province_en`),
  KEY `province_cn` (`province_cn`),
  KEY `province_cn2` (`province_cn2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库-省份中英文对照表';

CREATE TABLE `quota_tradingtime_aly` (
  `keyword` varchar(20) NOT NULL DEFAULT '' COMMENT '关键词',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '当期',
  `hour_of` int(11) NOT NULL DEFAULT '0' COMMENT '小时',
  `volume` int(11) DEFAULT NULL COMMENT '销售量',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`keyword`,`date_of`,`hour_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `hour_of` (`hour_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-交易时段结果表';

CREATE TABLE `ststc_shop_recommend_items` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `date_of` date DEFAULT NULL COMMENT '日期',
  `iid1` varchar(20) NOT NULL COMMENT '商品1',
  `iid2` varchar(20) NOT NULL COMMENT '商品2',
  `sup` float NOT NULL COMMENT '支持度',
  `trade_num` int(11) NOT NULL COMMENT '组合成交笔数',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `shop_id` (`shop_id`,`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关联推荐结果表';

CREATE TABLE `ststc_cat_shop_sales_detail` (
  `keyword` varchar(30) NOT NULL COMMENT '关键词类目',
  `date_of` date NOT NULL COMMENT '日期',
  `user_num_id` varchar(30) NOT NULL COMMENT '店铺用户ID',
  `wangwang` varchar(50) NOT NULL COMMENT '卖家旺旺昵称',
  `province` varchar(20) NOT NULL COMMENT '省份',
  `city` varchar(20) NOT NULL COMMENT '城市',
  `volume` int(11) NOT NULL COMMENT '销售件数',
  `trade_num` int(11) NOT NULL COMMENT '交易次数',
  `sales` float NOT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`,`user_num_id`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `user_id` (`user_num_id`),
  KEY `province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目&店铺销售统计表';

CREATE TABLE `lib_datelist` (
  `date_of` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ststc_price_keyword` (
  `keyword` varchar(20) NOT NULL COMMENT '关键词',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '当期',
  `avg_price` float DEFAULT NULL COMMENT '平均价',
  `max_price` float DEFAULT NULL COMMENT '最高价',
  `min_price` float DEFAULT NULL COMMENT '最低价',
  `item_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词下价格统计信息';

DELIMITER $$
USE `ibbd2`$$
CREATE PROCEDURE `sp_top_shop1`(inDateOf DATE)
    COMMENT '对淘宝店铺基本信息做ETL操作'
BEGIN
      -- 更新ibbd2.top_shop1中店铺的信用信息

      UPDATE ibbd2.top_shop1 T1,
             (SELECT T3.shop_id, T3.user_id, T3.shop_rank
                FROM    topspider.top_shop T3
                     LEFT JOIN
                        ibbd2.top_shop1 T4
                     ON     T3.shop_id = T4.shop_id
                        AND T3.user_id = T4.user_num_id
               WHERE     T3.population_tsmp > inDateOf
                     AND T4.shop_id IS NOT NULL) T2
         SET T1.shop_rank = T2.shop_rank, population_tsmp = NOW()
       WHERE T1.shop_id = T2.shop_id AND T1.user_num_id = T2.user_id;



      -- 插入topspider.top_shop中新增加的店铺

      INSERT IGNORE INTO ibbd2.top_shop1
         SELECT T1.shop_id,
                T1.user_id,
                T1.shop_name,
                T1.wangwang,
                T1.shop_type,
                T1.shop_rank,
                T1.location,
                NULL,
                NOW()
           FROM    topspider.top_shop T1
                LEFT JOIN
                   ibbd2.top_shop1 T2
                ON T1.shop_id = T2.shop_id AND T1.user_id = T2.user_num_id
          WHERE T1.population_tsmp > inDateOf AND T2.shop_id IS NULL
         GROUP BY T1.shop_id, T1.user_id;

      -- 更新集市店铺的店铺地址

      UPDATE ibbd2.top_shop1 T1,
             (SELECT T1.shop_id, T1.location, T1.location2
                FROM    ibbd2.top_item1 T1
                     LEFT JOIN
                        ibbd2.top_shop1 T2
                     ON T1.shop_id = T2.shop_id AND T2.location IS NULL
               WHERE     T1.location IS NOT NULL
                     AND T1.population_tsmp > inDateOf) T2
         SET T1.location = T2.location, T1.location2 = T2.location2
       WHERE T1.shop_id = T2.shop_id;



      -- 更新店铺的地址格式到location2



      UPDATE ibbd2.top_shop1
         SET location =
                REPLACE(REPLACE(REPLACE(location, '省份', ''), '省', ''),
                        '市',
                        '')
       WHERE population_tsmp > inDateOf;



      UPDATE ibbd2.top_shop1
         SET location = REPLACE(REPLACE(location, ',', ''), ' ', '')
       WHERE population_tsmp > inDateOf;



      UPDATE ibbd2.top_shop1
         SET location2 =
                CASE
                   WHEN SUBSTRING(location, 1, 2) IN
                           ('北京', '上海', '重庆')
                   THEN
                      SUBSTRING(location, 1, 2)
                   WHEN SUBSTRING(RPAD(location, '3', ' '), 1, 3) IN
                           ('黑龙江', '内蒙古')
                   THEN
                      CONCAT(SUBSTRING(RPAD(location, '3', ' '), 1, 3),
                             ' ',
                             SUBSTRING(location, 4))
                   ELSE
                      CONCAT(SUBSTRING(location, 1, 2),
                             ' ',
                             SUBSTRING(location, 3))
                END
       WHERE population_tsmp > inDateOf;
   END$$

CREATE PROCEDURE `sp_top_shop2`(date_of DATE)
    COMMENT '对淘宝店铺交易信息做ETL操作'
BEGIN

      INSERT INTO ibbd2.top_shop2

         SELECT shop_id,

                user_id,

                DATE(population_tsmp),

                COUNT(DISTINCT (item_id)),

                SUM(item_sales),

                SUM(item_price * item_sales),

                NOW()

           FROM (SELECT shop_id,

                        user_id,

                        item_id,

                        item_sales,

                        item_price,

                        population_tsmp

                   FROM topspider.top_allitem_info

                   WHERE DATE(population_tsmp)=date_of

                 GROUP BY shop_id, user_id, item_id) T

         GROUP BY shop_id, user_id, DATE(population_tsmp);

   END$$

CREATE PROCEDURE `sp_quota_sale_index`(inDateOf DATE)
    COMMENT '计算所有关键词的销售额指数'
BEGIN
      INSERT IGNORE INTO ibbd2.quota_sale_index
         SELECT T.keyword,
                T.province,
                T.city,
                T.dateOf,
                T.sales,
                NOW()
           FROM (SELECT T1.keyword,
                        SUBSTRING_INDEX(T2.location2, ' ', 1) AS province,
                        SUBSTRING_INDEX(T2.location2, ' ', -1) AS city,
                        T3.date_of AS dateOf,
                        SUM(T3.sales) AS sales
                   FROM topspider.top_itemsearchresult T1
                        LEFT JOIN ibbd2.top_item1 T2
                           ON T1.item_id = T2.item_id
                        LEFT JOIN ibbd2.top_item2 T3
                           ON     T1.item_id = T3.item_id
                              AND DATE(T3.population_tsmp) = inDateOf
                  WHERE DATE(T1.population_tsmp) = inDateOf
                 GROUP BY T1.keyword, location2) T
         GROUP BY T.keyword,
                  T.province,
                  T.city,
                  T.dateOf;



      INSERT IGNORE INTO ibbd2.quota_sale_index
         SELECT keyword,
                '全国',
                '',
                date_of,
                SUM(sales),
                NOW()
           FROM ibbd2.quota_sale_index
          WHERE DATE(population_tsmp) = inDateOf
         GROUP BY keyword, date_of;
   END$$

CREATE PROCEDURE `sp_top_tiny_shop`()
    COMMENT '对客单表进行数据添充'
begin
insert ignore into top_tiny_shop
(select shop_id,user_num_id,wangwang from top_shop1);
end$$

CREATE PROCEDURE `sp_ststc_cat_shop_sales_detail`(quotaDate    DATE,
                                                        ststcDate    DATE)
    COMMENT '统计类目&店铺销售详细信息'
BEGIN
      INSERT IGNORE
        INTO ibbd2.ststc_cat_shop_sales_detail
         SELECT T1.keyword,
                T2.date_of,
                T1.user_num_id,
                T1.wangwang,
                SUBSTRING_INDEX(T1.location, ' ', 1),
                SUBSTRING_INDEX(T1.location, ' ', -1),
                SUM(T2.volume),
                SUM(T2.trade_num),
                SUM(T2.sales),
                NOW()
           FROM    topspider.top_itemsearchresult T1
                LEFT JOIN
                   ibbd2.top_item2 T2
                ON     T1.item_id = T2.item_id
                   AND DATE(T2.population_tsmp) = ststcDate
          WHERE     DATE(T1.population_tsmp) = quotaDate
                AND T2.volume IS NOT NULL
                AND T2.item_id IS NOT NULL
         GROUP BY T1.keyword, T2.date_of, T1.user_num_id;
   END$$

CREATE PROCEDURE `sp_quota_compete_index`(dateOf DATE)
    COMMENT '计算关键词下的竞争指数'
BEGIN

      INSERT INTO ibbd2.quota_compete_index

         SELECT T1.keyword,

                T1.date_of,

                    (    -1

                       * SUM(

                            LOG10(T1.sales / T2.sales) * T1.sales / T2.sales)

                     - LOG10(COUNT(1)))

                  / LOG10(COUNT(1))

                + 1,

                NOW()

           FROM    ibbd2.ststc_shop_sales_keyword T1

                LEFT JOIN

                   (SELECT keyword, date_of, SUM(sales) AS sales

                      FROM ibbd2.ststc_shop_sales_keyword

                    GROUP BY keyword, date_of) T2

                ON T1.keyword = T2.keyword AND T1.date_of = T2.date_of

          WHERE T2.sales IS NOT NULL AND T1.date_of = dateOf

         GROUP BY T1.keyword, T1.date_of;

   END$$

CREATE PROCEDURE `sp_insert_top_tiny_shop`()
    COMMENT '对客单表进行数据添充'
BEGIN
INSERT IGNORE INTO top_tiny_shop
SELECT shop_id,user_num_id,wangwang FROM top_shop1;
END$$

CREATE PROCEDURE `sp_top_item_buyer`(date_of DATE)
    COMMENT '对淘宝商品买家列表做ETL操作'
BEGIN

      INSERT INTO ibbd2.top_item_buyer

         SELECT item_id,

                DATE(trade_time),

                nick,

                rank,

                CONCAT_WS(' ', nick, rank),

                COUNT(1),

                SUM(amount),

                NOW()

           FROM topdata.top_item_trade

          WHERE     DATE(population_tsmp) = date_of + INTERVAL 1 DAY

                AND DATE(trade_time) <= date_of

         GROUP BY item_id,

                  DATE(trade_time),

                  nick,

                  rank;

   END$$

CREATE PROCEDURE `sp_quota_pricesale_index`(date_of DATE)
    COMMENT '所有关键词的计算价格-销售指数'
BEGIN

      INSERT INTO ibbd2.quota_pricesale_index

         SELECT T1.keyword,

                T2.date_of,

                T3.date_of,

                SUM(T2.price * T3.volume) / SUM(T3.price * T3.volume),

                SUM(T3.price * T2.volume) / SUM(T3.price * T3.volume),

                NOW()

           FROM topspider.top_itemsearchresult T1

                LEFT JOIN ibbd2.top_item2 T2

                   ON     T1.item_id = T2.item_id

                      AND DATE(T1.population_tsmp) = T2.date_of

                LEFT JOIN ibbd2.top_item2 T3

                   ON     T1.item_id = T3.item_id

                      AND DATE(T1.population_tsmp) > T3.date_of

          WHERE     DATE(T1.population_tsmp) = date_of

                AND T2.date_of IS NOT NULL

                AND T3.date_of IS NOT NULL

         GROUP BY T1.keyword, T2.date_of, T3.date_of;

   END$$

CREATE PROCEDURE `sp_clear_ibbd2_etl`(inDateOf Date)
    COMMENT '清楚指定一天的ibbd2数据库中的ETL表'
BEGIN
DELETE FROM ibbd2.top_itemsearchresult

       WHERE DATE(population_tsmp) = inDateOf;



      DELETE FROM ibbd2.top_item1

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.top_item2

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.top_item_buyer

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.top_item_tradingtime

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.top_shop2

       WHERE date_of = inDateOf;


      DELETE FROM ibbd2.ststc_cat_shop_sale

       WHERE date_of = inDateOf;


      DELETE FROM ibbd2.ststc_cat_shop_sales_detail

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.ststc_price_keyword

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.ststc_shop_sales_keyword

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.ststc_keyword_shop_pct

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.ststc_keyword_hot_items

       WHERE to_date = inDateOf;



      DELETE FROM ibbd2.ststc_user_hostitems_7

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.quota_pricesale_index

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.quota_sale_index

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.quota_shop_credit

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.quota_tradingtime_aly

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.quota_pct_keyword

       WHERE date_of = inDateOf;



      DELETE FROM ibbd2.quota_compete_index

       WHERE date_of = inDateOf;
END$$

CREATE PROCEDURE `sp_top_item_search_result`(in_date_of date)
BEGIN
	REPLACE INTO ibbd2.top_item_search_result
  SELECT *
  FROM topspider.top_itemsearchresult
  WHERE population_tsmp BETWEEN in_date_of AND in_date_of + INTERVAL 1 DAY;
END$$

CREATE PROCEDURE `sp_quota_tradingtime_aly`(inDateOf DATE)
    COMMENT '计算关键词的交易时段数据'
BEGIN
      INSERT IGNORE INTO ibbd2.quota_tradingtime_aly
         SELECT T1.keyword,
                T2.date_of,
                T2.hour_of,
                SUM(T2.volume),
                SUM(T2.sales),
                NOW()
           FROM    topspider.top_itemsearchresult T1
                LEFT JOIN
                   ibbd2.top_item_tradingtime T2
                ON     T1.item_id = T2.item_id
                   AND DATE(T2.population_tsmp) = inDateOf
          WHERE     DATE(T1.population_tsmp) = inDateOf
                AND T2.date_of IS NOT NULL
         GROUP BY T1.keyword, DATE(T2.date_of), T2.hour_of;
   END$$

CREATE PROCEDURE `sp_top_itemsearchresult`(inDateOf DATE)
    COMMENT 'Extract表——对关键词搜索结果做抽取操作，保留最近30天的数据'
BEGIN

      DELETE FROM ibbd2.top_itemsearchresult

       WHERE population_tsmp < inDateOf - INTERVAL 30 DAY;



      INSERT INTO ibbd2.top_itemsearchresult

         SELECT *

           FROM topspider.top_itemsearchresult

          WHERE population_tsmp > inDateOf;

   END$$

CREATE PROCEDURE `sp_ststc_cat_shop_sale`(
   quotaDate    DATE,
   ststcDate    DATE)
    COMMENT '统计关键词搜索结果下店铺的销售情况,传入指标计算日期quotaDate和统计日期（当天）ststcDate'
BEGIN
      INSERT IGNORE
        INTO ibbd2.ststc_cat_shop_sale
         SELECT T1.keyword,
                T2.date_of,
                T1.user_num_id,
                SUM(T2.volume),
                SUM(T2.trade_num),
                SUM(T2.sales),
                NOW()
           FROM    topspider.top_itemsearchresult T1
                LEFT JOIN
                   ibbd2.top_item2 T2
                ON     T1.item_id = T2.item_id
                   AND DATE(T2.population_tsmp) = ststcDate
          WHERE     DATE(T1.population_tsmp) = quotaDate
                AND T2.volume IS NOT NULL
                AND T2.item_id IS NOT NULL
         GROUP BY T1.keyword, T2.date_of, T1.user_num_id;
   END$$

CREATE PROCEDURE `sp_ststc_cat_hotshops`(inDateOf date)
    COMMENT '统计——统计类目热销店铺Top20'
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE cat VARCHAR(30);
 DECLARE cur CURSOR FOR SELECT DISTINCT(keyword) FROM ibbd2.top_cat_items;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;

     cat_loop:
      LOOP
         FETCH cur INTO cat;

         IF done
         THEN
            LEAVE cat_loop;
         END IF;

         INSERT IGNORE
           INTO ibbd2.ststc_cat_hotshops
            SELECT T1.keyword,
                   inDateOf,
                   T3.shop_id,
                   T1.user_num_id,
                   T3.wangwang,
                   COUNT(DISTINCT (T1.item_id)),
                   SUM(T2.volume),
                   SUM(T2.trade_num),
                   SUM(T2.sales),
                   NOW()
              FROM ibbd2.top_cat_items T1
                   LEFT JOIN ibbd2.ststc_cat_shop_sale T2
                      ON     T1.keyword = T2.keyword
                         AND T1.user_num_id = T2.user_num_id
                         AND T2.date_of = inDateOf
                   LEFT JOIN ibbd2.top_shop1 T3
                      ON T1.user_num_id = T3.user_num_id
             WHERE T1.keyword = cat AND T2.user_num_id IS NOT NULL
            GROUP BY T1.keyword, T3.shop_id
            ORDER BY T2.sales DESC
             LIMIT 20;
      END LOOP;

      CLOSE cur;
   END$$

CREATE PROCEDURE `sp_ststc_keyword_shop_pct`(inDateOf DATE)
    COMMENT '计算关键词类目下店铺的客单价'
BEGIN
      INSERT IGNORE INTO ibbd2.ststc_keyword_shop_pct
         SELECT T3.keyword,
                T3.wangwang,
                T3.date_of,
                COUNT(DISTINCT (T3.item_id)),
                COUNT(1),
                SUM(T3.amount),
                SUM(T3.price * T3.amount),
                COUNT(DISTINCT (CONCAT_WS('&', T3.nick, T3.rank))),
                  SUM(T3.price * T3.amount)
                / COUNT(DISTINCT (CONCAT_WS('&', T3.nick, T3.rank))),
                NOW()
           FROM (SELECT T1.keyword,
                        T1.wangwang,
                        DATE(T2.trade_time) AS date_of,
                        T2.*
                   FROM    topspider.top_itemsearchresult T1
                        LEFT JOIN
                           topdata.top_item_trade T2
                        ON     T1.item_id = T2.item_id
                           AND DATE(T2.population_tsmp) = inDateOf
                  WHERE     DATE(T1.population_tsmp) = inDateOf
                        AND T2.item_id IS NOT NULL) T3
         GROUP BY T3.keyword, T3.wangwang, T3.date_of;
   END$$

CREATE PROCEDURE `sp_ststc_shop_multi_buyer`(user_num_id VARCHAR(20))
    COMMENT '统计店铺多商品购买记录的买家购买列表'
BEGIN

    INSERT INTO ibbd2.ststc_shop_multi_buyer

      SELECT NULL,T4.user_id,CURDATE(),T4.identifier,NULL,T4.ids,NOW()

      FROM(

      SELECT T3.user_id,T3.identifier,GROUP_CONCAT(item_id SEPARATOR ',') AS ids

      FROM(

        SELECT T1.user_id,T1.item_id,T2.identifier

        FROM topspider.top_allitem_info T1

        LEFT JOIN ibbd2.top_item_buyer T2

        ON T1.item_id = T2.item_id

        WHERE T1.user_id=user_num_id

        GROUP BY T1.item_id,T2.identifier)T3

      WHERE T3.identifier IS NOT NULL

      GROUP BY T3.identifier)T4

      WHERE LOCATE(',',T4.ids)<>0      ;

   END$$

CREATE PROCEDURE `sp_ststc_user_hostitems_7`(inDateOf DATE)
    COMMENT '统计用户自定义类目下商品热销情况'
BEGIN

      INSERT INTO ibbd2.ststc_user_hostitems_7

         SELECT T3.user,

                inDateOf,

                T3.item_id,

                T3.item_name,

                T3.item_pic,

                T3.user_num_id,

                T3.wangwang,

                SUM(T4.volume) AS volume,

                SUM(T4.sales) AS sales,

                NOW()

           FROM    (SELECT T1.user,

                           T2.item_id,

                           T2.item_name,

                           T2.item_pic,

                           T2.user_num_id,

                           T2.wangwang

                      FROM    ibbd2.user_keywords T1

                           LEFT JOIN

                              topspider.top_itemsearchresult T2

                           ON     T1.keyword = T2.keyword

                              AND DATE(T2.population_tsmp) BETWEEN   inDateOf

                                                                   - INTERVAL 7 DAY

                                                               AND inDateOf

                     WHERE T1.status = '1'

                    GROUP BY T1.user, T2.item_id) T3

                LEFT JOIN

                   ibbd2.top_item2 T4

                ON     T3.item_id = T4.item_id

                   AND T4.date_of BETWEEN inDateOf - INTERVAL 7 DAY

                                      AND inDateOf

          WHERE T4.volume IS NOT NULL

         GROUP BY T3.user, T3.item_id

         ORDER BY SUM(T4.sales) DESC;

   END$$

CREATE PROCEDURE `sp_insert_date`()
    COMMENT '插入时间数据到lib_datelist表中'
begin
declare n int unsigned default 0;
declare m int unsigned default 10000;
while n < m do
insert into lib_datelist
(select date('2012-01-01') + interval n day);
set n = n+1;
end while;
select '已完成';
end$$

CREATE PROCEDURE `sp_insert_num`()
    COMMENT '插入数值到lib_numlist表中,从0开始'
begin
declare n int unsigned default 2;
declare m int unsigned default 100000;
truncate table lib_numlist;
insert into lib_numlist values(0),(1);
while n < m do
insert into lib_numlist
(select num+n from lib_numlist);
set n = n*2;
end while;
select '已完成';
end$$

CREATE PROCEDURE `sp_quota_pct_keyword`(inDateOf DATE)
    COMMENT '计算关键词下的客单价'
BEGIN
      INSERT IGNORE
        INTO ibbd2.quota_pct_keyword
         SELECT T1.keyword,
                T2.date_of,
                SUM(T2.trade_num),
                SUM(T2.volume),
                SUM(T2.sales),
                AVG(T2.pct),
                NOW()
           FROM    topspider.top_itemsearchresult T1
                LEFT JOIN
                   ibbd2.top_item2 T2
                ON     T1.item_id = T2.item_id
                   AND DATE(T2.population_tsmp) = inDateOf
          WHERE DATE(T1.population_tsmp) = inDateOf AND T2.pct IS NOT NULL
         GROUP BY T1.keyword, T2.date_of;
   END$$

CREATE PROCEDURE `sp_ststc_price_keyword`(inDateOf DATE)
    COMMENT '统计关键词下价格信息'
BEGIN
      INSERT IGNORE INTO ibbd2.ststc_price_keyword
         SELECT keyword,
                DATE(population_tsmp),
                AVG(price),
                MAX(price),
                MIN(price),
                COUNT(DISTINCT (item_id)),
                NOW()
           FROM topspider.top_itemsearchresult
          WHERE DATE(population_tsmp) = inDateOf
         GROUP BY keyword, DATE(population_tsmp);
   END$$

CREATE PROCEDURE `sp_ststc_keyword_shop_pct_outdated`(inDateOf DATE)
    COMMENT '计算关键词类目下店铺的客单价'
BEGIN
      INSERT IGNORE
        INTO ibbd2.ststc_keyword_shop_pct_outdated
         SELECT T5.keyword,
                T5.wangwang,
                DATE(T6.trade_time),
                COUNT(DISTINCT (T5.item_id)),
                COUNT(1),
                SUM(T6.amount),
                SUM(T6.amount * T6.price),
                COUNT(DISTINCT (CONCAT_WS('&', T6.nick, T6.rank))),
                  SUM(T6.amount * T6.price)
                / COUNT(DISTINCT (CONCAT_WS('&', T6.nick, T6.rank))),
                NOW()
           FROM    (SELECT T3.keyword,
                           T3.date_of,
                           T4.item_id,
                           T4.wangwang
                      FROM    (SELECT T1.keyword, MIN(T2.date_of) AS date_of
                                 FROM    ibbd2.user_keywords T1
                                      LEFT JOIN
                                         ibbd2.ststc_keyword_shop_pct T2
                                      ON T1.keyword = T2.keyword
                                WHERE T1.status = '1'
                               GROUP BY T1.keyword) T3
                           LEFT JOIN
                              topspider.top_itemsearchresult T4
                           ON T3.keyword = T4.keyword
                    GROUP BY T3.keyword, T3.date_of, T4.item_id) T5
                LEFT JOIN
                   topdata.top_item_trade T6
                ON     T5.item_id = T6.item_id
                   AND DATE(T6.trade_time) < T5.date_of
         GROUP BY T5.keyword, T5.wangwang, DATE(T6.trade_time);
   END$$

CREATE PROCEDURE `sp_ststc_cat_dealprice`(inDateOf DATE)
    COMMENT '统计关键词类目下成交价数据'
BEGIN
      INSERT IGNORE
        INTO ibbd2.ststc_cat_dealprice
         SELECT T1.keyword,
                T2.date_of,
                AVG(T2.avg_deal_price),
                MIN(T2.min_deal_price),
                MAX(T2.price),
                COUNT(DISTINCT (T1.item_id)),
                NOW()
           FROM    (SELECT T.keyword, T.item_id
                      FROM topspider.top_itemsearchresult T
                     WHERE DATE(T.population_tsmp) = inDateOf
                    GROUP BY T.keyword, T.item_id) T1
                LEFT JOIN
                   ibbd2.top_item2 T2
                ON     T1.item_id = T2.item_id
                   AND DATE(T2.population_tsmp) = inDateOf
          WHERE T2.item_id IS NOT NULL
         GROUP BY T1.keyword, T2.date_of;
   END$$

CREATE PROCEDURE `sp_top_item2`(inDateOf DATE)
    COMMENT '对淘宝商品交易信息做ETL操作'
BEGIN
      INSERT INTO ibbd2.top_item2
         SELECT item_id,
                shop_id,
                DATE(trade_time),
                MAX(price),
                SUM(amount),
                COUNT(1),
                SUM(amount * price),
                MIN(price),
                AVG(price),
                COUNT(DISTINCT (CONCAT_WS('&', nick, rank))),
                  SUM(amount * price)
                / COUNT(DISTINCT (CONCAT_WS('&', nick, rank))),
                NOW()
           FROM topdata.top_item_trade
          WHERE     DATE(population_tsmp) = inDateOf 
                -- AND DATE(trade_time) <= inDateOf
         GROUP BY item_id, DATE(trade_time);
   END$$

CREATE PROCEDURE `sp_top_item1`(inDate DATE)
BEGIN
      INSERT IGNORE
        INTO ibbd2.top_item1
         SELECT item_id,
                user_id,
                shop_id,
                site_id,
                DATE(population_tsmp),
                IFNULL(init_price, 0),
                IFNULL(item_title, ''),
                IFNULL(location, ''),
                '',
                IFNULL(brand, ''),
                IFNULL(item_img, ''),
                IFNULL(monthly_trade, 0),
                IFNULL(total_sold_out, 0),
                IFNULL(cid, ''),
                NOW()
           FROM topspider.top_item T2
          WHERE T2.population_tsmp > inDate
      ON DUPLICATE KEY UPDATE date_of = DATE(T2.population_tsmp),
                              price = IFNULL(T2.init_price, 0),
                              title =
                                 CASE
                                    WHEN    T2.item_title IS NULL
                                         OR T2.item_title = ''
                                    THEN
                                       title
                                    ELSE
                                       T2.item_title
                                 END,
                              item_img = IFNULL(T2.item_img, ''),
                              volume_month = IFNULL(T2.monthly_trade, 0),
                              volume_all = IFNULL(T2.total_sold_out, 0),
                              population_tsmp = NOW();



      UPDATE ibbd2.top_item1
         SET location =
                REPLACE(REPLACE(REPLACE(location, '省份', ''), '省', ''),
                        '市',
                        '')
       WHERE population_tsmp > inDate;



      UPDATE ibbd2.top_item1
         SET location2 =
                CASE
                   WHEN SUBSTRING(location, 1, 2) IN
                           ('北京', '上海', '重庆')
                   THEN
                      SUBSTRING(location, 1, 2)
                   WHEN SUBSTRING(RPAD(location, '3', ' '), 1, 3) IN
                           ('黑龙江', '内蒙古')
                   THEN
                      CONCAT(SUBSTRING(RPAD(location, '3', ' '), 1, 3),
                             ' ',
                             SUBSTRING(location, 4))
                   ELSE
                      CONCAT(SUBSTRING(location, 1, 2),
                             ' ',
                             SUBSTRING(location, 3))
                END
       WHERE population_tsmp > inDate;
   END$$

CREATE PROCEDURE `sp_top_item_tradingtime`(inDateOf DATE)
    COMMENT '统计商品天、小时的交易信息'
BEGIN
      INSERT IGNORE INTO ibbd2.top_item_tradingtime
         SELECT item_id,
                DATE(trade_time),
                HOUR(trade_time),
                SUM(amount),
                SUM(price * amount),
                NOW()
           FROM topdata.top_item_trade
          WHERE     DATE(population_tsmp) = inDateOf
         GROUP BY item_id, DATE(trade_time), HOUR(trade_time);
   END$$

CREATE DEFINER=`hostinfo`@`%` PROCEDURE `sp_select_table_size`(_schema_name varchar(50), _table_name varchar(50))
    COMMENT '统计表所占用的空间'
SELECT TABLE_NAME, concat(round(sum(DATA_LENGTH/1024), 2), 'KB') as '数据大小', concat(round(sum(INDEX_LENGTH/1024), 2), 'KB') as '索引大小', concat(round(sum((DATA_LENGTH+INDEX_LENGTH)/1024), 2), 'KB') as '大小总和', TABLE_ROWS as '行数' FROM information_schema.TABLES  WHERE TABLE_SCHEMA=_schema_name AND TABLE_NAME=_table_name$$

CREATE PROCEDURE `sp_ststc_cat_range_hotshops`(inFromDate    date,
                                                     inToDate      date)
    COMMENT '统计——统计类目下时间区间内的热销店铺Top20'
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE cat VARCHAR(30);
 DECLARE cur CURSOR FOR SELECT DISTINCT(keyword) FROM ibbd2.top_cat_items;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;

     cat_loop:
      LOOP
         FETCH cur INTO cat;

         IF done
         THEN
            LEAVE cat_loop;
         END IF;

         INSERT IGNORE
           INTO ibbd2.ststc_cat_range_hotshops
            SELECT T1.keyword,
                   inFromDate,
                   inToDate,
                   T3.shop_id,
                   T1.user_num_id,
                   T3.wangwang,
                   COUNT(DISTINCT (T1.item_id)),
                   SUM(T2.volume),
                   SUM(T2.trade_num),
                   SUM(T2.sales),
                   NOW()
              FROM ibbd2.top_cat_items T1
                   LEFT JOIN ibbd2.top_item2 T2
                      ON     T1.item_id = T2.item_id
                         AND T2.date_of BETWEEN inFromDate AND inToDate
                   LEFT JOIN ibbd2.top_shop1 T3
                      ON T1.user_num_id = T3.user_num_id
             WHERE     T1.keyword = cat
                   AND T2.item_id IS NOT NULL
                   AND T3.user_num_id IS NOT NULL
            GROUP BY T1.user_num_id
            ORDER BY SUM(T2.sales) DESC
             LIMIT 20;
      END LOOP;

      CLOSE cur;
   END$$

CREATE PROCEDURE `sp_ststc_shop_pct_nokeyword`(tsmp date)
    COMMENT '对客单表进行数据添充,首先把数据汇总插入到ststc_shop_pct_nokeyword_repeat中，再把repeat\n表中的数据汇总成集合数据插入到ststc_shop_pct_nokeyword'
begin
insert ignore into ststc_shop_pct_nokeyword
(select shop_id,
DATE(trade_time),
SUM(price*amount),
COUNT(DISTINCT (CONCAT_WS('&', nick, rank))),
COUNT(*),
SUM(amount),
COUNT(DISTINCT item_id),
NOW()
from topdata.`top_item_trade`
where population_tsmp between tsmp and tsmp+INTERVAL 1 DAY
group by shop_id,DATE(trade_time));
end$$

CREATE PROCEDURE `sp_ststc_keyword_hot_items`(inDateOf DATE)
    COMMENT '统计关键词下商品的热销情况'
BEGIN

      INSERT INTO ibbd2.ststc_keyword_hot_items

         SELECT T1.keyword,

                inDateOf - INTERVAL 7 DAY,

                inDateOf,

                T1.item_id,

                T1.user_num_id,

                SUM(T2.volume),

                SUM(T2.trade_num),

                CAST(SUM(T2.sales) AS SIGNED),

                NOW()

           FROM    topspider.top_itemsearchresult T1

                LEFT JOIN

                   ibbd2.top_item2 T2

                ON     T1.item_id = T2.item_id

                   AND DATE(T1.population_tsmp) = T2.date_of

          WHERE     DATE(T1.population_tsmp) BETWEEN   inDateOf

                                                     - INTERVAL 7 DAY

                                                 AND inDateOf

                AND T2.volume IS NOT NULL

         GROUP BY T1.keyword, T1.item_id;

   END$$

CREATE PROCEDURE `sp_top_cat_items`(inDateOf date)
    COMMENT '更新类目下的商品列表'
BEGIN
      INSERT IGNORE
        INTO ibbd2.top_cat_items
         SELECT keyword,
                item_id,
                user_num_id,
                NOW()
           FROM topspider.top_itemsearchresult
          WHERE population_tsmp > inDateOf
         GROUP BY keyword, item_id;
   END$$

CREATE PROCEDURE `sp_ststc_shop_sale_in`(inDateOf DATE)
    COMMENT '统计店铺每日销售数据'
BEGIN
      INSERT IGNORE
        INTO ibbd2.ststc_shop_sale_in
         SELECT IFNULL(T2.user_num_id, ''),
                T1.shop_id,
                IFNULL(T2.wangwang, ''),
                T1.date_of,
                SUM(T1.volume),
                SUM(T1.sales),
                SUM(T1.trade_num),
                0,
                NOW()
           FROM    ibbd2.top_item2 T1
                LEFT JOIN
                   ibbd2.top_shop1 T2
                ON T1.shop_id = T2.shop_id
          WHERE DATE(T1.population_tsmp) = inDateOf
         GROUP BY T1.shop_id, T1.date_of;
   END$$

CREATE PROCEDURE `sp_top_cat_search_result`(in_date_of date)
    COMMENT '汇总表——汇总关键词搜索结果'
BEGIN
	REPLACE INTO ibbd2.top_cat_search_result
  SELECT *
  FROM topspider.top_itemsearchresult
  WHERE population_tsmp BETWEEN in_date_of AND in_date_of + INTERVAL 1 DAY;
END$$

CREATE PROCEDURE `sp_top_shop_items`(inDateOf DATE)
    COMMENT '对淘宝店铺交易信息做ETL操作'
BEGIN

      INSERT INTO ibbd2.top_shop_items

         SELECT user_id,

                shop_id,

                NULL,

                NULL,

                DATE(population_tsmp),

                item_id,

                NOW()

           FROM topspider.top_allitem_info

          WHERE DATE(population_tsmp) = inDateOf

         GROUP BY user_id, DATE(population_tsmp);



      UPDATE ibbd2.top_shop_items T1, ibbd2.top_shop1 T2

         SET T1.shop_name = T2.shop_name, T1.wangwang = T2.wangwang

       WHERE     T1.user_num_id = T2.user_num_id

             AND T1.date_of = inDateOf

             AND T1.wangwang IS NULL;

   END$$

CREATE PROCEDURE `sp_ibbd2_etl`(inDateOf DATE)
    COMMENT '运行ibbd指标，保存到ibbd2数据库'
BEGIN

      DECLARE dStartTime   DATETIME DEFAULT NOW();

      DECLARE dEndTime     DATETIME;

      -- CALL sp_top_item1(inDateOf);



      SET dEndTime = NOW();

   END$$

CREATE PROCEDURE `sp_lib_cat_id`()
BEGIN
  INSERT IGNORE INTO ibbd2.lib_cat_id(cat_name)
   SELECT T1.keyword
    FROM ibbd2.user_keywords T1
    LEFT JOIN ibbd2.lib_cat_id T2
    ON T1.keyword=T2.cat_name
    WHERE T2.cat_name IS NULL
    GROUP BY T1.keyword;

  INSERT IGNORE INTO ibbd2.lib_cat_id(cat_name)
   SELECT T1.keyword
    FROM ibbd2.user_keywords_ztc T1
    LEFT JOIN ibbd2.lib_cat_id T2
    ON T1.keyword=T2.cat_name
    WHERE T2.cat_name IS NULL
    GROUP BY T1.keyword;
END$$

CREATE PROCEDURE `sp_ststc_item_rate1`(inDateOf DATE)
    COMMENT '统计商品评论用户'
BEGIN
      INSERT IGNORE INTO ibbd2.ststc_item_rate1
         SELECT auc_num_id,
                rate_id,
                `date`,
                nick,
                user_id,
                NOW()
           FROM topspider.top_item_rate
          WHERE DATE(population_tsmp) = inDateOf
         GROUP BY auc_num_id, rate_id;
   END$$

CREATE PROCEDURE `sp_ststc_shop_sales_keyword`(inDateOf DATE)
    COMMENT '计算关键词下每个店铺的销售情况'
BEGIN
      INSERT INTO ibbd2.ststc_shop_sales_keyword
         SELECT T1.keyword,
                T1.user_num_id,
                T2.date_of,
                SUM(T2.volume),
                SUM(T2.trade_num),
                SUM(T2.sales),
                NOW()
           FROM    topspider.top_itemsearchresult T1
                LEFT JOIN
                   ibbd2.top_item2 T2
                ON T1.item_id = T2.item_id AND DATE(T2.date_of) = inDateOf
          WHERE DATE(T1.population_tsmp) = inDateOf
         GROUP BY T1.keyword, T1.user_num_id, T2.date_of;
   END$$

CREATE PROCEDURE `sp_quota_shop_credit`(inDateOf DATE)
    COMMENT '计算关键词的店铺信用、分布数据'
BEGIN
      INSERT IGNORE
        INTO ibbd2.quota_shop_credit
         SELECT T1.keyword,
                SUBSTRING_INDEX(T2.location2, ' ', 1),
                SUBSTRING_INDEX(T2.location2, ' ', -1),
                SUBSTRING_INDEX(T2.shop_rank, '_', 2),
                T2.shop_id,
                T2.user_num_id,
                T2.shop_name,
                T2.shop_type,
                NOW()
           FROM    topspider.top_itemsearchresult T1
                LEFT JOIN
                   ibbd2.top_shop1 T2
                ON T1.user_num_id = T2.user_num_id
          WHERE DATE(T1.population_tsmp) = inDateOf
         GROUP BY T1.keyword,
                  SUBSTRING_INDEX(T2.location2, ' ', 1),
                  SUBSTRING_INDEX(T2.location2, ' ', -1),
                  SUBSTRING_INDEX(T2.shop_rank, '_', 2),
                  DATE(T1.population_tsmp),
                  T2.user_num_id
      ON DUPLICATE KEY UPDATE credit_level =
                                 SUBSTRING_INDEX(T2.shop_rank, '_', 2);
   END$$

DELIMITER ;