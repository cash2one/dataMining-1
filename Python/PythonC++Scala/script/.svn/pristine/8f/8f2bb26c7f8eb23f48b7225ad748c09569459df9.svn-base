#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time
from Queue import Queue
from threading import Thread

def worker(q):
    while 1:
        item = q.get()
        print item
        time.sleep(item)
        q.task_done()

def run():
    q = Queue()
    for i in range(3):
        t = Thread(target=worker, args=(q, ))
        t.daemon = True
        t.start()

    for t in range(10):
        q.put(t)

    q.join()
run()
print 'done'