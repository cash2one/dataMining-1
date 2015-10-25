#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
提供操作数据库的简易方法
Created on 2012-11-29

@author: liangj
'''

import MySQLdb
import MySQLdb.cursors
import ibbdlib.database
MYSQL_CONFIG = {
        'host': '223.4.155.152',
        'user': 'ibbd',
        'passwd': 'spider',
        'charset': 'utf8',
        'db': 'mysql',
        }
def getResult(sql, args=None, type='set',dbName='mysql'):
    MYSQL_CONFIG.update(db=dbName)
    cursor = ibbdlib.database.Connection(**MYSQL_CONFIG)
    if args:
        ret = cursor.query(sql,args)
    else:
        ret = cursor.query(sql)
    if type == 'list':
        temp = ret
        ret = []
        for i in temp:
            ret.append(list(i.values()))
    cursor.close()
    return ret

def executemany(sql,parmlist=[],dbName='mysql'):
    cursor = ibbdlib.database.Connection(**MYSQL_CONFIG)
    cursor.executemany(sql,parmlist)
    cursor.close()

class Sql():
    def __init__(self):
        self._select = []
        self._from = set()
        self._where = []
        self._group = []
        self._order = []
    def select(self,*args,**kwargs):
        for i in args:
            self._select.append(i)
        for k,v in kwargs.items():
            self._select.append(v+' AS ' + k)
        return self
    
    def fro(self,*args,**kwargs):
        for i in args:
            self._from.add(i)
        for k,v in kwargs.items():
            self._from.add(v+' AS ' + k)
        return self
    
    def where(self,*args):
        for i in args:
            self._where.append(i)
        return self
    
    def groupby(self,*args):
        for i in args:
            self._group.append(i)
        return self
    
    def orderby(self,*args):
        for i in args:
            self._order.append(i)
        return self
    
    def __str__(self):
        sql =  'SELECT '+','.join(self._select) \
                + ' FROM ' + ','.join(self._from) \
                + ' WHERE ' + ' AND '.join(self._where) 
        if self._group:
            sql = sql + ' GROUP BY ' + ','.join(self._group) 
        if self._order:
            sql = sql +' ORDER BY ' + ','.join(self._order)
        return sql
    
if __name__ == '__main__':
#    SELECT T2.hour_of,CAST(SUM(T2.volume) AS SIGNED)
#                        FROM ibbd2.top_item_tradingtime T2,
#                                ibbd2.top_cat_search_result T1
#                       WHERE T2.item_id =T1.item_id
#                                AND T1.keyword='排毒养颜'
#                                AND T1.wangwang='肌言堂旗舰店'
#                                AND T2.date_of BETWEEN '2012-12-19 00:00:00' AND '2012-12-25 00:00:00'
#                        GROUP BY T2.hour_of
    sql ='''
         SELECT T1.*,T2.*,T3.*
        FROM ibbd2.top_cat_items T1
        LEFT JOIN ibbd2.top_item2 T2
        ON T1.item_id = T2.item_id
        AND T2.date_of BETWEEN '2012/12/27' AND '2012/12/27'
        LEFT JOIN ibbd2.top_shop1 T3
        ON T1.user_num_id = T3.user_num_id
        WHERE T1.keyword='iphone4s手机壳'
        AND T2.sales IS NOT NULL
        AND T1.user_num_id='1022543733'
        -- AND T2.item_id IS NOT NULL
        ORDER BY T2.sales DESC
            '''
    a = getResult(sql)
    print '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    sql ='''
                    SELECT DISTINCT T2.*
        FROM ibbd2.top_cat_items T1
        LEFT JOIN ibbd2.top_item2 T2
        ON T1.item_id = T2.item_id
        AND T2.date_of BETWEEN '2012/12/27' AND '2012/12/27'
        LEFT JOIN ibbd2.top_shop1 T3
        ON T1.user_num_id = T3.user_num_id
        WHERE T1.keyword='iphone4s手机壳'
        AND T2.sales IS NOT NULL
        AND T1.user_num_id='1022543733'
        -- AND T2.item_id IS NOT NULL
        ORDER BY T2.sales DESC
        '''
    b = getResult(sql)
    for i in a:
        print i
    print '111111111111111'
    for i in b:
        print i
    
#    print getResult('select * from hostinfo.cpu_info limit 5')
#    executemany('insert into ibbdtest.test values(%s)',[[4],[5]])    
