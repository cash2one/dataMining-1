#!/bin/sh
echo dumping ibbd2 ddl
/usr/local/mysql/bin/mysqldump -uibbd -pspider -d ibbd2 > ibbd2_ddl_$(date +%Y%m%d).sql
/usr/local/mysql/bin/mysqldump -uibbd -pspider -d topspider > topspider_ddl_$(date +%Y%m%d).sql
/usr/local/mysql/bin/mysqldump -uibbd -pspider -d topapi > ibbd2_topapi_$(date +%Y%m%d).sql
/usr/local/mysql/bin/mysqldump -uibbd -pspider -d ibbdlog > ibbdlog_topapi_$(date +%Y%m%d).sql

echo add ddl script to svn
svn add *$(date +%Y%m%d).sql
svn commit -m 'update ddl script'
echo Yeah