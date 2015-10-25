# -*- coding: utf-8 -*-
# 通常而言，穷举法才是最常用的算法，
def bubble(A):
    for k in range(len(A)-1,0,-1):
        for i in range(k):
            if A[i]>A[i+1]:
                A[i],A[i+1]=A[i+1],A[i]
    return A
x=bubble([3,2,4,1])  
print x              