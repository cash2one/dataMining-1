#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth    Cooper
date    2012.12.4
desc    slave配置, default, identified by IP, rquired by slave.py
"""

__all__ = ['slave_config', 'debug']

debug = True

static_ip_server_ips = []

slave_config = dict((ip, {'mysql': {}, 'redis': {}, 'reqinterval':
                    None, 'slave_info_log': []}) for ip in static_ip_server_ips)
slave_config.update(
    {
        'default':
        {
            'mysql': {
                'host': '121.199.16.12',
                'port': 3306,
                'user': 'ibbd',
                'passwd': 'spider',
                'charset': 'utf8',
                'db': 'topspider'
            },
            'redis': {
                'host': '121.199.16.12',
                'port': 6379,
                'password': 'ibbdooredisserver'
            },
            'reqinterval': 0.4,
            'slave_info_log': ['console']
        }
    }
)
for ip in static_ip_server_ips:
    slave_config[ip].update(slave_config['default'])
    slave_config[ip].update({'slave_info_log': ['file']})

db_server = {
    '223.4.155.152': {
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
    }
}
db_server_master = {
    'host': '223.4.155.152',
    'user': 'ibbd',
    'passwd': 'spider',
    'port': 3306,
}

eth0_mapping = {
    '121.199.16.12': '10.132.11.5',
    '223.4.155.152': '10.200.27.183'
}
