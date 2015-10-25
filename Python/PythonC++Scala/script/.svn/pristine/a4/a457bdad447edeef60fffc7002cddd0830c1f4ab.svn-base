#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time
import string
from random import randint
import MySQLdb


def getDBConn():

    # db=MySQLdb.connect(host='localhost',user='root',passwd='LTs00744601',db='mysql')

    db = MySQLdb.connect(host='localhost', user='cooper', passwd='1234',
                         db='mysql')
    return db


def initDb():
    db = getDBConn()
    db.query('DROP DATABASE IF EXISTS mysqldb')
    db.query('CREATE DATABASE mysqldb')
    db.query('CREATE TABLE mysqldb.table1 (iid varchar(20),name varchar(50),pk varchar(32),KEY iid(iid))ENGINE=InnoDB'
             )
    db.commit()
    db.close()


def insertRows(num):
    db = getDBConn()
    c = db.cursor()
    c.executemany('INSERT INTO mysqldb.table1 VALUES(%s,%s,MD5(%s))',
                  [[''.join([string.letters[randint(0, 27)] for i in
                  range(20)]), ''.join(string.letters[randint(0, 27)] for i in
                  range(50)), ''.join(string.letters[randint(0, 27)] for i in
                  range(50))] for i in range(num)])
    db.commit()
    c.close()
    db.close()


def destrunctor():
    db = getDBConn()
    db.query('DROP DATABASE IF EXISTS mysqldb')
    db.commit()
    db.close()


def main():
    initDb()
    for num in [10 ** 3, 10 ** 5]:
        print 'rows num %d, ' % num,
        t1 = time.time()
        insertRows(num)
        t2 = time.time()
        print 'cost %fS' % (t2 - t1)
    destrunctor()


if __name__ == '__main__':
    main()
