#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import cPickle as pickle
from uuid import uuid4
import redis
import time
import datetime

def getRedisConn(conn_config={'host': '223.4.155.152'}):
    r = None
    while 1:
        try:
            r = redis.StrictRedis(**conn_config)
            break
        except :
            time.sleep(60)
    return r

'''
使用Redis实现的Session池

*************************************************************
设计原理：
使用Redis作为存储池
当用户访问时加载保存的session,以dict作为session存储空间,
当用户离开时，把session的内容保存进Redis里面进行存储

若用户为游客，使用cookie保存键key,且cookie为临时cookie，关闭浏览器则消失
    保存在Redis里面的内容会在较短时间(expire)后删除
若用户为登录用户，则使用user作为键key，
    保存在Redis里面的内容会存活较长时间(logined_expire)

*************************************************************
使用方法：在Application 和 BaseHandler添加下面的配制
class Application(tornado.web.Application):
    def __init__(self, handlers=None, default_host="", transforms=None, wsgi=False, **settings):
        self.session_store = RedisSessionPool(getRedisConn2())

class BaseHandler(tornado.web.RequestHandler):
    @property
    def session(self):
        sessionTag = 'ibbdsessionid'
        temp_sid = self.get_secure_cookie(sessionTag)
        store = self.application.session_store
        if self.current_user:
            sessionid = self.current_user
            session = ibbdlib.session.Session(session_store = store, sessionid = sessionid, logined = True)
            
            if temp_sid:
                session.marge(ibbdlib.session.Session(store, temp_sid))
        else:
            session = ibbdlib.session.Session(store, temp_sid)
            print 'BaseHandler,session:addCookie'
            self.set_secure_cookie(name = sessionTag, values = session.sessionid, expires_days=None)
        return session
*************************************************************
继承BaseHandler的handler可以直接使用
    self.session['key'] = 'value'
    value =  self.session['key']
    
*************************************************************

'''
class RedisSessionStore:

    def __init__(self, redis_connection=None, **options):
        self.options = {'key_prefix': 'session', 'expire': 1800,
                        'logined_expire': datetime.timedelta(days=10)}  # 前缀
                                                                        # 不登录用户的session存活时间
                                                                        # 已登录用户的session存活时间
        self.options.update(options)
        self.redis = redis_connection if redis_connection else getRedisConn()

    def prefixed(self, sid):
        return '%s:%s' % (self.options['key_prefix'], sid)

    def generate_sid(self):
        return uuid4().get_hex()

    def get_session(self, sid, name):
        data = self.redis.hget(self.prefixed(sid), name)
        session = (pickle.loads(data) if data else dict())
        return session

    def set_session(
        self,
        sid,
        session_data,
        name,
        logined=False,
        ):
        '''
        对于已登录的用户应为logined=True
        保存时间比较久
        '''

        expiry = self.options['expire']
        self.redis.hset(self.prefixed(sid), name, pickle.dumps(session_data))
        if logined:
            logined_expiry = self.options['logined_expire']
            if logined_expiry:
                self.redis.expire(self.prefixed(sid), logined_expiry)
        elif expiry:
            self.redis.expire(self.prefixed(sid), expiry)

    def delete_session(self, sid):
        self.redis.delete(self.prefixed(sid))


class Session:

    def __init__(
        self,
        session_store,
        sessionid=None,
        logined=False,
        ):
        self._store = session_store
        self._logined = (logined if sessionid else False)
        self._sessionid = \
            (sessionid if sessionid else self._store.generate_sid())
        self._sessiondata = self._store.get_session(self._sessionid, 'data')
        self.dirty = False

    def clear(self):
        self.dirty = False
        self._store.delete_session(self._sessionid)

    def marge(self, anotherSession):
        self._sessiondata.update(anotherSession._sessiondata)
        anotherSession.clear()

    def access(self, remote_ip):
        access_info = {'remote_ip': remote_ip, 'time': '%.6f' % time.time()}
        self._store.set_session(self._sessionid, 'last_access',
                                pickle.dumps(access_info))

    def last_access(self):
        access_info = self._store.get_session(self._sessionid, 'last_access')
        return pickle.loads(access_info)

    @property
    def sessionid(self):
        return self._sessionid

    def __getitem__(self, key):
        try:
            return self._sessiondata[key]
        except:
            return None
        
    def __setitem__(self, key, value):
        self._sessiondata[key] = value
        self._dirty()

    def __delitem__(self, key):
        del self._sessiondata[key]
        self._dirty()

    def __len__(self):
        return len(self._sessiondata)

    def __contains__(self, key):
        return key in self._sessiondata

    def __iter__(self):
        for key in self._sessiondata:
            yield key

    def __repr__(self):
        return self._sessiondata.__repr__()

    def __del__(self):
        if self.dirty:
            self._save()

    def _dirty(self):
        self.dirty = True

    def _save(self):
        self._store.set_session(self._sessionid, self._sessiondata, 'data',
                                self._logined)
        self.dirty = False


if __name__ == '__main__':

#    print 'hello'
#    print str(10*24*3600)
    print '1'
    redis = getRedisConn()
    print '2'
#    redis.delete('试试中文')
#    redis.set('试试中文','不试')
#    print redis.get('试试中文')
#    sessionPool = RedisSessionStore(redis_connection=redis)
#    session = Session(session_store = sessionPool, sessionid = 'baojianpin',logined=True)
#    session['test'] = 'goodmorning'
#    session['hello'] = 'word'
#
#    print session['good']
    print redis.hget('session:baojianpin','data')
    print redis.ttl("session:baojianpin")

    pass

# '''
#    使用dict实现的简单sessionStore
#    使用方式
# '''
# class SessionStore(object):
#
#    def __init__(self):
#        self.db = getRedisConn2()
#        self.session_poll = self.db
#      #  self.session_last = {}  #'session的最后访问时间
#      #  t = threading.Thread(target=self.__remove_dead_session)  #定时对sessionStore中没用的session进行删除
#       # t.setDaemon(True)
#      #  t.start()
#
#    def generate_sid(self):
#        return uuid4().get_hex()
#
#    def get_session(self,sid=None):
#        if not sid:
#            sid = self.generate_sid()
#        if sid in self.session_poll:
#            self.session_last[sid] = time.time()
#            return self.session_poll[sid]
#        self.session_last[sid] = time.time()
#        self.session_poll[sid] = {}
#        return self.session_poll[sid]
#
#    def last_access(self,sid):
#        return self.session_last[sid]
#
#    def delete_session(self,sid):
#        self.session_last.pop(sid)
#        self.session_poll.pop(sid)
#
#    def __remove_dead_session(self):
#        while True:
#            t = time.time()
#            for sid in self.session_last:
#                if t - self.session_last[sid] > 3600 :
#                    self.delete_session(sid)
#            time.sleep(60)
#
# class Session:
#
#    def __init__(self, session_store, sessionid=None):
#        self._store = session_store
#        self._sessionid = sessionid if sessionid else self._store.generate_sid()
#        self._sessiondata = self._store.get_session(self._sessionid)
#
#    def clear(self):
#        self._store.delete_session(self._sessionid)
#
#    def last_access(self):
#        return self._store.last_access(self._sessionid)
#
#    @property
#    def sessionid(self):
#        return self._sessionid
#
#    def __getitem__(self, key):
#        return self._sessiondata[key]
#
#    def __setitem__(self, key, value):
#        self._sessiondata[key] = value
#
#    def __delitem__(self, key):
#        del self._sessiondata[key]
#
#    def __len__(self):
#        return len(self._sessiondata)
#
#    def __contains__(self, key):
#        return key in self._sessiondata
#
#    def __iter__(self):
#        for key in self._sessiondata:
#            yield key
#
#    def __repr__(self):
#        return self._sessiondata.__repr__()
