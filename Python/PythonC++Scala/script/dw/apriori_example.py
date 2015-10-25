#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import Apriori
import ibbdlib
import json

db_server = {'host': '223.4.155.172', 'user': 'ibbd', 'passwd': 'spider'}

def arpriori_trade(full_table_name):
    query = \
        """SELECT T.*
        FROM(
          SELECT shop_id, GROUP_CONCAT(DISTINCT(item_id)) AS list
          FROM topdata.top_item_trade_his_20121219_1
          GROUP BY shop_id, nick)T
        WHERE LOCATE(',', T.list)<>0
        """
    db_conn = ibbdlib.get_db_conn(**db_server)
    metadata = dict()
    try:
        for row in db_conn.iter(cmd_str):
            if not metadata.get(row.shop_id):
                metadata[row.shop_id] = [row.list.split(',')]
            else:
                metadata[row.shop_id].append(row.list.split(','))

        for (shop_id, t) in metadata.items():
            print shop_id
            t = Apriori.apriori(t, 0.1)
            print json.dumps(t, indent=4)
            query = 'INSERT IGNORE INTO ibbd2.ststc_shop_apriori values(%%s, CURDATE(), %s, NOW())' % ','.join(['%s'] * 4)
            db_conn.executemany(query, [[shop_id, pair.split(',')[0], pair.split(',')[1], data['sup'], data['num']]
                                for (pair, data) in t.items() if len(pair.split(',')) == 2])
    except Exception, e:
        print e
    finally:
        db_conn.close()
