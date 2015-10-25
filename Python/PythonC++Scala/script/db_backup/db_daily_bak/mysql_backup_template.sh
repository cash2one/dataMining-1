#!/bin/sh

if [ ! -d "{{bak_prefix}}" ]; then
    mkdir {{bak_prefix}}
fi

cd {{bak_prefix}}
{% for db, tables in bak_tables.items() %}

if [ ! -d "{{db}}" ]; then
    mkdir {{db}}
fi
if [ ! -d "{{db}}/{{date_tsmp_my_str}}" ]; then
    mkdir {{db}}/{{date_tsmp_my_str}}
fi

{% for table in tables %}
{% if tb_bak_type.get(db + '.' + table) == 'full' %}
/usr/local/mysql/bin/mysqldump -u{{user}} -p{{passwd}} {{db}} {{table}} --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > {{bak_prefix}}/{{db}}/{{date_tsmp_my_str}}/{{table}}_{{date_tsmp_str}}.sql
{% else %}
/usr/local/mysql/bin/mysqldump -u{{user}} -p{{passwd}} {{db}} {{table}} --where "population_tsmp BETWEEN '{{tsmp_from}}'-INTERVAL 8 HOUR AND '{{tsmp_to}}'-INTERVAL 8 HOUR" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > {{bak_prefix}}/{{db}}/{{date_tsmp_my_str}}/{{table}}_{{date_tsmp_str}}.sql
{% end %}
echo $(date) '{{db}}' '{{table}}' '{{date_tsmp_str}}' >> bak_process.log
{% end %}
{% end %}