#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
从网站抓取温度数据
"""

import sqlite3
import re
import json
from urllib import quote
from datetime import datetime, timedelta
from dateutil import parser

import requests
from BeautifulSoup import BeautifulSoup

host = \
    'http://www.wunderground.com/cgi-bin/findweather/getForecast?airportorwmo=query&historytype=DailyHistory&backurl=%%2Fhistory%%2Findex.html&code=%s&month=%d&day=%d&year=%d'

cities = [
    '安庆',
    '安阳',
    '蚌埠',
    '宝鸡',
    '保定',
    '亳州',
    '沧州',
    '常德',
    '常熟',
    '常州',
    '巢湖',
    '郴州',
    '成都',
    '池州',
    '滁州',
    '达州',
    '大冶',
    '丹阳',
    '东莞',
    '东营',
    '峨眉山',
    '鄂州',
    '佛山',
    '福清',
    '福州',
    '抚州',
    '阜阳',
    '公安',
    '广水',
    '广州',
    '桂林',
    '邯郸',
    '汉中',
    '合川',
    '合肥',
    '菏泽',
    '衡阳',
    '华容县',
    '淮安',
    '淮北',
    '淮南',
    '黄冈',
    '黄石',
    '吉首',
    '济南',
    '建阳',
    '江阴',
    '焦作',
    '晋江',
    '荆门',
    '荆州',
    '景德镇',
    '靖江',
    '九江',
    '开封',
    '昆山',
    '廊坊',
    '乐山',
    '利川',
    '连云港',
    '涟源',
    '临沂',
    '浏阳',
    '六安',
    '龙岩',
    '娄底',
    '泸州',
    '洛阳',
    '漯河',
    '麻城',
    '马鞍山',
    '眉山',
    '绵阳',
    '南昌',
    '南充',
    '南京',
    '南宁',
    '南平',
    '南通',
    '内江',
    '宁德',
    '宁国',
    '宁乡县',
    '彭州',
    '平顶山',
    '萍乡',
    '莆田',
    '濮阳',
    '潜江',
    '青岛',
    '泉州',
    '三门峡',
    '三明',
    '厦门',
    '商洛',
    '商丘',
    '上海',
    '上饶',
    '韶关',
    '邵阳',
    '十堰',
    '石家庄',
    '石首',
    '寿光',
    '双流县',
    '松滋',
    '苏州',
    '随州',
    '太原',
    '泰安',
    '泰州',
    '天门',
    '铜陵',
    '万州',
    '潍坊',
    '涡阳县',
    '无锡',
    '芜湖',
    '武冈',
    '武汉',
    '西安',
    '仙桃',
    '咸宁',
    '咸阳',
    '湘潭',
    '襄樊',
    '孝感',
    '新密',
    '新乡',
    '新余',
    '信阳',
    '徐州',
    '宣城',
    '雅安',
    '盐城',
    '扬州',
    '阳泉',
    '宜宾',
    '宜昌',
    '宜春',
    '宜兴',
    '益阳',
    '永安',
    '永泰县',
    '永州',
    '玉林',
    '岳阳',
    '运城',
    '枣阳',
    '张家港',
    '张家界',
    '漳平',
    '长沙',
    '肇庆',
    '镇江',
    '郑州',
    '中山',
    '钟祥',
    '重庆',
    '周口',
    '株洲',
    '资阳',
    '淄博',
    '自贡',
    '邹城',
    '遵义',
    ]

cities = ['广州', '深圳', '东莞', '杭州', '长沙']

conn = sqlite3.connect('tempeture_his.db')
cursor = conn.cursor()
try:

    # try to create table

    cursor.execute('''CREATE TABLE tempeture_his (city text, date text, avg text, max_act integer, max_avg integer, max_rec integer, min_act integer, min_avg integer, mmin_rec integer)'''
                   )
except:
    pass

# 开始日期1900年、截至昨天

fromdate = '1990-1-1'
todate = datetime.now().strftime('%Y-%m-%d')
cur_date = None

# 调试使用，获取days_limit天数的数据后退出

days = 0
days_limit = 1

def _get_city_temperature(
    city,
    month,
    day,
    year,
    ):
    """
    获取城市指定日期的温度数据
    
    return
        {
            city: 'Guangzhou',
            year: 2012,
            month: 12,
            day: 18,
            avg: 平均温度,
            max: [当天最高温、同期历史平均温度、同期历史最高温度],
            min: [当天最低温、同期历史平均温度、同期历史最低温度]
        }
    """

    data = dict()
    r = requests.get(host % (quote(city), 12, 18, 2012), timeout=10)
    soup = BeautifulSoup(r.text, fromEncoding=r.encoding)
    data['city'] = re.findall(r'for\s+(.+?),', soup.h1.text)[0]
    data['year'] = year
    data['month'] = month
    data['day'] = day
    soup = soup.find('table', {'id': 'historyTable'})
    for (i, row) in enumerate(soup.findAll('tr')):
        if i in [2, 3, 4]:
            if i == 2:
                data['avg'] = row.findAll('td')[1].span.span.text
            elif i == 3:
                data['max'] = [row.findAll('td')[i].span.span.text for i in [1, 2, 3]]
            elif i == 4:
                data['min'] = [row.findAll('td')[i].span.span.text for i in [1, 2, 3]]
    return data

while 1:

    # 循环：从截止日期到开始日期，倒序
    # 在当前日期遍历城市获取温度数据

    if not cur_date:
        cur_date = parser.parse(todate)
    cur_date = cur_date - timedelta(1)
    if cur_date < parser.parse(fromdate):
        break
    for city in cities:
        print city.decode('utf-8', 'ignore'), cur_date,
        try:
            metadata = _get_city_temperature(city, cur_date.month, cur_date.day, cur_date.year)
            print json.dumps(metadata, indent=4)

            # 将记录插入到sqlite3数据库

            cursor.executemany('INSERT INTO tempeture_his VALUES(?,?,?,?,?,?,?,?,?)', [tuple([metadata['city'],
                               cur_date.strftime('%Y-%m-%d'), metadata['avg']] + metadata.get('max')
                               + metadata.get('min'))])
            print 'success'
        except Exception, e:
            print e
            print 'error'
    days += 1
    if days >= days_limit:
        break
    pass

# 输出数据库中的温度数据

for row in conn.execute('SELECT * FROM tempeture_his'):
    print row
conn.close()
