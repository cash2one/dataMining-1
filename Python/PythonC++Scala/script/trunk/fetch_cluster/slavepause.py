#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import json
import uuid
import time
import sys
from string import atoi

from dfhspider.lib import getRedisConn2


def main():
    interval = (atoi(sys.argv[1]) if len(sys.argv) > 1 else 60)
    slaveId = uuid.getnode()
    server = getRedisConn2()
    server.set('SlaveSleep%s' % slaveId, interval)
    server.expire('SlaveSleep%s' % slaveId, 60)
    del server
    print 'paused'
    raw_input('')


if __name__ == '__main__':
    main()
