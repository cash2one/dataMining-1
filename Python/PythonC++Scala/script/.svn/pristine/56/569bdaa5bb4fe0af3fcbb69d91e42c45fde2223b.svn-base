#!/bin/sh
cd /data/script/dw
fetch_date=$(date -d yesterday +%Y%m%d)
etl_date=$(date +%Y%m%d)
python2.7 dispatch_blocking.py
echo $(date) fetch_date $fetch_date > /data/log/dispatch_source.log
echo $(date) etl_date $etl_date >> /data/log/dispatch_source.log
echo $(date) prepare_dispatch.py >> /data/log/dispatch_source.log
python2.7 prepare_dispatch.py "${fetch_date}" >> /data/log/dispatch_source.log
echo $(date) master.py >> /data/log/dispatch_source.log
python2.7 master.py >> /data/log/dispatch_source.log
python2.7 save.py
python2.7 save_2.py
# python2.7 /data/script/dw/dispatch_mail.py source
python2.7 etl_gen.py "${fetch_date}" >> /data/log/dispatch_source.log
python2.7 etl_migrate_gen.py "${etl_date}" >> /data/log/dispatch_source.log
python2.7 etl_dispatch.py "${fetch_date}" >> /data/log/dispatch_source.log
# python2.7 /data/script/dw/dispatch_mail.py source
echo run etl apriori >> /data/log/dispatch_source.log
nohup python2.7 etl_apriori.py "${fetch_date}" >> /data/log/dispatch_source.log &
python2.7 etl_apriori_daemon.py
# python2.7 /data/script/dw/dispatch_mail.py source
cd etl_script/
sh "etl_export_${etl_date}.sh"
# scp etl3_${fetch_date}.sql root@223.4.155.152:/data/script/dw/etl_script/etl3_${fetch_date}.sql
# scp etl_export_${etl_date}.sh root@223.4.155.152:/data/script/dw/etl_script/etl_export_${etl_date}.sh
# scp etl_import_${etl_date}.sh root@223.4.155.152:/data/script/dw/etl_script/etl_import_${etl_date}.sh
echo $(date) dispatch_source finished >> /data/log/dispatch_source.log
scp -rp /data/migrate/${etl_date} root@223.4.155.172:/data/migrate/
scp etl_import_${etl_date}.sh root@223.4.155.172:/data/migrate/${etl_date}/etl_import_${etl_date}.sh
# python2.7 /data/script/dw/dispatch_mail.py source
python2.7 /data/script/dw/dispatch_mail.py notify source
