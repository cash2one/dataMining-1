#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
@auth   Cooper
@date   2013.01.23
@desc   export data to xls from db
ibbd数据导出包
"""

import datetime

import ibbdlib
import ibbdlib.ibbdlog
import xlwt
import MySQLdb

log = ibbdlib.ibbdlog.get_logger(output='console', log_name='ibbdlib.ibbdexport')


class MySQLXlsExporter(object):

    """导出MySQL中的数据到Excel

    主要针对linux下没有好的导出Excel的工具
    TODO: 50W行数据集性能优化

    >> exporter = ibbdlib.ibbdexport.MySQLXlsExporter('export.xls', {'host'='localhost', 'user': 'root', 'passwd': ''})
    >> exporter.set_query("SELECT * FROM user")
    >> exporter.save()
    """

    def __init__(self, xls_file, mysql_conn_args):
        log.info('start to initialize')
        self._xls_file = xls_file
        log.info('create workbook')
        self.workbook = xlwt.Workbook(encoding='GB2312')
        self.sheets = dict()
        self.default_sheet = None
        self._mysql_conn_args = mysql_conn_args
        self._mysql_conn_args['charset'] = self._mysql_conn_args.get('charset') or 'utf8'
        log.info('connecting to mysql host %s', self._mysql_conn_args.get('host'))
        self._db_conn = MySQLdb.connect(**self._mysql_conn_args)
        self._default_block = 2000
        self._is_query = False
        self._cell_cursor = [1, 0]
        self._column_names = []
        log.info('initialized')

    def connect(**kwargs):
        """如果初始化连接失败则手动连接数据库"""

        self._db_conn = MySQLdb.connect(**kwargs)

    def add_sheet(self, sheet_name='sheet'):
        """增加sheet

        如果已有同名sheet则返回，如果没有则添加
        如果workboot中只有一个sheet则将其设为默认default_sheet
        """

        if self.sheets.get(sheet_name):
            return
        _sheet = self.workbook.add_sheet(sheet_name)
        self.sheets[sheet_name] = _sheet
        if len(self.sheets.keys()) == 1:
            self.default_sheet = self.sheets[self.sheets.keys()[0]]
            log.info('default_sheet %s', sheet_name)

    def set_default_sheet(self, sheet_name):
        """设置当前默认sheet"""

        return self.sheets.get(sheet_name)

    def _get_curosr(self):
        self._cursor = self._db_conn.cursor()

    def set_query(self, query_stm, block=None):
        """通过SQL语句设置导出的数据"""

        self._block = block or self._default_block
        self._get_curosr()
        self._cursor.execute(query_stm)
        self._is_query = True

    def save(self):
        """保存数据源查询结果到EXCEL"""

        if not self.sheets:
            self.add_sheet()
        self._get_col_names()
        self._write_xls_header(self.default_sheet, 0, 0)
        for rows in self._block_rows():
            self._write_rows(self.default_sheet, rows, self._cell_cursor[0], self._cell_cursor[1])
            self._cell_cursor[0] += len(rows)
        log.info('save as file %s', self._xls_file)
        self.workbook.save(self._xls_file)

    def _get_col_names(self):
        """获取数据集的列名"""

        self._column_names = [d[0].decode('utf-8').encode('GB2312', 'ignore') for d in self._cursor.description]

    def _write_xls_header(
        self,
        sheet,
        row_index,
        col_index,
    ):
        """将数据集列名写入sheet指定位置"""

        for (i, col_name) in enumerate(self._column_names):
            sheet.write(row_index, col_index + i, col_name)

    def _block_rows(self):
        """生成查询结果的generator,返回指定的block行数"""

        if not self._is_query:
            raise Exception('no query specified')
            return
        log.info('get query result')
        row_count = 0
        while True:
            log.info('fetching rows')
            rows = self._cursor.fetchmany(self._block)
            row_count += len(rows)
            log.info('rows total %d', row_count)
            if not rows:
                break
            yield rows
        self._cursor.close()

    def _write_rows(
        self,
        sheet,
        rows,
        row_index,
        col_index,
    ):
        """将查询结果写入sheet"""

        log.info('save rows %d', len(rows))
        for (i, row) in enumerate(rows):
            for (j, col) in enumerate(row):
                if isinstance(col, unicode):
                    col_data = col.encode('GB2312', 'ignore')
                elif isinstance(col, datetime.date):
                    col_data = col.strftime('%Y-%m-%d')
                elif isinstance(col, datetime.datetime):
                    col_data = col.strftime('%Y-%m-%d %H:%M:%S')
                else:
                    col_data = col
                self.default_sheet.write(row_index + i, col_index + j, col_data)
