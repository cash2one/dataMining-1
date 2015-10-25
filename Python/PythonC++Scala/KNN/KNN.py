#urs/bin/KNN-algrithm
# author:apple
# date:2014/4/5

from numpy import *
import operator
# input the dataset,convert to matrix
'''
###  function name:file2Mat()
###  input:the training-file name & the dataset-dimension
###  output:result-matrix & classLabel-vector
'''
def file2Mat(TrainingDataName,paraNumber):
	Tfile = open(TrainingDataName)
	lines = Tfile.readlines()
	lineNum = len(lines)
	resultMat = zeros((lineNum,paraNumber))
	classLabel = []
	for i in range(lineNum):
		line = lines[i].strip() # trim two side's space
		itemMat = line.split(',')
		resultMat[i,:] = itemMat[0:paraNumber]
		classLabel.append(itemMat[-1])
	Tfile.close()
	return resultMat,classLabel;
'''
### function:Normlize(),(preprocess data)
### input:data-matrix
### output:processed data(matrix),each column's min values & (max-min)
'''
def Normlize(dataSet):
	minVals = dataSet.min(0)
	maxVals = dataSet.max(0)
	ranges = maxVals - minVals
	normMat = zeros(shape(dataSet))
	size = normMat.shape[0]
	normMat = dataSet - tile(minVals,[size,1])
	normMat = normMat/tile(ranges,[size,1])
	return normMat,minVals,ranges;
'''
### function:knnClassify(),label the test data
### input:test data(matrix),trainingMat,classLabel,k(the first k)
### output:label
'''
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
'''
### function:Test(),get the test's data label
### input:TrainingDataName,testfilename
### output:errorRate
'''
def Test(trainFileName,testFileName):
	trainingMat,classLabel = file2Mat(trainFileName,4)
	trainingMat,minVals,ranges = Normlize(trainingMat)
	testMat,testLabel = file2Mat(testFileName,4)
	testSize = testMat.shape[0]
	errorCount = 0.0
	labels = []
	for i in range(testSize):
		result = knnClassify((testMat[i]-minVals)/ranges,trainingMat,classLabel,20)
		labels.append(result)
		if result != testLabel[i]:
			errorCount += 1.0
	errorRate = errorCount/(float)(len(testLabel))
	return errorRate,labels;
# function:main()
#if __name__ == '__main__':
if __name__ == '__main__':
	#errorRate = test('TrainingData.txt','TestData.txt')
	#print("the error rate is : %f" %(errorRate))
	trainFileName = '/home/ruige/KNN/trainIris.txt'
	testFileName = '/home/ruige/KNN/testIris.txt'
	errorRate,labels = Test(trainFileName,testFileName)
	#trainingMat,classLabel = file2Mat(TrainingDataName,4)
	print errorRate,labels

			

