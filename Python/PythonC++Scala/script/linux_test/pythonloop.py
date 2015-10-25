#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
"""

import time
import threading


def test_loop():

    # d=dict((i,i**3) for i in xrange(1000000))

    t1 = time.time()
    for i in xrange(10 ** 4):
        t = [i ** 3 for i in range(i)]
        t = sum(t)
    t2 = time.time()
    print '%fS' % (t2 - t1)


def test_multicore_loop(num):
    for i in range(num):
        threading.Thread(target=test_loop).start()


def main():

    # test_loop()
    # for i in [1,2,4,10]:

    for i in [2]:
        print 'thread num %d' % i
        test_multicore_loop(i)


if __name__ == '__main__':
    main()
