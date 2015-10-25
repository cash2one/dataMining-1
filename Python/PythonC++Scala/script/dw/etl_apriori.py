#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import sys
import traceback
import Apriori
import ibbdlib
import ibbdlib.ibbdlog
import json
from Queue import Queue
import threading
from dateutil.parser import parse

fetch_date = '2013-01-24'
if len(sys.argv) >= 2:
    arg_date = parse(sys.argv[1])
    fetch_date = arg_date.strftime('%Y-%m-%d')
fetch_date_short = fetch_date.replace('-', '')

db_server = {'host': 'localhost', 'user': 'ibbd_etl', 'passwd': 'ibbd_etl_secure', 'db': 'topdata'}
block_async_num = 3
log = ibbdlib.ibbdlog.get_logger(output='console', log_name='ibbd.etl_apriori')


def arpriori_trade():
    while 1:
        full_table_name = tasks_queue.get()
        log.info(full_table_name)
        query = \
            """SELECT T.*
            FROM(
              SELECT shop_id, GROUP_CONCAT(DISTINCT(item_id)) AS list
              FROM %s
              GROUP BY shop_id, nick)T
            WHERE LOCATE(',', T.list)<>0""" \
            % full_table_name
        db_conn = ibbdlib.get_db_conn(**db_server)
        metadata = dict()
        try:
            log.info('%s query data...', full_table_name)
            for row in db_conn.iter(query):
                if not metadata.get(row.shop_id):
                    metadata[row.shop_id] = [row.list.split(',')]
                else:
                    metadata[row.shop_id].append(row.list.split(','))
            log.info('%s run apriori...', full_table_name)
            for (shop_id, t) in metadata.items():
                t = Apriori.apriori(t, 0.1)
                query = 'INSERT IGNORE INTO ibbd2.ststc_shop_apriori values(%%s, CURDATE(), %s, NOW())' % ','.join(['%s'
                        ] * 4)
                db_conn.executemany(query, [[shop_id, pair.split(',')[0], pair.split(',')[1], data['sup'], data['num']]
                                    for (pair, data) in t.items() if len(pair.split(',')) == 2])
            log.info('%s finished', full_table_name)
        except:
            log.error(traceback.format_exc())
        finally:
            db_conn.close()
            tasks_queue.task_done()


tasks_queue = Queue()
db_conn = ibbdlib.get_db_conn(**db_server)
for row in db_conn.iter("SHOW TABLES IN topspider LIKE 'top_item_trade_his_{0}_%%'".format(fetch_date_short)):
    tasks_queue.put('topspider.%s' % row.get('Tables_in_topdata (top_item_trade_his_%s_%%)' % fetch_date_short))
db_conn.close()
for i in range(block_async_num):
    t = threading.Thread(target=arpriori_trade)
    t.daemon = True
    t.start()
tasks_queue.join()
log.info('done')
