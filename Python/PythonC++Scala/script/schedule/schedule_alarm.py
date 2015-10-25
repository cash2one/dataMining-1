import time
import traceback
import re

import ibbdlib
import ibbdlib.ibbdmail


redis_server = {
    'host': '121.199.16.12',
    'port': 6379,
    'password': 'ibbdooredisserver'
}


def send_mail(title, content):
    mail = ibbdlib.ibbdmail.IBBDmail()
    mail.set_content(content)
    mail.send('gsavl@ibbd.net', title)


def get_redis_sets_len(re_conn, keys):
    return sum(map(lambda x: re_conn.scard(x), keys))


def get_redis_blocked_keys(re_conn):
    blocked_keys = ','.join(
        map(
            lambda x: ','.join(re_conn.keys(x)),
            [
                'Schedule_shopmonitor_*_process',
                'Schedule_shopmonitor_*_error',
                'Schedule_itemprice_*_process',
                'Schedule_itemprice_*_error'
            ]
        )
    ).strip(',')
    return set(blocked_keys.split(',') if blocked_keys != '' else [])


def remove_redis_blocked_keys(re_conn, blocked_keys):
    for key in blocked_keys:
        re_conn.delete(key)

try:
    re_conn = ibbdlib.get_redis_conn(**redis_server)
    keys = [
        'Schedule_itemFullInfo',
        'Schedule_itemTrade2',
        'Schedule_shopFullInfo'
    ]

    extend_keys = []
    for key_pre in ['Schedule_shopmonitor_', 'Schedule_itemprice_']:
        extend_keys.extend(
            [key for key in re_conn.keys('%s*' % key_pre)
             if re.match(r'^%s\d+$' % key_pre, key)]
        )
    total1 = get_redis_sets_len(re_conn, keys + extend_keys)
    blocked_keys = get_redis_blocked_keys(re_conn)
    time.sleep(60 * 2)

    extend_keys = []
    for key_pre in ['Schedule_shopmonitor_', 'Schedule_itemprice_']:
        extend_keys.extend(
            [key for key in re_conn.keys('%s*' % key_pre)
             if re.match(r'^%s\d+$' % key_pre, key)]
        )
    total2 = get_redis_sets_len(re_conn, keys + extend_keys)
    blocked_keys2 = get_redis_blocked_keys(re_conn)
    if len(blocked_keys.intersection(blocked_keys2)) > 0:
        remove_redis_blocked_keys(re_conn, blocked_keys2)
    if total1 == total2 > 0:
        send_mail(
            'IBBD System Warning',
            'Schedule seems blocked, it stay unchanged in 5 minutes, please check redis'
        )
    del re_conn
except:
    traceback.print_exc()
    send_mail(
        'IBBD System Warning',
        'IBBD schedule schedule_alarm error: %s\n, \
        please check redis server'
        % traceback.format_exc()
    )
