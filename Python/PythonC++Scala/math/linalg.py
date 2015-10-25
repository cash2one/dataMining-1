import numpy
from numpy import *
A=mat([[10,3,40,0.7],[2,70,9,17.0],[40,4,1,1.8],[33,24,17,100]])
B=dot(A.T,A)
b=mat([[9],[8],[6],[17]])
package=numpy.linalg.solve(B,b)
print dot(A,package),package

'''
python is stronger in numerical computing
[ 0.13510349]
[ 0.06779006]
[ 0.18477953]
[ 0.07773371]

[ 0.06865086]
[ 0.0525211 ]
[ 0.07382   ]
[ 0.1592621 ]

''' 