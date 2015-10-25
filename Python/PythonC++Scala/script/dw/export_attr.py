#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import os
import HTMLParser

from dfhspider.lib import getDBConn

parser = HTMLParser.HTMLParser()

sql = \
    """SELECT T3.item_id, T4.attr_list
  FROM    (SELECT T2.keyword,
                  T2.rank,
                  T2.item_id,
                  T2.item_name,
                  T2.wangwang
             FROM topspider.top_itemsearchresult T2
            WHERE T2.keyword = '%s'
           GROUP BY T2.keyword, T2.item_id) T3
       LEFT JOIN
          topspider.top_item T4
       ON T3.item_id = T4.item_id
GROUP BY T3.item_id"""


def main():

    # config

    exportpath = 'F:/'
    keyword = '女士手表'
    exportfile = os.path.join(exportpath, 'verified_%s_attr.txt' % keyword.decode('utf-8').encode('GBK'))

    # action

    dbConn = getDBConn('ibbd2')
    cursor = dbConn.cursor()
    print 'execute sql query'
    cursor.execute(sql % keyword)
    rows = cursor.fetchall()
    rows = [[row[0], (parser.unescape(row[1]).encode('GB2312', 'ignore').replace('\n', ' ') if row[1] else '')]
            for row in rows]
    if os.path.exists(exportfile):
        os.remove(exportfile)
    with open(exportfile, 'a') as f:
        f.write('\n'.join([str(row[0]) + '\t' + row[1] for row in rows]))
    cursor.close()
    dbConn.close()


if __name__ == '__main__':
    main()
