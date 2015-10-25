#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

from datetime import datetime, timedelta

import ibbdlib

from dateutil.parser import parse as dateparser
import ibbdlib
import ibbdlib.tornadolib

his_db = 'topspider'
db = 'topdata'
split_tb_num = 15

fetch_date = '2012-12-28'
if len(sys.argv) >= 2:
    arg_date = dateparser(sys.argv[1])
    fetch_date = arg_date.strftime('%Y-%m-%d')
cal_date = fetch_date
his_table = 'top_item_trade_his_%s'%fetch_date.replace('-','')
reporter_date = (dateparser(cal_date) - timedelta(1)).strftime('%Y-%m-%d')
reporter_date_range = (dateparser(cal_date) - timedelta(7)).strftime('%Y-%m-%d')
his_trade_table = 'top_item_trade_his_%s' % fetch_date.replace('-', '')


def _get_shop_ids():
    db_conn = ibbdlib.get_db_conn(host='223.4.155.172', user='ibbd', passwd='spider')
    cmd_str = 'SELECT DISTINCT(shop_id) AS shop_id FROM %s.%s' % (his_db, his_table)
    sids = list(db_conn.iter(cmd_str))
    db_conn.close()
    return [row.shop_id for row in sids]


def _generate_sql_template():
    shop_id_interval = split_trade_data()
    sql_commands = ibbdlib.tornadolib.render_string(
        open('task.xml').read(),
        his_trade_table=his_trade_table,
        fetch_date=fetch_date,
        cal_date=cal_date,
        reporter_date=reporter_date,
        reporter_date_range=reporter_date_range,
        cache_table_num=split_tb_num,
        shop_id_interval=shop_id_interval,
        )
    open('task_%s.xml' % fetch_date.replace('-', ''), 'w').write(sql_commands)


def split_trade_data():
    sids = list(sorted(_get_shop_ids()))
    step = len(sids) / (split_tb_num - 1)
    interval = [sids[0]]
    for i in range(split_tb_num - 1):
        interval.append(sids[(i + 1) * step - 1])
    interval.append(sids[-1])
    return interval

    db_conn = ibbdlib.get_db_conn(host='223.4.246.146', user='huangj', passwd='huangj')
    for i in range(len(interval) - 1):
        ddl_table = '%s.%s_%d' % (db, his_table, i + 1)
        ddl = 'DROP TABLE IF EXISTS %s' % ddl_table
        db_conn.execute(ddl)
        ddl = 'CREATE TABLE %s LIKE topdata.top_item_trade' % ddl_table
        print 'create table', ddl_table
        db_conn.execute(ddl)
        sql = \
            """INSERT IGNORE INTO %s
            SELECT *, MD5(CONCAT_WS(',', item_id, nick, rank, trade_time)) 
            FROM %s.%s 
            WHERE shop_id %s"""
        sql = sql % (ddl_table, his_db, his_table, ">='%s' AND shop_id <'%s'" % (interval[i], interval[i + 1]))
        if i == len(interval) - 2:
            sql = sql.replace('<', '<=')
        print 'migrate metadata to', ddl_table,
        print db_conn.execute_rowcount(sql)

    db_conn.close()


def main():

    # split_trade_data()

    _generate_sql_template()


if __name__ == '__main__':
    main()
