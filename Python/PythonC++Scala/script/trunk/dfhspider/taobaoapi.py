#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
author:Cooper
date:2012.4.4
'''

import md5
import time
import json
from lib import request

APP = [{'app_key': '12543465', 'app_secret': 'dd547d6090fd8973346d41f704a173db'
       }, {'app_key': '12645589',
       'app_secret': '4157f295711f22dfd5f69a16f10dd801'}, {'app_key': '21154398'
       , 'app_secret': '708efdf463573e2247bf9bead363c020'}]

domain = 'http://gw.api.taobao.com/router/rest'
app_secret = APP[1]['app_secret']
dkey = {'app_key': APP[1]['app_key'], 'sign_method': 'md5', 'v': '2.0'}


def getURL(params, appNum=0, encoding='utf-8'):
    timestamp = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
    params['timestamp'] = timestamp
    global dkey
    global app_secret
    dkey['app_key'] = APP[appNum]['app_key']
    app_secret = APP[appNum]['app_secret']
    for key in dkey:
        params[key] = dkey[key]
    s = [key + params[key].decode(encoding).encode('utf-8') for key in params]
    s.sort()
    s = app_secret + ''.join(s) + app_secret
    sign = md5.new(s).hexdigest().upper()
    url = domain + '?sign=' + sign
    for para in params:
        url = url + '&%s=%s' % (para, params[para])
    return url


def reqTaobaoAPI(params):
    metadata = {}
    global APP
    for i in range(len(APP)):
        metadata = json.loads(request(getURL(params, i + 1)), encoding='utf-8')
        if not metadata.has_key('error_response'):
            break
    return json.dumps(metadata, encoding='utf-8')


def getItemCats(parentId):
    d = {
        'method': 'taobao.itemcats.get',
        'format': 'json',
        'fields': 'cid,parent_cid,name,is_parent,sort_order',
        'parent_cid': parentId,
        }
    return request(getURL(d)).text


def getItemProps(cid):
    d = {
        'method': 'taobao.itemprops.get',
        'format': 'json',
        'fields': 'pid,name,must,multi,prop_values',
        'cid': cid,
        }
    return request(getURL(d, 1)).text


def getItem(iid):
    d = {
        'method': 'taobao.item.get',
        'format': 'json',
        'fields': 'detail_url,num_iid,title,nick,type,cid,seller_cids,props,input_pids,input_str,desc,pic_url,num,valid_thru,list_time,delist_time,stuff_status,location,price,post_fee,express_fee,ems_fee,has_discount,freight_payer,has_invoice,has_warranty,has_showcase,modified,increment,approve_status,postage_id,product_id,auction_point,property_alias,item_img,prop_img,sku,video,outer_id,is_virtual',
        'num_iid': iid,
        }
    return request(getURL(d)).text


def getUser(nick):
    d = {
        'method': 'taobao.user.get',
        'format': 'json',
        'fields': 'user_id,uid,nick,sex,buyer_credit,seller_credit,location,created,last_visit,birthday,type,status,alipay_no,alipay_account,alipay_account,email,consumer_protection,alipay_bind',
        'nick': nick,
        }
    return request(getURL(d)).text


def getUsers(nicks):
    d = {
        'method': 'taobao.users.get',
        'format': 'json',
        'fields': 'user_id,nick,sex,buyer_credit,seller_credit,location,created,last_visit',
        'nicks': nicks,
        }
    return request(getURL(d, 1)).text


def getItems(num_iids):
    d = {
        'method': 'taobao.items.list.get',
        'format': 'json',
        'fields': 'num_iid,props_name,cid,props,pic_url,num,valid_thru,list_time,delist_time,price,is_timing',
        'num_iids': num_iids,
        }
    return request(getURL(d, 0)).text


def getItemPromotion(item_id, appId=0):
    d = {'method': 'taobao.ump.promotion.get', 'format': 'json',
         'item_id': item_id}
    return request(getURL(d, appId)).text


def getTrades(session_key, fromTsmp, toTsmp):
    d = {
        'method': 'taobao.trades.sold.get',
        'format': 'json',
        'session': session_key,
        'fields': 'seller_nick,buyer_nick,title,type,created,sid,tid,seller_rate,buyer_rate,status,payment,discount_fee,adjust_fee,post_fee,total_fee,pay_time,end_time,modified,consign_time,buyer_obtain_point_fee,point_fee,real_point_fee,received_payment,commission_fee,pic_path,num_iid,num_iid,num,price,cod_fee,cod_status,shipping_type,receiver_name,receiver_state,receiver_city,receiver_district,receiver_address,receiver_zip,receiver_mobile,receiver_phone,orders.title,orders.pic_path,orders.price,orders.num,orders.iid,orders.num_iid,orders.sku_id,orders.refund_status,orders.status,orders.oid,orders.total_fee,orders.payment,orders.discount_fee,orders.adjust_fee,orders.sku_properties_name,orders.item_meal_name,orders.buyer_rate,orders.seller_rate,orders.outer_iid,orders.outer_sku_id,orders.refund_id,orders.seller_type',
        'start_created': fromTsmp,
        'end_created': toTsmp,
        }
    return request(getURL(d, 2)).text


def main():

    # data=getItemCats('0')
    # data=getItem('18146120010')
    # s=json.dumps(json.loads(data,encoding='utf-8'),indent=4,ensure_ascii=False)

    num_iids = ['10052851699', '2461883338', '1437763442', '1583010862',
                '7497670727']

    # metadata=json.loads(getItems(','.join(num_iids)),encoding='utf-8')

    for iid in num_iids:
        metadata = json.loads(getItemPromotion(iid), encoding='utf-8')
        print json.dumps(metadata, indent=4, ensure_ascii=False)
