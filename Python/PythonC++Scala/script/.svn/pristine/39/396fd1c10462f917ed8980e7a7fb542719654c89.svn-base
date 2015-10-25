#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

md_template="""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="help/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="help/bootstrap/css/bootstrap-responsive.min.css">
</head>
<body>
    <div class="container">
        $BODY$
    <script type="text/javascript" src="help/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="help/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>"""

md_doc = """
# ibbd python script <small>2012.12.3</small>
# IBBD python 脚本库

## 目录介绍

1. /config_backup       配置备份目录
1. /db_backup           数据库备份脚本
1. /dw                  数据仓库、调度相关脚本
1. /dw/etl.sql          ETL调度脚本
1. /dw/export.sql       类目数据导出脚本
1. /cache               网站数据缓存脚本
1. /dfhspider           数据抓取包
1. /ibbdlib             python package IBBD公共python库
1. /fetch_cluster       任务系统
1. /fetch_cluster/master.py     任务分配脚本
1. /fetch_cluster/slave.py      任务处理脚本
1. /fetch_cluster/schedule_rollback.py  任务回滚
1. /fetch_cluster/slave_error_handler.py    任务的错误处理
1. /fetch_fluster/slavepause.py     停止本机任务(废弃)
1. /schedule            IBBD常驻任务(可用slave代替)
1. /docs                项目文档
1. /team_liangj         队员临时文件夹
1. /linux_test          Linux测试脚本
1. /log                 日志文件夹
1. /project_backup      项目备份文件、模板文件
1. /test                测试
1. /tools               工具箱(python代码格式化)
1. /WeiboAPI            新浪微博API SDK APP
1. /help                项目HTML文档模板

## 依赖类库
* MySQLdb1.2.3
* redis
* requests
* dateutil
* path.py
* requests
* tornado
* BeautifulSoup
* markdown

## 项目相关框架

1. [tornado官方文档](http://www.tornadoweb.org/documentation/index.html)
1. [tornado翻译版本](http://sebug.net/paper/books/tornado/)
2. [bootstrap](http://twitter.github.com/bootstrap/)
3. [redis](http://redis.io)
4. [sqlalchemy](http://docs.sqlalchemy.org/en/rel_0_7)
5. [python正则](http://www.cnblogs.co官方文档m/huxi/archive/2010/07/04/1771073.html)
6. [python编码规范](http://google-styleguide.googlecode.com/svn/trunk/pyguide.html)
7. [MarkDown语法速查](https://gitcafe.com/GitCafe/Help/blob/master/Markdown.md#code),[中文版](https://github.com/riku/Markdown-Syntax-CN)

## 参考连接

1. [Python 打包指南](http://www.ibm.com/developerworks/cn/opensource/os-pythonpackaging/)
2. [深入Python3.0:打包 Python 类库](http://woodpecker.org.cn/diveintopython3/packaging.html)
3. [python打包:分发指定文件](http://docs.python.org/release/3.1.5/distutils/sourcedist.html#manifest)
4. [深入python3.0: 单元测试](http://woodpecker.org.cn/diveintopython3/unit-testing.html)
5. [Unit testing framework](http://docs.python.org/library/unittest.html)
6. [Python单元测试框架中文版](http://pyunit.sourceforge.net/pyunit_cn.html)
7. [Python自动单元测试框架](http://www.ibm.com/developerworks/cn/linux/l-pyunit/index.html)
"""

import markdown
with open('readme.html', 'w') as f:
    f.write(md_template.replace('$BODY$', markdown.markdown(md_doc.decode('utf-8')).encode('utf-8')))