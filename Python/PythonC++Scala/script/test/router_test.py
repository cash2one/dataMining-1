#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import requests

headers = {
    'Authorization': 'Basic YWRtaW46YWRtaW4=',
    'Host': '192.168.1.1',
    'Accept-Charset': 'GBK,utf-8;q=0.7,*;q=0.3',
    'Referer': 'http://192.168.1.1/userRpm/StatusRpm.htm',
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
    }


def main():
    session = requests.session()
    session.config['prefetch'] = True
    r = session.get('http://192.168.1.1/userRpm/StatusRpm.htm', headers=headers)
    print r.text.encode('utf-8')


if __name__ == '__main__':
    main()
