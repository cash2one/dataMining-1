#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import json
import re

from api import *


def _utf8(pre):
    return pre.encode('utf-8') if isinstance(pre, (unicode, str)) else pre


def _encode_dict(j):
    def _encode_list(l):
        return [_utf8(li) for li in l]
    j = dict((k,
              _encode_list(v)
              if isinstance(v, (list, tuple, set))
              else v)
             for k, v in j.items())
    j = dict((k,
              _encode_dict(v)
              if isinstance(v, dict)
              else v)
             for k, v in j.items())
    j = dict((k, _utf8(v)) for k, v in j.items())
    return j


def _encode_obj(obj):
    if isinstance(obj, (unicode, str)):
        return _utf8(obj)
    elif isinstance(obj, dict):
        return _encode_dict(obj)
    elif isinstance(obj, list):
        return [_encode_obj(row) for row in obj]
    else:
        return obj


def get_catname_by_cid(cid):
    """
    {
        "cid":50019578,
        "is_parent":false,
        "name":"露营\/旅游\/登山帐篷",
        "parent_cid":50019539
    }
    """
    data = taobao_itemcats_get(cids=cid)['item_cats']['item_cat'][0]
    return _encode_obj(data)


def get_item(item_id):
    data = taobao_item_get(num_iid=item_id)
    filters = ['cid', 'list_time', 'delist_time', 'item_imgs', 'location',
               'nick', 'num', 'num_iid', 'pic_url', 'price',
               'seller_cids', 'title', 'props', 'input_pids', 'input_str']
    return _encode_obj(dict((k, v) for k, v in data.items() if k in filters))


def get_items(item_ids):
    data = taobao_items_list_get(num_iids=item_ids)
    filters = ['cid', 'list_time', 'delist_time', 'item_imgs', 'location',
               'nick', 'num', 'num_iid', 'pic_url', 'price',
               'seller_cids', 'title', 'props', 'input_pids', 'input_str']
    return [_encode_obj(
        dict((k, v) for k, v in item.items() if k in filters))
        for item in data]


def get_item_props(cid, pvs):
    data = taobao_itempropvalues_get(cid=cid, pvs=pvs)
    return _encode_obj(data)


def get_item_brand(item):
    cid = item['cid']
    props = item['props']
    prop_val = get_item_props(cid, props)
    prop_val = [row for row in prop_val if row['pid'] == 20000]
    if prop_val:
        return prop_val[0]['name']
    else:
        input_pids = item['input_pids'].split(',')
        input_str = re.sub(r'(\(.+?\))', r'', item['input_str']).split(',')
        if input_pids.count('20000') > 0:
            return input_str[input_pids.index('20000')]
        else:
            return None
