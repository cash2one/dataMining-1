#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
@author Cooper
@date   2013.1.21
@desc   ibbd mail module
"""

import traceback
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import tornadolib
import ibbdlog

log = ibbdlog.get_logger(output='console', log_name='ibbd.ibbdmail')


class IBBDmail(object):

    """封装python的smtp包，提供set_content()和render_template()设置邮件内容，send()方法发送邮件

    example:
    >> mail = IBBDmail()
    >> mail.set_content('IBBDmail Email Content')
    >> mail.send('***@163.com', 'Email from IBBDmail')
    """

    def __init__(
        self,
        server=None,
        port=None,
        domain_email=None,
        domain_passwd=None,
    ):
        """初始化IBBDmail，可选是否登录服务器

        Args:
            server: 邮件服务器SMTP地址
            port:   邮件服务器端口
            domain_email:   邮件服务器帐号
            domain_passwd:  邮件服务器密码
        """

        self._is_login = False
        self.server = smtplib.SMTP()
        self.subject = None
        self.email_from = None
        self.email_to = None
        self.email_obj = MIMEMultipart('alternative')
        self._encoding = 'utf-8'
        self.default_server = {
            'server': 'smtp.exmail.qq.com',
            'port': '25',
            'domain_email': 'app@ibbd.net',
            'domain_passwd': 'scut2092',
        }
        if server:
            self.login(server, port, domain_email, domain_passwd)
        else:
            self._auto_login()

    def login(
        self,
        server,
        port,
        domain_email,
        domain_passwd,
    ):
        """登录邮件服务器"""

        if self._is_login:
            self.logout()
        self.server.connect(server, str(port))
        self.server.login(domain_email, domain_passwd)
        self._is_login = True

    def _prettify_gmail(self):
        """针对Gmail收件人做特殊处理"""

        if self.email_to:
            if self.email_to.endswith('@gmail.com'):
                self.server.starttls()

    def _auto_login(self):
        """登录默认邮件服务器帐号"""

        try:
            self.server.connect(
                self.default_server['server'], self.default_server['port'])
            self.server.login(self.default_server[
                              'domain_email'], self.default_server['domain_passwd'])
            self.email_from = self.default_server['domain_email']
            self._is_login = True
        except:
            log.error(traceback.format_exc())

    def render_template(
        self,
        email_template_file=None,
        email_template_string=None,
        encoding=None,
        **kwargs
    ):
        """设置邮件的html内容

        通过渲染兼容tornado.template格式的模板设置邮件正文
        参数email_template_file/email_template_string二选一

        Args:
            email_template_file:    HTML文件全路径
            email_template_string:  HTML文本字符串
            encoding:               HTML文件/字符串编码
            kwargs:                 渲染HTML模板用到的变量
        """

        self.write_content(
            tornadolib.render_string(
                (open(email_template_file).read()
                 if email_template_file else email_template_string),
                **kwargs).decode(encoding or self._encoding).encode('utf-8'))

    def write_content(self, email_content, encoding=None):
        """设置邮件的纯文本内容"""

        self.email_obj.attach(
            MIMEText(
                unicode(
                    email_content.replace('\n', '<br>').decode(
                        encoding or self._encoding).encode(self._encoding),
                    self._encoding), 'html', self._encoding))

    def set_content(self, email_content, encoding=None):
        """设置邮件的纯文本内容"""

        self.write_content(email_content, encoding)

    def send(
        self,
        send_to,
        subject,
        encoding=None,
        send_tsmp=None,
        send_from=None,
    ):
        """发送邮件

        Args:
            send_to:    收件人
            subject:    邮件标题
            encoding:   标题编码
            send_tsmp:  发送时间(deprecated)
            send_from:  发件人
        """

        self._prettify_gmail()
        if not self._is_login:
            log.info('login with default user app@ibbd.net')
            self._auto_login()
        self.email_obj['Subject'] = unicode(
            subject, encoding or self._encoding)
        self.email_obj['From'] = send_from or self.email_from
        self.email_obj['To'] = ';'.join(send_to) if isinstance(
            send_to, (list, set)) else send_to
        self.server.sendmail(send_from or self.email_from,
                             send_to, self.email_obj.as_string().encode('ascii'))

    def reset(self):
        """重置邮件内容"""

        self.email_obj = MIMEMultipart('alternative')

    def logout(self):
        """注销邮件服务器"""

        log.info('logout')
        self.server.quit()
        self._is_login = False

    def __del__(self):
        self.logout()
