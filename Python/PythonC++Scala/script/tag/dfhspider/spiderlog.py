#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import os
import time
import threading
import uuid
from random import randint

_lock = threading.Lock()
_slaveid = uuid.getnode()

# create spider log direction if not exists

_logdir = os.path.join(os.getcwd(), 'spiderlog')
if not os.path.exists(_logdir):
    os.mkdir(_logdir)


def _writelog(logLevel, *arg, **kwargs):
    _lock.acquire()
    logname = os.path.join(_logdir, '%s.txt' % time.strftime('%Y%m%d',
                           time.localtime()))
    with open(logname, 'a') as f:
        logpair = [logLevel, time.strftime('%Y-%m-%d %H:%M:%S',
                   time.localtime()), _slaveid] + list(arg) + ['%s:%s' % (k,
                str(v)) for (k, v) in kwargs.items()]
        f.write(''.join(['[%s]' % str(t) for t in logpair]) + '\n')
    _lock.release()


def debug(*arg, **kwargs):
    _writelog(*arg)


def info():
    pass


def warning():
    pass


def error():
    pass


def exception():
    pass


def critical():
    pass


def log():
    pass

