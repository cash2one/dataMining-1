#train：训练样本的特征矩阵，其中每行代表一个训练样本的特征向量
#test：测试样本
#cl：factor of true classifications of training set
#k：最近邻个数
#prob：If this is true, the proportion of the votes for the winning class are returned as attribute prob.
library(class)
data(iris3) #使用Fisher的鸢尾花（Iris）数据
     train <- rbind(iris3[1:30,,1], iris3[1:30,,2], iris3[1:30,,3])  #每组选前30个数据为训练数据
     test <- rbind(iris3[31:50,,1], iris3[31:50,,2], iris3[31:50,,3])#剩下的为测试数据 
     cl <- factor(c(rep("s",30), rep("c",30), rep("v",30))) 
     knn(train, test, cl, k = 3, l=0,prob= TRUE)                         #进行KNN算法分类 
     attributes(.Last.value)
 
 

