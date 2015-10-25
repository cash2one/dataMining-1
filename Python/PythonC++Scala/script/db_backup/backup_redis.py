#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

from dfhspider.lib import getRedisConn, spiderLog2


def main():
    spiderLog2('Redis', 'GBSAVE', 'Start')
    redis = getRedisConn()
    redis.bgsave()
    spiderLog2('Redis', 'BGSAVE', 'Success')


if __name__ == '__main__':
    main()
