#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
    对数据库进行查询，测试分区效果
'''
import MySQLdb
import time

def getKeywords():
    file = open('./keywords.data')
    keywords = [i[:-1] for i in file.readlines()[:-1]]
    return keywords
    
def test_partition():
    keywords=getKeywords()
    conn = MySQLdb.connect(host='223.4.246.146',port=3306,user='liangj',passwd='liangj',db='mysql')
    cursor = conn.cursor()
    data = []
    for i,keyword in enumerate(getKeywords()):
        print i,':   ',keyword
        ttt = time.time()
        cursor.execute("""
                            SELECT t2.hour_of,cast(SUM(t2.volume) AS signed) 
                            FROM ibbd2.top_item_tradingtime t2, ibbd2.top_cat_search_result t1 
                            WHERE t2.item_id =t1.item_id 
                                AND t1.keyword='{}' 
                                AND t2.date_of BETWEEN '2013-01-01' AND '2013-01-14' 
                            GROUP BY t2.hour_of; 
                        """.format(keyword))
        ret = cursor.fetchall()
        data.append(keyword+":"+str(time.time() - ttt))
    file = open('./test_partition.afterpartition.result','w')
    for i in data:
        file.write(i+'\n')
    file.close()
    cursor.close()
    conn.close()
    
if __name__ == '__main__':
    test_partition()


