/**
  *基础topN 排序算法
  *
  */
  object topN  {
  	val conf = new SparkConf()
	conf.setAppName("top N sort ")
	conf.setMaster("local")
	val sc = new SparkContext(conf)
	val lines = sc.textFile("hdfs://path")
	val pairs = lines.map(line=>line.toInt,line)
	val sortedPairs = pairs.sortByKey(false)
	val sortedData = sortedPairs.map(pair=>pair_.2)
	val top5 = sortedData.take(5).foreach(println)
  }
  	
  