#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import re
import os
from path import path
import hashlib

import ibbdlib

log_path_dir = 'D:/tbi/ibbd/log'
log_path_dir = '/var/www/htdocs/ibbd/log'

def rec_log_files(file_filter):
    log_path = path(log_path_dir)
    files = []
    regx = re.compile(file_filter)
    for t in log_path.walkfiles():
        if regx.search(t):
            files.append(t)
    return files

def save_log_file(log):
    db_conn = ibbdlib.get_db_conn()
    with open(log) as f:
        # db_conn.executemany("INSERT IGNORE INTO ibbdlog.ibbd_log values(%s)"%(','.join(['%s']*8)), map(lambda row: row.replace('\n','').split('\t') + [hashlib.md5(row.split('\t')[0]+row.split('\t')[6]).hexdigest()] if len(row.split('\t')) >= 7, open(log).readlines()))
        db_conn.executemany("INSERT IGNORE INTO ibbdlog.ibbd_log values(%s)"%(','.join(['%s']*8)), [row.replace('\n','').split('\t') + [hashlib.md5(row.split('\t')[0]+row.split('\t')[6]).hexdigest()] for row in open(log).readlines() if len(row.split('\t')) >= 7])
    db_conn.close()

def main():
    for log in rec_log_files(r'ibbd.log.+'):
        print 'saving', log
        save_log_file(log)

if __name__ == '__main__':
    main()