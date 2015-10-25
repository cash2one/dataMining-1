-- MySQL dump 10.13  Distrib 5.5.28, for Win32 (x86)
--
-- Host: 223.4.155.152    Database: ibbdlog
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
-- Table structure for table `ibbd_log`
--

DROP TABLE IF EXISTS `ibbd_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibbd_log` (
  `visit_time` datetime NOT NULL COMMENT '访问时间',
  `remote_ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip',
  `current_users` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_agent` varchar(300) NOT NULL DEFAULT '' COMMENT '用户系统浏览器等详情',
  `referer` varchar(400) NOT NULL DEFAULT '' COMMENT '来源页面',
  `path` varchar(200) NOT NULL DEFAULT '' COMMENT '访问页面',
  `uri` varchar(500) NOT NULL DEFAULT '' COMMENT 'uri',
  `pk` varchar(32) NOT NULL DEFAULT '' COMMENT '日志MD5',
  PRIMARY KEY (`pk`),
  KEY `visit_time` (`visit_time`),
  KEY `remote_ip` (`remote_ip`),
  KEY `current_users` (`current_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-29 15:25:54
