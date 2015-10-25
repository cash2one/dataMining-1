#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth    Cooper
date    2012.12.9
desc    封装一些redis api
"""

import redis
import redis.connection
try:
    from dfhspider.config import redis_config
except:
    redis_config = {'host': 'localhost'}


def get_redis_conn(host=redis_config.get('host'), **kwargs):
    """快速获取redis连接

    默认从dfhspider.config获取连接参数
    """

    return redis.StrictRedis(host=host, **kwargs)


def redis_pipe(re_conn, commands):
    """执行多条redis命令，返回结果

    example:
        result = redis_pipe(re_conn, [['set', 'foo', 'bar'], ['get', 'foo']])
        print result

        output: [True, 'bar']
    """

    pipe = re_conn.pipeline()
    for command in commands:
        pipe.execute_command(*command)
    return pipe.execute()
