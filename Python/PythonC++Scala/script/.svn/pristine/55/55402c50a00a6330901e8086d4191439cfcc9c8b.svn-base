#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import os
import sys
import ibbdlib
import ibbdlib.ibbdmail

log_path = '/data/log/dispatch_%s.log' % sys.argv[1]

if sys.argv[1] in ['source', 'target']:
    server = ibbdlib.ibbdmail.IBBDmail()
    send_to = 'lannikcooper@gmail.com'
    if os.path.exists(log_path):
        server.set_content(open(log_path).read(), 'GB2312')
    else:
        server.set_content('log file %s not find' % log_path, 'utf-8')
    server.send(send_to, 'ibbd dw dispatch %s log' % sys.argv[1])
elif sys.argv[1] == 'notify':
    server = ibbdlib.ibbdmail.IBBDmail()
    send_to = 'gsavl@ibbd.net'
    if sys.argv[2] == 'source':
        server.set_content('数据雷达后台计算完成，开始迁移数据并导入显示', 'utf-8')
        server.send(send_to, 'ibbd dispatch source notify')
    elif sys.argv[2] == 'target':
        server.set_content('数据雷达计算数据导入完成，报表已更新', 'utf-8')
        server.send(send_to, 'ibbd dispatch target notify')
    del server
