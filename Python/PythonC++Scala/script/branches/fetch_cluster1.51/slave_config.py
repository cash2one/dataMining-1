#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth    Cooper
date    2012.12.4
desc    slave配置, default, identified by IP, rquired by slave.py
"""

__all__ = ['slave_config', 'debug']

debug = True

static_ip_server_ips = ['223.4.146.232', '223.4.155.152', '223.4.155.172', '42.121.0.186', '42.121.54.49', '223.4.246.146', '42.121.99.101', '42.121.109.196', '42.121.109.199', '116.254.253.83', '223.4.216.246', '42.121.115.132', '42.120.21.35', '42.121.192.159', '42.121.192.16']

slave_config = dict((ip, {'mysql': {}, 'redis': {}, 'reqinterval': None, 'slave_info_log': []}) for ip in static_ip_server_ips)
slave_config.update({'default': {'mysql': {
    'host': '116.254.253.83',
    'port': 3306,
    'user': 'ibbd',
    'passwd': 'spider',
    'charset': 'utf8',
    'db': 'topspider'
    }, 'redis': {'host': '223.4.155.152', 'port': 6379}, 'reqinterval': 0.4, 'slave_info_log': ['console']}})
for ip in static_ip_server_ips:
    slave_config[ip].update(slave_config['default'])
    slave_config[ip].update({'slave_info_log': ['file']})

db_server = {'223.4.155.152': {
    'host': '223.4.155.152',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }, '223.4.155.172': {
    'host': '223.4.155.172',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }, '223.4.146.232': {
    'host': '223.4.146.232',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }}
db_server_master = {
    'host': '223.4.155.152',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
    }
