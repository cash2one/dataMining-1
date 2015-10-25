#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
@auth   Cooper
@date   2012.12.19
@desc   在不同的主机之间增量/全量迁移数据
@TODO   replace print with logging on level DEBUG
"""

import traceback
from datetime import date, timedelta
from dateutil import parser
import ibbdlib
import ibbdlib.ibbdlog

log = ibbdlib.ibbdlog.get_logger(output='console', log_name='ibbdlib.migratetable')


def _yield_table_rows(conn_pool, query_stm, block=10000):
    """递归返回制定SQL查询的结果集

    args:
        conn_pool   连接池
        query_stm   SQL查询语句
        block       每次返回的行数,默认1W
    """

    db_conn = conn_pool.get_connection()
    cursor = db_conn._db.cursor()
    cursor.execute(query_stm)
    try:
        while 1:
            rows = cursor.fetchmany(block)
            if len(rows) > 0:
                yield rows
            else:
                break
    except:
        log.error(traceback.format_exc())
    finally:
        cursor.close()
        conn_pool.release(db_conn)


def _get_table_ddl(conn_pool, full_table):
    """获取表的DDL语句,需要传入连接
    """

    db_conn = conn_pool.get_connection()
    try:
        result = db_conn.iter('SHOW CREATE TABLE %s' % full_table)
        ddl_sql = result.next()['Create Table'].encode('utf-8')
        result.close()
        db_name = full_table[:full_table.index('.')]
        table_name = full_table[full_table.index('.') + 1:]
        ddl_sql = ddl_sql.replace('CREATE TABLE `%s`' % table_name, 'CREATE TABLE %s.`%s`' % (db_name, table_name))
        return ddl_sql
    except:
        log.error(traceback.format_exc())
    finally:
        conn_pool.release(db_conn)


def _check_table_existence(conn_pool, db_name, table_name):
    """检查数据库中是否存在某张表
    """

    db_conn = conn_pool.get_connection()
    existence = False
    try:
        for row in db_conn.iter('SHOW TABLES IN %s' % db_name):
            if row[row.keys()[0]] == table_name:
                existence = True
                break
    except:
        log.error(traceback.format_exc())
    finally:
        conn_pool.release(db_conn)
    return existence


def _check_column_existence(conn_pool, table_name, col_name):
    """检查表中是否存在某列
    """

    db_conn = conn_pool.get_connection()
    existence = False
    try:
        for row in db_conn.iter('SHOW COLUMNS IN %s' % table_name):
            if row.Field == col_name:
                existence = True
    except:
        log.error(traceback.format_exc())
    finally:
        conn_pool.release(db_conn)
    return existence


def _describe_table(conn_pool, full_table):
    """获取表的列信息
    """

    db_conn = conn_pool.get_connection()
    rows = []
    try:
        for row in db_conn.iter('DESCRIBE %s' % full_table):
            rows.append(row)
    except:
        log.error(traceback.format_exc())
    finally:
        conn_pool.release(db_conn)
        return rows


def _get_table_tsmp_range(conn_pool, full_table, tsmp_col_name):
    """获取表的数据更新时间戳范围
    """

    db_conn = conn_pool.get_connection()
    (max_tsmp, min_tsmp) = (None, None)
    try:
        for row in db_conn.query('SELECT MAX(%s) AS max_tsmp, MIN(%s) AS min_tsmp FROM %s' % (tsmp_col_name,
                                 tsmp_col_name, full_table)):
            (max_tsmp, min_tsmp) = (row.max_tsmp, row.min_tsmp)
    except:
        log.error(traceback.format_exc())
    finally:
        conn_pool.release(db_conn)
        return (min_tsmp, max_tsmp)


def _execute_sql_stm(conn_pool, query, *parameters):
    """执行SQL语句并commit"""

    db_conn = conn_pool.get_connection()
    try:
        return db_conn.execute(query, *parameters)
    except:
        log.error(traceback.format_exc())
    finally:
        conn_pool.release(db_conn)


def _execute_sql_stms(conn_pool, query, parameters):
    """制定多条INSERT语句"""

    db_conn = conn_pool.get_connection()
    try:
        return db_conn.executemany(query, parameters)
    except:
        log.error(traceback.format_exc())
    finally:
        conn_pool.release(db_conn)


def migrate_table(
    source_config,
    dest_config,
    full_table,
    incre_field=None,
    incre_from=None,
    incre_to=None,
    block=2000,
    mode='REPLACE'
):
    """迁移表

    args:
        source_config   源主机配置 {'host': '', 'user': 'root', 'passwd': ''}
        dest_config     目标主机配置
        full_table      迁移表的全名like (mysql.user)
        incre_field     增量更新字段like (population_tsmp)
        incre_to        更新截止时间like (2012-12-12)
        mode            UPDATE MODE: REPLACE/INSERT IGNORE/INSERT

    流程描述:
        1.检查目标主机是否存在此表,如果不存在复制源表结构到目标主机
        2.判断是否增量迁移(如果传入incre_field则为增量迁移)
        3.如果是全量迁移,二话不说直接SELECT出来
        4.如果是增量迁移,先计算增量迁移的时间起点,终点默认为当天凌晨零点
            (1).如果目标主机表中没有数据时间戳记录,则增量起点为源主机表中的数据时间戳起点
            (2).如果目标主机表中存在最近更新时间戳,则将其+1作为迁移时间戳起点(不检查数据完整性)
        5.擦屁股 T_T
    """

    log.info('migrate table %s' % full_table)
    log.info('source %s  destination %s' % (source_config['host'], dest_config['host']))
    conn_pool_source = ibbdlib.get_db_pool(**source_config)
    conn_pool_dest = ibbdlib.get_db_pool(**dest_config)

    # 检查目标数据库是否存在表，如果不存在则创建之

    db_name = full_table[:full_table.index('.')]
    tb_name = full_table[full_table.index('.') + 1:]
    if not _check_table_existence(conn_pool_source, db_name, tb_name):
        log.error('source table not exists')
        conn_pool_source.disconnect()
        conn_pool_dest.disconnect()
        return
    if not _check_table_existence(conn_pool_dest, db_name, tb_name) or \
        len(_describe_table(conn_pool_source,
                            full_table)) != len(_describe_table(conn_pool_dest,
                                                                full_table)):
        log.warn('dest table not exists')
        _execute_sql_stm(conn_pool_dest, 'DROP TABLE IF EXISTS %s' % full_table)
        table_ddl = _get_table_ddl(conn_pool_source, full_table)
        log.info('create dest table')
        _execute_sql_stm(conn_pool_dest, table_ddl)

    # migrate data 开始迁移数据

    table_info = _describe_table(conn_pool_source, full_table)
    if not incre_field:

        # 没有传入增量字段,全量迁移表

        log.info('migrate full table rows')
        query_stm = 'SELECT * FROM %s' % full_table
        insert_query = '%s INTO %s values(%s)' % (
            mode,
            full_table,
            ','.join(['%s'] * len(table_info)))
        block_cursor = 0
        log.info('block %d', block)
        rows_count = 0
        for rows in _yield_table_rows(conn_pool_source, query_stm, block=block):
            rows_count += len(rows)
            block_cursor += 1
            log.info('block cursor %d', block_cursor)
            _execute_sql_stms(conn_pool_dest, insert_query, rows)
        log.info('migrate complete within %d rows', rows_count)
    else:

        # 增量迁移
        # 更新截止日期默认为当天凌晨

        if not incre_to:
            incre_to = date.today()
        else:
            incre_to = parser.parse(incre_to).date()

        if not incre_from:

            # 目标主机的数据更新时间戳范围
            dest_tsmp_range = _get_table_tsmp_range(conn_pool_dest, full_table, 'population_tsmp')

            # 如果时间戳为空则全量迁移
            if not dest_tsmp_range[1]:

                # 数据源表的开始时间戳
                source_tsmp_range = _get_table_tsmp_range(conn_pool_source, full_table, 'population_tsmp')
                if not source_tsmp_range[0]:
                    return
                migrate_date = source_tsmp_range[0].date()
            else:
                migrate_date = dest_tsmp_range[1].date() + timedelta(1)
        else:
            migrate_date = incre_from

        # 从migrate_date开始迁移
        log.info('migrate from %s' % migrate_date)
        while 1:
            if not migrate_date:
                migrate_date = source_tsmp_range[0].date()
            if migrate_date == incre_to:
                break
            log.info('migrate from %s' % migrate_date)
            query_stm = "SELECT * FROM %s WHERE %s BETWEEN '%s' AND '%s'" % (
                full_table,
                incre_field,
                migrate_date,
                migrate_date + timedelta(1))
            insert_query = '%s INTO %s values(%s)' % (
                mode,
                full_table,
                ','.join(['%s'] * len(table_info)))
            block_cursor = 0
            rows_count = 0
            log.info('block %d', block)
            for rows in _yield_table_rows(conn_pool_source, query_stm, block=block):
                block_cursor += 1
                log.info('block cursor %d', block_cursor)
                rows_count += len(rows)
                _execute_sql_stms(conn_pool_dest, insert_query, rows)
            log.info('migrate complete within %d rows' % rows_count)

            # increse migrate_date
            migrate_date = migrate_date + timedelta(1)

    # clear

    conn_pool_source.disconnect()
    conn_pool_dest.disconnect()


def migrate_table_by_date(
    source_config,
    dest_config,
    full_table,
    tsmp_field=None,
    tsmp=None,
    block=2000,
    mode='REPLACE'
):

    conn_pool_source = ibbdlib.get_db_pool(**source_config)
    conn_pool_dest = ibbdlib.get_db_pool(**dest_config)
    db_name = full_table[:full_table.index('.')]
    tb_name = full_table[full_table.index('.') + 1:]
    table_info = _describe_table(conn_pool_source, full_table)

    sql_query = "SELECT * FROM %s WHERE %s BETWEEN '%s 00:00:00' AND '%s 23:59:59'" % (
        full_table,
        tsmp_field,
        tsmp,
        tsmp)
    insert_query = '%s INTO %s values(%s)' % (
        mode,
        full_table,
        ','.join(['%s'] * len(table_info)))
    log.info('block %d', block)
    block_cursor = 0
    rows_count = 0
    for rows in _yield_table_rows(conn_pool_source, sql_query, block=block):
        block_cursor += 1
        log.info('block cursor %d', block_cursor)
        rows_count += len(rows)
        _execute_sql_stms(conn_pool_dest, insert_query, rows)
    log.info('migrate rows %d', rows_count)
    conn_pool_source.disconnect()
    conn_pool_dest.disconnect()


def migrate_table_by_tsmp(
    source_config,
    dest_config,
    full_table,
    tsmp_field,
    from_tsmp,
    to_tsmp,
    block=2000,
    mode='REPLACE'
):

    log.info('migrate %s by tsmp from %s to %s',
             full_table,
             source_config['host'],
             dest_config['host'])
    conn_pool_source = ibbdlib.get_db_pool(**source_config)
    conn_pool_dest = ibbdlib.get_db_pool(**dest_config)
    db_name = full_table[:full_table.index('.')]
    tb_name = full_table[full_table.index('.') + 1:]
    table_info = _describe_table(conn_pool_source, full_table)

    sql_query = "SELECT * FROM %s WHERE %s BETWEEN '%s' AND '%s'" % (full_table, tsmp_field, from_tsmp, to_tsmp)
    insert_query = '%s INTO %s values(%s)' % (
        mode,
        full_table,
        ','.join(['%s'] * len(table_info)))
    log.info('block %d', block)
    block_cursor = 0
    rows_count = 0
    for rows in _yield_table_rows(conn_pool_source, sql_query, block=block):
        block_cursor += 1
        log.info('block cursor %d', block_cursor)
        rows_count += len(rows)
        _execute_sql_stms(conn_pool_dest, insert_query, rows)
    log.info('migrate rows %d', rows_count)
    conn_pool_source.disconnect()
    conn_pool_dest.disconnect()


def migrate_table_by_query(
    source_config,
    dest_config,
    source_full_table,
    query,
    block=3000,
    dest_full_table=None,
    mode='REPLACE'
):
    conn_pool_source = ibbdlib.get_db_pool(**source_config)
    conn_pool_dest = ibbdlib.get_db_pool(**dest_config)
    db_name = source_full_table[:source_full_table.index('.')]
    tb_name = source_full_table[source_full_table.index('.') + 1:]
    table_info = _describe_table(conn_pool_source, source_full_table)
    insert_query = '%s INTO %s values(%s)' % (
        mode,
        dest_full_table or source_full_table,
        ','.join(['%s'] * len(table_info)))
    log.info('block %d', block)
    block_cursor = 0
    rows_count = 0
    for rows in _yield_table_rows(conn_pool_source, query, block=block):
        block_cursor += 1
        log.info('block cursor %d', block_cursor)
        rows_count += len(rows)
        _execute_sql_stms(conn_pool_dest, insert_query, rows)
    log.info('migrate rows %d', rows_count)
    conn_pool_source.disconnect()
    conn_pool_dest.disconnect()
