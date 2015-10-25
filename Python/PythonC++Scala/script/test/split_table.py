#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import ibbdlib
import threading
from multiprocessing import Process

his_db = 'topspider'
his_table = 'top_item_trade_his_20121221'

db = 'topdata'
split_tb_num = 15


def _get_shop_ids():
    db_conn = ibbdlib.get_db_conn(host='223.4.155.172', user='ibbd', passwd='spider')
    cmd_str = 'SELECT DISTINCT(shop_id) AS shop_id FROM %s.%s' % (his_db, his_table)
    sids = []
    for row in db_conn.iter(cmd_str):
        sids.append(row.shop_id)
    db_conn.close()
    return sids


def run_sql(db_conn_pool, sql):
    db_conn = db_conn_pool.get_connection()
    db_conn.execute(sql)
    db_conn_pool.release(db_conn)


def split_topspider_table(full_table):
    db_conn = ibbdlib.get_db_conn(host='223.4.155.172', user='ibbd', passwd='spider')
    cmd_str = "SELECT DISTINCT(shop_id) AS shop_id FROM %s" % (full_table)
    sids = []
    for row in db_conn.iter(cmd_str):
        sids.append(row.shop_id)
    length = len(sids) / 100
    i = 1
    sid_dict = dict()
    for sid in sids:
        if sid_dict.get(i):
            if len(sid_dict[i]) < length:
                sid_dict[i].append(sid)
            else:
                i +=1
                sid_dict[i] = [sid]
        else:
            sid_dict[i] = [sid]
    for k in sid_dict.keys():
        print k, len(sid_dict[k])
        db_conn.executemany("INSERT IGNORE INTO topdata.top_trade_dist(table_name, shop_id) values(%s, %s)", [['top_item_trade_%d'%k, sid] for sid in sid_dict[k]])
    db_conn.close()


def main():
    sids = list(sorted(_get_shop_ids()))
    step = len(sids) / split_tb_num
    interval = []
    for i in range(split_tb_num):
        interval.append(sids[(i + 1) * step])

    db_conn = ibbdlib.get_db_conn(host='223.4.155.172', user='ibbd', passwd='spider')
    sql_dml_list = []
    for i in range(len(interval)):
        ddl_table = '%s.%s_%d' % (db, his_table, i + 1)
        ddl = "DROP TABLE IF EXISTS %s" % ddl_table
        db_conn.execute(ddl)
        ddl = 'CREATE TABLE %s LIKE topdata.top_item_trade' % ddl_table
        db_conn.execute(ddl)
        sql = \
            """INSERT IGNORE INTO %s
            SELECT *, MD5(CONCAT_WS(',', item_id, nick, rank, trade_time)) 
            FROM %s.%s 
            WHERE shop_id %s"""
        if i == 0:
            sql = sql % (ddl_table, his_db, his_table, "< '%s'" % interval[i])
        elif i == len(interval) - 1:
            sql = sql % (ddl_table, his_db, his_table, ">= '%s'" % interval[i])
        else:
            sql = sql % (ddl_table, his_db, his_table, ">='%s' AND shop_id <'%s'" % (interval[i], interval[i + 1]))
        sql_dml_list.append(sql)
        print '%s;'%sql

    db_conn.close()

if __name__ == '__main__':
    main()
    # split_topspider_table('topdata.top_item_trade_his_20121220')