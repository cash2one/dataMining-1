#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import time
import redis
from redis.connection import ConnectionPool
from redis.client import PubSub
import threading


def getPool():
    return ConnectionPool(host='223.4.155.152')


pool = getPool()


def changeFoo():
    conn = pool.get_connection(None)
    conn.set('foo', 'bar')
    time.sleep(5)
    conn.send_command('foo', 'change')
    pool.release(conn)


def main():
    pubsub = PubSub(pool)
    pubsub.subscribe(['foo'])
    threading.Thread(target=changeFoo).start()
    for t in pubsub.listen():
        print t


if __name__ == '__main__':
    main()
