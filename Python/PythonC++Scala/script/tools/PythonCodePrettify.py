#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
auth    Cooper
date    2012.11.28
desc    py code formater python代码格式化工具
"""

import os
import sys
from PythonTidy import tidy_up
from path import path


def getFiles(dirpath, recursive=False):
    """遍历目录中的文件"""

    for tmppath in \
        (path(dirpath).walkfiles() if recursive else path(dirpath).files()):
        yield tmppath


def prettifyFile(source, bak=True):
    """格式化py代码文件"""

    if not os.path.exists(source):
        return
    print source
    if os.path.exists(source + '.bak'):
        os.remove(source + '.bak')
    if bak:
        tidy_up(source, source + '.pre')
        os.rename(source, source + '.bak')
        os.rename(source + '.pre', source)
    else:
        tidy_up(source, source)


def prettifyDir(dirpath, bak=True, recursive=False):
    """格式化指定目录下的所有py代码文件"""

    if not os.path.exists(dirpath):
        return
    for filePath in getFiles(dirpath, recursive):
        if filePath.name.startswith('.') or not filePath.name.endswith('.py'):
            continue
        prettifyFile(filePath, bak)


def clearBakFile(dirpath, recursive=False):
    """清除指定目录下的格式化备份bak文件"""

    if not os.path.exists(dirpath):
        return
    for filePath in getFiles(dirpath, recursive):
        if filePath.name.endswith('.py.bak'):
            print filePath
            os.remove(filePath)


def resotreBakFile(dirpath, recursive=False):
    """恢复指定目录下的格式化备份文件到py文件"""

    if not os.path.exists(dirpath):
        return
    for filePath in getFiles(dirpath, recursive):
        if filePath.endswith('.py.bak'):
            os.remove(filePath[:-4])
            os.rename(filePath, filePath[:-4])


def main():
    """
    """

    # prettifyDir('../../tbi/ibbd', bak=False, recursive=True)

    # clearBakFile('../db_backup', recursive=True)

    # resotreBakFile('../test')

    prettifyFile('../../tbi/ibbd/ibbdajaxhandler.py', False)

    # prettifyFile('../dw/etl_apriori.py', False)

if __name__ == '__main__':
    main()
