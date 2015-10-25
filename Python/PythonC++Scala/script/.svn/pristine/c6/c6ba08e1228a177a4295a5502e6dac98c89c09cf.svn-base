#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.9.11
'''

import time
import MySQLdb
from lib import getDBConn, escapeSQLCommand

DB = 'topapi'
mapping_trade = {'table': 'trade', 'fields': [
    'seller_nick',
    'buyer_nick',
    'title',
    'type',
    'created',
    'tid',
    'seller_rate',
    'buyer_rate',
    'status',
    'payment',
    'discount_fee',
    'adjust_fee',
    'post_fee',
    'total_fee',
    'pay_time',
    'end_time',
    'modified',
    'consign_time',
    'buyer_obtain_point_fee',
    'point_fee',
    'real_point_fee',
    'received_payment',
    'commission_fee',
    'pic_path',
    'num_iid',
    'num',
    'price',
    'cod_fee',
    'cod_status',
    'shipping_type',
    'receiver_name',
    'receiver_state',
    'receiver_city',
    'receiver_district',
    'receiver_address',
    'receiver_zip',
    'receiver_mobile',
    'receiver_phone',
    ]}
mapping_order = {'table': 'order', 'fields': [
    'tid',
    'title',
    'pic_path',
    'price',
    'num',
    'num_iid',
    'sku_id',
    'refund_status',
    'status',
    'oid',
    'total_fee',
    'payment',
    'discount_fee',
    'adjust_fee',
    'sku_properties_name',
    'item_meal_name',
    'buyer_rate',
    'seller_rate',
    'outer_iid',
    'outer_sku_id',
    'refund_id',
    'seller_type',
    ]}


def saveTrades(trades):
    db = getDBConn(DB)
    cmdStr = 'INSERT INTO %s VALUES(%s,NOW())' % (mapping_trade['table'],
            ','.join(['%s' for t in mapping_trade['fields']]))
    args = [[(trade[key] if trade.has_key(key) else None) for key in
            mapping_trade['fields']] for trade in trades]
    args = [[(field.encode('utf-8') if isinstance(field, unicode) else field)
            for field in trade] for trade in args]
    c = db.cursor()
    rowNum = c.executemany(cmdStr, args)
    orders = [[dict(order.items() + {'tid': trade['tid']}.items()) for order in
              trade['orders']['order']] for trade in trades]
    orders = [order[0] for order in orders]
    cmdStr = 'INSERT INTO `%s` VALUES(%s,NOW())' % (mapping_order['table'],
            ','.join(['%s' for t in mapping_order['fields']]))
    args = [[(order[key] if order.has_key(key) else None) for key in
            mapping_order['fields']] for order in orders]
    args = [[(field.encode('utf-8') if isinstance(field, unicode) else field)
            for field in order] for order in args]
    rowNum += c.executemany(cmdStr, args)
    db.commit()
    c.close()
    db.close()
    return rowNum


