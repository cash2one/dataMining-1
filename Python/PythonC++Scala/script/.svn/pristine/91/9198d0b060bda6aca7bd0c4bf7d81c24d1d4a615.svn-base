-- MySQL dump 10.13  Distrib 5.5.24, for Linux (x86_64)
--
-- Host: localhost    Database: hostinfo
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
-- Table structure for table `cpu_info`
--

DROP TABLE IF EXISTS `cpu_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `free` float(5,2) DEFAULT NULL COMMENT '空闲时间',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CPU信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cpu_top5_info`
--

DROP TABLE IF EXISTS `cpu_top5_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu_top5_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(300) DEFAULT NULL COMMENT '进程名',
  `cpu` float(5,2) DEFAULT NULL COMMENT '进程占用cpu',
  `mem` float(12,2) DEFAULT NULL COMMENT '进程占用内存',
  `order_of` int(1) DEFAULT NULL COMMENT '名次',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`),
  KEY `host_tsmp` (`host`,`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='占用CPU前5名进程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disk_info`
--

DROP TABLE IF EXISTS `disk_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disk_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(100) DEFAULT NULL COMMENT '挂载点',
  `total` float(20,2) DEFAULT NULL COMMENT '总共空间',
  `used` float(20,2) DEFAULT NULL COMMENT '已用空间',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='硬盘信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disk_io_info`
--

DROP TABLE IF EXISTS `disk_io_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disk_io_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(100) DEFAULT NULL COMMENT '挂载点',
  `util` float(5,2) DEFAULT NULL COMMENT '负载情况',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='硬盘IO信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `host_info`
--

DROP TABLE IF EXISTS `host_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_info` (
  `ip` varchar(20) NOT NULL COMMENT '主机IP',
  `name` varchar(50) DEFAULT NULL COMMENT '主机名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主机信息信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mem_info`
--

DROP TABLE IF EXISTS `mem_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mem_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `total` float(12,2) DEFAULT NULL COMMENT '总共空间',
  `used` float(10,2) DEFAULT NULL COMMENT '已用空间',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内存信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mem_top5_info`
--

DROP TABLE IF EXISTS `mem_top5_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mem_top5_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(300) DEFAULT NULL COMMENT '进程名',
  `cpu` float(5,2) DEFAULT NULL COMMENT '进程占用cpu',
  `mem` float(12,2) DEFAULT NULL COMMENT '进程占用内存',
  `order_of` int(1) DEFAULT NULL COMMENT '名次',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='占用内存前5名进程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_io_info`
--

DROP TABLE IF EXISTS `web_io_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_io_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(10) DEFAULT NULL COMMENT '端口',
  `receive` float(20,2) DEFAULT NULL COMMENT '每秒接受数据',
  `send` float(20,2) DEFAULT NULL COMMENT '每秒发送数据',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网络IO信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'hostinfo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-05 18:21:34
