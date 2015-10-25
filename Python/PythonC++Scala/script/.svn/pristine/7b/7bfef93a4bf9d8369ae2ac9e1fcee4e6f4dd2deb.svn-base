#!/usr/bin/python2.7
# -*- coding: utf-8 -*-


def save_top_item_price(data, db_pool):
    """
    """
    sku, promo = data
    db_conn = db_pool.get_connection()
    cursor = db_conn.cursor()
    if sku:
        sql_stm = "INSERT IGNORE INTO ibbd2.top_item_sku values(%s, %s, %s, %s, %s, NOW())"
        cursor.executemany(sql_stm, sku)
    if promo:
        sql_stm = "INSERT IGNORE INTO ibbd2.top_item_promo values(%s, %s, %s, %s, %s, %s, %s, NOW())"
        cursor.executemany(sql_stm, promo)
    db_conn.commit()
    cursor.close()
    db_pool.release(db_conn)


def save_topapi_item(data, db_pool):
    """
    """
    db = 'ibbd_outflow'
    db_conn = db_pool.get_connection()
    cursor = db_conn.cursor()
    query = "REPLACE INTO %s.top_item(item_id, cid, cat, img, location, nick, price, title, brand, scid, sid) values(%s)" % (
        db, ','.join(['%s'] * 11))
    item = data['item']
    cursor.execute(query, (
        data['iid'],
        item['cid'],
        data.get('cat'),
        item['pic_url'],
        item['location']['state'] + ' ' + item['location']['city'],
        item['nick'],
        item['price'],
        item['title'],
        data.get('brand') or '',
        data.get('scid'),
        data.get('sid')
    ))
    db_conn.commit()
    cursor.close()
    db_pool.release(db_conn)


def save_top_item_rela(data, db_pool):
    db_conn = db_pool.get_connection()
    cursor = db_conn.cursor()

    item_id = data['iid']

    db = 'ibbd_outflow'
    query = "REPLACE INTO %s.top_item_fav(item_id, nick, user_num_id, price, title, img, location, fav_num) \
        values(%s)" % (db, ','.join(['%s'] * 8))
    cursor.execute(
        query,
        (item_id, data['nick'], data['user_num_id'], data['price'],
            data['title'], data['img'], data['location'], data['fav_num']))

    if data['same_cat']:
        query = "REPLACE INTO %s.top_item_fav_tui(item_id, `from`, %s) values(%s, 'samecat', %s)"
        keys = [key for key in data['same_cat'][
            -1].keys() if key not in ['isCusGuar', 'url']]
        query = query % (db, ','.join(
            keys), item_id, ','.join(['%s' for key in keys]))
        cursor.executemany(
            query,
            [[row.get(key) for key in keys] for row in data['same_cat']])
    if data['other_cat']:
        query = "REPLACE INTO %s.top_item_fav_tui(item_id, `from`, %s) values(%s, 'nearcat', %s)"
        keys = [key for key in data['other_cat'][
            -1].keys() if key not in ['isCusGuar', 'url']]
        query = query % (db, ','.join(
            keys), item_id, ','.join(['%s' for key in keys]))
        cursor.executemany(
            query,
            [[row.get(key) for key in keys] for row in data['other_cat']])
    if data['cat_fav_item']:
        query = "REPLACE INTO %s.top_item_cat_hotfav(item_id, id, title, price, img) values(%%s, %%s, %%s, %%s, %%s)" % db
        cursor.executemany(
            query,
            [[item_id, row['iid'], row['title'], row['price'], row['img']] for row in data['cat_fav_item']])
    if data['fav_shop']:
        query = "REPLACE INTO %s.top_item_fav_shop(item_id, uid, nick, credit) values(%%s, %%s, %%s, %%s)" % db
        cursor.executemany(
            query,
            [[item_id, row['uid'], row['nick'], row['credit']] for row in data['fav_shop']])

    db_conn.commit()
    cursor.close()
    db_pool.release(db_conn)
