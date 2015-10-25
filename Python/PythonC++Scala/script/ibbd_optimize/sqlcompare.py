#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
import MySQLdb
import datetime
import random
import time
import urllib
def getParam():
    """
        获取测试url时所需要的模拟参数
    """
    data = {}
    data.update(keyword='四物汤',
                        region = '全国',
                        brand = '全部',
                        count = 10,
                        brand2 =2,
                        keyword2 = 2,
                        region2 = 2,
                        chartType = 'line',
                        tradeType = 'volume',
                        myshop = '******',
                        compareName = '',
                        page = 1,
                        pageCount =1,
                        pageSize = 1)
    
    n = datetime.datetime.now()
    yesterday = (n - datetime.timedelta(days=1)).strftime('%Y/%m/%d')
    oneweekbefore = (n - datetime.timedelta(days=8)).strftime('%Y/%m/%d')
#    oneweekbefore.strftime('%Y/%m/%d')
    
    '''测试1月份的'''
    yesterday = '2013/01/02'
    oneweekbefore = '2013/01/16'
    
    data.update(fromdate = oneweekbefore,
                        fromDate = oneweekbefore,
                        toDate = yesterday,
                        todate = yesterday)
    return data
    
def sqlLogTime(sql,longQueryTime=1, logFile="./sqlCompare.log",connConfig={}):
    
    keywords = getKeywordsFromFile()[199:299]
#    tmp = []
#    for _i in range(50):
#        tmp.append(random.choice(keywords))
#    keywords = tmp
    keywordsLen = len(keywords)
    conf = {'host':"223.4.155.152",
            'db':"ibbd2",
            'port':3306,
            'charset':"utf8",
            'user':"ibbdtest",
            'passwd':"ibbdtest"
            }
    conf.update(connConfig)
    
    print conf
    connect = MySQLdb.connect(**conf)
    cursor = connect.cursor()
    
    result = []
    formatSql = sql
    for keyword in keywords:
        keywordsLen = keywordsLen - 1
        print '关键词为',keyword,'  还有'+str(keywordsLen)+'个'
        sql = formatSql.format(keyword)
        try:
            '''
                将测试两次，如果第一次时间比第二次时间要长很多，说明第一次是未
                预热的情况，记录该时间
            '''
            t = time.time()
     #       sql = "select 1"
      #      sql = "select * from top_item2 limit 1"
            cursor.execute(sql)
            interval = time.time() - t
            
            t = time.time()
            cursor.execute(sql)
            hotInterval = time.time() - t
            
            if interval > longQueryTime and interval-hotInterval>1:
                result.append({'keyword':keyword,'time':interval})
        except   :
            print 'errr'
            pass
    cursor.close()
    connect.close()
    file = open(logFile,'w')
    for line in result:
        file.write(line['keyword']+':'+str(line['time']) + '\n')
    file.flush()
    file.close()
    
    
def loadLog(log = './timeresult.log'):    
    lines = open(log).readlines()
#    data = [[(dd[0],int(dd[1])*float(dd[2])) for dd in line[:-1].split(':')] for line in lines]
    data = []
    for line in lines:
        d = line[:-1].split(':')
        data.append((d[0],int(d[1]),int(float(d[1])*float(d[2]))))
    data = sorted(data,key=lambda x:x[1],reverse=True)
    return data[:10]

def getKeywordsFromFile(file="./keywords.data"):
    words = open(file).read().split('\n')
    return words

def sqlCompareTime(sql1,sql2,logFile1,logFile2):
#    sqlLogTime(sql1,logFile=logFile1)
#  sqlLogTime(sql2,logFile=logFile2)
    pass
def hostCompareTime(host1Config,host2Config,sql,logFile1,logFile2):
    sqlLogTime(sql,logFile=logFile1,connConfig=host1Config)
    sqlLogTime(sql,logFile=logFile2,connConfig=host2Config)
    pass
def avgTime(log):
    lines = open(log).readlines()
    times = [float(i.split(':')[1][:-1]) for i in lines]
    if len(times) == 0:
        tim = 0
    else:
        tim   = sum(times)/len(times)
    return (tim,len(times))
    
def avgTimeCompare(*logs):
    ret = ""
    for i in logs:
        ret =ret +  i+":平均时间："+str(avgTime(i)[0])+"    次数："+str(avgTime(i)[1]) +"\n"
    return ret
#    time1 = avgTime(log1)
#    time2 = avgTime(log2)
#    print log1,":",time1
#    print log2,":",time2

def testHost():
    sql = """SELECT DATE_FORMAT(date_of,'%Y/%m/%d'),
            CAST(SUM(buyer_num) AS SIGNED),
            CAST(SUM(trade_num) AS SIGNED),
            CAST(SUM(sales) AS SIGNED),
            CAST(SUM(sales)/SUM(buyer_num) AS SIGNED)
        FROM ibbd2.ststc_keyword_shop_pct
        WHERE keyword='{}'
        AND date_of BETWEEN '2012-12-25' AND '2013-01-10' 
        GROUP BY date_of"""
#    sql = """
#        SELECT T1.item_id,T1.item_name,T1.user_num_id,T1.wangwang,CAST(SUM(T2.volume) AS SIGNED),MAX(CASE WHEN T2.date_of='2012-12-25' THEN T2.volume ELSE 0 END)
#        FROM ibbd2.top_cat_search_result T1
#        LEFT JOIN ibbd2.top_item2 T2
#        ON T1.item_id = T2.item_id
#        AND T2.date_of BETWEEN ('2012-12-25' - INTERVAL 6 DAY) AND '2012-12-25'
#        WHERE T1.keyword='{}'
#        GROUP BY T1.item_id
#        ORDER BY SUM(T2.volume) DESC
#        LIMIT 0,50
#    """
#    sql = """
#            SELECT cast(t2.avg_deal_price AS signed), cast(SUM(t2.volume) AS signed) 
#            FROM ibbd2.top_item2 t2,ibbd2.top_cat_items t1 
#            WHERE t1.item_id = t2.item_id 
#            AND t2.date_of BETWEEN '2012-12-25' AND '2013-01-10' 
#            AND t1.keyword='{}' AND t2.item_id IS NOT NULL 
#            GROUP BY cast(t2.avg_deal_price AS signed) 
#            ORDER BY cast(t2.avg_deal_price AS signed);
#            """
#    sql = """
#        SELECT
#        SUM(T2.hour_0),
#        SUM(T2.hour_1),
#        SUM(T2.hour_2),
#        SUM(T2.hour_3),
#        SUM(T2.hour_4),
#        SUM(T2.hour_5),
#        SUM(T2.hour_6),
#        SUM(T2.hour_7),
#        SUM(T2.hour_8),
#        SUM(T2.hour_9),
#        SUM(T2.hour_10),
#        SUM(T2.hour_11),
#        SUM(T2.hour_12),
#        SUM(T2.hour_13),
#        SUM(T2.hour_14),
#        SUM(T2.hour_15),
#        SUM(T2.hour_16),
#        SUM(T2.hour_17),
#        SUM(T2.hour_18),
#        SUM(T2.hour_19),
#        SUM(T2.hour_20),
#        SUM(T2.hour_21),
#        SUM(T2.hour_22),
#        SUM(T2.hour_23)
#        FROM ibbd2.top_cat_search_result T1
#        LEFT JOIN ibbd2.top_item_tradingtime T2
#        ON T1.item_id = T2.item_id
#        AND T2.date_of BETWEEN '2013-02-26 00:00:00' AND '2013-03-04 00:00:00'
#        WHERE T1.keyword='{}'
#            """
    hostCompareTime({'host':"223.4.155.152",
            'db':"ibbd2",
            'port':3306,
            'charset':"utf8",
            'user':"ibbdtest",
            'passwd':"ibbdtest"
            },
           {'host':"223.4.216.246",
            'db':"ibbd2",
            'port':3306,
            'charset':"utf8",
            'user':"liangj",
            'passwd':"liangj"
            },
            sql,
            './log/bigint/152test_from60.log',
            './log/bigint/246test_from60.log' )
    ret = avgTimeCompare(
         './log/bigint/152test_from60.log',
        './log/bigint/246test_from60.log'       
               )
    print ret
    f = open("./log/bigint/compare.log","a")
    f.write(sql + "\n")
    f.write(ret)
    f.write("**************************************************\n")
    f.flush()
    f.close()

def testSql():
    sql1 = """
        SELECT
        SUM(T2.hour_0),
        SUM(T2.hour_1),
        SUM(T2.hour_2),
        SUM(T2.hour_3),
        SUM(T2.hour_4),
        SUM(T2.hour_5),
        SUM(T2.hour_6),
        SUM(T2.hour_7),
        SUM(T2.hour_8),
        SUM(T2.hour_9),
        SUM(T2.hour_10),
        SUM(T2.hour_11),
        SUM(T2.hour_12),
        SUM(T2.hour_13),
        SUM(T2.hour_14),
        SUM(T2.hour_15),
        SUM(T2.hour_16),
        SUM(T2.hour_17),
        SUM(T2.hour_18),
        SUM(T2.hour_19),
        SUM(T2.hour_20),
        SUM(T2.hour_21),
        SUM(T2.hour_22),
        SUM(T2.hour_23)
        FROM ibbd2.top_cat_search_result T1
        LEFT JOIN ibbd2.top_item_tradingtime T2
        ON T1.item_id = T2.item_id
        AND T2.date_of BETWEEN '2013-02-26 00:00:00' AND '2013-03-04 00:00:00'
        WHERE T1.keyword='{}'
    """
    sql2 = """
        SELECT
        SUM(T2.hour_0),
        SUM(T2.hour_1),
        SUM(T2.hour_2),
        SUM(T2.hour_3),
        SUM(T2.hour_4),
        SUM(T2.hour_5),
        SUM(T2.hour_6),
        SUM(T2.hour_7),
        SUM(T2.hour_8),
        SUM(T2.hour_9),
        SUM(T2.hour_10),
        SUM(T2.hour_11),
        SUM(T2.hour_12),
        SUM(T2.hour_13),
        SUM(T2.hour_14),
        SUM(T2.hour_15),
        SUM(T2.hour_16),
        SUM(T2.hour_17),
        SUM(T2.hour_18),
        SUM(T2.hour_19),
        SUM(T2.hour_20),
        SUM(T2.hour_21),
        SUM(T2.hour_22),
        SUM(T2.hour_23)
        FROM ibbd2.top_cat_search_result T1
        LEFT JOIN ibbd2.top_item_tradingtime_partition T2
        ON T1.item_id = T2.item_id
        AND T2.date_of BETWEEN '2013-02-26 00:00:00' AND '2013-03-04 00:00:00'
        WHERE T1.keyword='{}'
    """
    sqlCompareTime(sql1,sql2,"./log/top_item_tradingtime.old.log","./log/top_item_tradingtime.new.log")
def main():    
    testHost()
    
    pass
if __name__ == '__main__':
    main()
"""
delimiter $$
CREATE DEFINER=`liangj`@`%` PROCEDURE `sp_select_all_table_size`(_schema_name varchar(50))
    COMMENT '统计表所占用的空间'
begin
SELECT TABLE_NAME,  concat(round(sum(DATA_LENGTH)/1024/1024, 2), 'MB') as '数据大小',  concat(round(sum(INDEX_LENGTH)/1024/1024, 2), 'MB') as '索引大小',  concat(round(sum(DATA_LENGTH+INDEX_LENGTH)/1024/1024, 2), 'MB') as '大小总和',  TABLE_ROWS as '行数' FROM information_schema.TABLES   WHERE TABLE_SCHEMA=_schema_name  GROUP BY table_name ORDER BY DATA_LENGTH+INDEX_LENGTH DESC;
SELECT '总共',  concat(round(sum(DATA_LENGTH)/1024/1024, 2), 'MB') as '数据大小',  concat(round(sum(INDEX_LENGTH)/1024/1024, 2), 'MB') as '索引大小',  concat(round(sum(DATA_LENGTH+INDEX_LENGTH)/1024/1024, 2), 'MB') as '大小总和' FROM information_schema.TABLES   WHERE TABLE_SCHEMA=_schema_name ORDER BY DATA_LENGTH+INDEX_LENGTH DESC;
end $$
delimiter ;
"""
"""
drop procedure if exists `sp_select_all_table_size`;
delimiter $$
 CREATE PROCEDURE `sp_select_all_table_size`(_schema_name varchar(50))
    COMMENT '统计表所占用的空间'
begin
SELECT TABLE_NAME,  concat(round(sum(DATA_LENGTH)/1024/1024, 2), 'MB') as '数据大小',  concat(round(sum(INDEX_LENGTH)/1024/1024, 2), 'MB') as '索引大小',  concat(round(sum(DATA_LENGTH+INDEX_LENGTH)/1024/1024, 2), 'MB') as '大小总和',  TABLE_ROWS as '行数' FROM information_schema.TABLES   WHERE TABLE_SCHEMA=_schema_name  GROUP BY table_name ORDER BY DATA_LENGTH+INDEX_LENGTH DESC;
SELECT '总共',  concat(round(sum(DATA_LENGTH)/1024/1024, 2), 'MB') as '数据大小',  concat(round(sum(INDEX_LENGTH)/1024/1024, 2), 'MB') as '索引大小',  concat(round(sum(DATA_LENGTH+INDEX_LENGTH)/1024/1024, 2), 'MB') as '大小总和' FROM information_schema.TABLES   WHERE TABLE_SCHEMA=_schema_name ORDER BY DATA_LENGTH+INDEX_LENGTH DESC;
end $$
delimiter ;
"""