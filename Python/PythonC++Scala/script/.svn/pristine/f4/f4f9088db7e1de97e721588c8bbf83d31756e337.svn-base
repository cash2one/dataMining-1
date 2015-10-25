#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

# MD文档模板,bootstrp style

md_template = \
    """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="../help/css/jquery.ui.all.css">
    <link rel="stylesheet" type="text/css" href="../help/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../help/bootstrap/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" type="text/css" href="../help/tocify/jquery.tocify.css">
    <style type="text/css">
    #toc li{
      line-height: 20px;
    }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="span3">
                <div id="toc"></div>
            </div>
            <div class="span9">$BODY$</div>
        </div>
    <script type="text/javascript" src="../help/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../help/js/jquery-ui-1.9.1.custom.min.js"></script>
    <script type="text/javascript" src="../help/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../help/tocify/jquery.tocify.min.js"></script>
    <script type="text/javascript">
    $(function(){
      $("#toc").tocify({ selectors: "h2, h3, h4, h5" }).data("tocify");
    })
    </script>
</body>
</html>
"""

md_doc = \
    """

# ibbdlib公共接口

## 基础库 <small>ibbdlib.\_\_init\_\_.py</small>

### ibbdlib.get_db_conn <small>获取数据库连接</small>
    用例：
        import ibbdlib
        db_conn = ibbdlib.get_db_conn()
        db_conn = ibbdlib.get_db_conn(host='localhost', user='root', passwd='')
        for user in db_conn.iter("SELECT * FROM user"):
            print user.nick
        db_conn.close()

### ibbdlib.get_db_pool <small>获取数据库连接池</small>
    用例：
        import ibbdlib
        
        # 得到连接池
        db_conn_pool = ibbdlib.get_db_pool(max_connections=1000)
        # or
        db_conn_pool = ibbdlib.get_db_pool(max_connections=1000, host='localhost', user='root', passwd='')
        
        # 获取一个可用连接
        db_conn = db_conn_pool.get_connection()
        for user in db_conn.query("SELECT * FROM user"):
            print user.nick
        
        # 释放连接(不允许直接关闭)
        db_conn_pool.release(db_conn)
        
        # 断开全部连接
        db_conn_pool.disconnect()

### ibbdlib.get_redis_conn <small>获取Redis连接</small>
    用例：
        import ibbdlib
        re_conn = ibbdlib.get_redis_conn()
        re_conn = ibbdlib.get_redis_conn(host='localhost', user='', passwd='')
        
        re_conn.set('foo')
        re_conn.get('foo')
        
        del re_conn

### ibbdlib.gen_sql_statement <small>生成SQL语句</small>
    用例：
        import ibbdlib
        db_conn = ibbdlib.get_db_conn()
        print ibbdlib.gen_sql_statement(db_conn, "INSERT INTO user values(%s,%s)", [['wang', datetime.datetime.now()], ['zhang', '2012-11-11 00:00:00']])
        db_conn.close()
        
        output:
            INSERT INTO user values
            ('wang', '2012-12-12 14:38:17'),
            ('zhang', '2012-11-11 00:00:00')

## 日志 <small>ibbdlib.ibbdlog.py</small>
### 获取日志对象 get_logger()
    参数：
        log_path    日志文件夹路径
        log_file    日志文件
        output      输出方式 default(console, file)
        log_name    日志名称
        msg_format  日志格式
        time_format     日志中的时间格式
        time_routate    日志生成机制(默认每天一个文件)
        log_level       日志级别
    用例:
        import ibbdlib.ibbdlog
        log = ibbdlib.ibbdlog.get_logger(log_file='test.log')
        log.info('hello, i\'m ibbd')
        
        >> hello i'm ibbd
        file output:
            ../log/test.log

## redis <small>二次封装的redis函数</small>

### 文件
ibbdlib.redislib.py
### get_redis_conn
    获取一个redis连接
    用例:
        import ibbdlib.redislib
        re_conn = ibbdlib.redislib.get_redis_conn()
        re_con.set('foo', 'bar')
        print re_con.get('foo')
        
        outpu: bar

### redis_pipe
    执行多条redis命令，并返回结果
    用例：
        from ibbdlib.redislib import redis_pipe
        result = redis_pipe(re_conn, [['set', 'foo', 'bar'], ['get', 'foo']])
        print result
        
        output: [True, 'bar']

## tornado <small>从tornado中提取的工具</small>
### render_string(template_str, **kwargs)
    渲染tornado模板，返回字符串
    用例：
        import ibbdlib.tornadolib
        template_str = "<li>{{ func('HelloWorld') }}</li>"
        def hello(value):
            print '%s, ibbd'
        print ibbdlib.tornadolib.render_string(template_str, func = hello)
        >> <li>HelloWorld, ibbd</li>
"""

import markdown
with open('readme.html', 'w') as f:
    f.write(md_template.replace('$BODY$',
            markdown.markdown(md_doc.decode('utf-8')).encode('utf-8')))
