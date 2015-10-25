#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

"""
获取一个店铺中所有商品的高频词
"""

import json
from collections import Counter

from dfhspider.topshop import TopShop
from dfhspider.topalliteminfo import getShopItemsOverview

import jieba
import jieba.analyse

# 词库文件
dict_path='ciku.txt'

# 分词长度
seg_len = 6

def _getS_shop_items(url):
    """获取店铺中的所有商品
    
    returns:
        dict(item_id, item_name) list
    """
    shopurl = TopShop(url).getBasicInfo()['shopLink']
    return dict((item[3], item[4]) for item in getShopItemsOverview(url))

def _add_dict(titles):
    """将单词长度小于seg_len的词加入到词典"""
    
    seg_list = set()
    for title in titles:
        for t in title.split():
            if len(t) < seg_len*3:
                if t.strip() != '':
                    seg_list.add('%s 1'%t)
    # load dict and merte 加载原始词典合并到现在的词典中
    with open(dict_path) as f:
        s = set(iter([row.rstrip('\n') for row in f.read().splitlines()]))
        seg_list.update(s)
    # write dict
    with open(dict_path, 'w') as f:
        f.write('\n'.join(list(seg_list))+'\n')
    # 加载词库
    jieba.load_userdict('ciku.txt')

def seg_items(items):
    """对商品列表进行分词
    
    Args:
        items: [[item_id, item_name], ]
    """
    
    # 词频计数器
    c = Counter()
    # 记录每个词对应的商品ID
    seg_item_dict = dict()
    for item_id, item_name in items.items():
        # print 'processing',item[1]
        title_seg = item_name.split()
        seg_list = []
        for spt in title_seg:
            if len(spt) > 3*seg_len:
                seg_list.extend([t.encode('utf-8') for t in jieba.cut(spt, cut_all=False)])
            else:
                seg_list.append(spt)
        for seg in seg_list:
            c[seg] += 1
            if seg_item_dict.get(seg):
                seg_item_dict[seg].add(item_id)
            else:
                seg_item_dict[seg]=set(iter([item_id]))
    print 'result'
    for t in c.most_common(20):
        print t[0],t[1]
        print '\n'.join([items[t] for t in list(seg_item_dict[t[0]])])

def seg_character(seg_str):
    pass

def extract_tags(character):
    """提取一段文字中的关键词"""
    
    tags = jieba.analyse.extract_tags(character, topK=20)
    print json.dumps([tag.encode('utf-8') for tag in tags], indent=4, ensure_ascii=False)

def main():
    items = _getS_shop_items('http://skintalk.tmall.com')
    _add_dict([v for k,v in items.items()])
    # 对商品分别分词
    # seg_items(items)
    
    # 将商品标题组成段落进行分词
    extract_tags('\n'.join([v for k,v in items.items()]))

if __name__ == '__main__':
    main()