#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
@auth   Cooper
@date   2012.6.7
@desc   library
'''

import re
import time
import json
import uuid

import requests
import MySQLdb
import redis
from config import spider_header, mysql_db_config, redis_config, cookies
from dfhspider.connectionpool import ConnectionPool

SLAVEID = uuid.getnode()
connpool = ConnectionPool(max_connections=20, **mysql_db_config)


def getMyIpInfo():
    refer = 'http://ip.taobao.com/service/getIpInfo.php'
    try:
        r = requests.request('POST', refer, data={'ip': 'myip'})
        j = json.loads(r.text, encoding=r.encoding)
    except Exception, e:
        j = {'error': e.message}
    return j

try:
    IP = (getMyIpInfo().get('data') or {}).get('ip') or ''
except:
    IP = ''


def spiderLog2(*msg):
    print ' '.join(['[%s]' % str(t) for t in [time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()), SLAVEID, IP] + list(msg)])


def request(
    url,
    method='GET',
    timeout=5,
    retries=2,
    requiredPropertyRegx=None,
    reqinterval=0.1,
    **kwargs
):

    return requests.get(url, timeout=timeout)

    r = None
    if retries > 0:
        try:
            if kwargs.get('headers'):
                headers = spider_header
                headers.update(kwargs['headers'])
                kwargs.pop('headers')
            elif kwargs.get('headers') == {}:
                headers = {}
            else:
                headers = spider_header
            headers.pop('Referer')
            r = requests.request(method,
                                 url,
                                 timeout=timeout,
                                 cookies=cookies,
                                 allow_redirects=True,
                                 headers = headers
                                 **kwargs)
            # time.sleep(reqinterval)
            return r
            # t = r.text
            # if t.find('location.href=')!=-1:
            #     search = url[url.index('?'):]
            #     regx = re.findall(r'location.href=\'(.+?)\'', t)
            #     if regx:
            #         url = regx[0] + search
            #         r = requests.request(method, url, timeout=timeout, **kwargs)
            for regx in [r'.+?home\/deny\..+', r'.+alisec\.taobao.+',
                         r'.+error.+']:
                if re.match(regx, r.url):
                    spiderLog2('Request Limited')
                    time.sleep(60 * 10)
                    r = request(
                        url,
                        method,
                        timeout,
                        retries,
                        requiredPropertyRegx,
                        **kwargs
                    )
                    break
            # if requiredPropertyRegx:
            #     re.findall(requiredPropertyRegx, r.content)[0]
        except:
            r = request(
                url,
                method,
                timeout,
                retries - 1,
                requiredPropertyRegx,
                reqinterval,
                **kwargs
            )
    return r


def requestByProxy(
    url,
    method='GET',
    timeout=5,
    retries=5,
    requiredPropertyRegx=None,
    **kwargs
):

    return request(
        url,
        method,
        timeout,
        retries,
        requiredPropertyRegx,
        proxies={'http': '127.0.0.1:8097'},
        **kwargs
    )


def getDBConn(dbName='mysql', **kwargs):
    db = None
    while 1:
        try:
            conn_args = mysql_db_config
            conn_args.update(kwargs)
            conn_args.update({'db': dbName})
            db = MySQLdb.connect(**conn_args)
            break
        except Exception, e:
            print e
            time.sleep(60 * 2)
    return db


def getRedisConn2(conn_config=redis_config):
    r = None
    while 1:
        try:
            r = redis.StrictRedis(**conn_config)
            break
        except:
            time.sleep(60)
    return r


def getMacId():
    macId = uuid.getnode()
    return macId


def escapeSQLCommand(cmd):
    return MySQLdb.escape_string(str(cmd))


def getIpInfo(ip):
    if not re.match(r'\d+\.\d+\.\d+\.\d+', ip):
        return None
    url = 'http://ip.taobao.com/service/getIpInfo.php?ip=%s' % str(ip)
    r = request(url)
    j = json.loads(r.text, encoding=r.encoding)
    return j


def spiderLog(msg):
    print ' '.join(['[%s]' % str(t) for t in [time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()), SLAVEID] + msg])


def findTag(text, tag, attr):
    k = attr.keys()[0]
    v = attr[k]
    r = r'\<' + tag + '\s+.*?' + k + '\s*\=\s*\"' + v + '\"\s*.*?\>'
    t = re.findall(r, text, re.S)
    return t


def executeSQLCommand(
    dbName,
    sqlCommand,
    args=None,
    connpool=connpool,
    block=2000,
):

    # execute by executemany

    conn = connpool.get_connection()
    c = conn.cursor()
    for i in range((len(args) / block if len(args) % block == 0 else len(args)
                   / 20 + 1)):
        c.executemany(sqlCommand, args[block * i:block * (i + 1)])
    conn.commit()
    c.close()
    connpool.release(conn)
    return len(args)


def sendMail(sendTo, subject, htmlBody):
    import smtplib
    from email.mime.multipart import MIMEMultipart
    from email.mime.text import MIMEText
    server = smtplib.SMTP()
    server.connect('smtp.exmail.qq.com', '25')
    server.login('app@ibbd.net', 'scut2092')
    if sendTo.endswith('@gmail.com'):
        server.starttls()
    try:
        msg = MIMEMultipart('alternative')
        msg['Subject'] = unicode(subject, 'utf-8')
        msg['From'] = 'app@ibbd.net'
        msg['To'] = sendTo
        msg.attach(MIMEText(unicode(htmlBody, 'utf-8'), 'html', 'utf-8'))
        server.sendmail('app@ibbd.net', sendTo, msg.as_string().encode('ascii'))
    except Exception, e:
        raise e
    finally:
        server.quit()
    del smtplib
    del MIMEMultipart
    del MIMEText
