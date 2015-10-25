#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
auth: 黄健
date: 2012.12.27
线程任务基类
'''

__all__ = ['ProcTask', 'SQLTask']

import threading
import time
from  datetime import datetime
import Queue

# 字典,key为线程block数字,后面是线程数量
specTask={"2":5,}


def _get_time_str():
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S') 

class BaseTaskThread(threading.Thread):
    
    db_pool= None
    queue = Queue.Queue()
    # args:任务名称,依赖list,是否异步，日志
    def __init__(self,name,depend,async,log):
        threading.Thread.__init__(self)
        self.name=name
        self.depend=depend
        self.async=async
        self.log =log
        self.flowerList=set()
#   空方法，子类必需覆盖此方法
    def execute(self):
        pass

    def run(self):
        start_time = datetime.now()
        while 1:
#            try:
            self.log.info('%s block %s start to run', _get_time_str(), self.getName())            
            self.execute()
            self.db_pool.release(self.db_conn)
            self.sema.release()
            self.log.info('%s block %s dependList : %s', _get_time_str(), self.getName(),",".join([f.getName() for f in self.flowerList])) 
            if self.flowerList :
                self.updateFlower()
            for readyFlower in self.flowerList:
                #发现不再存在依赖就
                self.log.info('%s block %s  . block %s dependList : %s ', _get_time_str(), self.getName(),readyFlower.getName(),",".join( readyFlower.getDepend())) 
                if not readyFlower.getDepend():
                    self.log.info("------block %s ----insert  block %s" ,self.getName(),readyFlower.getName())
                    self.queue.put(readyFlower)
            break
#            except Exception, e:
#                print Exception, ":" , e
        end_time = datetime.now()
        processTime = (end_time - start_time).microseconds
        self.log.info('%s block %s success to run ,process time : %s ', _get_time_str(), self.getName(),processTime)
        self.queue.task_done()
        return   
    
    def setQueue(self,queue):
        self.queue=queue
    
    def setSemaphore(self,sema):
        self.sema=sema
        
    def setDB_pool(self, db_pool):
        self.db_pool= db_pool
        self.db_conn= db_pool.get_connection()
        
    def getDB_pool(self):
        return self.db_pool
    
    def getName(self):
        return self.name
    
    def getDepend(self):
        return self.depend
    
    def getAsync(self):
        return self.async

    #观察者的操作方法
    def addFlower(self,flower):
        self.flowerList.add(flower)
    #flowerlist 是一个set
    def getFlowerList(self):
        return self.flowerList
    def removeFlower(self,flower):
        self.flowerList.remove(flower)
    #调用每个观察者的方法
    def updateFlower(self):
        for flower in self.flowerList:
            flower.updateDepend(self.getName())
            
    #从每个任务类依赖里面删除依赖name
    def updateDepend(self,name):
        lock = threading.Lock()
        lock.acquire()
#        print "block %s remove depend %s"%(self.getName(), name)
        self.depend.remove(name)
        lock.release()


#处理储存过程的任务类 
class ProcTask(BaseTaskThread):
    def __init__(self,name,depend,async,log):
        BaseTaskThread.__init__(self,name,depend,async,log)
           
    def execute(self):
        if self.getAsync()=="async":
            self.log.info("block %s select method async start")
            task_queue=Queue.Queue()
            for p in self.getProc():
                task_queue.put(p)
            command_async_num = 3 if not specTask.has_key(self.getName()) else specTask[self.getName()]
            for i in range(command_async_num):
                t = MicroPThread(self.getName(),task_queue,self.getDB_pool(),self.log)
                t.daemon =True
                t.start()
            task_queue.join()
        elif self.getAsync() == 'sync':
            for p,params in self.getProc():
                print "proc : " ,p
                print "params : ", params
                self.callProc(p,params)
        
                
    def callProc(self,proc,params):
        self.log.info('%s block %s %s(%s) start', _get_time_str(),self.getName(), proc, ','.join(params))
        cursor = self.db_conn._db.cursor()
        cursor.callproc(proc, tuple(params)) 
        self.db_conn._db.commit()
        cursor.close()
        self.log.info('%s block %s %s %s success', _get_time_str(),self.getName(), proc, ','.join(params))
#        time.sleep( 5 )
#        print "test proc-----%s-----------"
#        print proc
#        print "test proc=================="  
          
    
        
    def setProc(self,proc):
        self.proc=proc
        
    def getProc(self):
        return self.proc
    
    def setParams(self,params):
        self.params=params
        
    def getParams(self):
        return self.params            
        
#处理SQL的任务类
class SQLTask(BaseTaskThread):
    def __init__(self,name,depend,async,log):
        BaseTaskThread.__init__(self,name,depend,async,log)
       
    def execute(self):
        if self.getAsync()=="async":
            task_queue=Queue.Queue()
            for p in self.getSQL():
                task_queue.put(p)
            command_async_num = 3 if not specTask.has_key(self.getName()) else specTask[self.getName()]
            for i in range(command_async_num):
                t = MicroSThread(self.getName(),task_queue,self.getDB_pool(),self.log)
                t.daemon =True
                t.start()
            task_queue.join()
        elif self.getAsync() == 'sync':
            for sql in self.getSQL():
                self.execSQL(sql)

        
    def execSQL(self,sql):
        self.log.info('%s block %s  start %s', _get_time_str(), self.getName(), sql)
        cursor = self.db_conn._db.cursor()
        cursor.execute(sql) 
        self.db_conn._db.commit()
        cursor.close()
        self.log.info('%s block %s success %s', _get_time_str(), self.getName(), sql)
#        time.sleep( 5 )
#        print "test sql-----%s-----------" %self.getName()
#        print sql
#        print "test sql=================="    
    
    def setSQL(self,SQL):
        self.SQL=SQL
        
    def getSQL(self):
        return self.SQL    
    
#处理并行的存储过程的任务类
class MicroPThread(threading.Thread):
    # args:任务队列，连接池，日志文件，参数
    def __init__(self,name,task_queue,db_pool,log):
        threading.Thread.__init__(self)
        self.name=name
        self.task_queue = task_queue
        self.db_pool= db_pool
        self.log= log
        
    def getName(self):
        return self.name
    
    def run(self):
        while True:
            proc = self.task_queue.get()
            self.callProc(proc[0],tuple(proc[1]))
            self.task_queue.task_done()
                
    def callProc(self,proc,params):
#        time.sleep( 5 )
#        print "test proc-----%s-----------"
#        print proc
#        print "test proc=================="
        db_conn= self.db_pool.get_connection()
        start_time = datetime.now()
        self.log.info('%s block %s %s %s start', _get_time_str(),self.getName(), proc, ','.join(params))
        cursor = self.db_conn._db.cursor()
        cursor.callproc(proc, tuple(params)) 
        db_conn._db.commit()
        cursor.close()
        self.db_pool.release(db_conn)
        end_time = datetime.now()
        processTime = (end_time - start_time).microseconds
        self.log.info('%s block %s %s %s success, procees time: %s', _get_time_str(),self.getName(), proc, ','.join(params),processTime)

#处理并行的SQL的任务类     
class MicroSThread(threading.Thread):
    # args:任务队列，连接池，日志文件
    def __init__(self,name,task_queue,db_pool,log):
        threading.Thread.__init__(self)
        self.name = name
        self.task_queue = task_queue
        self.db_pool=db_pool
        self.log= log
    
    def getName(self):
        return self.name
    
    def run(self):
        while True:
            sql = self.task_queue.get()
            self.execSQL(sql)
            self.task_queue.task_done()
                
    def execSQL(self,sql):
#        time.sleep( 5 )
#        print "test sql-----%s-----------" 
#        print sql
#        print "test sql=================="
        db_conn= self.db_pool.get_connection()
        start_time = datetime.now()
        self.log.info('%s block %s  start %s', _get_time_str(), self.getName(), sql)
        cursor = db_conn._db.cursor()
        cursor.execute(sql) 
        db_conn._db.commit()
        cursor.close()
        self.db_pool.release(db_conn)
        end_time = datetime.now()
        processTime = (end_time - start_time).microseconds
        self.log.info('%s block %s success %s , process time: %s', _get_time_str(), self.getName(), sql, processTime)
    