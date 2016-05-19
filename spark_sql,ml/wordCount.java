package com.dt.sparkapps.cores; 
import org.apache.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
public class WordCount{
	public void main(String[] arsgs){
		
		// 应用java 开发spark 程序着实操蛋 ，还是学好scala，开发spark ，flink 等程序 
		SparkConf = conf  = new SparkConf().setAppName("spark WordCount by java !").setMaster("local");
		javaSparkContext sc = new javaSparkContext(conf); // 底层其实是scala sc 的封装 ；
		JavaRDD<String> textFile = sc.textFile("hdfs://...");
		JavaRDD<String> words = textFile.flatMap(new FlatMapFunction<String, String>() {
   		public Iterable<String> call(String s) { 
   			return Arrays.asList(s.split(" ")); }
 		});
		JavaPairRDD<String, Integer> pairs = words.mapToPair(new PairFunction<String, String, Integer>() {
   			public Tuple2<String, Integer> call(String s) 
   			{ return new Tuple2<String, Integer>(s, 1); }
 		});
		JavaPairRDD<String, Integer> counts = pairs.reduceByKey(new Function2<Integer, Integer, Integer>() {
   			public Integer call(Integer a, Integer b) { return a + b; }
 		});
 		counts.saveAsTextFile("hdfs://..."); 

	}
}