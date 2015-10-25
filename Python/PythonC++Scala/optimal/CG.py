# -*- coding:utf-8 -*- 
import numpy 
from numpy import *
#A=mat(random.randint(-5,5,size=(5,5)))
#b=mat(random.rand(5,1)*10)
#x0=mat(random.randint(3,1))
x0=mat([[2],[4],[9],[10.0]])
A=mat([[10,3,40,0.7],[2,70,9,17.0],[40,4,1,1.8],[33,24,17,100]])
B=dot(A.T,A)
#print numpy.linalg.eig(A),numpy.linalg.cond(A)
b=mat([[9],[8],[6],[17]])
'''
def norm(x):
    return sqrt(sum(power(x,2)))
'''    
r0=B*x0-b ; p0=-r0; k=0
while numpy.linalg.norm(r0)>0.05:
    a=-float(r0.T*p0)/float(p0.T*B*p0)
    x0=x0+p0*a
    r0=B*x0-b
    beta=float(r0.T*B*p0)/float(p0.T*B*p0)
    p0=-r0+p0*beta
    k=k+1
package=numpy.linalg.solve(B,b)
print x0,r0,k,dot(B,x0),A*x0,package

'''
 [ 0.00174553]
 [ 0.0003667 ]
 [ 0.00123982]
 [ 0.00071782]
 '''
# 在程序的调试过程中，你要搞清楚每一个细节都可以让你的程序失败，
# 从算法到代码不能有半点马虎.
