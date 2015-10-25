#!/bin/sh

cd /data/script/dw/ETLByHJ

read -p "please input fetch date like yesterday(20121220): " fetch_date


# check input
if [ ${#fetch_date} -lt 8 ]; then
    echo invalid input
    exit
fi

if [ ${#fetch_date} -gt 8 ]; then
    echo invalid input
    exit
fi
python2.7 task.py "${fetch_date}"
svn add "sqlxml/task_${fetch_date}.sql"
python2.7 etlByHJ.py "${fetch_date}"
svn add "log/etl.${fetch_date}.log"
svn commit -m "add new etl sqlxml and log"