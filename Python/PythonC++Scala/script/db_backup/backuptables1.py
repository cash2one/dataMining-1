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

DB_tables = {'ibbd2': [
    'user2',
    'user_item_monitor',
    'user_keywords',
    'user_keywords_ztc',
    'user_privileges',
    'user_shop_monitor',
    'history_topuser_rfmconfig',
    ]}

# 迁移开始的日期 如要迁移12号的数据，请模仿如何格式 2012-12-12 23:59:59

date = '2012-12-12 23:59:59'

# 数据表中日期字段

datefield = {
    'user2': 'create_time',
    'user_item_monitor': 'population_tsmp',
    'user_keywords': 'population_tsmp',
    'user_keywords_ztc': 'population_tsmp',
    'user_privileges': 'population_tsmp',
    'user_shop_monitor': 'population_tsmp',
    'history_topuser_rfmconfig': 'population_tsmp',
    }

# 每次迁移10000条

record_num = 1000

# 表中字段的数量

field_num = {
    'user2': 14,
    'user_item_monitor': 7,
    'user_keywords': 8,
    'user_keywords_ztc': 3,
    'user_privileges': 10,
    'user_shop_monitor': 5,
    'history_topuser_rfmconfig': 10,
    }

# 插入影响的行数,初始化为0

affectedRows = {
    'user2': 0,
    'user_item_monitor': 0,
    'user_keywords': 0,
    'user_keywords_ztc': 0,
    'user_privileges': 0,
    'user_shop_monitor': 0,
    'history_topuser_rfmconfig': 0,
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

fromday = datetime.datetime.strptime('2012-05-30 23:59:59', '%Y-%m-%d %H:%M:%S')
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

