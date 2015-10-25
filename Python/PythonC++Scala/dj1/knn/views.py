from django.shortcuts import render_to_response
from KNN.KNN import Test 
import MySQLdb
def index(request): 
    conn = MySQLdb.connect(host='localhost',user='root',passwd='ibbdhost215',db='knn')
    cur = conn.cursor()
    sql1='select * from train'
    sql2='select * from test'
    cur.execute(sql1)
    trainData=cur.fetchall()
    trainData1=[list(item) for item in trainData]
    cur.execute(sql2)
    testData=cur.fetchall()
    testData1=[list(item) for item in testData]
    errorRate,labels=Test(trainData1,testData1)
    return render_to_response('index.html',{'trainData':trainData,
                                            'testData':testData,
                                            'errorRate':round(errorRate,2),
                                            'labels':labels
                                            })