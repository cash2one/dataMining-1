# -*- coding: utf-8 -*-

from datetime import date, timedelta
import ibbdlib
from ibbdlib.ibbdexport import MySQLXlsExporter
from ibbdlib.migratetable import migrate_table
db_server = {
    'host': 'localhost',
    'user': 'root',
    'passwd': 'JhBSxMJ0rElACRfZUBsE02fr5dDsmaEM',
    'db': 'taobao',
    'charset': 'utf8'
}
source_db_server = {
    'host': '112.124.60.13',
    'user': 'ibbdui',
    'passwd': '2dhrXbOdZ8VfSPyM3ChJKE8ogQWbUmXl',
    'db': 'ibbd_user',
    'charset': 'utf8'
}
labels = [(date.today() - timedelta(i)).strftime('%Y-%m-%d')
          for i in range(2, 11)]
file_str = date.today().strftime('%Y%m%d')
file_name = '%s_ibbd_reporter.xls' % file_str
labels = labels + labels[:2] + labels[-1:]
d_labels = [i for i in labels]
for i in range(len(labels)):
    d_labels.insert(len(labels) - 1 - i, labels[len(labels) - 1 - i])
from_date = (date.today() - timedelta(10)).strftime('%Y%m')
to_date = (date.today() - timedelta(2)).strftime('%Y%m')
months = set([from_date, to_date])
query = """SELECT T.`一级类目`, T.`二级类目`, T.keyword,
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s sales`) '%s sales',
MAX(T.`%s volume`) '%s volume',
MAX(T.`%s volume`) '%s volume',
MAX(T.`%s volume`) '%s volume'
FROM(
    %s
)T
GROUP BY T.keyword""" % tuple(d_labels + ['\nUNION\n'.join(["""SELECT
    T5.cat '一级类目',
    T5.industry '二级类目',
    T3.keyword,
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 2 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 3 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 4 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 5 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 6 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 7 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 8 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 9 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 10 DAY
        THEN T4.sales ELSE 0 END) '%s sales',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 2 DAY
        THEN T4.volume ELSE 0 END) '%s volume',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 3 DAY
        THEN T4.volume ELSE 0 END) '%s volume',
    SUM(CASE WHEN T4.date_of = curdate() - INTERVAL 10 DAY
        THEN T4.volume ELSE 0 END) '%s volume'
    FROM taobao.top_cat_items T3
    LEFT JOIN ibbd_%s.top_item2 T4
    ON T3.item_id = T4.item_id
    AND T4.date_of >= curdate() - INTERVAL 10 DAY
    LEFT JOIN(
        SELECT keyword,
        GROUP_CONCAT(DISTINCT cat) cat,
        GROUP_CONCAT(DISTINCT industry) industry
        FROM taobao.lib_cat_industry_keyword_2
        GROUP BY keyword
    )T5
    ON T3.keyword = T5.keyword
    WHERE T4.date_of IS NOT NULL
    GROUP BY T3.keyword""" % tuple(labels + [m]) for m in months])])
exporter = MySQLXlsExporter(
    '/data/data/%s' % file_name,
    db_server)
exporter.set_query(query)
exporter.save()

import smtplib
import os
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email.Utils import COMMASPACE, formatdate
from email import Encoders


def send_mail(send_to, subject, text, files=[]):
    """
    send_mail('example@gmail.com', '附件邮件测试', '附件邮件正文测试', '/root/robot.txt')
    """
    send_to = [send_to] if isinstance(send_to, (str, unicode)) else send_to
    files = [files] if isinstance(files, (str, unicode)) else files
    msg = MIMEMultipart()
    msg['From'] = 'app@ibbd.net'
    msg['To'] = COMMASPACE.join(send_to)
    msg['Date'] = formatdate(localtime=True)
    msg['Subject'] = subject
    msg.attach(MIMEText(text))
    for f in files:
        part = MIMEBase('application', "octet-stream")
        part.set_payload(open(f, "rb").read())
        Encoders.encode_base64(part)
        part.add_header(
            'Content-Disposition',
            'attachment; filename="%s"' % os.path.basename(f))
        msg.attach(part)

    smtp = smtplib.SMTP()
    smtp.connect('smtp.exmail.qq.com', '25')
    smtp.login('app@ibbd.net', 'scut2092')
    smtp.sendmail('app@ibbd.net', send_to, msg.as_string())
    smtp.close()

send_mail(
    [
        'gsavl@qq.com',
        '137741110@qq.com',
        '1209398893@qq.com'
    ],
    '数据雷达关键词销售表 %s' % file_str,
    'RT',
    '/data/data/%s' % file_name)
