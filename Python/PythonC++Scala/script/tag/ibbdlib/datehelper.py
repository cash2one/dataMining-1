#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
日期辅助函数
Created on 2012-11-29

@author: root
'''

import datetime


def datePage(
    fromDate,
    toDate,
    page=1,
    size=10,
    order='desc',
):

    sizeDays = datetime.timedelta(days=size)
    if toDate - fromDate < sizeDays:
        return (fromDate, toDate)
    days = datetime.timedelta(days=(page - 1) * size)
    if order == 'esc':
        if fromDate + days <= toDate:
            fromDate = fromDate + days
            if toDate - fromDate < sizeDays:
                return (fromDate, toDate)
            else:
                return (fromDate, fromDate + datetime.timedelta(days=size - 1))
    else:
        if toDate - days >= fromDate:
            toDate = toDate - days
            if toDate - fromDate < sizeDays:
                return (fromDate, toDate)
            else:
                return (toDate - datetime.timedelta(days=size - 1), toDate)

    return (datetime.date.max, datetime.date.max)


if __name__ == '__main__':
    fromDate = datetime.datetime(2012, 11, 15)
    toDate = datetime.datetime(2012, 12, 9)
    print datePage(fromDate, toDate, 3)
