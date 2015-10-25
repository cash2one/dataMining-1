# -*- coding: utf-8 -*-
from numpy import *
def genMat(dim,low,high):
    matrix1=random.randint(low,high,size=(dim,dim))
    Q = mat(matrix1)*mat(matrix1).T
    b = random.randint(low,high,size=(dim,1))
    x0 = random.rand(dim,1)*10
    return Q,b,x0

def positive(x):
    y = mat([[0] for i in range(len(x))])
    for i in range(len(x)):
        if x[i][0]>=0:
            y[i][0]=x[i][0]
        else:
            y[i][0]=0
    return y       

def func(Q,b,x):
    return 0.5*mat(x.T)*mat(Q)*mat(x)+mat(b.T)*mat(x)

def gradient(Q,x,b):
    return mat(Q)*mat(x)+mat(b)

def proj(Q,b,x,m,beta,s):
    x1 = positive(mat(x)-s*(beta**m)*(mat(Q)*mat(x)+mat(b)))
    return x1

def armijo(Q,b,x0,beta,s,delt):
    
    while True:
        x1 = proj(Q,b,x0,m,beta,s)
        if func(Q,b,x0)-func(Q,b,x1)> = delt*gradient(Q,x0,b).T*(x0-x1):
            break
        m=m+1
    return x1

def e(e,Q,b,x0,beta,s,delt):
    x1 = armijo(Q,b,x0,beta,s,delt)
    while fabs(func(Q,b,x1)-func(Q,b,x0))>e:
        x0 = x1
        x1 = armijo(Q,b,x0,beta,s,delt)
    return x1                       
if __name__=='__main__':
    Q,b,x0 = genMat(5,-7,7)
    x = e(0.02,Q,b,x0,0.6,1.0,0.001)
    print x,func(Q,b,x)     
        