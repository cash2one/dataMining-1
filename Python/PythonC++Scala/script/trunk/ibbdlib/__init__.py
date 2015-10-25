#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther  Cooper
date    2012.12.1
desc    python 公共库
'''

__version__ = '2.0.1'

import re

import database
import connectionpool
from redislib import get_redis_conn

__all__ = ['connectionpool', 'get_redis_conn', 'get_db_conn', 'get_db_pool', 'gen_sql_statement']

# 连接参数

try:
    from dfhspider.config import mysql_db_config
except:
    mysql_db_config = {'host': 'localhost', 'user': 'root', 'passwd': ''}


def get_db_conn(**kwargs):
    """获取数据库连接(tornado.database)

    Args:
        host
        user
        passwd

    example:
        db_conn = get_db_conn()
        for row in db_conn.iter("SELECT * FROM ibbd2.user"):
            print row.nick, row.email
        db_conn.close()
    """

    mysql_db_config.update(kwargs)
    return database.Connection(**mysql_db_config)


def get_db_pool(**kwargs):
    """获取数据库连接池

    Args:
        host
        user
        passwd

    example:
        // 得到连接池
        db_conn_pool = get_db_pool(max_connections=1000)
        // 获取一个可用连接
        db_conn = db_conn_pool.get_connection()
        for user in db_conn.query("SELECT * FROM user"):
            print user.nick
        // 释放连接(不允许直接关闭)
        db_conn_pool.release(db_conn)
        // 断开全部连接
        db_conn_pool.disconnect()
    """

    connection_args = mysql_db_config
    connection_args.update(kwargs)
    connection_args.update({'connection_class': database.Connection, 'max_connections': kwargs.get('max_connections') or 100})
    return connectionpool.ConnectionPool(**connection_args)


def gen_sql_statement(db_conn, query, args):
    """从SQL模板生成SQL语句

    Args:
        db_conn     isinstance of MySQLdb.connections.Connection or tornado.database.Connection
        query   INSERT INTO table values(%s,%s)
        args    [[obj,],]

    example:
        gen_sql_statement(db_conn, "INSERT INTO user values(%s,%s)", [['wang', datetime.datetime.now()], ['zhang', '2012-11-11 00:00:00']])
        output:
            INSERT INTO user values
            ('wang', '2012-12-12 14:38:17'),
            ('zhang', '2012-11-11 00:00:00')
    @see MySQLdb/cursors.py
    generate query & args to sql
    """

    literval_func = None
    if isinstance(db_conn, database.Connection):
        literval_func = db_conn._db.literal
    elif isinstance(db_conn, __import__('MySQLdb').connections.Connection):
        literval_func = db_conn.literal
    restr = \
        "\\svalues\\s*(\\(((?<!\\\\)'[^\\)]*?\\)[^\\)]*(?<!\\\\)?'|[^\\(\\)]|(?:\\([^\\)]*\\)))+\\))"
    insert_values = re.compile(restr, re.I)
    m = insert_values.search(query)
    if args:
        if isinstance(args[0], list) or isinstance(args[0], tuple):
            pass
        else:
            args = [args]
    p = m.start(1)
    e = m.end(1)
    qv = m.group(1)
    q = [qv % literval_func(a) for a in args]
    r = '\n'.join([query[:p], ',\n'.join(q), query[e:]])
    return r
