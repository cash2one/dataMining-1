#-*- coding: utf-8 -*-
from numpy import *
import numpy
def QuasiNewtow(e,Q,b,x0,a,c,dim,po):
	k = 0
	H0 = identity(dim)
	while numpy.linalg.norm(gradient(Q,x0,b))>e:
		p0 = dot(-H0,gradient(Q,x0,b))
		#print numpy.linalg.norm(p0)
		a0 = wolfe(x0,a,c,p0,Q,b,po)
		x1 = x0 + dot(a0,p0)
		s0 = x1 - x0
		y0 = gradient(Q,x1,b)-gradient(Q,x0,b)
		#print s0,y0,dot(s0,y0.T),dot(y0.T,s0)
		pp0 = 1/float(dot(y0.T,s0))
		H1 = mat(identity(dim)-pp0*dot(s0,y0.T))*mat(H0)*mat(identity(dim)-pp0*dot(y0,s0.T))+pp0*dot(s0,s0.T)
		x0 = x1
		H0 = H1
		k = k+1
		print k
	return x0,func(Q,b,x0)

def genMat(dim,low,high):
    matrix1=random.randint(low,high,size=(dim,dim))
    Q = dot(matrix1,matrix1.T)
    b = random.randint(low,high,size=(dim,1))
    x = random.rand(dim,1)*100
    return Q,b,x

def func(Q,b,x):
    return 0.5*mat(x.T)*mat(Q)*mat(x)+mat(b.T)*mat(x)

def gradient(Q,x,b):
    return dot(Q,x)+mat(b)

def wolfe(x,a,c,p,Q,b,po):
	while True:
		if func(Q,b,x+a*p)<= func(Q,b,x)+ dot(gradient(Q,x,b).T,p)*c*a:
			break
		a=po*a
	return a			

if __name__=='__main__':
	Q,b,x0 = genMat(200,-100,100)
	x0,value = QuasiNewtow(0.0001,Q,b,x0,1,0.5,200,0.6)
	print x0,value 