#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
ETL调度脚本
调度对象：etl3.py生成的SQL文件,如etl3_20121212.sql
调度描述
根据sql文件中每个block的依赖关系、同步/异步运行进行调度
SQL示例:
    @block=1 sync=1
    INSERT INTO user values('','');
    INSERT INTO privileges values('','');
    @end
    @block=2 async=1 requires=1
    INSERT INTO user2 SELECT * FROM user;
    @end
SQL规范:
    每个block块可以包括N个SQL语句,每个block有一个唯一序号block=(unique id)
    block的sync/async/requires分别表示同步/异步/依赖
    block内的sql代码可以为call sp_name(date('')),但仅限于传入日期参数
    依赖依据为block的批次
    可以有多个依赖 requires=2,3
    将优先级高的sql放在前面
调度算法：
    提取每个block区块代码,以';'分割,将block的同步/异步/依赖属性保存到dict对象中
    利用Queue排队处理多个block
    处理每个block时,先处检查依赖,如果依赖的block全部处理完才开始运行
    如果block同步,则顺序运行
    如果block异步,则以Queue排队处理
    等待block里面的sql全部运行完后,此block任务完成
run:
    >> python2.7 etl_dispatch.py 20121231
"""

import sys
import re
import time
from datetime import datetime, timedelta
from threading import Thread
from Queue import Queue
import traceback

import ibbdlib
import ibbdlib.ibbdlog

import MySQLdb
from dateutil.parser import parse
from _mysql_exceptions import OperationalError

fetch_date = '2013-07-24'
etl_date_str = '2013-07-25'
if len(sys.argv) >= 2:
    arg_date = parse(sys.argv[1])
    fetch_date = arg_date.strftime('%Y-%m-%d')
    etl_date_str = (arg_date + timedelta(1)).strftime('%Y-%m-%d')
fetch_date_short = fetch_date.replace('-', '')

# sql文件

f_sql_query = 'etl_script/etl3_%s.sql' % fetch_date_short

# 每个block完成标志,-1/0/1分别表示未开始/正在运行/已完成

block_task_done = dict()

# block最大异步数

block_async_num = 4

# 每个async的sql最大异步数

command_async_num = 4

log = ibbdlib.ibbdlog.get_logger(log_file='etl_dispatch.%s.log' % fetch_date_short)


db_server = {
    'host': 'localhost',
    'user': 'ibbd_etl',
    'passwd': 'ibbd_etl_secure',
    'db': 'topspider',
    'charset': 'utf8',
    'sql_mode': 'NO_ENGINE_SUBSTITUTION'
}


def _get_db_pool():
    return ibbdlib.get_db_pool(max_connections=1000, **db_server)


def _get_db_conn():
    return ibbdlib.get_db_conn(**db_server)


def _get_time_str():
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')


def _sync_etl_status(block, command_id):
    _db_conn = _get_db_conn()
    _db_conn.execute(
        "INSERT IGNORE INTO ibbdetl.block_status(date_of, block, command_id, finished) values('%s', %d, %d, 1)" % (
            etl_date_str,
            int(block),
            int(command_id)
        ))
    _db_conn.close()


def _check_etl_status(block, command_id):
    _db_conn = _get_db_conn()
    rows = list(
        _db_conn.iter("SELECT finished FROM ibbdetl.block_status WHERE date_of='%s' AND block=%d AND command_id=%d" % (
            etl_date_str,
            int(block),
            int(command_id))
        )
    )
    _db_conn.close()
    if rows and rows[0].finished == 1:
        return 1
    else:
        return 0


def _get_sql_blcks():
    """从sql文件中提取每个block及其配置"""

    sql_blocks = re.findall(r'@(block.+?)-- @end', open(f_sql_query).read(), re.S)
    for i in range(len(sql_blocks)):
        meta = sql_blocks[i]
        block = dict((t.split('=')[0], t.split('=')[1]) for t in meta[:meta.index('\n')].split(' '))
        block['commands'] = [command.strip().strip('\n') for command in meta[meta.index('\n') + 1:].split(';')
                             if command.strip('-').strip(' ').strip('\n') != '']
        if block.get('requires'):
            block['requires'] = [re.findall(r'\d+', t)[0] for t in block['requires'].split(',')]

        # block异常处理

        block['block'] = re.findall(r'\d+', block['block'])[0]

        # block完成情况初始化

        block_task_done[block['block']] = -1
        sql_blocks[i] = block
    return sql_blocks


def _run_command(db_pool, command, block_id, command_id):
    """运行一条sql

    如果sql是call sp_name,则提取sp名称和参数
    否则常规运行sql
    """

    if command.strip() == '' or not command:
        return
    if _check_etl_status(int(block_id), command_id) == 1:
        log.info('check_etl_status block %d command_id %d finished', int(block_id), command_id)
        return
    db_conn = db_pool.get_connection()
    if command.startswith('call'):
        cursor = db_conn._db.cursor()
        proc_name = re.findall(r'call (.+?)\(', command)[0]
        params = re.findall(r'DATE\(\'(.+?)\'\)', command, re.I)
        log.info('%s block %s start %s %s', _get_time_str(), block_id, proc_name, ','.join(params))
        cursor.callproc(proc_name, tuple(params))
        db_conn._db.commit()
        cursor.close()
        log.info('%s block %s success %s %s', _get_time_str(), block_id, proc_name, ','.join(params))
    else:
        log.info('%s block %s start %s', _get_time_str(), block_id, command.split('\n')[0])
        while 1:
            try:
                db_conn.execute(command)
                log.info('%s block %s success %s', _get_time_str(), block_id, command.split('\n')[0])
                break
            except UnicodeEncodeError:
                log.error('Ignored UnicodeEncodeError run sql query %s', command.split('\n')[0])
                break
            except OperationalError as e:
                if e.args[0] == 2002:
                    log.warn('OperationalError(2002) try connect again...')
                    time.sleep(10)
                    continue
                else:
                    raise
            except:
                log.error('error run sql query %s', command.split('\n')[0])
                log.error('traceback info %s', traceback.format_exc())
                raise
        # else:
        #     log.error('ignore sql query', command.split('\n')[0])
        #     log.error('traceback info %s', traceback.format_exc())
    db_pool.release(db_conn)
    _sync_etl_status(int(block_id), command_id)


def _command_worker(task_list, db_pool):
    """单sql处理队列"""

    while True:
        command, block_id, command_id = task_list.get()
        _run_command(db_pool, command, block_id, command_id)
        task_list.task_done()


def _block_worker():
    """block处理队列"""

    while True:
        block = tasks_queue.get()

        # check requires

        if block.get('requires'):
            while True:

                # if requires blocks complete

                if sum([block_task_done[re.findall(r'\d+', t)[0]] for t in block.get('requires') if t in [b['block'] for b in blocks]]) \
                        == len(block.get('requires')):
                    log.info('%s block %s waiting for requires %s', _get_time_str(), block.get('block'),
                             block.get('requires'))
                    break
                else:
                    time.sleep(10)
        log.info('%s block %s start to run', _get_time_str(), block.get('block'))
        db_pool = _get_db_pool()
        block_task_done[block.get('block')] = 0
        if block.get('commands'):
            if block.get('async'):
                task_list = Queue()
                for i, command in enumerate(block.get('commands')):
                    task_list.put([command, block.get('block'), i + 1])
                for i in range(command_async_num):
                    t = Thread(target=_command_worker, args=(task_list, db_pool))
                    t.daemon = True
                    t.start()
                task_list.join()
            elif block.get('sync'):
                for i, command in enumerate(block.get('commands')):
                    _run_command(db_pool, command, block.get('block'), i + 1)
        block_task_done[block.get('block')] = 1
        tasks_queue.task_done()
        db_pool.disconnect()
        log.info('%s block %s success to run', _get_time_str(), block.get('block'))


blocks = _get_sql_blcks()
tasks_queue = Queue()
for block in blocks:
    tasks_queue.put(block)
for i in range(block_async_num):
    t = Thread(target=_block_worker)
    t.daemon = True
    t.start()
tasks_queue.join()
log.info('finished')
