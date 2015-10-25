*/10 * * * * sh /var/www/htdocs/ibbd/keep-alive.sh >> /var/www/htdocs/ibbd/log/keep-alive.log 2>>/var/www/htdocs/ibbd/log/keep-alive.error.log
10 0 * * * /opt/python2.7/bin/python2.7 /var/www/htdocs/ibbd/log/ibbd_logsaver.py >> /data/log/log_saver.log 2>>/data/log/log_saver_error.log
# 1 0 * * * sh /data/script/db_backup/db_daily_bak/mysql_daily_bak.sh
0 1 * * * sh /data/script/dw/dispatch_target.sh >> /data/log/dispatch_target.log 2>> /data/log/dispatch_target_error.log
0 1 * * * /opt/python2.7/bin/python2.7 /var/www/htdocs/ibbd/updatega.py
*/1 * * * * /opt/python2.7/bin/python2.7 /data/script/schedule/schedule_monitor.py
