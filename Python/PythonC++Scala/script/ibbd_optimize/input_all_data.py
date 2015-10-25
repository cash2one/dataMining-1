#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
import MySQLdb
import time

"""
    把表数据导进bigint(8)结构的表
"""
def input_all_data(filePath):
    if not filePath.endswith("/"):
        filePath = filePath + "/"
    logFile = './log/input_all_data.log'
    connect = MySQLdb.connect("!!!!!!!!!!error !!!!!!!!!!!!!!!!!")
    cursor = connect.cursor()
    cursor.execute("show tables like 'int_%'")
    table_names = cursor.fetchall()
    num = len(table_names)
    start_time = time.time()
    for i,name in enumerate(table_names):
        name = name[0].encode('utf-8')
        this_time = time.time()
        status =  '开始第'+str(i+1)+'个 '+name+',共有 '+str(num) + '个'
        log(status,logFile)
        sql = "load data infile '"+filePath + name + ".data' into table " + name
        print sql
#        cursor.execute(sql)
        log('完成'+name+',耗时'+str(time.time()-start_time),logFile)
    log('全部完成，总耗时'+str(time.time()-start_time),logFile)
    cursor.close()
    connect.close()

def log(msg,logFile="./log/input_all_data.log"):
    print msg
    ff = open(logFile,'a')
    ff.write(msg + '\n')
    ff.flush()
    ff.close()
    
def main():
    input_all_data("/data/146.file/mysql_copy/data")
    
if __name__ == '__main__':
    main()