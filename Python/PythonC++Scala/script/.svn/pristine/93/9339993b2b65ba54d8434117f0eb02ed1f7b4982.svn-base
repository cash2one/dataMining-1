#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import re
import traceback
import ibbdlib
import ibbdlib.redislib

db_server = {
    'host': '223.4.155.152',
    'user': 'ibbd',
    'passwd': 'spider',
    'db': 'ibbd_admin'
}
redis_server = {
    'host': '121.199.16.12',
    'port': 6379,
    'password': 'ibbdooredisserver'
}

db_conn = ibbdlib.get_db_conn(**db_server)
re_conn = ibbdlib.get_redis_conn(**redis_server)
# insure schedule name pop order
schedules = re_conn.keys('Schedule_*')
schedules.reverse()
while 1:
    try:
        schedule_name = schedules.pop()
        fixed_schedule_name = re.sub(r'(?P<end>Error)$', r'', schedule_name)
        fixed_schedule_name = re.sub(r'(?P<end>_process)$', r'', fixed_schedule_name)
        fixed_schedule_name = re.sub(r'(?P<end>_error)$', r'', fixed_schedule_name)
        # schedule group name
        schedule_group = re.sub(r'(?P<id>\_\d+)$', r'', fixed_schedule_name)
        process_name = fixed_schedule_name + '_process'
        if re_conn.type(fixed_schedule_name) != 'set':
            continue
        pipe_out = ibbdlib.redislib.redis_pipe(
            re_conn,
            [
                ['hlen', fixed_schedule_name + 'Error'],
                ['hlen', process_name],
                ['hlen', fixed_schedule_name + '_error'],
                ['scard', fixed_schedule_name]
            ]
        )
        error_name = '' if pipe_out[0] + pipe_out[2] == 0 else \
            (fixed_schedule_name +
                ('Error'
                 if pipe_out[0] > 0 else '_error')
             )
        schedules = filter(
            lambda x: x not in (
                fixed_schedule_name,
                process_name,
                error_name),
            schedules)
        query = "INSERT INTO ibbd_admin.schedule_monitor values(%s, %s, %s, %s, %s, %s, %s, NOW())"
        db_conn.execute(query,
                        schedule_group,
                        fixed_schedule_name,
                        pipe_out[3],
                        process_name,
                        pipe_out[1],
                        error_name,
                        max(pipe_out[0], pipe_out[2])
                        )
    except IndexError:
        break
    except:
        traceback.print_exc()
db_conn.close()
del re_conn
