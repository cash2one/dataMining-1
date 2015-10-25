#!/bin/sh

# Cooper
# {{etl_date}}
# run on 172
echo $(date) hello Cooper

# move old exported_data to dir

{% for table in tables %}
echo $(date) {{table}}
mysqldump -u{{user}} -p{{passwd}} ibbd2 {{table}} --where "population_tsmp>'{{etl_date}}'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --replace --no-autocommit> /data/migrate/{{table}}_{{short_date}}.sql
{% end %}

# scp /data/migrate/*.sql root@223.4.155.152:/data/migrate/

cd /data/migrate
if [ ! -d "${{short_date}}" ]; then
    mkdir {{short_date}}
fi
mv -f *.sql {{short_date}}/

echo $(date) end