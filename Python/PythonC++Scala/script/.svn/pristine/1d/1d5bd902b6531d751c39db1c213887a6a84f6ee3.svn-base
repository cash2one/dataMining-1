#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import sys

import ibbdlib
import ibbdlib.tornadolib

from dateutil.parser import parse

import bak_config

date_tsmp = parse('2012-12-28')
if len(sys.argv) >= 2:
    date_tsmp = parse(sys.argv[1])
date_tsmp_str = date_tsmp.strftime('%Y%m%d')
date_tsmp_my_str = date_tsmp.strftime('%Y%m')

open('mysql_backup_%s.sh' % date_tsmp_str, 'w').write(ibbdlib.tornadolib.render_string(
    open(bak_config.template_path).read(),
    user=bak_config.db_server['223.4.155.152']['user'],
    passwd=bak_config.db_server['223.4.155.152']['passwd'],
    bak_tables=bak_config.bak_tables,
    tb_bak_type=bak_config.tb_bak_type,
    bak_prefix=bak_config.bak_path_prefix,
    date_tsmp_my_str=date_tsmp_str,
    date_tsmp_str=date_tsmp_str,
    tsmp_from=date_tsmp.strftime('%Y-%m-%d 00:00:00'),
    tsmp_to=date_tsmp.strftime('%Y-%m-%d 23:59:59'),
    ))
