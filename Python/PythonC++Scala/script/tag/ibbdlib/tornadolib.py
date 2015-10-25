#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import re
from tornado.template import Template


def render_string(template_string, **kwargs):
    """渲染tornado模板

    args:
        template_string  需要渲染的tornado模板字符串
        kwargs  关键词命名空间，值可以为函数
    return:
        渲染后的字符串
    example:
        import ibbdlib.tornadolib
        template_str = "<li>{{ func('HelloWorld') }}</li>"
        def hello(value):
            print '%s, ibbd'
        print ibbdlib.tornadolib.render_string(template_str, func = hello)
        >> <li>HelloWorld, ibbd</li>
    """

    for t in re.findall(r'{{\s*\w+\s*}}', template_string):
        vari = re.findall(r'{{\s*(\w+?)\s*}}', t)[0]
        if kwargs.get(vari):
            template_string = template_string.replace(t, kwargs.get(vari))
    template = Template(template_string)
    return template.generate(**kwargs)
