#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import MySQLdb
import time
import Apriori


def getDBconn():
    return MySQLdb.connect(host='223.4.155.152', user='ibbdtest', passwd='ibbdtest', db='ibbdtest', charset='utf8')


def getdata():
    '''
        从数据库中获取Apriori所需要的数据
        返回格式：map(shop_id,map((nick,vip_level),set(items)))
               ex:
                        {
                        shop1:{(nick1,vip_level1):([item1,item2])},
                        shop2:{(nick2,vip_level2):([item1,item2])}
                        }
    '''

    conn = getDBconn()
    cursor = conn.cursor()
    cursor.execute('''
                            select *
                                from top_trade_assortment limit 0,1000;
                            ''')
    ret = cursor.fetchall()
    cursor.close()
    conn.close()
    shop = {}
    for (shop_id, nick, vip_level, item_ids) in ret:
        if shop_id not in shop:
            shop[shop_id] = {}
        shop[shop_id][(nick, vip_level)] = item_ids.split(',')
    del ret
    return shop


def printdata(data):
    for k in data:
        for (n, v) in data[k]:
            print k, (n, v), data[k][(n, v)]


def saveaprioriresult(data):
    '''
        保存apriori计算结果到数据库
        data格式：
            ex: 
                    {
                        shop1:{item_ids:{'num':1,'sup':0.5}}
                        ....
                    }
    '''

    resultList = []
    for shop in data:
        for item_ids in data[shop]:
            resultList.append([shop, item_ids, data[shop][item_ids]['num'], data[shop][item_ids]['sup']])
    db = getDBconn()
    corsor = db.cursor()
    corsor.executemany('insert into ststc_apriori_assortment values(%s,%s,%s,%s,NOW())', resultList)
    db.commit()
    corsor.close()
    db.close()
    del resultList
    del corsor
    del db


def main():
    print 'begin:'
    t = time.time()
    print '获取数据中：'
    data = getdata()

#    printdata(data)

    print '获取数据完毕'
    print '商店总数：', len(data)
    aprioriResult = {}
    for shop in data:
        print 'shop:', shop, '  顾客数：', len(data[shop])
        assortment = []
        for curstomer in data[shop]:
            assortment.append(list(data[shop][curstomer]))

      #  print 'get assortment done',assortment

        adata = Apriori.apriori(assortment, 0.5)

#        if adata:
#            print adata

        aprioriResult[shop] = adata
    print '保存apriori结果到数据库'
    saveaprioriresult(aprioriResult)
    print str(time.time() - t)
    print 'done'


if __name__ == '__main__':
    main()
