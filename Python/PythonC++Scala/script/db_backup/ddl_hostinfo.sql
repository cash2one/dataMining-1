USE hostinfo;
DROP TABLE IF EXISTS `disk_info`;
DROP TABLE IF EXISTS `host_info`;
DROP TABLE IF EXISTS `cpu_top5_info`;
DROP TABLE IF EXISTS `mem_info`;
DROP TABLE IF EXISTS `cpu_info`;
DROP TABLE IF EXISTS `web_io_info`;
DROP TABLE IF EXISTS `disk_io_info`;
DROP TABLE IF EXISTS `mem_top5_info`;
CREATE TABLE `disk_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(100) DEFAULT NULL COMMENT '挂载点',
  `total` float(20,2) DEFAULT NULL COMMENT '总共空间',
  `used` float(20,2) DEFAULT NULL COMMENT '已用空间',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='硬盘信息';

CREATE TABLE `host_info` (
  `ip` varchar(20) NOT NULL COMMENT '主机IP',
  `name` varchar(50) DEFAULT NULL COMMENT '主机名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主机信息信息';

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

CREATE TABLE `mem_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `total` float(12,2) DEFAULT NULL COMMENT '总共空间',
  `used` float(10,2) DEFAULT NULL COMMENT '已用空间',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内存信息';

CREATE TABLE `cpu_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `free` float(5,2) DEFAULT NULL COMMENT '空闲时间',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CPU信息';

CREATE TABLE `web_io_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(10) DEFAULT NULL COMMENT '端口',
  `receive` float(20,2) DEFAULT NULL COMMENT '每秒接受数据',
  `send` float(20,2) DEFAULT NULL COMMENT '每秒发送数据',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网络IO信息';

CREATE TABLE `disk_io_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(100) DEFAULT NULL COMMENT '挂载点',
  `util` float(5,2) DEFAULT NULL COMMENT '负载情况',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='硬盘IO信息';

CREATE TABLE `mem_top5_info` (
  `host` varchar(20) DEFAULT NULL COMMENT '主机IP',
  `name` varchar(300) DEFAULT NULL COMMENT '进程名',
  `cpu` float(5,2) DEFAULT NULL COMMENT '进程占用cpu',
  `mem` float(12,2) DEFAULT NULL COMMENT '进程占用内存',
  `order_of` int(1) DEFAULT NULL COMMENT '名次',
  `tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据获取时间',
  KEY `key_tsmp` (`tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='占用内存前5名进程信息';

DELIMITER $$
USE `ibbd2`$$
DELIMITER ;