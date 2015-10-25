#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
@auth: Cooper
@create: 2012.11.22
@desc: test logging
"""

import time

import logging
import logging.handlers
filehandler = logging.handlers.TimedRotatingFileHandler(filename='test.log',
        when='M', interval=1)
formatter = logging.Formatter('%(asctime)s %(name)s %(levelname)s %(message)s',
                              '%Y-%m-%d %H:%M:%S')
filehandler.setFormatter(formatter)
log = logging.getLogger('spider.Zhitongche')
log.addHandler(filehandler)
log.setLevel(logging.INFO)


def main():
    for i in range(3):
        log.info('test')
        time.sleep(60)


if __name__ == '__main__':
    main()
