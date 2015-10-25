#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
author:Cooper
date:2012.7.23
'''

import json
import re
import time
from string import atof
from lib import request, getMyIpInfo, getDBConn
from config import mysql_ip_config
from topbll import saveZhitongcheResult
import threading


def getZhitongcheResult(keyword, encoding='utf-8', page=1, reqinterval=0.2):
    timestamp = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
    q = repr(keyword.decode(encoding).encode('GBK')).replace('\\x', '%'
            ).upper()[1:-1]
    ip = getMyIpInfo()['data']['ip']
    domain = \
        'http://tmatch.simba.taobao.com/?name=tbuad&catid=&pid=420434_1006,420435_1006&count=5&rct=8&o=j&keyword=%s&offset=%d&ip=%s&frontcatid=&type=0&refpid=&propertyid=&lid=&gprice=&loc=&sort=&q2cused=0&sbid=6&ismall=0&multikeys=1&p4p=__p4p_sidebar__,__p4p_bottom__&t=%d'
    metadata = []
    for pageIndex in range(page):
        url = domain % (q, 13 * pageIndex, ip, int(time.time() * 1000))
        s = request(url, reqinterval=reqinterval,
                    headers={'Referer': 'http://s.taobao.com/search?q=%s&style=list&bcoffset=1&sort=sale-desc&s=%d'
                     % (q, 13 * pageIndex), 'Host': 'tmatch.simba.taobao.com'
                    }).text
        for (i, t) in enumerate(re.findall(r'(\{.+?\})', s, re.S)):
            try:
                j = json.loads(t)
                metadata.append({  # 'key':eval("u'%s'"%(j['REDKEY'][j['REDKEY'].index(';')+1:j['REDKEY'].rindex('&')])).encode('utf-8'),
                    'ip': ip,
                    'keyword': keyword,
                    'rank': i + 1 + 13 * pageIndex,
                    'itemId': re.findall(r'id\=(\d+)', j['URL'
                            ])[0].encode('utf-8'),
                    'itemLink': j['URL'].encode('utf-8'),
                    'itemImg': j['TBGOODSLINK'].encode('utf-8'),
                    'itemPrompName': eval("u'%s'" % j['TITLE']).encode('utf-8'
                            ),
                    'itemTitle': eval("u'%s'" % j['ADGTITLE']).encode('utf-8'),
                    'sellerId': j['SELLERID'].encode('utf-8'),
                    'wangwang': eval("u'%s'" % j['WANGWANGID']).encode('utf-8'
                            ),
                    'price': atof(j['GOODSPRICE'].encode('utf-8')) * 1.0 / 100,
                    'location': eval("u'%s'" % j['LOCATION']).encode('utf-8'),
                    'volume': j['SELL'].encode('utf-8'),
                    'key': eval("u'%s'" % j['REDKEY']).encode('utf-8'),
                    'keys': ','.join([eval("u'%s'" % t) for t in j['REDKEYS'
                                     ]]).encode('utf-8'),
                    'time': timestamp,
                    })
            except:
                pass
    return metadata


def getLastestTimeOfKeyword(keyword, dbname='topspider'):
    db = getDBConn(dbname,**mysql_ip_config.get('152'))
    cursor = db.cursor()
    cursor.execute('select timestampdiff(minute,lastest_tsmp,now()) from top_ztc_keyword_update_time where keyword=%s'
                   , [keyword])
    ret = cursor.fetchone()
    db.commit()
    cursor.close()
    db.close()
    ret = (ret[0] if ret != None else 9999)  # 返回值可能为0
    return ret


def setLastestTimeOfKeyword(keyword, dbname='topspider'):
    db = getDBConn(dbname,**mysql_ip_config.get('152'))
    cursor = db.cursor()
    cursor.execute('replace into top_ztc_keyword_update_time values(%s,now())',
                   [keyword])
    db.commit()
    cursor.close()
    db.close()


def sum_ztc(keyword, dayinterval=2, dbname='topspider'):
    sql = \
        '''replace into ibbd2.top_ztc_sum(`id`,`keyword`,`key`,`item_id`,`avg_rank`,`lastest_tsmp`,`shop_id`)
                (select `item_id`,`keyword`,`key`,`item_id`,AVG(rank),now(),`shop_id`
                    from topspider.top_ztc_simple
                    where keyword=%s
                    and population_tsmp > (now() - INTERVAL {0} DAY)
                    group by item_id);
    '''.format(dayinterval)
    db = getDBConn(dbname,**mysql_ip_config.get('152'))
    cursor = db.cursor()
#    print 'sum_ztc'
#    print sql
    cursor.execute(sql, [keyword])
    db.commit()
    cursor.close()
    db.close()


class ZTCSpider(threading.Thread):
    '''直通车爬虫，向淘宝查询数据并保存到数据库'''
    
    def __init__(self, keyword, page=5):
        threading.Thread.__init__(self)
        self.keyword = keyword
        self.page = page

    def run(self):
        self.__get_save_sum(self.keyword, self.page)

    def __get_save_sum(self, keyword, page=5):
        if getLastestTimeOfKeyword(keyword=keyword) < 20:
            return
        setLastestTimeOfKeyword(keyword)
        data = getZhitongcheResult(keyword, 'utf-8', page)
#        print "topzhitongche.py ZTCSpider"
#        for i in data:
#            print i['itemId'],'   ',i['wangwang'],'    ',i['rank']
           
 
        '''把获取结果保存到topspider中'''
        saveZhitongcheResult(data)
        
        '''从topspider中把结果精炼到ibbd2中'''
        sum_ztc(keyword=keyword, dayinterval=2)


def refresh_data(keyword, page=5):
    print 'refresh_data'
    thead = ZTCSpider(keyword=keyword, page=page)
    thead.start()
    thead.join(3)

def main():
    print 'start'
    spider = ZTCSpider(keyword='女装 连衣裙')
    spider.start()
    spider.join()
    print 'done'
