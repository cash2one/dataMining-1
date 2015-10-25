# test plot
import numpy as np
import mlpy
import matplotlib.pyplot as plt
from matplotlib.mlab import PCA
#from mpl_toolkits.mplot3d import Axes3D
from matplotlib.font_manager import FontProperties
iris = np.loadtxt('/home/ruige/KNN/trainIris.txt',delimiter=',')
x,y = iris[:,:4], iris[:,4].astype(np.int)
#print x,y
pca = PCA(x)
x1 = []
y1 = []
for item in pca.Y:
	x1.append(item[0])
	y1.append(item[1])
fig1 = plt.figure()
pltData = [x1,y1]
plt.scatter(pltData[0],pltData[1],c=y)
plt.show()
#pca.learn(x)
#print pca
#fig1 = plt.figure(1)
#plt.scatter(pca,c=y)
#plt.show()
