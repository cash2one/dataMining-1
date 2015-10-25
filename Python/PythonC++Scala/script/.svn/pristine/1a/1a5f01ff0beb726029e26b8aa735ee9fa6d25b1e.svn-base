#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import ibbdlib

db_server = {'host': '223.4.155.152', 'user': 'ibbd', 'passwd': 'spider'}
db_conn = ibbdlib.get_db_conn(**db_server)

db_list = ['ibbd2']
db_tables = dict((db_name, list()) for db_name in db_list)

dump_query_template = '/usr/local/mysql/bin/mysqldump -u %s -p%s %s %s --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/mysql_bak/full/%s/%s.sql'
dump_query = list()
for db_name in db_list:
    for row in db_conn.iter("SHOW TABLES IN %s" % db_name):
        table_name = row.get('Tables_in_%s' % db_name)
        dump_query.append('echo $(date) dump table %s in %s' % (table_name, db_name))
        dump_query.append(dump_query_template % (db_server.get('user'), db_server.get('passwd'), db_name, table_name, db_name, table_name))

db_conn.close()

open('mysqldump.sh', 'w').write('#!/bin/sh\n')
open('mysqldump.sh', 'a').write('\n'.join(dump_query))