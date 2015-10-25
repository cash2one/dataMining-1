#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auther:Cooper
date:2012.8.22
desc:直通车任务
'''

import time

from dfhspider.lib import spiderLog2, getDBConn, executeSQLCommand
from dfhspider.topzhitongche import getZhitongcheResult
from dfhspider.topbll import saveZhitongcheResult

import logging
import logging.handlers
filehandler = \
    logging.handlers.TimedRotatingFileHandler(filename='log/zhitongche.log',
        when='D', interval=1)
formatter = logging.Formatter('%(asctime)s %(name)s %(levelname)s %(message)s',
                              '%Y-%m-%d %H:%M:%S')
filehandler.setFormatter(formatter)
log = logging.getLogger('spider.Zhitongche')
log.addHandler(filehandler)
log.setLevel(logging.INFO)

exclude_hours = [
    2,
    3,
    4,
    5,
    6,
    7,
    ]


def updateTopZhitongcheResult():
    while 1:

        # exclude hours

        if time.localtime().tm_hour in exclude_hours:
            time.sleep(60 * 10)
            continue

        # 获取关键词列表

        db = getDBConn('ibbd2')
        cmdStr = 'SELECT DISTINCT(keyword) FROM ibbd2.user_keywords_ztc'
        db.query(cmdStr)
        r = db.store_result()
        keywords = [r.fetch_row()[0][0].encode('utf-8') for i in
                    range(r.num_rows())]
        db.close()

        # 获取直通车结果

        for keyword in keywords:
            log.info('%s Start', keyword)

            # 保存结果

            try:
                metadata = getZhitongcheResult(keyword, 'utf-8', 5)
                saveZhitongcheResult(metadata)

                # 更新店铺列表

                executeSQLCommand('ibbd2',
                                  'DELETE FROM ibbd2.ststc_ztc_shops WHERE keyword=%s'
                                  , [keyword])
                sellerDict = dict((record['sellerId'], record['wangwang'])
                                  for record in metadata)
                executeSQLCommand('ibbd2',
                                  'INSERT INTO ibbd2.ststc_ztc_shops VALUES(%s,%s,%s)'
                                  , [[keyword, k, v] for (k, v) in
                                  sellerDict.items()])
                log.info('%s Success' % keyword)
            except Exception, e:
                log.error('%s Error %s', keyword, str(e))
        log.info('Sleep %d', 60 * 25)
    pass


def main():
    updateTopZhitongcheResult()


if __name__ == '__main__':
    main()
