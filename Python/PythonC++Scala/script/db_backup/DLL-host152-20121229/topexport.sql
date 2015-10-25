-- MySQL dump 10.13  Distrib 5.5.28, for Win32 (x86)
--
-- Host: 223.4.155.152    Database: topexport
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
-- Table structure for table `keyword_trade`
--

DROP TABLE IF EXISTS `keyword_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_trade` (
  `keyword` varchar(30) NOT NULL,
  `rank` int(11) NOT NULL,
  `site_id` varchar(2) NOT NULL,
  `item_id` varchar(30) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `attr_list` text NOT NULL,
  `wangwang` varchar(50) NOT NULL,
  `location` varchar(20) NOT NULL,
  `buyer_nick` varchar(30) NOT NULL,
  `buyer_rank` varchar(10) NOT NULL,
  `buyer_vip_level` varchar(5) NOT NULL,
  `price` float(10,2) NOT NULL,
  `promo_price` float(10,2) NOT NULL,
  `amount` int(11) NOT NULL,
  `trade_time` datetime NOT NULL,
  `sku` varchar(100) NOT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `keyword` (`keyword`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词的交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword_trade_baonuanneiyi`
--

DROP TABLE IF EXISTS `keyword_trade_baonuanneiyi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_trade_baonuanneiyi` (
  `keyword` varchar(30) NOT NULL DEFAULT '' COMMENT '类目',
  `NULL` binary(0) DEFAULT NULL,
  `shop_type` varchar(20) COMMENT '所属店铺类型',
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `title` varchar(250) COMMENT '商品标题',
  `attr_list` varchar(1500) DEFAULT '' COMMENT '商品属性',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '旺旺昵称',
  `location2` varchar(20) COMMENT '修正地址',
  `nick` varchar(20) DEFAULT NULL COMMENT '买家昵称',
  `rank` varchar(10) DEFAULT NULL COMMENT '买家信用',
  `vip_level` varchar(10) DEFAULT NULL COMMENT '买家vip等级',
  `price` float DEFAULT NULL COMMENT '成交价',
  `promo_title` varchar(20) DEFAULT NULL COMMENT '促销类型',
  `amount` int(11) DEFAULT NULL COMMENT '购买量',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `sku` varchar(100) DEFAULT NULL COMMENT '交易sku'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword_trade_nanshishoubiao`
--

DROP TABLE IF EXISTS `keyword_trade_nanshishoubiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_trade_nanshishoubiao` (
  `keyword` varchar(30) NOT NULL,
  `rank` int(11) NOT NULL,
  `site_id` varchar(2) NOT NULL,
  `item_id` varchar(30) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `attr_list` text NOT NULL,
  `wangwang` varchar(50) NOT NULL,
  `location` varchar(20) NOT NULL,
  `buyer_nick` varchar(30) NOT NULL,
  `buyer_rank` varchar(10) NOT NULL,
  `buyer_vip_level` varchar(5) NOT NULL,
  `price` float(10,2) NOT NULL,
  `promo_price` float(10,2) NOT NULL,
  `amount` int(11) NOT NULL,
  `trade_time` datetime NOT NULL,
  `sku` varchar(100) NOT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `keyword` (`keyword`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词的交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword_trade_nvshishoubiao`
--

DROP TABLE IF EXISTS `keyword_trade_nvshishoubiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_trade_nvshishoubiao` (
  `keyword` varchar(30) NOT NULL,
  `rank` int(11) NOT NULL,
  `site_id` varchar(2) NOT NULL,
  `item_id` varchar(30) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `attr_list` text NOT NULL,
  `wangwang` varchar(50) NOT NULL,
  `location` varchar(20) NOT NULL,
  `buyer_nick` varchar(30) NOT NULL,
  `buyer_rank` varchar(10) NOT NULL,
  `buyer_vip_level` varchar(5) NOT NULL,
  `price` float(10,2) NOT NULL,
  `promo_price` float(10,2) NOT NULL,
  `amount` int(11) NOT NULL,
  `trade_time` datetime NOT NULL,
  `sku` varchar(100) NOT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `keyword` (`keyword`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词的交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword_trade_tieguanyin`
--

DROP TABLE IF EXISTS `keyword_trade_tieguanyin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_trade_tieguanyin` (
  `keyword` varchar(30) NOT NULL,
  `rank` int(11) NOT NULL,
  `site_id` varchar(2) NOT NULL,
  `item_id` varchar(30) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `attr_list` text NOT NULL,
  `wangwang` varchar(50) NOT NULL,
  `location` varchar(20) NOT NULL,
  `buyer_nick` varchar(30) NOT NULL,
  `buyer_rank` varchar(10) NOT NULL,
  `buyer_vip_level` varchar(5) NOT NULL,
  `price` float(10,2) NOT NULL,
  `promo_price` float(10,2) NOT NULL,
  `amount` int(11) NOT NULL,
  `trade_time` datetime NOT NULL,
  `sku` varchar(100) NOT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `keyword` (`keyword`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词的交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_3`
--

DROP TABLE IF EXISTS `top_item_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_3` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `attr_list` varchar(1500) NOT NULL DEFAULT '' COMMENT '商品属性',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`item_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表3——商品额外字段';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-29 15:39:52
