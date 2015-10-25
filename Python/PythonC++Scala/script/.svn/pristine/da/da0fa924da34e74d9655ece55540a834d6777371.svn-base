USE topdata2;
DROP TABLE IF EXISTS `top20w`;
CREATE TABLE `top20w` (
  `publish_date` date DEFAULT NULL COMMENT '发布日期',
  `cat_level1` varchar(30) DEFAULT NULL COMMENT '一级类目',
  `cat_level1_id` varchar(32) DEFAULT NULL,
  `cat_level2` varchar(30) DEFAULT NULL COMMENT '二级类目',
  `cat_level2_id` varchar(32) DEFAULT NULL,
  `cat_level3` varchar(30) DEFAULT NULL COMMENT '三级类目',
  `cat_level3_id` varchar(32) DEFAULT NULL,
  `keyword` varchar(30) DEFAULT NULL COMMENT '关键词',
  `keyword_id` varchar(32) DEFAULT NULL,
  `keyword_buyer_num` varchar(30) DEFAULT NULL COMMENT '关键词购买人数',
  `click_amount` varchar(30) DEFAULT NULL COMMENT '关键词上周点击次数',
  `ppc` varchar(30) DEFAULT NULL COMMENT '关键词上周平均出价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `publish_date` (`publish_date`),
  KEY `keyword` (`keyword`),
  KEY `ppc` (`ppc`),
  KEY `cat_level1_id` (`cat_level1_id`),
  KEY `cat_level2_id` (`cat_level2_id`),
  KEY `cat_level3_id` (`cat_level3_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝直通车top20w';

DROP TABLE IF EXISTS `top20w_keyword`;
CREATE TABLE `top20w_keyword` (
  `kid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关键词ID',
  `cat_level` int(11) DEFAULT NULL COMMENT '类目级别',
  `keyword` varchar(50) DEFAULT NULL COMMENT '关键词',
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=5680 DEFAULT CHARSET=utf8 COMMENT='Top20万关键词ID表';

DROP TABLE IF EXISTS `top20w2`;
CREATE TABLE `top20w2` (
  `publish_date` date DEFAULT NULL COMMENT '发布日期',
  `cat_level1` varchar(30) DEFAULT NULL COMMENT '一级类目',
  `cat_level2` varchar(30) DEFAULT NULL COMMENT '二级类目',
  `cat_level3` varchar(30) DEFAULT NULL COMMENT '三级类目',
  `keyword` varchar(30) DEFAULT NULL COMMENT '关键词',
  `keyword_buyer_num` varchar(30) DEFAULT NULL COMMENT '关键词购买人数',
  `click_amount` varchar(30) DEFAULT NULL COMMENT '关键词上周点击次数',
  `ppc` varchar(30) DEFAULT NULL COMMENT '关键词上周平均出价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `publish_date` (`publish_date`),
  KEY `keyword` (`keyword`),
  KEY `ppc` (`ppc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝直通车top20w';

