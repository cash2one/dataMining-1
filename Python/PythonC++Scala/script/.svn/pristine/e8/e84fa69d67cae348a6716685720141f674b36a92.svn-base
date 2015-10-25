#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

md_template = """
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
</html>
"""

md_doc = """
### requests <small>HTTP包</small>
* pip install requests
### BeautifulSoup <small>HTML/XML解析包</small>
* pip install BeautifulSoup
### tornado <small>web server</small>
* pip install tornado
### dateutil <small>日期处理包</small>
* pip install dateutil
* wget [http://labix.org/download/python-dateutil/python-dateutil-1.5.tar.gz](http://labix.org/download/python-dateutil/python-dateutil-1.5.tar.gz)
### path <small>代替原生os的包</small>
* pip install path.py
### redis <small>reids python sdk</small>
* pip install redis
### sqlparse <small>SQL转换处理</small>
* pip install sqlparse
* 官网 [python-sqlparse](http://code.google.com/p/python-sqlparse/)
### jieba <small>中文分词工具</small>
* pip install jieba
* 结巴 [git-jieba](https://github.com/fxsjy/jieba)
### PyQuery <small>jQuery风格的HTM解析包</small>
### fuzzywuzzy <small>字符串模糊匹配包</small>
* pip install fuzzywuzzy
### markdown <small>python的markdown语法转换工具</small>
* pip install markdown
### watchdog <small>来监控文件系统事件</small>
### sh <small>执行Linux命令的包</small>
### pattern <small>Web 数据挖掘模块 可用于数据挖掘、自然语言处理、机器学习和网络分析</small>
"""

import markdown
with open('package_source.html', 'w') as f:
    f.write(md_template.replace('$BODY$', markdown.markdown(md_doc.decode('utf-8')).encode('utf-8')))