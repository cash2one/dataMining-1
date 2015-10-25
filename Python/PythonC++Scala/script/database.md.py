#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import json

import ibbdlib.tornadolib
import ibbdlib.database
import dfhspider.lib
import ibbdlib

db_server = {'host': '223.4.155.172', 'user': 'ibbd', 'passwd': 'spider'}

def get_tables(db):
    db_conn = ibbdlib.get_db_conn(**db_server)
    cmdStr = \
        """SELECT CONCAT(TABLE_SCHEMA, '.', TABLE_NAME) AS TABLE_NAME, TABLE_TYPE, TABLE_ROWS, DATA_LENGTH, INDEX_LENGTH, TABLE_COMMENT
        FROM information_schema.TABLES
        WHERE TABLE_SCHEMA='%s'
        ORDER BY TABLE_NAME""" \
        % db
    info_dict = dict((row.TABLE_NAME, dict((k, ((v.encode('utf-8'
                     ) if isinstance(v, unicode) else v) if v else '')) for (k,
                     v) in row.items())) for row in db_conn.query(cmdStr))
    db_conn.close()
    return info_dict


def get_columns(db):
    db_conn = ibbdlib.get_db_conn(**db_server)
    cmdStr = \
        """SELECT CONCAT(TABLE_SCHEMA, '.', TABLE_NAME) AS TABLE_NAME,ORDINAL_POSITION, COLUMN_NAME, COLUMN_TYPE, COLUMN_KEY, COLUMN_COMMENT
        FROM information_schema.COLUMNS
        WHERE TABLE_SCHEMA='%s'""" \
        % db
    info_dict = dict()
    for row in db_conn.query(cmdStr):
        if row.TABLE_NAME in info_dict:
            info_dict[row.TABLE_NAME].append(dict((k, ((v.encode('utf-8'
                    ) if isinstance(v, unicode) else v) if v else '')) for (k,
                    v) in row.items()))
        else:
            info_dict[row.TABLE_NAME] = [dict((k, ((v.encode('utf-8'
                    ) if isinstance(v, unicode) else v) if v else '')) for (k,
                    v) in row.items())]
    db_conn.close()
    return info_dict


def main():
    tables = get_tables('ibbd2')
    columns = get_columns('ibbd2')
    for (table, info) in tables.items():
        tables[table]['COLUMNS'] = columns[table]
    tables_order = list(sorted(tables.keys()))
    tables_cat = {
        'lib_': '知识库表',
        'user': '用户配置表',
        'ststc_': '统计表',
        'top_': '淘宝数据基础统计表',
        'quota_': '指数表'
        }
    with open('database.html', 'w') as f:
        with open('database_template.html') as f2:
            template_string = f2.read()
        f.write(ibbdlib.tornadolib.render_string(template_string,
                ibbd2_tables=tables, tables_order=tables_order,
                tables_cat=tables_cat))


if __name__ == '__main__':
    main()
