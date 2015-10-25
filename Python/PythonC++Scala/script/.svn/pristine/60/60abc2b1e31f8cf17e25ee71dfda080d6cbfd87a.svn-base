#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import requests

from common import top_api_url


def taobao_itemcats_get(**kwargs):
    """
    @param parent_cid
    @param cids
    """
    params = {
        'method': 'taobao.itemcats.get',
        'fields': 'cid,parent_cid,name,is_parent'
    }
    params.update(kwargs)
    return requests.get(top_api_url(params)).json().get('itemcats_get_response')


def taobao_item_get(**kwargs):
    """
    @see http://api.taobao.com/apitools/apiTools.htm?catId=4&apiName=taobao.item.get

    @param num_iid
    """
    params = {
        'method': 'taobao.item.get',
        'fields': 'detail_url,num_iid,title,nick,type,cid,seller_cids,props,input_pids,input_str,pic_url,num,valid_thru,list_time,delist_time,stuff_status,location,price,post_fee,express_fee,ems_fee,has_discount,freight_payer,has_invoice,has_warranty,has_showcase,modified,increment,approve_status,postage_id,product_id,auction_point,property_alias,item_img,prop_img,sku,video,outer_id,is_virtual'
    }
    params.update(kwargs)
    return requests.get(top_api_url(params)).json().get('item_get_response')['item']


def taobao_items_list_get(**kwargs):
    """
    @param num_iids id1,
    """
    params = {
        'method': 'taobao.items.list.get',
        'fields': 'detail_url,volume,num_iid,title,nick,type,cid,seller_cids,props,input_pids,input_str,pic_url,num,valid_thru,list_time,delist_time,stuff_status,location,price,post_fee,express_fee,ems_fee,has_discount,freight_payer,has_invoice,has_warranty,has_showcase,modified,increment,approve_status,postage_id,product_id,auction_point,property_alias,item_img,prop_img,sku,video,outer_id,is_virtual'
    }
    params.update(kwargs)
    return requests.get(top_api_url(params)).json().get('items_list_get_response')['items']['item']


def taobao_itempropvalues_get(**kwargs):
    """
    @param cid
    @param pvs
    @retur [
        {
        "cid":50019578,
        "name":"3-4人帐",
        "name_alias":"3-4人帐",
        "pid":3788104,
        "prop_name":"帐篷分类",
        "sort_order":8,
        "status":"normal",
        "vid":67860397
        },
    ]
    """
    params = {
        'method': 'taobao.itempropvalues.get',
        'fields': 'cid,pid,prop_name,vid,name,name_alias,status,sort_order',
    }
    params.update(kwargs)
    return requests.get(top_api_url(params)).json().\
        get('itempropvalues_get_response')['prop_values']['prop_value']


def taobao_shop_get(**kwargs):
    """
    @param nick
    @return {
        bulletin: ,
        cid: 1048,
        created: 2007-08-25 15:24:54,
        desc: <p>专业数码周边供应商</p>,
        modified: 2013-04-24 12: 07: 22,
        nick: udddf999,
        pic_path: /85/b4/T1nxnPXjxdXXartXjX,
        sid: 34782328,
        title: 三门数码 专业数码周边供应商
    }
    """
    params = {
        'method': 'taobao.shop.get',
        'fields': 'sid,cid,title,nick,desc,bulletin,pic_path,created,modified'
    }
    params.update(kwargs)
    return requests.get(top_api_url(params)).json()['shop_get_response']['shop']
