from xml.etree.ElementTree import ElementTree
from Queue import Queue
import re
import threading
from BaseTaskThreadSQL import ProcTask, SQLTask
import ibbdlib
import ibbdlib.ibbdlog
import time
from datetime import datetime


fetch_date = '2012-12-28'
fetch_date_short = fetch_date.replace('-', '')
log = ibbdlib.ibbdlog.get_logger(log_file='etlhj-test.%s.log' % fetch_date_short)

def getTaskList(filename):
	doc = ElementTree(file=filename)
	tasks= doc.getroot()
	taskDict={}
	for task in tasks.findall('task') :
		name =task.get('name')
		deal =task.get('deal')
		depend = task.get('depend').strip()
		execution = task.find('exec')
		execType = execution.get('type')
		sqlstr = execution.text.strip()
		str=[]
		str=[command.strip().strip('\n') for command in sqlstr.split(';')
                            if command.strip('-').strip(' ').strip('\n') != '']
#		print str
		dependList=[]
		dependList=[t.strip() for t in depend.split(',') if t.strip(' ') != '']
		if execType=='proc':
			task = ProcTask(name,dependList,deal,log)
			proc=[ [getProc(p),getProcParam(p)] for p in str if getProc(p) !='']
			task.setProc(proc)
			
		elif execType=='sql':
			task = SQLTask(name,dependList,deal,log)
			task.setSQL(str)
		taskDict[task.getName()]=task
	return taskDict

def getProc(text):
	return re.findall(r'(.+?)\(',text)[0].strip()
def getProcParam(text):
	return re.findall(r'DATE\(\'(.+?)\'\)',text,re.I)	
def _get_db_pool():
    return ibbdlib.get_db_pool(max_connections=500, **{'host': '223.4.246.146', 'user': 'huangj', 'passwd': 'huangj'})
 	
def _get_time_str():
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')   
   
 	
if __name__ == '__main__':
	#start the db connection
	db_pool = _get_db_pool()
	block_async_num = 6
	t_queue = Queue()
	command_async_num = 3
		
	taskList=getTaskList("task_20121228.xml")
	for taskKey in taskList.keys():
		task = taskList.get(taskKey)
		if not task.getDepend() :
			t_queue.put(task)
		else : 
			dependList = task.getDepend()
			for depend in dependList:
				dependTask = taskList.get(depend)
				dependTask.addFlower(task)
	
	blockRunning = threading.Semaphore(block_async_num)
	
	for i in range(len(taskList)):
		blockRunning.acquire()
		print "queue size  %s : " %t_queue.qsize()
		t= t_queue.get()
		t.setSemaphore(blockRunning)
		t.setQueue(t_queue)
		t.setDB_pool(db_pool)
		t.daemon = True
		t.start()
	t_queue.join()	
	db_pool.disconnect()
	log.info('finished')
	print "finished"
	
	
	
	
	
	
	