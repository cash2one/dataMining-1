#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auth: Cooper
date: 2012.9.28
备份数据库
'''

import os
import re
from dfhspider.lib import getDBConn

DBS = ['topspider', 'ibbd2', 'topdata', 'topapi', 'hostinfo']


def getTableDDL(dbName):
    j = {}
    db = getDBConn(dbName)
    db.query("SELECT TABLE_NAME, TABLE_TYPE FROM information_schema.TABLES WHERE TABLE_SCHEMA='%s'" % dbName)
    r = db.store_result()
    tables = [r.fetch_row()[0] for i in range(r.num_rows())]
    tables = [table[0] for table in tables if table[1] == 'BASE TABLE']
    for table in tables:
        cmdStr = 'SHOW CREATE TABLE %s.%s' % (dbName, table)
        db.query(cmdStr)
        r = db.store_result()
        rs = r.fetch_row()[0]
        j[rs[0]] = rs[1].encode('utf-8')
    db.close()
    return j


def getDbRoutine(dbName):
    j = {}
    db = getDBConn(dbName)
    db.query("SELECT ROUTINE_NAME FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='%s'" % dbName)
    r = db.store_result()
    procs = [r.fetch_row()[0][0] for i in range(r.num_rows())]
    for proc in procs:
        cmdStr = 'SHOW CREATE PROCEDURE %s.%s' % (dbName, proc)
        db.query(cmdStr)
        r = db.store_result()
        rs = r.fetch_row()[0]
        j[rs[0]] = rs[2].encode('utf-8')
        j[rs[0]] = re.sub(r'\n{2,10}', '\n', j[rs[0]])
        j[rs[0]] = j[rs[0]].replace('DEFINER=`ibbd`@`%` ', '')
    db.close()
    return j


def main():
    j = {}
    j.update(dict((dbName, list(getTableDDL(dbName).viewitems()) + list(getDbRoutine(dbName).viewitems()))
             for dbName in DBS))

    for dbName in j:
        with open(os.path.join(os.getcwd(), 'ddl_%s.sql' % dbName), 'w') as f:
            f.write('USE %s;\n' % dbName)

            # DROP DDL

            for tableOrProc in j[dbName]:
                if tableOrProc[0].startswith('sp_'):
                    f.write('DROP PROCEDURE IF EXISTS `%s`;\n' % tableOrProc[0])
                else:
                    f.write('DROP TABLE IF EXISTS `%s`;\n' % tableOrProc[0])

            # CREATE DDL
            # TABLE

            for table in [t for t in j[dbName] if not t[0].startswith('sp_')]:
                print table[0]
                f.write(table[1] + ''';

''')

            # PROCEDURE

            f.write('''DELIMITER $$
USE `ibbd2`$$
''')
            for proc in [t for t in j[dbName] if t[0].startswith('sp_')]:
                print proc[0]
                f.write(proc[1] + '''$$

''')
            f.write('DELIMITER ;')
    print 'OK'


if __name__ == '__main__':
    main()
