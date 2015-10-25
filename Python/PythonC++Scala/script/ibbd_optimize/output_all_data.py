#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
import MySQLdb
import time

'''
    把表的数据导出
'''
def output_all_data():
    connect = MySQLdb.connect(host="223.4.155.152",db="ibbd2",port=3306,charset="utf8",user="ibbd",passwd="spider")
    cursor = connect.cursor()
    cursor.execute("select table_name from information_schema.tables where table_schema='ibbd2' order by table_rows desc")
    table_names = cursor.fetchall()[2:]
    num = len(table_names)
    start_time = time.time()
    for i,name in enumerate(table_names):
        name = name[0].encode('utf-8')
        if name.endswith('partition') or name.endswith('partition2'):
            print '跳过第',i+1,'个',name
            continue
        tt = time.time()
        print '开始第',i+1,'个 ',name,',还有 '+str(num) + '个'
        print "select * from "+name+" into outfile /home/liangj/mysql_copy/data/int_"+name+".data"
        cursor.execute("select * from "+name+" into outfile '/home/liangj/mysql_copy/data/int_"+name+".data'")
        print '完成',name,',耗时',time.time()-tt
    print '全部完成，总耗时',time.time()-start_time
    cursor.close()
    connect.close()

def main():
    output_all_data()
    
if __name__ == '__main__':
    main()