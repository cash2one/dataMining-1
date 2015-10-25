#!/bin/sh
etl_date=$(date +%Y%m%d)
reporter_date=$(date -d "2 day ago" +%Y%m%d)
echo $(date) $etl_date > /data/log/dispatch_target.log
echo $(date) $reporter_date >> /data/log/dispatch_target.log
cd /data/script/dw/
svn up
cd /data/script/dw/etl_script/
while true; do
    if [ -f "etl_import_${etl_date}.sh" ]; then
        echo start to import etl data >> /data/log/dispatch_target.log
        sh "etl_import_${etl_date}.sh" >> /data/log/dispatch_target.log
        cd /data/script/cache/
        python2.7 cache_industry_page.py ${reporter_date} >> /data/log/dispatch_target.log
        echo end of dispatch >> /data/log/dispatch_target.log
        python2.7 /data/script/dw/dispatch_mail.py target
        python2.7 /data/script/dw/dispatch_mail.py notify target
        break
    else
        echo $(date +%Y%m%d_%H:%M:%S) waiting... >> /data/log/dispatch_target.log
        sleep 600
    fi
done