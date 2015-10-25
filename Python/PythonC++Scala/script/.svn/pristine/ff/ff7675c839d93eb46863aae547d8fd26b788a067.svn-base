use hostinfo;

drop table if exists `host_info`;
create table `host_info`(
ip varchar(20) not null comment '主机IP',
name varchar(50) comment '主机名'
)engine=innodb default charset=utf8 comment '主机信息信息';

drop table if exists `cpu_info`;
create table `cpu_info`(
host varchar(20) comment '主机IP',
free float(5,2) comment '空闲时间', 
tsmp timestamp comment '数据获取时间',
key `key_tsmp`(tsmp)
)engine=innodb default charset=utf8 comment 'CPU信息';

drop table if exists `mem_info`;
create table `mem_info`(
host varchar(20) comment '主机IP',
total float(12,2) comment '总共空间',
used float(10,2) comment '已用空间', 
tsmp timestamp comment '数据获取时间',
key `key_tsmp`(tsmp)
)engine=innodb default charset=utf8 comment '内存信息';

drop table if exists `cpu_top5_info`;
create table `cpu_top5_info`(
host varchar(20) comment '主机IP',
name varchar(300) comment '进程名', 
cpu float(5,2) comment '进程占用cpu',
mem float(12,2) comment '进程占用内存',
order_of int(1) comment '名次',
tsmp timestamp comment '数据获取时间',
key `key_tsmp`(tsmp)
)engine=innodb default charset=utf8 comment '占用CPU前5名进程信息';

drop table if exists `mem_top5_info`;
create table `mem_top5_info`(
host varchar(20) comment '主机IP',
name varchar(300) comment '进程名', 
cpu float(5,2) comment '进程占用cpu',
mem float(12,2) comment '进程占用内存',
order_of int(1) comment '名次',
tsmp timestamp comment '数据获取时间',
key `key_tsmp`(tsmp)
)engine=innodb default charset=utf8 comment '占用内存前5名进程信息';


drop table if exists `disk_info`;
create table `disk_info`(
host varchar(20) comment '主机IP',
name varchar(100) comment '挂载点', 
total float(20,2) comment '总共空间',
used float(20,2) comment '已用空间',
tsmp timestamp comment '数据获取时间',
key `key_tsmp`(tsmp)
)engine=innodb default charset=utf8 comment '硬盘信息';

drop table if exists `disk_io_info`;
create table `disk_io_info`(
host varchar(20) comment '主机IP',
name varchar(100) comment '挂载点', 
util float(5,2) comment '负载情况',
tsmp timestamp comment '数据获取时间',
key `key_tsmp`(tsmp)
)engine=innodb default charset=utf8 comment '硬盘IO信息';

drop table if exists `web_io_info`;
create table `web_io_info`(
host varchar(20) comment '主机IP',
name varchar(10) comment '端口', 
receive float(20,2) comment '每秒接受数据',
send float(20,2) comment '每秒发送数据',
tsmp timestamp comment '数据获取时间',
key `key_tsmp`(tsmp)
)engine=innodb default charset=utf8 comment '网络IO信息';
/*
('webIOStat', [{'receive': '223.76', 'unit': 'byte/s', 'name': 'eth0', 'send': '0.00'}])
('memTop5', [{'mem': '10.6', 'name': '\xe7\x9a\x84\xe9\x93\xbe\xe6\x8e\xa5', 'unit': '%', 'cpu': '3.8'}, {'mem': '7.6', 'name': '/usr/lib/firefox/firefox', 'unit': '%', 'cpu': '10.1'}, {'mem': '1.5', 'name': '/org/wrapper/NSPlugins/libflashplayer.so/8262-5', 'unit': '%', 'cpu': '2.8'}, {'mem': '1.2', 'name': 'vt7', 'unit': '%', 'cpu': '0.5'}, {'mem': '1.0', 'name': '--port=3306', 'unit': '%', 'cpu': '0.0'}])
('diskIOStat', [{'util': '0.05', 'name': 'sda', 'unit': '%'}, {'util': '0.05', 'name': 'sda1', 'unit': '%'}, {'util': '0.00', 'name': 'sda2', 'unit': '%'}, {'util': '0.00', 'name': 'sda5', 'unit': '%'}, {'util': '0.01', 'name': 'sda6', 'unit': '%'}])
('mem', {'unit': 'MB', 'free': 642})
('cpuTop5', [{'mem': '0.2', 'name': '/root/workspace/tbi/ibbdteam/handler/machineload.py', 'unit': '%', 'cpu': '22.0'}, {'mem': '7.6', 'name': '/usr/lib/firefox/firefox', 'unit': '%', 'cpu': '10.1'}, {'mem': '10.6', 'name': '\xe7\x9a\x84\xe9\x93\xbe\xe6\x8e\xa5', 'unit': '%', 'cpu': '3.8'}, {'mem': '1.5', 'name': '/org/wrapper/NSPlugins/libflashplayer.so/8262-5', 'unit': '%', 'cpu': '2.8'}, {'mem': '0.2', 'name': 'plugin', 'unit': '%', 'cpu': '2.1'}])
('cpu', {'unit': '%', 'free': 97})
('diskStat', [{'available': '13231', 'used': '4294', 'name': '/dev/sda1', 'percent': '25%', 'total': '18479', 'unit': 'mb'}, {'available': '867242', 'used': '1684', 'name': '/dev/sda6', 'percent': '1%', 'total': '915426', 'unit': 'mb'}])
 */
