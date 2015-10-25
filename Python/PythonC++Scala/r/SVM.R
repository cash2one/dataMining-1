library("e1071")#载入支持向量机包
require(class)#载入分类包
data <- read.table("iris.txt",header=FALSE)#选择要训练的样本数据文件
col_num <- ncol(data)#训练样本个数
row_num <- nrow(data)#样本的属性个数，其中最后一列为训练样本的原始类标
x <- data[,-col_num]#训练样本的属性
y <- data[,col_num]#训练样本的原始类标

## 分类器模型
model <- svm(x, y)
summary(model)

# 用训练数据做测试
pred <- predict(model, x)

#  精度
table(pred, y)

# compute decision values and probabilities:
pred <- predict(model, x, decision.values = TRUE)
attr(pred, "decision.values")[1:col_num-1,]

# 可视化 (类别用不同颜色标出, 支持向量用+号标出):
plot(cmdscale(dist(data[,-col_num])),
     col = as.integer(data[,col_num]),
     pch = c("o","+")[1:row_num %in% model$index + 1])




