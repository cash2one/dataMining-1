#_*_coding:utf-8-*
import sys,pywt,re
import time
from os import path,listdir
import numpy as np
from sklearn.svm import LinearSVC,SVC
from sklearn.multiclass import OneVsRestClassifier
from sklearn.lda import LDA
from sklearn import tree
from sklearn.ensemble import RandomForestClassifier
import cv2
traindir = 'C:\\Users\\ruige\\Desktop\\grayface'
testdir = 'C:\\Users\\ruige\\Desktop\\grayfacetest'

def wave(image,lev):
    matrix = image.shape
    transform = pywt.wavedec2(image,'db1',level=lev)
    data = transform[0]
    scale = int(np.ceil(float(matrix[0])/(2**lev))*np.ceil(float(matrix[1])/(2**lev)))
    vector = list(data.reshape(1,scale)[0])
    return vector

def wave0(image,lev):
    matrix = image.shape
    scale = int(np.ceil(float(matrix[0])/(2**lev))*np.ceil(float(matrix[1])/(2**lev)))
    vector = list(image.reshape(1,scale)[0])
    return vector 

def data_target(dirname,lev):
    images = []
    target = []
    imlist = listdir(dirname)
    x1=[]
    for im_name in imlist:
        if im_name[-3:]=='bmp':
            y = int((im_name.split('_')[0]).strip('s'))
            image_filename = path.join(dirname,im_name)
            image = cv2.cvtColor(cv2.imread(image_filename),cv2.COLOR_BGR2GRAY)
            do = wave(image,lev)
            target.append(y)
            x1.append(do)
    return x1,target       

def oneVrest(x,y,test):
    predict=OneVsRestClassifier(SVC(kernel='linear')).fit(x, y).predict(test)
    return predict

def lda(x,y,test):
    clf = LDA()
    clf.fit(x, y)
    return clf.predict(test)

def dcisiontree(x,y,test):
    clf = tree.DecisionTreeClassifier()
    clf.fit(x,y)
    return clf.predict(test)

def ensemble(x,y,test):
    clf = RandomForestClassifier(n_estimators=10)
    clf.fit(x,y)
    return clf.predict(test)

def acura(predict,lable):
    length  = len(predict)
    count = 0
    for i in range(length):
        if predict[i]==lable[i]:
            count=count+1
    return str((float(count)/length)*100)+"%" 
           
if __name__=='__main__': 
    train,target= data_target(traindir,5)
    test,lab = data_target(testdir,5)
    start = time.time()
    svm = oneVrest(train,target,test)
    mid = time.time()
    lda2 =lda(train,target,test)
    mid2 = time.time()
    dtree = dcisiontree(train,target,test)
    mid3 = time.time()
    ens = ensemble(train,target,test) 
    end = time.time()
    print ('svm use time is %.2f'%(mid-start),'lda use time is %.2f'%(mid2-mid),'tree use time is %.2f'%(mid3-mid2),'ensemble use time is %.2f'%(end-mid3))
    print mid-start
    print acura(svm,lab)
    print acura(lda2,lab),acura(dtree,lab),acura(ens,lab)
    print svm,
    print lda2,dtree,ens,lab   
"""
the results of the svm
[10  3 11 11 12 12 13 13 14 14 15 15 16 16 17 17 18 18 19 19  1  1 20 20 21
 21 22 22 23 23 24 24 25 25 26 26 27 27 28 28 29 29  2  2 30 30 31 31 32 32
 33 33 34 34 35 35 36 36 37 37 38 38 39 39  3  3 40 15  4  4 18  5  6  6  7
  7  8  8  9  9] 
[10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 1, 1, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 2, 2, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 37, 38, 38, 39, 39, 3, 3, 40, 40, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9]
[Finished in 2.1s]

the results of the lda
[10 10 11 11 12 12 13 13 14 14 15 15 16 16 17 17 18 18 19 19  1 16 20 20 21
 21 22 22 23 23 24 24 25 25 26 26 27 27 28 28 29 29  2  2 30 30 31 31 32 32
 33 33 34 34 35 35 36 36 37 37 38 38 39 39  3  3 40 15  4  4 40  5  6  6  7
  7  8  8  9  9] [10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 1, 1, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 2, 2, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 37, 38, 38, 39, 39, 3, 3, 40, 40, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9]
[Finished in 1.9s]

the results of the tree
[27 24 11 11 12 12 13 25 14 14 15 33  4 16 17 17 40 25 19 19  8  8 33 20 21
 21 22 22 23 23 24 33  4 25 25  3 27 27 14 37 29 39  2  2 30 30 31 31 32 17
 33 20 34 34  6 35  4 36 37 37 15 38 39 39 32 32 40 25 20  4  5  5  6  6  7
  7  8 27  9  9] [10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 1, 1, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 2, 2, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 37, 38, 38, 39, 39, 3, 3, 40, 40, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9]
[Finished in 2.1s]

the results of the ensemble
[10 10 11 11 12 12 13 26 14 14 15 15 16 16 17 17 18 18 19 19  1  1 20 20 21
 21 22 22 23 23 24 24 25 25 26 26 27 27 28 28 29 29  2  2 30 30 31 31 32 32
 33 33 34 34 40 35  4 36 37 37 38 38 39 39  3  7  5 40  4  4  5  5  6  6 36
  7  8  8  9  9] [10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 1, 1, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 2, 2, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 37, 38, 38, 39, 39, 3, 3, 40, 40, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9]
[Finished in 1.9s]

lev = 5
73.1707317073% 92.6829268293% 70.7317073171% 85.3658536585%

lev = 4
96.3414634146% 96.3414634146% 67.0731707317% 82.9268292683%
96.3414634146% 96.3414634146% 74.3902439024% 85.3658536585%
[Finished in 2.2s]

lev = 3
98.7804878049% 98.7804878049% 70.7317073171% 92.6829268293%
[Finished in 2.3s]

lev = 2
100.0% 97.5609756098% 69.512195122% 84.1463414634%
[Finished in 3.2s]

lev = 1
100.0% 97.5609756098% 62.1951219512% 90.243902439%
[Finished in 7.3s]

lev = 0
100.0% 97.5609756098% 59.756097561% 76.8292682927%
23.7 

('svm use time is 0.39', 'lda use time is 0.05', 'tree use time is 0.17', 'ensemble use time is 0.08')
98.7804878049% 98.7804878049% 68.2926829268% 87.8048780488%
[10 10 11 11 12 12 13 13 14 14 15 15 16 16 17 17 18 18 19 19  1  1 20 20 21
 21 22 22 23 23 24 24 25 25 26 26 27 27 28 28 29 29  2  2 30 30 31 31 32 32
 33 33 34 34 35 35 36 36 37 37 38 38 39 39  3  3 40 40  4  4 18  5  6  6  6
  7  7  8  8  8  9  9] [10 10 11 11 12 12 13 13 14 14 15 15 16 16 17 17 18 18 19 19  1  1 20 20 21
 21 22 22 23 23 24 24 25 25 26 26 27 27 28 28 29 29  2  2 30 30 31 31 32 32
 33 33 34 34 35 35 36 36 37 37 38 38 39 39  3  3 40  5  4  4  5  5  6  6  6
  7  7  8  8  8  9  9] [10  5 30 11 12 12 13 15 14 14 15 15 36 16 17 17 15 18 19 19 18  8 20 20  9
 21 22 22  5  5 36 24 25  3 26 26 11 27 13 32 21 21  2  2 30 30 31 31 32 32
 33  7 34 34  6 32 36 36 37 37 21 33 39 39  3  3 40 15 31  9  5  5  6  6  6
  7  7  8  8 10  9  9] [10 10 11 11 12 12 13 13 14 14 15 15 16 16 17 17 26 18 19 19  1  1 20 20 21
 21 22 22 17 23 24 24 25 25 26 26 27 27 28 28 29 29  2  2 30 30 31 21 32 32
 33 21 34 34 35 35 36  7 37 37 38 38 22 39  4  3  5 12 23  4  5  5  6  6  6
  7  7  8  8  8  9  9] [10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 1, 1, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 2, 2, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 37, 38, 38, 39, 39, 3, 3, 40, 40, 4, 4, 5, 5, 6, 6, 6, 7, 7, 8, 8, 8, 9, 9]
[Finished in 13.2s]

lev = 0
22.635999918
100.0%

lev =1
5.99100017548
100.0%

lev =2
1.43499994278
99.88%

lev =3
0.390000104904
98.7804878049%

lev =4
0.141000032425
96.3414634146%

lev =5
26.4259998798
73.1707317073%
"""






        
        

             