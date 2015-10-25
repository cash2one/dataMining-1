#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import sys
import re
import xlrd

# from dfhspider.lib import getDBConn,getRedisConn2

import MySQLdb


def getDBConn():
    # return MySQLdb.connect(host='localhost', user='root', passwd='LTs00744601',
                           # charset='utf8', db='topspider')
    return MySQLdb.connect(
        host='223.4.155.152', user='ibbd_site', passwd='ibbd_site_152',
        charset='utf8', db='topspider')


def saveTop20w(path, rowIndex):
    print 'loading workbook'
    book = xlrd.open_workbook(path)
    print 'loading complete'
    # sheet = book.sheets()[0]
    for sheet_index, sheet in enumerate(book.sheets()[1:]):
        arr = []
        print 'reading top20w sheet', sheet_index, sheet.name.encode('utf-8'), sheet.nrows
        # sample = sheet.cell(rowIndex, 0).value
        regx = [re.compile(r'\d+'), re.compile(r'\d*\.*\d+')]
        for i in xrange(rowIndex, sheet.nrows):
            try:
                row = [sheet.cell_value(i, j)
                       for j in range(0, 6)]
                row = [(t.encode('utf-8', 'ignore') if isinstance(t,
                       unicode) else t) for t in row]
                if row[0] == '':
                    continue

                # for i in range(2):
                #     row[i]=repr(row[i])[1:-1].replace('\\x','%')

                row = row[:3] + [''] + row[3:]
                row[4] = regx[0].findall(row[4])[0]
                row[5] = regx[0].findall(row[5])[0]
                row[6] = regx[1].findall(row[6])[0]
                arr.append(row)
            except:
                raise
        print 'reading complete, total num', len(arr)

        # save to MySQL topspider
        print 'saving top20w'
        db = getDBConn()
        c = db.cursor()
        dateOf = re.findall(r'(\d+)\.', path)[0]
        c.executemany(
            "INSERT IGNORE INTO topspider.top_20w\
            (publish_date, keyword, cat_1, cat_2, cat_3, buyer_num, click_num, ppc) \
            VALUES(CONCAT(YEAR(CURDATE()),'{0}'),%s,%s,%s,%s,%s,%s,%s)".format(
            dateOf), [ar for ar in arr if len(ar) == 7])
        db.commit()
        c.close()
        db.close()
        print 'save complete'


    # del book,sheet,arr,db,c

def truncate():
    db = getDBConn()
    c = db.cursor()
    c.execute("TRUNCATE TABLE topspider.top_20w")
    db.commit()
    c.close()
    db.close()


def main():
    path = sys.argv[1]
    truncate()
    saveTop20w(path, 1)

if __name__ == '__main__':
    main()
