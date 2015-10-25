#!/bin/sh
cd /data/script/dw
while true
do
    python2.7 check_schedule.py
    if [[ $(<status) = "1" ]]; then
        sh dispatch_source.sh
        break
    else
        echo $(date +%Y\-%m\-%d\ %H\:%M\:%S) waiting for scheudle complete
    fi
    sleep 120
done

