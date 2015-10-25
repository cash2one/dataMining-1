#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time
import threading

def func(i):
    print 'start',i
    time.sleep(i)
    print 'end',i

t1 = threading.Thread(target=func, args=(4,))
t2 = threading.Thread(target=func, args=(2,))

t1.start()
t2.start()
t1.join()
print time.localtime()
t2.join()
print time.localtime()
print 'bye'