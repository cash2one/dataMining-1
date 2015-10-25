# -*- coding: utf-8 -*-
# map reduce lambda 表达式的应用,以及相关的区别
import inspect
a = [2,3,4,5]   
b = [4,5,6,7,2]               
c = [x for x in a if x in b]   
print c
from functools import reduce        
print reduce((lambda x,y:x+y),[1,2,3,4]),reduce((lambda x,y:x*y),[1,2,3,4])
print list(range(-5,5))
print list(filter(lambda x:x>0,range(-5,5)))
print map((lambda x : x+10),range(-5,5))
char = "I love you"
char1 = "inornvon"
p = []
print list(char1)
G = (x**2 for x in range(4))
"""for i in G:
	print i
	"""
print list(x**3 for x in range(5)),sum(x**2 for x in range(5)),zip('abc','xyz123')
def mymap(func,*seqs):
	res = []
	for args in zip(*seqs):
		res.append(func(*args))
	return res
print (mymap(abs,range(-2,3)))
t = (x*x for x in range(10))
for x in t:
	print x
ts = {x:x*x for x in range(10)}
print t,ts
def proc(x):
    print x
x = proc('testing 123')
list = [1,2,3]
list1 = list.append(4)
print list
# 对类的封装特性就是这样的。
class FirstClass(object):
	"""docstring for FirstClass"""
	def setdata(self,value):
	    self.data = value
	def display(self):
	    print self.data
q = FirstClass()
q.setdata(42)
print q.display()
for num in (x**2 for x in range(4)):
	print ('%s,%s' % (num,num/2.0))
	
