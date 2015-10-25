-- MySQL dump 10.13  Distrib 5.5.24, for Linux (x86_64)
--
-- Host: localhost    Database: topspider
-- ------------------------------------------------------
-- Server version	5.5.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item_lastest_rate_tsmp`
--

DROP TABLE IF EXISTS `item_lastest_rate_tsmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_lastest_rate_tsmp` (
  `auc_num_id` varchar(20) NOT NULL DEFAULT '' COMMENT 'aucNumId',
  `lastest_update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`auc_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_lastest_trade_tsmp`
--

DROP TABLE IF EXISTS `item_lastest_trade_tsmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_lastest_trade_tsmp` (
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `lastest_trade_date` date DEFAULT NULL,
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule_error_log`
--

DROP TABLE IF EXISTS `schedule_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_error_log` (
  `schedule` varchar(30) DEFAULT NULL COMMENT '任务类型',
  `run_date` date DEFAULT NULL COMMENT '运行日期',
  `slave_id` varchar(30) DEFAULT NULL COMMENT 'slave ID',
  `schedule_id` varchar(30) DEFAULT NULL COMMENT '任务ID',
  `schedule_error_id` varchar(30) DEFAULT NULL COMMENT '任务错误类型',
  `error_msg` varchar(100) DEFAULT NULL COMMENT '错误消息',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='爬虫错误日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule_plan_log`
--

DROP TABLE IF EXISTS `schedule_plan_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_plan_log` (
  `schedule` varchar(30) NOT NULL COMMENT '任务类型',
  `run_date` date NOT NULL COMMENT '运行日期',
  `schedule_id` varchar(30) NOT NULL COMMENT '任务ID',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `schedule` (`schedule`),
  KEY `run_date` (`run_date`),
  KEY `schedule_id` (`schedule_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='爬虫任务计划日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_1`
--

DROP TABLE IF EXISTS `tmp_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_1` (
  `item_id` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_2`
--

DROP TABLE IF EXISTS `tmp_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_2` (
  `item_id` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_20w`
--

DROP TABLE IF EXISTS `top_20w`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_20w` (
  `publish_date` date NOT NULL COMMENT '发布日期',
  `cat_1` varchar(50) NOT NULL COMMENT '一级类目',
  `cat_2` varchar(50) DEFAULT NULL COMMENT '二级类目',
  `cat_3` varchar(50) DEFAULT NULL COMMENT '三级类目',
  `keyword` varchar(50) DEFAULT NULL COMMENT '关键词',
  `buyer_num` int(11) NOT NULL COMMENT '关键词购买人数',
  `click_num` int(11) NOT NULL COMMENT '点击量',
  `ppc` float(5,2) NOT NULL COMMENT '平均点击费用',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  KEY `publish_date` (`publish_date`),
  KEY `cat_1` (`cat_1`),
  KEY `cat_2` (`cat_2`),
  KEY `cat_3` (`cat_3`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每周Top20W词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_allitem_info`
--

DROP TABLE IF EXISTS `top_allitem_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_allitem_info` (
  `site_id` varchar(5) NOT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) NOT NULL COMMENT '店铺ID',
  `user_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `item_link` varchar(100) DEFAULT NULL COMMENT '商品链接',
  `item_pic` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `item_price_type` varchar(20) DEFAULT NULL COMMENT '商品价格类型',
  `item_price` float DEFAULT NULL COMMENT '商品价格',
  `item_sales` int(11) DEFAULT '0' COMMENT '商品30天销量',
  `item_rate_num` int(11) DEFAULT '0' COMMENT '商品评价数量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺所有宝贝概括信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item`
--

DROP TABLE IF EXISTS `top_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_links`
--

DROP TABLE IF EXISTS `top_item_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_links` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `shop_type` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `item_id` varchar(20) DEFAULT NULL COMMENT '宝贝ID',
  `t` varchar(20) DEFAULT NULL COMMENT '时间标志',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `shop_id` (`shop_id`),
  KEY `shop_type` (`shop_type`),
  KEY `item_id` (`item_id`),
  KEY `t` (`t`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝店铺宝贝ID表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_rate`
--

DROP TABLE IF EXISTS `top_item_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_rate` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `auc_num_id` varchar(20) DEFAULT NULL COMMENT 'aucNumId',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `date` datetime DEFAULT NULL COMMENT '评价时间',
  `rate_id` varchar(30) DEFAULT NULL COMMENT '评价ID',
  `anony` varchar(5) DEFAULT NULL COMMENT '是否匿名',
  `nick` varchar(20) DEFAULT NULL COMMENT '评价人昵称',
  `nick_url` varchar(100) DEFAULT NULL COMMENT '评价人链接',
  `rank` varchar(20) DEFAULT NULL COMMENT '评价用户等级',
  `rank_url` varchar(100) DEFAULT NULL COMMENT '评价用户信用链接',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `vip_level` int(11) DEFAULT NULL COMMENT 'vip等级',
  `valid_score` int(11) DEFAULT NULL COMMENT '有效评分',
  `appendId` varchar(40) DEFAULT NULL COMMENT '追加评论ID',
  `appendContent` varchar(300) DEFAULT NULL COMMENT '追加评论内容',
  `appendAfter` int(11) DEFAULT NULL COMMENT '在多少天后追加',
  `appendTime` datetime DEFAULT NULL COMMENT '追加评论的时间',
  `appendReply` varchar(100) DEFAULT NULL COMMENT '追加评论的回复',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `auc_num_id` (`auc_num_id`),
  KEY `date` (`date`),
  KEY `rate_id` (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `valid_score` (`valid_score`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_rate_his`
--

DROP TABLE IF EXISTS `top_item_rate_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_rate_his` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `auc_num_id` varchar(20) DEFAULT NULL COMMENT 'aucNumId',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `date` datetime DEFAULT NULL COMMENT '评价时间',
  `rate_id` varchar(30) NOT NULL DEFAULT '' COMMENT '评价ID',
  `anony` varchar(5) DEFAULT NULL COMMENT '是否匿名',
  `nick` varchar(20) DEFAULT NULL COMMENT '评价人昵称',
  `nick_url` varchar(100) DEFAULT NULL COMMENT '评价人链接',
  `rank` varchar(20) DEFAULT NULL COMMENT '评价用户等级',
  `rank_url` varchar(100) DEFAULT NULL COMMENT '评价用户信用链接',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
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
  KEY `rate_id` (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `valid_score` (`valid_score`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_rate_his_2`
--

DROP TABLE IF EXISTS `top_item_rate_his_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_rate_his_2` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `auc_num_id` varchar(20) DEFAULT NULL COMMENT 'aucNumId',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `date` datetime DEFAULT NULL COMMENT '评价时间',
  `rate_id` varchar(30) DEFAULT NULL COMMENT '评价ID',
  `anony` varchar(5) DEFAULT NULL COMMENT '是否匿名',
  `nick` varchar(20) DEFAULT NULL COMMENT '评价人昵称',
  `nick_url` varchar(100) DEFAULT NULL COMMENT '评价人链接',
  `rank` varchar(20) DEFAULT NULL COMMENT '评价用户等级',
  `rank_url` varchar(100) DEFAULT NULL COMMENT '评价用户信用链接',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `vip_level` int(11) DEFAULT NULL COMMENT 'vip等级',
  `valid_score` int(11) DEFAULT NULL COMMENT '有效评分',
  `appendId` varchar(40) DEFAULT NULL COMMENT '追加评论ID',
  `appendContent` varchar(300) DEFAULT NULL COMMENT '追加评论内容',
  `appendAfter` int(11) DEFAULT NULL COMMENT '在多少天后追加',
  `appendTime` datetime DEFAULT NULL COMMENT '追加评论的时间',
  `appendReply` varchar(100) DEFAULT NULL COMMENT '追加评论的回复',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `auc_num_id` (`auc_num_id`),
  KEY `date` (`date`),
  KEY `rate_id` (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `valid_score` (`valid_score`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_rate_his_3`
--

DROP TABLE IF EXISTS `top_item_rate_his_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_rate_his_3` (
  `site_id` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `auc_num_id` varchar(20) DEFAULT NULL COMMENT 'aucNumId',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku',
  `title` varchar(250) DEFAULT NULL COMMENT '宝贝标题',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `date` datetime DEFAULT NULL COMMENT '评价时间',
  `rate_id` varchar(30) DEFAULT NULL COMMENT '评价ID',
  `anony` varchar(5) DEFAULT NULL COMMENT '是否匿名',
  `nick` varchar(20) DEFAULT NULL COMMENT '评价人昵称',
  `nick_url` varchar(100) DEFAULT NULL COMMENT '评价人链接',
  `rank` varchar(20) DEFAULT NULL COMMENT '评价用户等级',
  `rank_url` varchar(100) DEFAULT NULL COMMENT '评价用户信用链接',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `vip_level` int(11) DEFAULT NULL COMMENT 'vip等级',
  `valid_score` int(11) DEFAULT NULL COMMENT '有效评分',
  `appendId` varchar(40) DEFAULT NULL COMMENT '追加评论ID',
  `appendContent` varchar(300) DEFAULT NULL COMMENT '追加评论内容',
  `appendAfter` int(11) DEFAULT NULL COMMENT '在多少天后追加',
  `appendTime` datetime DEFAULT NULL COMMENT '追加评论的时间',
  `appendReply` varchar(100) DEFAULT NULL COMMENT '追加评论的回复',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `auc_num_id` (`auc_num_id`),
  KEY `date` (`date`),
  KEY `rate_id` (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `valid_score` (`valid_score`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade`
--

DROP TABLE IF EXISTS `top_item_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his`
--

DROP TABLE IF EXISTS `top_item_trade_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_10`
--

DROP TABLE IF EXISTS `top_item_trade_his_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_11`
--

DROP TABLE IF EXISTS `top_item_trade_his_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_12`
--

DROP TABLE IF EXISTS `top_item_trade_his_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_13`
--

DROP TABLE IF EXISTS `top_item_trade_his_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_14`
--

DROP TABLE IF EXISTS `top_item_trade_his_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_15`
--

DROP TABLE IF EXISTS `top_item_trade_his_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_2`
--

DROP TABLE IF EXISTS `top_item_trade_his_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121210`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121210`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121210` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121212`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121212`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121213`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121213`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121213` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121215`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121215` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121216`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121216`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121216` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121217`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121217`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121217` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_3`
--

DROP TABLE IF EXISTS `top_item_trade_his_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_4`
--

DROP TABLE IF EXISTS `top_item_trade_his_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_5`
--

DROP TABLE IF EXISTS `top_item_trade_his_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_6`
--

DROP TABLE IF EXISTS `top_item_trade_his_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_7`
--

DROP TABLE IF EXISTS `top_item_trade_his_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_8`
--

DROP TABLE IF EXISTS `top_item_trade_his_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_9`
--

DROP TABLE IF EXISTS `top_item_trade_his_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_itemsearchresult`
--

DROP TABLE IF EXISTS `top_itemsearchresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_itemsearchresult_bak`
--

DROP TABLE IF EXISTS `top_itemsearchresult_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_itemsearchresult_bak` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_price_monitor`
--

DROP TABLE IF EXISTS `top_price_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_price_monitor` (
  `item_id` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `title` varchar(250) DEFAULT NULL COMMENT '商品标题',
  `price` float DEFAULT NULL COMMENT '价格搜过结果',
  `pic` varchar(300) DEFAULT NULL COMMENT '商品图片',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '卖家',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `item_id` (`item_id`),
  KEY `price` (`price`),
  KEY `wangwang` (`wangwang`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='价格监控结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_price_monitor2`
--

DROP TABLE IF EXISTS `top_price_monitor2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_price_monitor2` (
  `item_id` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `title` varchar(250) DEFAULT NULL COMMENT '商品标题',
  `price` float DEFAULT NULL COMMENT '价格搜过结果',
  `pic` varchar(300) DEFAULT NULL COMMENT '商品图片',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '卖家ID',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '卖家',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `item_id` (`item_id`),
  KEY `price` (`price`),
  KEY `wangwang` (`wangwang`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `user_num_id` (`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='价格监控结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_shop`
--

DROP TABLE IF EXISTS `top_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝店铺表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_user_rate_spurating`
--

DROP TABLE IF EXISTS `top_user_rate_spurating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_user_rate_spurating` (
  `rate_id` varchar(20) DEFAULT NULL COMMENT '评论ID',
  `xid` varchar(20) DEFAULT NULL COMMENT '未知',
  `spu_name` varchar(20) DEFAULT NULL COMMENT '属性名',
  `spu_value` varchar(20) DEFAULT NULL COMMENT '属性值',
  `spu_desc` varchar(20) DEFAULT NULL COMMENT '属性详解',
  KEY `rate_id` (`rate_id`,`xid`,`spu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝用户-商品属性评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_user_ratelist`
--

DROP TABLE IF EXISTS `top_user_ratelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_user_ratelist` (
  `uid` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `auc_num_id` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `auc_price` float DEFAULT NULL COMMENT '商品价格',
  `auc_sku` varchar(100) DEFAULT NULL COMMENT '商品属性',
  `auc_title` varchar(250) DEFAULT NULL COMMENT '商品标题',
  `award` varchar(50) DEFAULT NULL COMMENT '买家奖励',
  `content` varchar(250) DEFAULT NULL COMMENT '评价内容',
  `date` date DEFAULT NULL COMMENT '评价日期',
  `from` varchar(20) DEFAULT NULL COMMENT '来源',
  `properties_avg` float DEFAULT NULL COMMENT '未知',
  `rate` varchar(5) DEFAULT NULL COMMENT '评价级别',
  `rate_id` varchar(20) DEFAULT NULL COMMENT '评价ID',
  `rater_type` int(11) DEFAULT NULL COMMENT '评价人类型',
  `tag` varchar(10) DEFAULT NULL COMMENT '评价标签',
  `trade_id` varchar(30) DEFAULT NULL COMMENT '交易ID',
  `useful` int(11) DEFAULT NULL COMMENT '是否有用',
  `user_avatar` varchar(20) DEFAULT NULL COMMENT '未知',
  `user_nick` varchar(30) DEFAULT NULL COMMENT '买家昵称',
  `user_id` varchar(30) DEFAULT NULL COMMENT '买家ID',
  `validscore` int(11) DEFAULT NULL COMMENT '是否有效',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  KEY `uid` (`uid`,`auc_num_id`),
  KEY `user_nick` (`user_nick`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝用户评价记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_zhitongche`
--

DROP TABLE IF EXISTS `top_zhitongche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_zhitongche` (
  `ip` varchar(20) DEFAULT NULL COMMENT '访问者IP',
  `keyword` varchar(20) NOT NULL COMMENT '关键词',
  `rank` int(11) NOT NULL COMMENT '排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_link` varchar(100) NOT NULL COMMENT '商品链接',
  `item_img` varchar(200) NOT NULL COMMENT '商品图片',
  `item_promp_name` varchar(250) NOT NULL COMMENT '商品直通车名称',
  `item_title` varchar(250) NOT NULL COMMENT '商品标题',
  `user_num_id` varchar(20) NOT NULL COMMENT '卖家用户ID',
  `wangwang` varchar(50) NOT NULL COMMENT '旺旺账号',
  `price` float NOT NULL COMMENT '直通车标价',
  `location` varchar(50) NOT NULL COMMENT '所在地',
  `volume` int(11) NOT NULL COMMENT '销量',
  `key` varchar(50) NOT NULL COMMENT '搜索词',
  `keys` varchar(100) NOT NULL COMMENT '匹配词组',
  `population_tsmp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `key` (`key`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `ip` (`ip`),
  KEY `wangwang` (`wangwang`),
  KEY `user_num_id` (`user_num_id`),
  KEY `rank` (`rank`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直通车搜索结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_zhitongche_bak`
--

DROP TABLE IF EXISTS `top_zhitongche_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_zhitongche_bak` (
  `ip` varchar(20) DEFAULT NULL COMMENT '访问者IP',
  `keyword` varchar(20) NOT NULL COMMENT '关键词',
  `rank` int(11) NOT NULL COMMENT '排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_link` varchar(100) NOT NULL COMMENT '商品链接',
  `item_img` varchar(200) NOT NULL COMMENT '商品图片',
  `item_promp_name` varchar(250) NOT NULL COMMENT '商品直通车名称',
  `item_title` varchar(250) NOT NULL COMMENT '商品标题',
  `user_num_id` varchar(20) NOT NULL COMMENT '卖家用户ID',
  `wangwang` varchar(50) NOT NULL COMMENT '旺旺账号',
  `price` float NOT NULL COMMENT '直通车标价',
  `location` varchar(50) NOT NULL COMMENT '所在地',
  `volume` int(11) NOT NULL COMMENT '销量',
  `key` varchar(50) NOT NULL COMMENT '搜索词',
  `keys` varchar(100) NOT NULL COMMENT '匹配词组',
  `population_tsmp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `rank` (`rank`),
  KEY `index_keyword_tsmp_wangwang_item_rank` (`keyword`,`population_tsmp`,`wangwang`,`item_id`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直通车搜索结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_ztc_item`
--

DROP TABLE IF EXISTS `top_ztc_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_ztc_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '暂定使用zhitongche_id',
  `zhitongche_id` bigint(20) NOT NULL COMMENT '直通车id',
  `link` varchar(100) NOT NULL COMMENT '商品链接',
  `img` varchar(200) NOT NULL COMMENT '商品图片',
  `zhitongche_name` varchar(250) NOT NULL COMMENT '商品直通车名称',
  `title` varchar(200) NOT NULL COMMENT '商品标题',
  `shop_id` varchar(50) NOT NULL COMMENT '卖家旺旺ID',
  `price` decimal(15,2) NOT NULL COMMENT '价钱',
  `location` varchar(50) NOT NULL COMMENT '所在地',
  `volume` bigint(20) unsigned NOT NULL COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21763948730 DEFAULT CHARSET=utf8 COMMENT='直通车商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_ztc_keyword_update_time`
--

DROP TABLE IF EXISTS `top_ztc_keyword_update_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_ztc_keyword_update_time` (
  `keyword` varchar(30) NOT NULL COMMENT '关键词',
  `lastest_tsmp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直通车中关键字的最新更新时间';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_ztc_shop`
--

DROP TABLE IF EXISTS `top_ztc_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_ztc_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '暂定使用shop_id',
  `shop_id` bigint(20) NOT NULL,
  `wangwang` varchar(255) NOT NULL COMMENT '卖家旺旺',
  PRIMARY KEY (`id`),
  KEY `wangwang` (`wangwang`,`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1097851986 DEFAULT CHARSET=utf8 COMMENT='直通车旺旺帐号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_ztc_simple`
--

DROP TABLE IF EXISTS `top_ztc_simple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_ztc_simple` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL COMMENT '访问者ip',
  `keyword` varchar(30) NOT NULL COMMENT '关键词',
  `item_id` bigint(20) NOT NULL COMMENT '商品id',
  `rank` int(11) NOT NULL COMMENT '排名',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '卖家用户ID',
  `key` varchar(50) NOT NULL COMMENT '搜索词',
  `keys` varchar(100) NOT NULL COMMENT '匹配词组',
  `population_tsmp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`),
  KEY `index_item` (`item_id`),
  KEY `index_keyword_tsmp` (`keyword`,`population_tsmp`)
) ENGINE=InnoDB AUTO_INCREMENT=13356 DEFAULT CHARSET=utf8 COMMENT='直通车排名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'topspider'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-05 18:21:31
