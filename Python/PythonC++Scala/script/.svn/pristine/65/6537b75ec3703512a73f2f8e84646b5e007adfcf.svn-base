#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
'''
    提供一些工具箱方法
'''


def compress(data, expect, zip):
    if len(data) < expect:
        return data
    num = len(data) / expect


def map2KeyList(mapList):
    '''
        把多个map的数据按key组合成数组
        ex:
            [{'name':'tom','id':1},
             {'name':'ketty','id':2}]
            －>
            {'name':['tom,'ketty'],
             'id':[1,2]}
    '''
    if not mapList or not mapList[0]:
        return []

    keys = mapList[0].keys()
    allList = [[m[k] for m in mapList] for k in keys]

    ret = {}
    for i, key in enumerate(keys):
        ret[key] = allList[i]
    return ret


def testMap2List():
    print map2List([{'name':'tom', 'id':1},
                    {'name':'ketty', 'id':2}])


def map2List(mapList):
    '''
        把map转换为list,list的元素按key保持顺序
        ex:
            [{'name':'tom','id':1},
             {'name':'ketty','id':2}]
            －>
            [['tom',1],
             ['ketty',2]]
    '''
    if not mapList or not mapList[0]:
        return []

    keys = mapList[0].keys()
    allList = [[m[k] for k in keys] for m in mapList]
    return allList


def testMap2List():
    print map2List([{'name':'tom', 'id':1},
                    {'name':'ketty', 'id':2}])

if __name__ == '__main__':
    testMap2List()
