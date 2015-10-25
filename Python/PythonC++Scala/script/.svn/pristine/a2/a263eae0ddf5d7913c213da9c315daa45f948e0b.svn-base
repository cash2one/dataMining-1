#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time
import threading
import traceback

import redis
# import redis._compat
# from redis._compat import next
# import redis

connection_pool = redis.ConnectionPool(host='localhost')
client = redis.Redis(connection_pool=connection_pool)
pubsub = client.pubsub()


def r_pub():
    for i in range(5):
        time.sleep(1)
        client.publish('foo', 'hello foo %d' % i)


def r_lis():
    listener = pubsub.listen()
    while 1:
        try:
            msg = listener.next()
            if msg['type'] == 'message':
                print msg['data']
        except StopIteration:
            break
        except:
            traceback.print_exc()

pubsub.subscribe('foo')
t1 = threading.Thread(target=r_pub)
t2 = threading.Thread(target=r_lis)
t1.start()
t2.start()
t1.join()
t2.join()
print 'end'
pubsub.close()
