#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import MySQLdb
import ibbdlib

# db_conn = MySQLdb.connect(host='223.4.155.172', user='ibbd', passwd='spider')
db_conn = ibbdlib.get_db_conn(host='223.4.155.172', user='ibbd', passwd='spider')
# cursor = db_conn.cursor()
cursor = db_conn._db.cursor()
try:
    print cursor.callproc('ibbd2.sp_insert_date', tuple(['2012-12-12']))
except Exception, e:
    print e
finally:
    cursor.close()
    db_conn.close()
