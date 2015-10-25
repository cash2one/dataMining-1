distvector <- function(x,data) 
{ 
  ddata <- t(data)-x 
  dv <- apply(ddata^2,2,sum) 
} 
# data：数据可以是nxp或距离矩阵 
# eps：对象的ε-临域  
# MinPts：类中包含的最小数目对象 
# scale: 数据是否要标准化？ 
# distances:选TURE时表示数据是距离矩阵  
# showplot: 计算过程是否要可视化？ 
# countmode:当计算过程空值DBSCAN将会给出相应的信息 
DBSCAN <- function(data,eps,MinPts=5, scale=FALSE, distances=FALSE, 
                   showplot=TRUE, islable=FALSE,isheader=FALSE,
                   countmode=c(1,2,3,5,10,100,1000,5000,10000,50000)){ 
  data <- as.matrix(data)
  n <- nrow(data)
  if (scale) data <- scale(data) #是否要标准化
  unregpoints <- rep(0,n) 
  e2 <- eps^2 
  cv <- rep(0,n) 
  cn <- 0 
  i <- 1 
  for (i in 1:n){ 
    if (i %in% countmode) cat("Processing point ", i," of ",n, ".\n") 
    unclass <- cv<1 
    if (cv[i]==0){ 
      if (distances) seeds <- data[i,]<=eps 
      else{ 
        seeds <- rep(FALSE,n) 
        seeds[unclass] <- distvector(data[i,],data[unclass,])<=e2 
      } 
      if (sum(seeds)+unregpoints[i]<MinPts) cv[i] <- (-1) 
      else{ 
        cn <- cn+1 
        cv[i] <- cn 
        seeds[i] <- unclass[i] <- FALSE 
        unregpoints[seeds] <- unregpoints[seeds]+1 
        while (sum(seeds)>0){ 
          #if (showplot) plot(data,col=1+cv) #绘图
          unclass[seeds] <- FALSE 
          cv[seeds] <- cn 
          ap <- (1:n)[seeds] 
          #print(ap) #打印ap
          seeds <- rep(FALSE,n) 
          for (j in ap){ 
            #if (showplot) plot(data,col=1+cv) #绘图
            jseeds <- rep(FALSE,n) 
            if (distances) jseeds[unclass] <- data[j,unclass]<=eps 
            else{ 
              jseeds[unclass] <- distvector(data[j,],data[unclass,])<=e2 
            } 
            unregpoints[jseeds] <- unregpoints[jseeds]+1 
           if (cn==1) 
             cat(j," sum seeds=",sum(seeds)," unreg=",unregpoints[j], 
               " newseeds=",sum(cv[jseeds]==0),"\n") 
            if (sum(jseeds)+unregpoints[j]>=MinPts){ 
              seeds[jseeds] <- cv[jseeds]==0 
              cv[jseeds & cv<0] <- cn 
            } 
          } # for j 
        } # while sum seeds>0 
      } # else (sum seeds + ... >= MinPts) 
    } # if cv==0 
  } # for i 
  if (sum(cv==(-1))>0){ 
    noisenumber <- cn+1 
    cv[cv==(-1)] <- noisenumber 
  } 
  else 
    noisenumber <- FALSE 
  out <- list(classification=cv, noisenumber=noisenumber, 
              eps=eps, MinPts=MinPts, unregpoints=unregpoints) 
  out 
} # dbscan 
# classification:分类向量 
# noisenumber:分类向量中包含的噪音点数目 
# unregpoints: 忽略...


library(cluster) 
require(graphics)
data <- read.table(file ="iris.txt",header=FALSE)
column <- ncol(data)
data <- data[,-column]
model <- DBSCAN(data,eps=0.65,MinPts=4,distances=F) 
print(model)
summary(model)
plot(as.matrix(data),col=model$classification,pch="+")


