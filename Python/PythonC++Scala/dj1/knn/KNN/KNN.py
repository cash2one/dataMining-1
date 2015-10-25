from numpy import *
import operator
def dataknn(data):
    resultMat=zeros((len(data),4))
    classLabel=[]
    index=0
    for i in range(len(data)):
    	resultMat[index,:] = data[i][0:4]
        classLabel.append(data[i][-1])
        index+=1
    return resultMat,classLabel   

def Normlize(dataSet):
    minVals = dataSet.min(0)
    maxVals = dataSet.max(0)
    ranges = maxVals - minVals
    normMat = zeros(shape(dataSet))
    size = normMat.shape[0]
    normMat = dataSet - tile(minVals,[size,1])
    normMat = normMat/tile(ranges,[size,1])
    return normMat,minVals,ranges

def knnClassify(inMat,dataSet,labels,k):
    dataSetSize = dataSet.shape[0]
    diffMat = tile(inMat,(dataSetSize,1)) - dataSet # calculate the distance between testdata and traindata
    sqDiffMat = diffMat**2
    distance = sqDiffMat.sum(axis=1)**0.5
    sortedDistIndicies = distance.argsort()
    classCount = {}
    for i in range(k):
        labelName = labels[sortedDistIndicies[i]]
        classCount[labelName] = classCount.get(labelName,0)+1;
    sortedClassCount = sorted(classCount.items(),key=operator.itemgetter(1),reverse=True)
    return sortedClassCount[0][0] # return label

def Test(traindata,testdata):
    trainingMat,classLabel = dataknn(traindata)
    trainingMat,minVals,ranges = Normlize(trainingMat)
    testMat,testLabel = dataknn(testdata)
    testSize = testMat.shape[0]
    errorCount = 0.0
    labels = []
    for i in range(testSize):
        result = knnClassify((testMat[i]-minVals)/ranges,trainingMat,classLabel,20)
        labels.append(result)
        if result != testLabel[i]:
            errorCount += 1.0
    errorRate = errorCount/(float)(len(testLabel))
    return errorRate,labels

