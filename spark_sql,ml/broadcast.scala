val num = 10 
val broadcast = sc.broadcast(num)
val data = sc.parallelize(1 to 10000)
val bn = data.map(_*broadcast.value)

