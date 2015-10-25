#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
@auth   Cooper
@date   2012.12.19
@desc   在不同的主机之间增量/全量迁移数据
"""

import traceback
import re
from datetime import date, datetime, timedelta
from dateutil import parser
import ibbdlib
import ibbdlib.migratetable

db_server = {'223.4.155.152': {
    'host': '223.4.155.152',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }, '223.4.155.172': {
    'host': '223.4.155.172',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }, '223.4.146.232': {
    'host': '223.4.146.232',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }}

def main():

    # ibbdlib.migratetable.migrate_table(db_server['223.4.155.152'], db_server['223.4.155.172'], 'ibbd2.user2')
    # ibbdlib.migratetable.migrate_table(db_server['223.4.155.152'], db_server['223.4.155.172'], 'ibbd2.user_keywords')

    ibbdlib.migratetable.migrate_table(db_server['223.4.155.172'], db_server['223.4.155.152'], 'ibbd2.user2')


    # migrate_table('223.4.155.152', '223.4.155.172', 'ibbd2.top_cat_search_result', block=3000)

    # migrate_table_by_date('223.4.155.172', '223.4.155.152', 'ibbd2.top_item2', tsmp_field='population_tsmp', tsmp='2012-12-23', block=3000)

    # migrate_table('223.4.155.152',  '223.4.155.172',  'topdata.top_item_trade_his_20121219_2')

if __name__ == '__main__':
    main()
    pass
