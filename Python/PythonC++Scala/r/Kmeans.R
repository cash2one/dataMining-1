#?????????ļ???Ԥ????
setwd("/opt/lampp/htdocs/R")
library(cluster)
require(graphics)
#data <- read.table(file=file.choose(),header=FALSE)
data <- read.table("iris.txt",header=FALSE)
row <- nrow(data)
column <- ncol(data)
ClusterNum = 3 #ȷ??????????
model <- kmeans(data[,-column],ClusterNum)#ѡ??????ģ??
print(model)#??ӡģ??
##???ӻ??????о?????????��ɫ???Ǳ???

plot(as.matrix(data[,-column]),col=model$cluster,pch="+",cex=1)
points(model$centers,col=rep(c("blue"),3)[1:ClusterNum],pch=2)
#dev.copy(png,filename="myfile.png",height=600,width=800,bg="white")
#png(filename="temp.png",width=500, height=500)
jpeg(filename="plot.jpg")
dev.off()


