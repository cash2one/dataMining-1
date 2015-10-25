-- MySQL dump 10.13  Distrib 5.5.28, for Win32 (x86)
--
-- Host: 223.4.155.152    Database: topapi
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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `tid` varchar(30) DEFAULT NULL COMMENT '交易编号 (父订单的交易编号)',
  `title` varchar(250) DEFAULT NULL COMMENT '商品标题',
  `pic_path` varchar(300) DEFAULT NULL COMMENT '商品图片的绝对路径',
  `price` float DEFAULT NULL COMMENT '商品价格',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `num_iid` varchar(30) DEFAULT NULL COMMENT '商品数字ID',
  `sku_id` varchar(20) DEFAULT NULL COMMENT '商品的最小库存单位Sku的id.可以通过taobao.item.sku.get获取详细的Sku信息',
  `refund_status` varchar(20) DEFAULT NULL COMMENT '退款状态',
  `status` varchar(30) DEFAULT NULL COMMENT '订单状态',
  `oid` varchar(30) DEFAULT NULL COMMENT '子订单编号',
  `total_fee` float DEFAULT NULL COMMENT '应付金额（商品价格 * 商品数量 + 手工调整金额 - 订单优惠金额）',
  `payment` float DEFAULT NULL COMMENT '子订单实付金额',
  `discount_fee` float DEFAULT NULL COMMENT '订单优惠金额',
  `adjust_fee` float DEFAULT NULL COMMENT '手工调整金额',
  `sku_properties_name` varchar(100) DEFAULT NULL COMMENT 'SKU的值',
  `item_meal_name` varchar(100) DEFAULT NULL COMMENT '套餐的值',
  `buyer_rate` tinyint(1) DEFAULT NULL COMMENT '买家是否已评价',
  `seller_rate` tinyint(1) DEFAULT NULL COMMENT '卖家是否已评价',
  `outer_iid` varchar(40) DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)',
  `outer_sku_id` varchar(40) DEFAULT NULL COMMENT '外部网店自己定义的Sku编号',
  `refund_id` varchar(30) DEFAULT NULL COMMENT '最近退款ID',
  `seller_type` varchar(5) DEFAULT NULL COMMENT '卖家类型，可选值为：B（商城商家），C（普通卖家）',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `tid` (`tid`),
  KEY `num_iid` (`num_iid`),
  KEY `oid` (`oid`),
  KEY `total_fee` (`total_fee`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade` (
  `seller_nick` varchar(30) DEFAULT NULL COMMENT '卖家昵称',
  `buyer_nick` varchar(30) DEFAULT NULL COMMENT '买家昵称',
  `title` varchar(250) DEFAULT NULL COMMENT '交易标题',
  `type` varchar(10) DEFAULT NULL COMMENT '交易类型列表',
  `created` datetime DEFAULT NULL COMMENT '交易创建时间。格式:yyyy-MM-dd HH:mm:ss',
  `tid` varchar(30) DEFAULT NULL COMMENT '交易编号 (父订单的交易编号)',
  `seller_rate` tinyint(1) DEFAULT NULL COMMENT '卖家是否已评价',
  `buyer_rate` tinyint(1) DEFAULT NULL COMMENT '买家是否已评价',
  `status` varchar(30) DEFAULT NULL COMMENT '交易状态',
  `payment` float DEFAULT NULL COMMENT '实付金额',
  `discount_fee` float DEFAULT NULL COMMENT '系统优惠金额',
  `adjust_fee` float DEFAULT NULL COMMENT '卖家手工调整金额',
  `post_fee` float DEFAULT NULL COMMENT '邮费',
  `total_fee` float DEFAULT NULL COMMENT '商品金额（商品价格乘以数量的总金额）',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间。格式:yyyy-MM-dd HH:mm:ss',
  `end_time` datetime DEFAULT NULL COMMENT '交易结束时间。交易成功时间(更新交易状态为成功的同时更新)/确认收货时间或者交易关闭时间 。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime DEFAULT NULL COMMENT '交易修改时间(用户对订单的任何修改都会更新此字段)',
  `consign_time` datetime DEFAULT NULL COMMENT '卖家发货时间',
  `buyer_obtain_point_fee` int(11) DEFAULT NULL COMMENT '买家获得积分,返点的积分',
  `point_fee` int(11) DEFAULT NULL COMMENT '买家使用积分',
  `real_point_fee` int(11) DEFAULT NULL COMMENT '买家实际使用积分（扣除部分退款使用的积分）',
  `received_payment` float DEFAULT NULL COMMENT '卖家实际收到的支付宝打款金额',
  `commission_fee` float DEFAULT NULL COMMENT '交易佣金',
  `pic_path` varchar(100) DEFAULT NULL COMMENT '商品图片绝对途径',
  `num_iid` varchar(30) DEFAULT NULL COMMENT '商品数字编号',
  `num` int(11) DEFAULT NULL COMMENT '商品购买数量',
  `price` float DEFAULT NULL COMMENT '商品价格',
  `cod_fee` float DEFAULT NULL COMMENT '货到付款服务费',
  `cod_status` varchar(50) DEFAULT NULL COMMENT '货到付款物流状态',
  `shipping_type` varchar(50) DEFAULT NULL COMMENT '创建交易时的物流方式',
  `receiver_name` varchar(50) DEFAULT NULL COMMENT '收货人的姓名',
  `receiver_state` varchar(20) DEFAULT NULL COMMENT '收货人的所在省份',
  `receiver_city` varchar(20) DEFAULT NULL COMMENT '收货人的所在城市',
  `receiver_district` varchar(100) DEFAULT NULL COMMENT '收货人的所在地区',
  `receiver_address` varchar(300) DEFAULT NULL COMMENT '收货人的详细地址',
  `receiver_zip` varchar(10) DEFAULT NULL COMMENT '收货人的邮编',
  `receiver_mobile` varchar(15) DEFAULT NULL COMMENT '收货人的手机号码',
  `receiver_phone` varchar(15) DEFAULT NULL COMMENT '收货人的电话号码',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `seller_nick` (`seller_nick`),
  KEY `buyer_nick` (`buyer_nick`),
  KEY `created` (`created`),
  KEY `tid` (`tid`),
  KEY `status` (`status`),
  KEY `payment` (`payment`),
  KEY `total_fee` (`total_fee`),
  KEY `num_iid` (`num_iid`),
  KEY `num` (`num`),
  KEY `price` (`price`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_id`
--

DROP TABLE IF EXISTS `user_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_id` (
  `nick` varchar(50) DEFAULT NULL,
  `uid` varchar(30) DEFAULT NULL
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

-- Dump completed on 2012-12-29 15:27:23
