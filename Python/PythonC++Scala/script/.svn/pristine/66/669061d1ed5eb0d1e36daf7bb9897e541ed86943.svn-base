#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auth: ryan
date: 2012.12.12
备份数据库
脚本优化建议
：添加日志操作模块
：先查出一共要插入多少条，若发现最后插入的数量与更新的不同的就指明哪个表哪一天没插好

'''

import MySQLdb
import datetime

# 设置连接变量
# 远程主机参数（被备份）

remote_user = 'ibbd'
remote_passwd = 'spider'
remote_host = '223.4.155.152'
remote_db = 'ibbd2'
remote_port = 3306
remote_charset = 'utf8'

# 本机参数（执行备份）

local_user = 'ibbd'
local_passwd = 'spider'
local_host = 'localhost'
local_db = 'ibbd2'
local_port = 3306
local_charset = 'utf8'

# 开始迁移数据库,需要迁移的数据库和表名 键名是数据库名，值是表的序列

DB_tables = {'ibbd2': [  #                      'top_cat_items',
                         #                      'ststc_ztc_shops',
                         #                      'ststc_keyword_reporter',
    'top_item1',
    'top_item2',
    'top_item_tradingtime',
    'top_shop1',
    'top_ztc_sum',
    'ststc_shop_sales_keyword',
    'ststc_shop_pct_nokeyword',
    'ststc_shop_credit',
    'ststc_keyword_shop_pct',
    'ststc_cat_shop_sales_detail',
    'ststc_cat_range_hotshops',
    'ststc_cat_dealprice',
    'quota_pct_keyword',
    'quota_tradingtime_aly',
    'quota_sale_index',
    'quota_shop_credit',
    'top_itemsearchresult',
    ]}

# 数据表中日期字段

datefield = {  #           'top_cat_items':'population_tsmp',
               #           'ststc_ztc_shops':'population_tsmp',
               #           'ststc_keyword_reporter':'population_tsmp',
    'top_item1': 'population_tsmp',
    'top_item2': 'population_tsmp',
    'top_item_tradingtime': 'population_tsmp',
    'top_shop1': 'population_tsmp',
    'top_ztc_sum': 'lastest_tsmp',
    'ststc_shop_sales_keyword': 'population_tsmp',
    'ststc_shop_pct_nokeyword': 'population_tsmp',
    'ststc_shop_credit': 'population_tsmp',
    'ststc_keyword_shop_pct': 'population_tsmp',
    'ststc_cat_shop_sales_detail': 'population_tsmp',
    'ststc_cat_range_hotshops': 'population_tsmp',
    'ststc_cat_dealprice': 'population_tsmp',
    'quota_pct_keyword': 'population_tsmp',
    'quota_tradingtime_aly': 'population_tsmp',
    'quota_sale_index': 'population_tsmp',
    'quota_shop_credit': 'population_tsmp',
    'top_itemsearchresult': 'population_tsmp',
    }

# 每次迁移10000条

record_num = 1000

# 表中字段的数量

field_num = {  #           'top_cat_items':4,
               #           'ststc_ztc_shops':3,
               #           'ststc_keyword_reporter':12,
    'top_item1': 15,
    'top_item2': 12,
    'top_item_tradingtime': 6,
    'top_shop1': 9,
    'top_ztc_sum': 7,
    'ststc_shop_sales_keyword': 7,
    'ststc_shop_pct_nokeyword': 8,
    'ststc_shop_credit': 8,
    'ststc_keyword_shop_pct': 10,
    'ststc_cat_shop_sales_detail': 10,
    'ststc_cat_range_hotshops': 11,
    'ststc_cat_dealprice': 7,
    'quota_pct_keyword': 7,
    'quota_tradingtime_aly': 6,
    'quota_sale_index': 6,
    'quota_shop_credit': 9,
    'top_itemsearchresult': 12,
    }

# 插入影响的行数,初始化为0

affectedRows = {  #              'top_cat_items':0,
                  #           'ststc_ztc_shops':0,
                  #           'ststc_keyword_reporter':0,
    'top_item1': 0,
    'top_item2': 0,
    'top_item_tradingtime': 0,
    'top_shop1': 0,
    'top_ztc_sum': 0,
    'ststc_shop_sales_keyword': 0,
    'ststc_shop_pct_nokeyword': 0,
    'ststc_shop_credit': 0,
    'ststc_keyword_shop_pct': 0,
    'ststc_cat_shop_sales_detail': 0,
    'ststc_cat_range_hotshops': 0,
    'ststc_cat_dealprice': 0,
    'quota_pct_keyword': 0,
    'quota_tradingtime_aly': 0,
    'quota_sale_index': 0,
    'quota_shop_credit': 0,
    'top_itemsearchresult': 0,
    }


# 进行连接

def backuptables(backupDate):

    try:
        remote_connection = MySQLdb.connect(user=remote_user, passwd=remote_passwd, host=remote_host, port=remote_port,
                                            db=remote_db)
        local_connection = MySQLdb.connect(user=local_user, passwd=local_passwd, host=local_host, port=local_port,
                                           db=local_db)
    except:
        print 'Could not connect to MySQL server.'
        exit(0)

    try:
        re_cur = remote_connection.cursor()
        lo_cur = local_connection.cursor()
        start_time = datetime.datetime.now()
        for db in DB_tables.keys():
            remote_connection.select_db(db)
            local_connection.select_db('information_schema')
            if not lo_cur.execute('SELECT count(*) FROM `schemata` WHERE schema_name=%s;', db):
                print 'database:%s does not exists.' % db
                continue
            for table in DB_tables[db]:
                local_connection.select_db('information_schema')
                if not lo_cur.execute('SELECT count(*) FROM `tables` WHERE table_name=%s;', table):
                    print 'databases:%s table:%s does not exists.' % (db, table)
                    continue
                print 'db:', db, ',table:', table
                local_connection.select_db(db)
                sqlstr = \
                    """SELECT * FROM {0} 
                              where {1} > DATE_SUB("{2}", INTERVAL 1 DAY) 
                              and {1} <= "{2}";""".format(table,
                        datefield[table], backupDate)
                print 'sql: ', sqlstr
                n = re_cur.execute(sqlstr)
                print n
                if not n:
                    continue
                i = 0
                t = record_num
                while i < n:
                    if i + record_num > n:
                        t = n - i
                    result = re_cur.fetchmany(t)
                    if not len(result):
                        break
                    sqlstr = 'REPLACE  INTO %s values(' % table + r"%s"
                    for i in range(field_num[table] - 1):
                        sqlstr += r",%s"
                    sqlstr += ' ); '
                    print 'sql: ', sqlstr
                    in_num = lo_cur.executemany(sqlstr, result)

                   # 提交

                    local_connection.commit()
                    print 'affect rows:', in_num
                    affectedRows[table] += in_num
                    i = record_num + i

        re_cur.close()
        lo_cur.close()
        end_time = datetime.datetime.now()
        print 'process time : ', (end_time - start_time).microseconds, ' microseconds.'
    except MySQLdb.Error, e:
        print 'Mysql Error %d: %s' % (e.args[0], e.args[1])


# 截止日期前一天不含截止日期

today = datetime.datetime.strptime('2012-12-13 23:59:59', '%Y-%m-%d %H:%M:%S')

# 开始日期（包含）

fromday = datetime.datetime.strptime('2012-08-30 23:59:59', '%Y-%m-%d %H:%M:%S')
oneday = datetime.timedelta(days=1)
daycount = (today - fromday).days
for i in range(daycount):
    today = today - oneday
    print '---------------------backup %s---------------------------' % today
    backuptables(today)
    print '=====================finished==========================='

print '!all finished:'
for i in affectedRows.keys():
    print '%s:rows %s' % (i, affectedRows[i])

