USE topdata;
DROP TABLE IF EXISTS `top_item_trade_his_20121209`;
DROP TABLE IF EXISTS `top_item`;
DROP TABLE IF EXISTS `top_item_trade_his_8`;
DROP TABLE IF EXISTS `top_allitem_info`;
DROP TABLE IF EXISTS `top_item_rate_his_1`;
DROP TABLE IF EXISTS `top_item_trade_his_10`;
DROP TABLE IF EXISTS `top_item_trade_his_11`;
DROP TABLE IF EXISTS `top_item_trade_his_12`;
DROP TABLE IF EXISTS `top_item_trade_his_13`;
DROP TABLE IF EXISTS `top_item_trade_his_14`;
DROP TABLE IF EXISTS `top_item_trade_his_15`;
DROP TABLE IF EXISTS `top_item_trade_his_16`;
DROP TABLE IF EXISTS `top_item_trade_his_17`;
DROP TABLE IF EXISTS `top_item_trade_his_18`;
DROP TABLE IF EXISTS `top_item_trade_his_19`;
DROP TABLE IF EXISTS `top_item_rate`;
DROP TABLE IF EXISTS `top_shop`;
DROP TABLE IF EXISTS `top_item_trade_his_2`;
DROP TABLE IF EXISTS `top_item_trade`;
DROP TABLE IF EXISTS `top_item_trade_his_6`;
DROP TABLE IF EXISTS `top_item_trade_his_7`;
DROP TABLE IF EXISTS `top_item_trade_his_4`;
DROP TABLE IF EXISTS `top_item_trade_his_5`;
DROP TABLE IF EXISTS `top_item_trade_his_20121212`;
DROP TABLE IF EXISTS `top_item_trade_his_9`;
DROP TABLE IF EXISTS `top_item_trade_his_3`;
DROP TABLE IF EXISTS `top_item_trade_his_21`;
DROP TABLE IF EXISTS `top_item_rate_20121118`;
DROP TABLE IF EXISTS `top_item_trade_his_23`;
DROP TABLE IF EXISTS `top_item_trade_his_22`;
DROP TABLE IF EXISTS `top_item_trade_his_25`;
DROP TABLE IF EXISTS `top_item_trade_his_24`;
DROP TABLE IF EXISTS `top_item_trade_his_26`;
DROP TABLE IF EXISTS `top_item_rate_20121119`;
DROP TABLE IF EXISTS `top_item_trade_his_20`;
DROP PROCEDURE IF EXISTS `sp_top_item_trade`;
CREATE TABLE `top_item_trade_his_20121209` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `page_id` varchar(20) DEFAULT NULL COMMENT '页面ID',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `charset` varchar(10) DEFAULT NULL COMMENT '字符集',
  `keywords` varchar(300) DEFAULT NULL COMMENT '页面关键词',
  `desc` varchar(500) DEFAULT NULL COMMENT '页面详细信息',
  `shop_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `shop_link` varchar(100) DEFAULT NULL COMMENT '店铺链接',
  `item_img` varchar(100) DEFAULT NULL COMMENT '宝贝图片',
  `item_title` varchar(250) DEFAULT NULL COMMENT '宝贝名称',
  `init_price` float DEFAULT NULL COMMENT '初始价格',
  `promo_info` varchar(500) DEFAULT NULL COMMENT '促销信息',
  `postage_info` varchar(200) DEFAULT NULL COMMENT '邮费信息',
  `monthly_trade` int(11) DEFAULT NULL COMMENT '月销量',
  `item_rate` int(11) DEFAULT NULL COMMENT '评价数量',
  `bonus` int(11) DEFAULT NULL COMMENT '奖励积分',
  `fav_num` int(11) DEFAULT NULL COMMENT '收藏量',
  `total_sold_out` int(11) DEFAULT NULL COMMENT '总销量',
  `review_count` int(11) DEFAULT NULL COMMENT '页面浏览量（仅C店）',
  `attr_list` varchar(1500) DEFAULT NULL,
  `starts` varchar(20) DEFAULT NULL COMMENT '上架时间',
  `ends` varchar(20) DEFAULT NULL COMMENT '下架时间',
  `user_tag` varchar(20) DEFAULT NULL COMMENT '用户标签',
  `cid` varchar(20) DEFAULT NULL COMMENT '商品类目',
  `location` varchar(20) DEFAULT NULL COMMENT '商品地址',
  `brand` varchar(20) DEFAULT NULL COMMENT '商品所属品牌',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `item_id` (`item_id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `init_price` (`init_price`),
  KEY `total_sold_out` (`total_sold_out`),
  KEY `review_count` (`review_count`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `cid` (`cid`),
  KEY `starts` (`starts`),
  KEY `cid_2` (`cid`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝店铺宝贝表';

CREATE TABLE `top_item_trade_his_8` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_allitem_info` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `item_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `item_link` varchar(100) DEFAULT NULL COMMENT '商品链接',
  `item_pic` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `item_price_type` varchar(20) DEFAULT NULL COMMENT '商品价格类型',
  `item_price` float DEFAULT NULL COMMENT '商品价格',
  `item_sales` int(11) DEFAULT '0' COMMENT '商品30天销量',
  `item_rate_num` int(11) DEFAULT '0' COMMENT '商品评价数量',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺所有宝贝概括信息';

CREATE TABLE `top_item_rate_his_1` (
  `site_id` varchar(5) NOT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) NOT NULL COMMENT '店铺ID',
  `auc_num_id` varchar(20) NOT NULL COMMENT 'aucNumId',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `date` datetime NOT NULL COMMENT '评价时间',
  `rate_id` varchar(30) NOT NULL DEFAULT '' COMMENT '评价ID',
  `anony` varchar(5) DEFAULT NULL COMMENT '是否匿名',
  `nick` varchar(20) DEFAULT NULL COMMENT '评价人昵称',
  `nick_url` varchar(100) DEFAULT NULL COMMENT '评价人链接',
  `rank` varchar(20) DEFAULT NULL COMMENT '评价用户等级',
  `rank_url` varchar(100) DEFAULT NULL COMMENT '评价用户信用链接',
  `user_id` varchar(20) NOT NULL COMMENT '用户ID',
  `vip_level` int(11) DEFAULT NULL COMMENT 'vip等级',
  `valid_score` int(11) DEFAULT NULL COMMENT '有效评分',
  `appendId` varchar(40) DEFAULT NULL COMMENT '追加评论ID',
  `appendContent` varchar(300) DEFAULT NULL COMMENT '追加评论内容',
  `appendAfter` int(11) DEFAULT NULL COMMENT '在多少天后追加',
  `appendTime` datetime DEFAULT NULL COMMENT '追加评论的时间',
  `appendReply` varchar(100) DEFAULT NULL COMMENT '追加评论的回复',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`rate_id`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `auc_num_id` (`auc_num_id`),
  KEY `date` (`date`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品评价表';

CREATE TABLE `top_item_trade_his_10` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_11` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_12` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_13` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`),
  KEY `shop_tsmp` (`shop_id`,`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_14` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_15` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_16` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_17` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_18` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_19` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_rate` (
  `site_id` varchar(5) NOT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) NOT NULL COMMENT '店铺ID',
  `auc_num_id` varchar(20) NOT NULL COMMENT 'aucNumId',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `date` datetime NOT NULL COMMENT '评价时间',
  `rate_id` varchar(30) NOT NULL DEFAULT '' COMMENT '评价ID',
  `anony` varchar(5) DEFAULT NULL COMMENT '是否匿名',
  `nick` varchar(20) DEFAULT NULL COMMENT '评价人昵称',
  `nick_url` varchar(100) DEFAULT NULL COMMENT '评价人链接',
  `rank` varchar(20) DEFAULT NULL COMMENT '评价用户等级',
  `rank_url` varchar(100) DEFAULT NULL COMMENT '评价用户信用链接',
  `user_id` varchar(20) NOT NULL COMMENT '用户ID',
  `vip_level` int(11) DEFAULT NULL COMMENT 'vip等级',
  `valid_score` int(11) DEFAULT NULL COMMENT '有效评分',
  `appendId` varchar(40) DEFAULT NULL COMMENT '追加评论ID',
  `appendContent` varchar(300) DEFAULT NULL COMMENT '追加评论内容',
  `appendAfter` int(11) DEFAULT NULL COMMENT '在多少天后追加',
  `appendTime` datetime DEFAULT NULL COMMENT '追加评论的时间',
  `appendReply` varchar(100) DEFAULT NULL COMMENT '追加评论的回复',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`rate_id`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `auc_num_id` (`auc_num_id`),
  KEY `date` (`date`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品评价表';

CREATE TABLE `top_shop` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `shop_link` varchar(50) DEFAULT NULL COMMENT '店铺链接',
  `shop_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `wangwang` varchar(100) DEFAULT NULL COMMENT '旺旺昵称',
  `shop_rank` varchar(10) DEFAULT NULL COMMENT 'C店店铺等级标志',
  `shop_grade` float DEFAULT NULL COMMENT 'B店店铺评分',
  `shop_rate` varchar(20) DEFAULT NULL COMMENT '店铺三个动态评分',
  `shop_keeper` varchar(50) DEFAULT NULL COMMENT '掌柜',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `location` varchar(100) DEFAULT NULL COMMENT '公司所在地',
  `goods_rate` float DEFAULT NULL COMMENT '好评率',
  `item_amount` int(11) DEFAULT NULL COMMENT '宝贝数',
  `setup_time` date DEFAULT NULL COMMENT '开店时间',
  `coll_count` int(11) DEFAULT NULL COMMENT '店铺收藏数',
  `shop_type` varchar(5) DEFAULT NULL COMMENT '2：B店|7：C店',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝店铺表';

CREATE TABLE `top_item_trade_his_2` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_6` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_7` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_4` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_5` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_20121212` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_9` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_3` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_21` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_rate_20121118` (
  `site_id` varchar(5) NOT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) NOT NULL COMMENT '店铺ID',
  `auc_num_id` varchar(20) NOT NULL COMMENT 'aucNumId',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `date` datetime NOT NULL COMMENT '评价时间',
  `rate_id` varchar(30) NOT NULL DEFAULT '' COMMENT '评价ID',
  `anony` varchar(5) DEFAULT NULL COMMENT '是否匿名',
  `nick` varchar(20) NOT NULL COMMENT '评价人昵称',
  `nick_url` varchar(100) DEFAULT NULL COMMENT '评价人链接',
  `rank` varchar(20) DEFAULT NULL COMMENT '评价用户等级',
  `rank_url` varchar(100) DEFAULT NULL COMMENT '评价用户信用链接',
  `user_id` varchar(20) NOT NULL COMMENT '用户ID',
  `vip_level` int(11) DEFAULT NULL COMMENT 'vip等级',
  `valid_score` int(11) DEFAULT NULL COMMENT '有效评分',
  `appendId` varchar(40) DEFAULT NULL COMMENT '追加评论ID',
  `appendContent` varchar(300) DEFAULT NULL COMMENT '追加评论内容',
  `appendAfter` int(11) DEFAULT NULL COMMENT '在多少天后追加',
  `appendTime` datetime DEFAULT NULL COMMENT '追加评论的时间',
  `appendReply` varchar(100) DEFAULT NULL COMMENT '追加评论的回复',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`rate_id`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `auc_num_id` (`auc_num_id`),
  KEY `date` (`date`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品评价表';

CREATE TABLE `top_item_trade_his_23` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_22` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_25` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_24` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_trade_his_26` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

CREATE TABLE `top_item_rate_20121119` (
  `site_id` varchar(5) NOT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) NOT NULL COMMENT '店铺ID',
  `auc_num_id` varchar(20) NOT NULL COMMENT 'aucNumId',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `date` datetime NOT NULL COMMENT '评价时间',
  `rate_id` varchar(30) NOT NULL DEFAULT '' COMMENT '评价ID',
  `anony` varchar(5) DEFAULT NULL COMMENT '是否匿名',
  `nick` varchar(20) NOT NULL COMMENT '评价人昵称',
  `nick_url` varchar(100) DEFAULT NULL COMMENT '评价人链接',
  `rank` varchar(20) DEFAULT NULL COMMENT '评价用户等级',
  `rank_url` varchar(100) DEFAULT NULL COMMENT '评价用户信用链接',
  `user_id` varchar(20) NOT NULL COMMENT '用户ID',
  `vip_level` int(11) DEFAULT NULL COMMENT 'vip等级',
  `valid_score` int(11) DEFAULT NULL COMMENT '有效评分',
  `appendId` varchar(40) DEFAULT NULL COMMENT '追加评论ID',
  `appendContent` varchar(300) DEFAULT NULL COMMENT '追加评论内容',
  `appendAfter` int(11) DEFAULT NULL COMMENT '在多少天后追加',
  `appendTime` datetime DEFAULT NULL COMMENT '追加评论的时间',
  `appendReply` varchar(100) DEFAULT NULL COMMENT '追加评论的回复',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`rate_id`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `auc_num_id` (`auc_num_id`),
  KEY `date` (`date`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品评价表';

CREATE TABLE `top_item_trade_his_20` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';

DELIMITER $$
USE `ibbd2`$$
CREATE PROCEDURE `sp_top_item_trade`(inDateOf DATE)
    COMMENT '对原始交易记录做去重操作'
BEGIN

      INSERT IGNORE

        INTO topdata.top_item_trade

         SELECT *,

                MD5(CONCAT_WS(',',

                              item_id,

                              nick,

                              rank,

                              trade_time))

           FROM topspider.top_item_trade

          WHERE DATE(population_tsmp) = inDateOf;

   END$$

DELIMITER ;