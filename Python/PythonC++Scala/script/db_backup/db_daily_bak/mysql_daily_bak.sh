#!/bin/sh
yesterday=$(date -d "1 day ago" +%Y%m%d)
python2.7 mysql_backup_gen.py "${yesterday}"
sh mysql_backup_"${yesterday}".sh
svn add mysql_backup_"${yesterday}".sh
svn commit -m 'add new mysql_backup script'