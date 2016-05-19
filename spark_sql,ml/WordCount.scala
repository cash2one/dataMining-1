package com.dt.spark

import org.apache.spark.SparkConf 
object WordCount{
	def main(args:Array[String]){
		/**
		* 创建SparkConf 的配置对象
		*/
		val conf = new SparkConf();
		conf.setAppName("MY first Spark ")
		conf.setMaster("local")// 此时，程序在本地执行，不需要spark 集群
		// conf.setMaster("spark:// Master:7077 ")
		// 创建SparkContext 对象,是spark程序的唯一入口，
		val sc = new SparkContext(conf)
		// 创建RDD ，数据会被RDD 分成一系列的partitions，分配到每个partitions的数据属于一个task 的处理范畴，，
		val lines:RDD[String] = sc.textFile("D//Big_Data")
		// 对RDD 进行transformation 处理 map，filter 等高阶函数编程 ，

		val words = lines.flatMap(_.split(" "))
		val pairs = words.map(_=>(_,1))
		val wordCount = pairs.reduceByKey(_+_)
		wordCount.foreach(pairs=>println(pairs._1+":"+pairs._2))
	}
}