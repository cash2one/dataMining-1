 use ibbd2_daily;
 
 DROP TABLE IF EXISTS `keyword`;
 CREATE TABLE `keyword`(
 `id` SMALLINT(2) AUTO_INCREMENT,
 `keyword` varchar(100) NOT NULL,
 primary key(`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词信息';
 
 DROP TABLE IF EXISTS `keyword_daily_status`;
 CREATE TABLE `keyword_daily_status` (
 `keyword_id` smallint(2) NOT NULL COMMENT '关键词ID',
 `keyword` varchar(100) NOT NULL COMMENT '关键词，为配合历史表保留列',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '属性更新时间',
  `volume` int(11) NOT NULL DEFAULT 0 COMMENT '商品销量',
  `trade_num` int(11) NOT NULL DEFAULT 0 COMMENT '成交笔数',
  `sales` float NOT NULL DEFAULT 0 COMMENT '销售额',
  `buyer_num` int(11) NOT NULL DEFAULT 0 COMMENT '购买人数',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`keyword_id`,`date_of`),
  KEY(`keyword`,`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词每日信息统计';

/*
 SELECT CAST(T2.avg_deal_price AS SIGNED), CAST(SUM(T2.volume) AS SIGNED)
        FROM
        (SELECT item_id FROM ibbd2.top_cat_items T
            WHERE T.keyword='四物汤') T1
        LEFT JOIN ibbd2.top_item2 T2
        ON T1.item_id = T2.item_id
        AND T2.date_of BETWEEN '2013-02-02 00:00:00' AND '2013-03-04 00:00:00'
        WHERE T2.item_id IS NOT NULL
        GROUP BY CAST(T2.avg_deal_price AS SIGNED)
        ORDER BY CAST(T2.avg_deal_price AS SIGNED)
 */
DROP TABLE IF EXISTS `ststc_keyword_price_volume`;
CREATE TABLE `ststc_keyword_price_volume`(
	 `keyword_id` smallint(2) NOT NULL COMMENT '关键词ID',
 `keyword` varchar(100) NOT NULL COMMENT '关键词，为配合历史表保留列',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '属性更新时间',
  `price` smallint(2) not NULL COMMENT '价钱，并不是准确数值，只是约数',
  `volume` smallint(2) NOT NULL DEFAULT 0 COMMENT '商品销量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY(`keyword_id`,`date_of`,`price`,`volume`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表－关键词每天的价格销售情况';


/*
 insert into ibbd2_daily.ststc_keyword_province_status 
 (select T1.id,T2.keyword,T2.date_of,IF(T2.province='','未知',T2.province),sum(T2.volume),sum(T2.trade_num),sum(T2.sales),now() 
  from ibbd2_daily.keyword T1, ibbd2.ststc_cat_shop_sales_detail T2 where T1.keyword=T2.keyword and T2.keyword='1tb移动硬盘' group by date_of,province);
 */
DROP TABLE IF EXISTS ststc_keyword_province_status;
CREATE TABLE ststc_keyword_province_status(
`keyword_id` smallint(2) NOT NULL COMMENT '关键词ID',
 `keyword` varchar(100) NOT NULL COMMENT '关键词，为配合历史表保留列',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '属性更新时间',
  `province` enum('未知','上海','云南','内蒙古','北京','台湾','吉林','四川','天津','宁夏','安徽','山东','山西','广东','广西','新疆','江苏','江西','河北','河南','浙江','海南','湖北','湖南','澳门','甘肃','福建','西藏','贵州','辽宁','重庆','陕西','青海','香港','黑龙江') not NULL default '未知' COMMENT '价钱，并不是准确数值，只是约数',
  `volume` int(10) NOT NULL DEFAULT 0 COMMENT '商品销量',
  `trade_num` int(11) NOT NULL DEFAULT 0 COMMENT '成交笔数',
  `sales` float(10,2) NOT NULL DEFAULT 0 COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  key(`keyword_id`,date_of,province)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词每天的省份销售情况';