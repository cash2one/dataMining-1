#_*_coding:utf-8-*
"使用过mongodb，熟悉mysql，Mssql等数据库，熟悉python,php,R 编程语言，熟悉sklearn库中常用算法，django，熟悉php网站后台开发"
"life is short , you need python ,sklearn is a good tool for you "
# 要养成自己的编程规范，自己定义的函数，变量名称，类名要应用驼峰命名法，
# 系统的内置以及加载的库用"_"分开的命名方式，代码缩进要严格控制。
" machine learing systems with python "
#import numpy,scipy
from sklearn import linear_model
clf = linear_model.LinearRegression()
clf.fit([[0,0,1],[1,1,2],[2,2,3]],[0,1,2])
#print clf.coef_,clf.intercept_
#print linear_model.LinearRegression()
#Nearest neighbor classfiction
sx
import numpy
def distance(p0,p1):
	'Computes squared euclidean'
	return numpy.sum((p0-p1)**2)

def nn_classify(training_set,training_lables,newtest):
	dists = numpy.array([distance(t,newtest) for t in training_set])
	nearest = dists.argmin(dists)
	return training_lables[nearest]

from sklearn.feature_extraction.text import CountVectorizer
vectorizer = CountVectorizer(min_df=1)
#print vectorizer	
# 自然语言处理的库

import nltk

# Kmeans algorithm 做聚类
from sklearn.cluster import KMeans
km=KMeans(n_clusters=5,init='random',n_init=1,verbose=1)
#km.fit(dataset)

# "逻辑回归"
from sklearn.linear_model import LogisticRegression
clf = LogisticRegression()

#
#决策树回归
#
import numpy as np
import matplotlib.pyplot as plt
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import AdaBoostRegressor

# Create a the dataset
rng = np.random.RandomState(1)
X = np.linspace(0, 6, 100)[:, np.newaxis]
y = np.sin(X).ravel() + np.sin(6 * X).ravel() + rng.normal(0, 0.1, X.shape[0])

# Fit regression model
clf_1 = DecisionTreeRegressor(max_depth=4)

clf_2 = AdaBoostRegressor(DecisionTreeRegressor(max_depth=4),
                          n_estimators=300, random_state=rng)
clf_1.fit(X, y)
clf_2.fit(X, y)

# Predict
y_1 = clf_1.predict(X)
y_2 = clf_2.predict(X)

# Plot the results
plt.figure()
plt.scatter(X, y, c="k", label="training samples")
plt.plot(X, y_1, c="g", label="n_estimators=1", linewidth=2)
plt.plot(X, y_2, c="r", label="n_estimators=300", linewidth=2)
plt.xlabel("data")
plt.ylabel("target")
plt.title("Boosted Decision Tree Regression")
plt.legend()
plt.show()

from sklearn import svm
X = [[0, 0,0.5], [1, 1,1.5],[2,3,4]]
y = [0,1,1]
clf = svm.SVC()
clf.fit(X,y)



#_*_coding:utf-8-*
from sklearn import svm
X = [[0, 0,0.5], [1,1,1.5],[2,3,4],[0,0,0.4]]
y = [0,1,2,0]
clf = svm.SVC()
clf.fit(X,y)
dec = clf.decision_function([[1,1,1.5]])
print dec

import numpy as np
from sklearn.lda import LDA
X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2],[4,3]])
y = np.array([1, 1, 1, 2, 2, 3,3])
clf = LDA()
clf.fit(X, y)
LDA(n_components=None, priors=None)
print(clf.predict([[-0.8, -1],[3,4]]))

# sift 算法
import numpy as np
import cv2
from matplotlib import pyplot as plt
img1 = cv2.imread('box.png',0) # queryImage
img2 = cv2.imread('box_in_scene.png',0) # trainImage
# Initiate SIFT detector
sift = cv2.SIFT()
# find the keypoints and descriptors with SIFT
kp1, des1 = sift.detectAndCompute(img1,None)
kp2, des2 = sift.detectAndCompute(img2,None)
# BFMatcher with default params
bf = cv2.BFMatcher(cv2.Norm_L2)
matches = bf.knnMatch(des1,des2, k=2)
# Apply ratio test
# 比值测试，首先获取与A 距离最近的点B（最近）和C（次近），只有当B/C
# 小于阈值时（0.75）才被认为是匹配，因为假设匹配是一一对应的，真正的匹配的理想距离为0
good = []
for m,n in matches:
if m.distance < 0.75*n.distance:
good.append([m])
# cv2.drawMatchesKnn expects list of lists as matches.
img3 = cv2.drawMatchesKnn(img1,kp1,img2,kp2,good[:10],flags=2)
plt.imshow(img3),plt.show()
surf = cv2.SURF(400)

