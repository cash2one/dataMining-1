# -*- coding: utf-8 -*-
#author:guorui
#通过这次程序的开发，发现python的自带数据类型非常丰富，元组，字典，列表，集合数组的插入操作，学会了如何构造二叉树
#用pop方法来构建栈的方法,数组，矩阵，转置，求-1,矩阵的乘法,矩阵的遍历，矩阵与数组的差别.'''
import MySQLdb
from numpy import *
import sys  
conn=MySQLdb.connect(unix_socket='/opt/lampp/var/mysql/mysql.sock',host="localhost",user="root",db='test',passwd='')
cur=conn.cursor()
sql1='create table if not exists testap (item1 char(255),item2 char(255),conf char(255))'
sql2='insert into testap(item1,item2,conf)values(%s,%s,%s)'
sql3='create table if not exists testapp(item1 char(100),supportData char(100))'
sql4='insert into testapp(item1,supportData)values(%s,%s)'
sql5='select * from ap'
cur.execute(sql1)
cur.execute(sql3)  
#获取原始数据集
def loadDataSet():
    #array=[line.split(",") for line in open('ap.txt')]
    #matrix1= [[i for i in array[j] if i!="" and i!="\r\n"] for j in range(len(array))]
    #matrix2= [[int(matrix1[j][i]) for i in range(23)] for j in range(len(array))]
    #return matrix2
    cur.execute(sql5)
    results = cur.fetchall()
    mat=[i[1].strip('[').strip(']').split(',') for i in results]
    data=[[int(i) for i in mat[j]] for j in range(len(mat))]
    return data
    #return [[1,3,4],[2,3,5],[1,2,3,5],[2,5],[4,6],[4,5,6]]
#创建候选一项集;    
def createC1(dataSet):
    C1=[]
    for transaction in dataSet:
        for item in transaction:
            if not [item] in C1:
                C1.append([item])
    C1.sort()
    return map(frozenset,C1)
# 扫描候选集在事件中的出现次数，是不是其子集;    
def scanD (D,Ck,minSupport):
    ssCnt={}
    for tid in D:  
        for can in Ck:
            if can.issubset(tid):
                if not ssCnt.has_key(can):
                    ssCnt[can]=1
                else:
                    ssCnt[can]+=1    
    numItems = float(len(D))
    retList = []
    supportData={}
    for key in ssCnt:
        support = ssCnt[key]/numItems
        if support >= minSupport:
            retList.insert(0,key)
            supportData[key]=support
    return retList,supportData
#产生新的候选频繁项集合    
def aprioriGen(Lk,k):
    retList = []
    lenLk = len(Lk)
    for i in range(lenLk):
        for j in range(i+1,lenLk):
            L1 = list(Lk[i])[:k-2];L2 = list(Lk[j])[:k-2]
            L1.sort;L2.sort()
            if L1==L2:
                retList.append(Lk[i] | Lk[j])
    return retList
#在ｐｙｔｈｏｎ里面，有ｃｌａｓｓ作为类，另外函数也可以充当类的功能！'''
#此处调用全部函数。
def apriori(dataSet,minSupport=0.5):  
    C1=createC1(dataSet)
    D=map(set,dataSet)
    L1,supportData=scanD(D,C1,minSupport)
    L=[L1]
    k=2
    while (len(L[k-2])>0):
        Ck = aprioriGen(L[k-2],k)
        Lk,supK = scanD(D,Ck,minSupport)
        supportData.update(supK)
        L.append(Lk)
        k+=1         
    return L,supportData 
# 产生置信规则,    
def generateRules(L,supportData,minConf=0.7):
    bigRuleList = []
    for i in range(1,len(L)):
        for freqSet in L[i]:
            H1=[frozenset([item]) for item in freqSet]
            if (i>1):
                ruelesFormConseq(freqSet,H1,supportData,bigRuleList,minConf)
            else:
                calcConf(freqSet,H1,supportData,bigRuleList,minConf) 
    return bigRuleList
#计算可信度 ，    
def calcConf(freqSet,H,supportData,br1,minConf):
    prunedH= []
    for conseq in H:
        conf = supportData[freqSet]/supportData[freqSet-conseq]
        if conf >= minConf:
            print freqSet-conseq,'-->',conseq,'conf:',conf
            print list(freqSet-conseq),'-->',list(conseq),'conf:',round(conf,2)
            values=(str(list(freqSet-conseq)),str(list(conseq)),str(round(conf,2)))
            br1.append((freqSet-conseq,conseq,conf))
            prunedH.append(conseq)
            cur.execute(sql2,values)
        conn.commit()                
    return prunedH  
#形成规则列表。    
def ruelesFormConseq(freqSet,H,supportData,br1,minConf=0.7):
    m=len(H[0])
    if (len(freqSet)>(m+1)):
        Hmp1 = aprioriGen(H,m+1)
        Hmp1 = calcConf(freqSet,Hmp1,supportData,br1,minConf)
        if (len(Hmp1)>1):
            ruelesFormConseq(freqSet,Hmp1,supportData,br1,minConf)
def mysqlWrite(data):
    array=[]
    for key in data.keys():
        array.append((str(list(key)),str(round(data[key],2))))
    cur.executemany(sql4,array) 

if __name__=="__main__":
    x = float(sys.argv[1])
    y = float(sys.argv[2])
    #x = 0.8
    #y = 0.8
    dataSet=loadDataSet()
    L,suppData=apriori(dataSet,minSupport=x)
    mysqlWrite(suppData)  
    #print suppData
    rules=generateRules(L,suppData,minConf=y)