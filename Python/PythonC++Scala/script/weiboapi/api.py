#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import json
import requests
import pymongo
import time

APP_KEY = '4166364270'
ACCESS_TOKEN = '2.006VHGuBifdxXE35539ccb9bSU2LNC'


def getMongoDB():
    server = pymongo.Connection('localhost', 27017)
    db = server.test
    return db


def get_account_rate_limit_status():
    uri = 'https://api.weibo.com/2/account/rate_limit_status.json'
    kwargs = {}
    kwargs['access_token'] = ACCESS_TOKEN
    r = requests.request('GET', uri, params=kwargs)
    j = json.loads(r.text, encoding='utf-8')
    return j


def weiboapi(method='GET', url=None, **kwargs):
    kwargs['access_token'] = ACCESS_TOKEN
    while 1:
        if url and method == 'GET':
            r = requests.request(method, url, params=kwargs)
        elif url and method == 'POST':
            r = requests.request(method, url, data=kwargs)
        j = json.loads(r.text, encoding='utf-8')
        if j.has_key('error_code'):
            print j['error_code'], j['error']
            j = get_account_rate_limit_status()
            print 'sleep', j['reset_time_in_seconds']
            time.sleep(j['reset_time_in_seconds'])
        else:
            break
    return j


def get_public_timeline(**kwargs):
    uri = 'https://api.weibo.com/2/statuses/friends_timeline.json'
    kwargs['count'] = 50
    kwargs['access_token'] = ACCESS_TOKEN
    r = requests.request('GET', uri, params=kwargs)
    try:
        j = json.loads(r.text, encoding='utf-8')
        return j
    except:
        return {}


def get_user_timeline(screen_name='小栾Cooper', count=100, page=1):
    uri = 'https://api.weibo.com/2/statuses/user_timeline.json'
    return weiboapi('GET', uri, screen_name=screen_name, count=80, page=page)


def get_comments(sid, page=1):
    uri = 'https://api.weibo.com/2/comments/show.json'
    return weiboapi('GET', uri, id=sid, page=page)


def get_followers(**kwargs):
    return weiboapi('GET', 'https://api.weibo.com/2/friendships/followers.json'
                    , screen_name='小栾Cooper', count=200)


def test_get_followers_():
    j = get_followers()
    for (i, t) in enumerate(j['users']):
        print i, t['screen_name'].encode('utf-8')


def test_get_user_timeline(screen_name='小栾Cooper'):
    page = 1
    statuses = []
    total = 0
    print screen_name
    while 1:
        j = get_user_timeline(screen_name=screen_name, page=page)
        if len(j['statuses']) == 0:
            break
        if total != 0 and len(statuses) >= total:
            break
        print 'page', page, len(j['statuses'])
        statuses.extend(j['statuses'])
        if total == 0:
            total = j['total_number']
        page += 1
    with open('statuses.txt', 'a') as f:
        for status in statuses:

            # print json.dumps(status,ensure_ascii=False,indent=4).encode('utf-8')
            # raw_input('pause')

            row = [screen_name, status['created_at'], status['text']]
            if status.has_key('retweeted_status'):
                row[1] = row[1] + '//' + status['retweeted_status']['text']
            f.write('\t'.join([(t.encode('utf-8', 'ignore') if isinstance(t,
                    unicode) else str(t)) for t in row]) + '\n')
            if status['comments_count'] > 0:
                print 'get comments', status['id']
                test_get_comments(status['id'])


def test_get_comments(sid):
    page = 1
    comments = []
    total = 0
    while 1:
        j = get_comments(sid, page)
        if len(j['comments']) == 0:
            break
        if total != 0 and len(comments) >= total:
            break
        comments.extend(j['comments'])
        if total == 0:
            total = j['total_number']
        page += 1
    with open('comments.txt', 'a') as f:
        for comment in comments:
            row = [sid, comment['user']['screen_name'], comment['created_at'],
                   comment['text']]
            f.write('\t'.join([(t.encode('utf-8', 'ignore') if isinstance(t,
                    unicode) else str(t)) for t in row]) + '\n')


def test_get_account_rate_limit_status():
    print json.dumps(get_account_rate_limit_status(), indent=4)


def saveLastestStatuses():
    db = getMongoDB()

    # c=db.statuses.find({},{'id':pymongo.ALL}).sort('id',pymongo.DESCENDING)

    c = db.statuses.find().sort('id', pymongo.DESCENDING)
    lastestStatus = c.next()
    since_id = lastestStatus['id']
    print lastestStatus['id'], lastestStatus['created_at'], '\nnew status'
    pause = False
    count = 0
    for i in range(100):
        if pause:
            break
        j = get_public_timeline(count=50, page=i + 1)

        # j=get_public_timeline(count=50,since_id=since_id,page=i+1)

        if not j.has_key('statuses'):
            break
        for status in j['statuses']:
            if status['id'] > since_id:
                count += 1
                print count, status['id'], status['created_at']
            else:
                pause = True
                break
            db.statuses.insert(status)

        # print j['statuses'][-1]['id'],j['statuses'][-1]['created_at']

        if max([t['id'] for t in j['statuses']]) < since_id:
            break
    db.connection.disconnect()


def printLastestStatuses():
    db = getMongoDB()
    c = db.statuses.find().sort('id', pymongo.DESCENDING)
    while 1:
        try:
            j = c.next()
            j.pop('_id')

            # print json.dumps(j,ensure_ascii=False,indent=4).encode('utf-8')

            print ','.join([j['created_at'], j['user']['name'], j['text'
                           ]]).encode('utf-8')
            raw_input('pause')
        except:
            break
    db.connection.disconnect()


def main():
    j = get_public_timeline()
    for key in ['total_number', 'previous_cursor', 'next_cursor']:
        print key, j[key]
    print j['statuses'][0].keys()


    # print json.dumps(j,ensure_ascii=False,indent=4).encode('utf-8')

if __name__ == '__main__':

    # main()

    saveLastestStatuses()

    # printLastestStatuses()
    # test_get_followers_()
    # for name in ['dada-范','chen_weixu','Howell_Lee','波之愚者','Tam绍楷Sky','爱因斯坦2','吴宋炎','09PU-伟煜']:
    # for name in ['chen_weixu']:
        # test_get_user_timeline(name)
    # test_get_account_rate_limit_status()
    # print get_user_timeline()=======
    # test_get_user_timeline(name)
