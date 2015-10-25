-- MySQL dump 10.13  Distrib 5.5.28, for Win32 (x86)
--
-- Host: 223.4.155.152    Database: topdata
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
-- Table structure for table `top_allitem_info`
--

DROP TABLE IF EXISTS `top_allitem_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_rate`
--

DROP TABLE IF EXISTS `top_item_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_rate_20121118`
--

DROP TABLE IF EXISTS `top_item_rate_20121118`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_rate_20121119`
--

DROP TABLE IF EXISTS `top_item_rate_20121119`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_rate_his_1`
--

DROP TABLE IF EXISTS `top_item_rate_his_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_1`
--

DROP TABLE IF EXISTS `top_item_trade_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_1` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_10`
--

DROP TABLE IF EXISTS `top_item_trade_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_10` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_100`
--

DROP TABLE IF EXISTS `top_item_trade_100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_100` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_101`
--

DROP TABLE IF EXISTS `top_item_trade_101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_101` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_11`
--

DROP TABLE IF EXISTS `top_item_trade_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_11` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_12`
--

DROP TABLE IF EXISTS `top_item_trade_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_12` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_13`
--

DROP TABLE IF EXISTS `top_item_trade_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_13` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_14`
--

DROP TABLE IF EXISTS `top_item_trade_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_14` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_15`
--

DROP TABLE IF EXISTS `top_item_trade_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_15` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_16`
--

DROP TABLE IF EXISTS `top_item_trade_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_16` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_17`
--

DROP TABLE IF EXISTS `top_item_trade_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_17` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_18`
--

DROP TABLE IF EXISTS `top_item_trade_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_18` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_19`
--

DROP TABLE IF EXISTS `top_item_trade_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_19` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_2`
--

DROP TABLE IF EXISTS `top_item_trade_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_2` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_20`
--

DROP TABLE IF EXISTS `top_item_trade_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_20` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_21`
--

DROP TABLE IF EXISTS `top_item_trade_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_21` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_22`
--

DROP TABLE IF EXISTS `top_item_trade_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_22` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_23`
--

DROP TABLE IF EXISTS `top_item_trade_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_23` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_24`
--

DROP TABLE IF EXISTS `top_item_trade_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_24` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_25`
--

DROP TABLE IF EXISTS `top_item_trade_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_25` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_26`
--

DROP TABLE IF EXISTS `top_item_trade_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_26` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_27`
--

DROP TABLE IF EXISTS `top_item_trade_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_27` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_28`
--

DROP TABLE IF EXISTS `top_item_trade_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_28` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_29`
--

DROP TABLE IF EXISTS `top_item_trade_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_29` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_3`
--

DROP TABLE IF EXISTS `top_item_trade_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_3` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_30`
--

DROP TABLE IF EXISTS `top_item_trade_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_30` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_31`
--

DROP TABLE IF EXISTS `top_item_trade_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_31` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_32`
--

DROP TABLE IF EXISTS `top_item_trade_32`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_32` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_33`
--

DROP TABLE IF EXISTS `top_item_trade_33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_33` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_34`
--

DROP TABLE IF EXISTS `top_item_trade_34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_34` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_35`
--

DROP TABLE IF EXISTS `top_item_trade_35`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_35` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_36`
--

DROP TABLE IF EXISTS `top_item_trade_36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_36` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_37`
--

DROP TABLE IF EXISTS `top_item_trade_37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_37` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_38`
--

DROP TABLE IF EXISTS `top_item_trade_38`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_38` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_39`
--

DROP TABLE IF EXISTS `top_item_trade_39`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_39` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_4`
--

DROP TABLE IF EXISTS `top_item_trade_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_4` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_40`
--

DROP TABLE IF EXISTS `top_item_trade_40`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_40` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_41`
--

DROP TABLE IF EXISTS `top_item_trade_41`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_41` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_42`
--

DROP TABLE IF EXISTS `top_item_trade_42`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_42` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_43`
--

DROP TABLE IF EXISTS `top_item_trade_43`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_43` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_44`
--

DROP TABLE IF EXISTS `top_item_trade_44`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_44` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_45`
--

DROP TABLE IF EXISTS `top_item_trade_45`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_45` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_46`
--

DROP TABLE IF EXISTS `top_item_trade_46`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_46` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_47`
--

DROP TABLE IF EXISTS `top_item_trade_47`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_47` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_48`
--

DROP TABLE IF EXISTS `top_item_trade_48`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_48` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_49`
--

DROP TABLE IF EXISTS `top_item_trade_49`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_49` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_5`
--

DROP TABLE IF EXISTS `top_item_trade_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_5` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_50`
--

DROP TABLE IF EXISTS `top_item_trade_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_50` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_51`
--

DROP TABLE IF EXISTS `top_item_trade_51`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_51` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_52`
--

DROP TABLE IF EXISTS `top_item_trade_52`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_52` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_53`
--

DROP TABLE IF EXISTS `top_item_trade_53`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_53` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_54`
--

DROP TABLE IF EXISTS `top_item_trade_54`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_54` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_55`
--

DROP TABLE IF EXISTS `top_item_trade_55`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_55` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_56`
--

DROP TABLE IF EXISTS `top_item_trade_56`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_56` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_57`
--

DROP TABLE IF EXISTS `top_item_trade_57`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_57` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_58`
--

DROP TABLE IF EXISTS `top_item_trade_58`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_58` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_59`
--

DROP TABLE IF EXISTS `top_item_trade_59`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_59` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_6`
--

DROP TABLE IF EXISTS `top_item_trade_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_6` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_60`
--

DROP TABLE IF EXISTS `top_item_trade_60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_60` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_61`
--

DROP TABLE IF EXISTS `top_item_trade_61`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_61` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_62`
--

DROP TABLE IF EXISTS `top_item_trade_62`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_62` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_63`
--

DROP TABLE IF EXISTS `top_item_trade_63`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_63` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_64`
--

DROP TABLE IF EXISTS `top_item_trade_64`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_64` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_65`
--

DROP TABLE IF EXISTS `top_item_trade_65`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_65` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_66`
--

DROP TABLE IF EXISTS `top_item_trade_66`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_66` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_67`
--

DROP TABLE IF EXISTS `top_item_trade_67`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_67` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_68`
--

DROP TABLE IF EXISTS `top_item_trade_68`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_68` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_69`
--

DROP TABLE IF EXISTS `top_item_trade_69`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_69` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_7`
--

DROP TABLE IF EXISTS `top_item_trade_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_7` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_70`
--

DROP TABLE IF EXISTS `top_item_trade_70`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_70` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_71`
--

DROP TABLE IF EXISTS `top_item_trade_71`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_71` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_72`
--

DROP TABLE IF EXISTS `top_item_trade_72`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_72` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_73`
--

DROP TABLE IF EXISTS `top_item_trade_73`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_73` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_74`
--

DROP TABLE IF EXISTS `top_item_trade_74`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_74` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_75`
--

DROP TABLE IF EXISTS `top_item_trade_75`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_75` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_76`
--

DROP TABLE IF EXISTS `top_item_trade_76`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_76` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_77`
--

DROP TABLE IF EXISTS `top_item_trade_77`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_77` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_78`
--

DROP TABLE IF EXISTS `top_item_trade_78`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_78` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_79`
--

DROP TABLE IF EXISTS `top_item_trade_79`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_79` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_8`
--

DROP TABLE IF EXISTS `top_item_trade_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_8` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_80`
--

DROP TABLE IF EXISTS `top_item_trade_80`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_80` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_81`
--

DROP TABLE IF EXISTS `top_item_trade_81`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_81` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_82`
--

DROP TABLE IF EXISTS `top_item_trade_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_82` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_83`
--

DROP TABLE IF EXISTS `top_item_trade_83`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_83` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_84`
--

DROP TABLE IF EXISTS `top_item_trade_84`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_84` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_85`
--

DROP TABLE IF EXISTS `top_item_trade_85`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_85` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_86`
--

DROP TABLE IF EXISTS `top_item_trade_86`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_86` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_87`
--

DROP TABLE IF EXISTS `top_item_trade_87`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_87` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_88`
--

DROP TABLE IF EXISTS `top_item_trade_88`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_88` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_89`
--

DROP TABLE IF EXISTS `top_item_trade_89`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_89` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_9`
--

DROP TABLE IF EXISTS `top_item_trade_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_9` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_90`
--

DROP TABLE IF EXISTS `top_item_trade_90`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_90` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_91`
--

DROP TABLE IF EXISTS `top_item_trade_91`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_91` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_92`
--

DROP TABLE IF EXISTS `top_item_trade_92`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_92` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_93`
--

DROP TABLE IF EXISTS `top_item_trade_93`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_93` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_94`
--

DROP TABLE IF EXISTS `top_item_trade_94`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_94` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_95`
--

DROP TABLE IF EXISTS `top_item_trade_95`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_95` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_96`
--

DROP TABLE IF EXISTS `top_item_trade_96`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_96` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_97`
--

DROP TABLE IF EXISTS `top_item_trade_97`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_97` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_98`
--

DROP TABLE IF EXISTS `top_item_trade_98`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_98` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_99`
--

DROP TABLE IF EXISTS `top_item_trade_99`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_99` (
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_16`
--

DROP TABLE IF EXISTS `top_item_trade_his_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_17`
--

DROP TABLE IF EXISTS `top_item_trade_his_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_18`
--

DROP TABLE IF EXISTS `top_item_trade_his_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_19`
--

DROP TABLE IF EXISTS `top_item_trade_his_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20`
--

DROP TABLE IF EXISTS `top_item_trade_his_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121209`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121209`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121215_2`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121215_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121215_2` (
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_1`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_1` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_10`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_10` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_11`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_11` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_12`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_12` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_13`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_13` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_14`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_14` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_15`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_15` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_2`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_2` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_3`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_3` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_4`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_4` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_5`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_5` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_6`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_6` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_7`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_7` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_8`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_8` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121219_9`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121219_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121219_9` (
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_1`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_1` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_10`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_10` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_11`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_11` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_12`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_12` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_13`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_13` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_14`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_14` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_15`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_15` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_2`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_2` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_3`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_3` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_4`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_4` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_5`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_5` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_6`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_6` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_7`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_7` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_8`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_8` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_20121220_9`
--

DROP TABLE IF EXISTS `top_item_trade_his_20121220_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_his_20121220_9` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_21`
--

DROP TABLE IF EXISTS `top_item_trade_his_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_22`
--

DROP TABLE IF EXISTS `top_item_trade_his_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_23`
--

DROP TABLE IF EXISTS `top_item_trade_his_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_24`
--

DROP TABLE IF EXISTS `top_item_trade_his_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_25`
--

DROP TABLE IF EXISTS `top_item_trade_his_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_his_26`
--

DROP TABLE IF EXISTS `top_item_trade_his_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `item_id` (`item_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_trade_tmp`
--

DROP TABLE IF EXISTS `top_item_trade_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_trade_tmp` (
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
  KEY `site_id` (`site_id`),
  KEY `shop_id` (`shop_id`),
  KEY `trade_time` (`trade_time`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品交易记录表';
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
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '唯一识别符',
  PRIMARY KEY (`pk`),
  KEY `shop_id` (`shop_id`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝店铺表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_trade_dist`
--

DROP TABLE IF EXISTS `top_trade_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_trade_dist` (
  `host` varchar(20) NOT NULL DEFAULT '223.4.155.152' COMMENT '主机',
  `table_name` varchar(20) NOT NULL DEFAULT '' COMMENT '表名',
  `shop_id` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `rows` int(11) NOT NULL DEFAULT '0' COMMENT '行数',
  PRIMARY KEY (`host`,`table_name`,`shop_id`),
  KEY `host` (`host`),
  KEY `table_name` (`table_name`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝交易记录分布表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-29 15:32:20
