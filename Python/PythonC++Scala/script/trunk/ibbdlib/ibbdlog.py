#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import os
import logging
import logging.handlers


def get_logger(
    log_path='',
    log_file='local',
    output=['console', 'file'],
    log_name='local.local',
    msg_format='%(asctime)s %(name)s %(levelname)s %(message)s',
    time_format='%Y-%m-%d %H:%M:%S',
    time_routate={'when': 'D', 'interval': 1},
    log_level=logging.INFO
):
    """获取python日志对象

    默认输出到命令行+文件
    example:
        log = get_logger(log_file='test.log')
        log.info('hello world %s', 'Lee')
    """

    if log_name == 'local.local':
        log_name = log_file
    log = logging.getLogger(log_name)
    log.setLevel(log_level)
    formatter = logging.Formatter(msg_format, time_format)
    if log.handlers:
        return log

    def _remove_handlers(handler):
        for i in range(len(log.handlers)):
            if isinstance(log.handlers[i], handler):
                log.handlers.pop(i)
                break
    if 'file' in output:
        _remove_handlers(logging.handlers.TimedRotatingFileHandler)
        filehandler = \
            logging.handlers.TimedRotatingFileHandler(filename=os.path.join(log_path,
                                                                            log_file), when=time_routate['when'],
                                                      interval=time_routate['interval'])
        filehandler.setFormatter(formatter)
        log.addHandler(filehandler)
    if 'console' in output:
        _remove_handlers(logging.StreamHandler)
        streamhandler = logging.StreamHandler()
        streamhandler.setFormatter(formatter)
        log.addHandler(streamhandler)
    return log
