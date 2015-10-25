#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import MySQLdb
import datetime
try:
    connection1 = MySQLdb.connect(user='ibbd', passwd='spider', host='localhost', db='ibbd2')
except:

    print 'Could not connect to MySQL server.'
    exit(0)

try:
    cur1 = connection1.cursor()
    cur2 = connection1.cursor()
    d1 = datetime.datetime.now()
    print 'start insert'

    count = \
        cur1.execute("""SELECT IFNULL(T2.user_num_id,''),

                T1.shop_id,

                IFNULL(T2.wangwang,''),

                T1.date_of,

                SUM(T1.volume),

                SUM(T1.sales),

                SUM(T1.trade_num),

                0,

                NOW()

           FROM    ibbd2.top_item2 T1

                LEFT JOIN

                   ibbd2.top_shop1 T2

                ON T1.shop_id = T2.shop_id

          WHERE DATE(T1.population_tsmp) = Date('2012-12-09')

         GROUP BY T1.shop_id, T1.date_of;
   """)
    print 'Rows selected:', count
    i = 0
    t = 10000
    result = ()

#   while 1:
#       result = cur1.fetchmany(t)
#       if not result:break
#       print len(result)

    while i < count:
        if i + t > count:
            t = count - i
        print 'i=', i
        result = cur1.fetchmany(t)
        print len(result)
        n = cur2.executemany('INSERT IGNORE INTO ststc_shop_sale_in values(%s,%s,%s,%s,%s,%s,%s,%s,%s)', result)
        i = i + t
        connection1.commit()

    d2 = datetime.datetime.now()
    print (d2 - d1).microseconds
    cur1.close()
except MySQLdb.Error, e:
    print 'Mysql Error %d: %s' % (e.args[0], e.args[1])
