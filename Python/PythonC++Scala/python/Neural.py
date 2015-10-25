from pybrain.datasets import ClassificationDataSet
from pybrain.utilities import percentError
from pybrain.tools.shortcuts import buildNetwork
from pybrain.supervised.trainers import BackpropTrainer
from pybrain.structure.modules import SoftmaxLayer
from pylab import ion, ioff, figure, draw, contourf, clf, show, hold, plot
from scipy import diag, arange, meshgrid, where
from numpy.random import multivariate_normal

means = [(-1,0),(2,4),(3,1)]
cov = [diag([1,1]), diag([0.5,1.2]), diag([1.5,0.7])]
alldata = ClassificationDataSet(2, 1, nb_classes=3)
for n in xrange(400):
    for klass in range(3):
        input = multivariate_normal(means[klass],cov[klass])
        alldata.addSample(input, [klass])
tstdata, trndata = alldata.splitWithProportion(0.25)
trndata._convertToOneOfMany()
tstdata._convertToOneOfMany()
print tstdata
fnn = buildNetwork(trndata.indim, 3, trndata.outdim, outclass=SoftmaxLayer)      
trainer = BackpropTrainer(fnn, dataset=trndata, momentum=0.1, verbose=True, weightdecay=0.01)

for i in range(10):
	trainer.trainEpochs(1)
	trnresult = percentError(trainer.testOnClassData(),trndata['class'])
	tstresult = percentError(trainer.testOnClassData(dataset=tstdata),tstdata['class'])
	label = trainer.testOnClassData(dataset=tstdata)
	print label,len(label)
	print "epoch: %4d" % trainer.totalepochs, " train error: %5.2f%%" % trnresult, " test error: %5.2f%%" % tstresult