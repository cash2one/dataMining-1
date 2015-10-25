import pandas as pd    
from sklearn import linear_model,tree    
from sklearn.svm import LinearSVR,SVR 
from sklearn.decomposition import PCA , FactorAnalysis  
from sklearn import cross_validation 
import numpy as np 
from sklearn.grid_search import GridSearchCV 
from sklearn import preprocessing  

# author ruige  
# 2015_10_6 

def readData():
    path = "C:\\Users\\ruige\\Desktop\\codeAndData\\data.csv" 
    csv  = pd.read_csv(path)
    return csv 

def randomData(): 
    csv = readData()
    col = ['ID','OS','status_OS','DFS_2','status_DFS_2','DFS_1','status_DFS_1'] 
    for i in col:
        del csv[i]   
    X_scaled = preprocessing.scale(csv) 
    data = X_scaled[:,1:]
    target = X_scaled[:,0] 
    return data ,target  

def Data(): 
    csv = readData()
    col = ['ID','OS','status_OS','DFS_2','status_DFS_2','DFS_1','status_DFS_1','DFS_3'] 
    target = csv['DFS_3'].values
    for i in col:
        del csv[i] 
    return csv.values , target

def norm01Data(): 
    csv = readData()
    col = ['ID','OS','status_OS','DFS_2','status_DFS_2','DFS_1','status_DFS_1'] 
    for i in col:
        del csv[i]   
    min_max_scaler = preprocessing.MinMaxScaler()
    X_scaled = min_max_scaler.fit_transform(csv) 
    data = X_scaled[:,1:]
    target = X_scaled[:,0] 
    print data.shape,target.shape
    return data ,target     

def normPartData():
    csv = readData()
    col = ['ID','OS','status_OS','DFS_2','status_DFS_2','DFS_1','status_DFS_1'] 
    leaveCol = ['status_DFS_3','histologic_grade','gender','stage','t_stage','n_stage','smoke']
    leave = csv.loc[:,leaveCol].values 
    col.extend(leaveCol) 
    for i in col:
        del csv[i] 
    min_max_scaler = preprocessing.MinMaxScaler()
    X_scaled = min_max_scaler.fit_transform(csv)
    data = []
    for i in range(len(leave)):
        data.append(X_scaled[i].tolist()+leave[i].tolist())
    arrdata  = np.array(data) 
    train = arrdata[:,1:]
    target = arrdata[:,0]      
    return  train,target 

def ridgeRegression(train,trainLable,testData):
    clf = linear_model.Ridge(alpha=0.65)
    clf.fit(train,trainLable)
    predict = clf.predict(testData)
    return predict

#""" 0.7187943262411347""" """ 0.7360688956433638""" """0.7446301925025329"""

def elasticRegression(train,trainLable,testData):
    clf = linear_model.ElasticNet(alpha = 0.6, l1_ratio=0.5)
    clf.fit(train,trainLable)
    predict = clf.predict(testData)
    return predict

def treeRegression(train,trainLable,testData):
    clf = tree.DecisionTreeRegressor()
    clf.fit(train,trainLable)
    predict = clf.predict(testData)
    return predict 

def pcaReduce(x,n_components,testData):
    pca = PCA(n_components)            
    pca.fit(x) 
    explained_variance_ratio = pca.explained_variance_ratio_  
    #print explained_variance_ratio 
    newTrainData = pca.fit_transform(x) 
    newTestData = pca.transform(testData) 
    return (newTrainData,newTestData) 

def factorAna(x,testData,n_components):
    fa = FactorAnalysis(n_components) 
    fa.fit(x)   
    newData = fa.transform(testData)  
    return newData    

def svmRegression(train,trainLable,testData):
	clf=SVR(kernel = 'linear',C=1)
	clf.fit(train,trainLable)
	predict = clf.predict(testData)
	return predict 

def linearSVR(train,trainLable,testData):
    clf = LinearSVR()  
    clf.fit(train,trainLable)  
    predict = clf.predict(testData)  
    return predict  

def gridSVR(train,trainLable,testData):
    parameters = {'kernel':('linear', 'rbf'), 'C':[0.1,0.2,0.3,0.4,0.5,0.6,0.7,1,2.5,3.5,4.5,6,7,8,9]}
    svr = GridSearchCV(SVR(),parameters)
    svr.fit(train,trainLable)
    predict = svr.predict(testData)
    return predict 

 #   """0.7326747720364741"""

def lassoRegression(train,trainLable,testData):
    clf = linear_model.LassoLars(alpha = 0.1,max_iter=1000000)
    clf.fit(train,trainLable)
    predict = clf.predict(testData) 
    return predict 

def getTrainTest(data,target): 
    trainData,testData,trainLable,testLable = cross_validation.train_test_split(data,target,test_size=0.5)
    return (trainData,testData,trainLable,testLable) 

def C_index(x,y):
    count = 0 
    n = len(x)
    total = n*(n-1)
    for i in range(n) :
        for j in range(n) :
            if i!=j :
                if((x[i]>=x[j])==(y[i]>=y[j])) :
                    count = count + 1 
    return float(count)/total 

def caculate():
    data ,target = normPartData() 
    result = []
    dataSplit = getTrainTest(data,target) 
    plasso = lassoRegression(dataSplit[0],dataSplit[2],dataSplit[1])
    afterpca = pcaReduce(dataSplit[0],20,dataSplit[1])
    psvm = svmRegression(dataSplit[0],dataSplit[2],dataSplit[1])
    pLinearSvm = linearSVR(dataSplit[0],dataSplit[2],dataSplit[1])
    pGrid = gridSVR(dataSplit[0],dataSplit[2],dataSplit[1])
    pTree = treeRegression(dataSplit[0],dataSplit[2],dataSplit[1])
    pRidge = ridgeRegression(dataSplit[0],dataSplit[2],dataSplit[1])
    pElastic = elasticRegression(dataSplit[0],dataSplit[2],dataSplit[1])
    #pcatree = treeRegression(afterpca[0],dataSplit[2],afterpca[1])
    predict = [plasso,psvm,pLinearSvm,pTree,pRidge,pElastic,pGrid]
    for i in predict:
        cIndex = C_index(i,dataSplit[3])
        result.append(cIndex)
    print result
    return result    

if __name__ == '__main__':
    caculate()
