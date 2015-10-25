# -*- coding: utf-8 -*-
from numpy import *
import operator
#创建数据集
def createDataSet():
    group = array([[1.0,1.1],[1.0,1.0],[0,0],[0,0.1]])
    labels = ['A','A','B','B']
    return group,labels
#k近邻算法
def classify0(inX,dataSet,labels,k):
    dataSetSize=dataSet.shape[0]
    diffmat = tile(inX,(dataSetSize,1)) - dataSet
    distance= ((diffmat**2).sum(axis=1))**0.5
    sortedDistIndicies = distance.argsort()
    classCount={}
    for i in range(k):
        voteIlabel=labels[sortedDistIndicies[i]]
        classCount[voteIlabel] = classCount.get(voteIlabel,0)+1
    sortedClassCount = sorted(classCount.iteritems(),key=operator.itemgetter(1),reverse=True)
    return sortedClassCount[0][0]    


    
