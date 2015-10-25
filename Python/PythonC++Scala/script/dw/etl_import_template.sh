#!/bin/sh
echo $(date) hello Cooper
cd /data/migrate
for file in *.sql
do
    echo $(date) imorting $file
    mysql -u{{user}} -p{{passwd}} --default-character-set=utf8 ibbd2 < $file
done
cd /data/migrate
if [ ! -d "${{short_date}}" ]; then
    mkdir {{short_date}}
fi
mv *.sql {{short_date}}/
echo $(date) end
