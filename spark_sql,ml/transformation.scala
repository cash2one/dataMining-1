import org.apache.spark.{SparkConf,SparkContext}
// 计算机编程就是依靠多练，没有技巧，
object transformation  {
	def main(args:Array[String]){
		sc = sparkContext("T")
		mapT(sc)
		filterT(sc)
		flatMapT(sc)
		reduceByKeyT(sc)
		groupByKeyT(sc)
		joinT(sc)
		sc.stop() // 停止sparkContext ，销毁基本的Driver 对象，释放资源
	}

	def sparkContext(name:String) = {
		val conf = new SparkConf().setAppName(name).setMaster("local")
		val sc = new SparkContext(conf)
		sc
	}

	def mapT(sc:SparkContext){
		val nums = sc.parallelize(1 to 10 )
		val mapped = nums.map(x => x*2 )
		mapped.collect.foreach(println)
	}

	def filterT(sc:SparkContext){
		val nums = sc.parallelize(1 to 10 )
		val filtered = nums.filter(x%2 == 0)
		filtered.collect.foreach(println)
	}

	def flatMapT(sc:SparkContext){
		val bigData = Array("scala spark","Java hadoop","Java Tachyon")
		val bigDataString = sc.parallelize(bigData)
		val words = bigDataString.flatMap(_.split(" "))  // 先分割单词，再进行压扁操作
		words.collect.foreach(println)
	}
	def groupByKeyT(sc:SparkContext){
		val data = Array(Tuple2(100,"spark"),Tuple2(100,"Tachyon"),Tuple2(80,"hadoop")，Tuple2(80,"flink"))
		val dataRdd = sc.parallelize(data)
		val grouped = dataRdd.groupByKey() // 按照相同的key 对value 进行分组，分组后的value是一个集合，
		grouped.collect.foreach(println)
	}
	def reduceByKeyT(sc:SparkContext){
		// wordCount 
		val wordCount = sc.textFile("hdfs://localhost:9000/wordCount").flatMap(_.split(" ")).map(x=>(x,1)).reduceByKey(_+_)
		wordCount.collect().foreach(println)

	}
	// join ,cogroup 运算 

	// 大数据中最重要的算子操作就是join，整合数据孤岛

	def joinT(sc:sparkContext){
		val students = Array(
			Tuple2(1,"Spark"),
			Tuple2(2,"Tachyon"),
			Tuple2(3,"Hadoop")
		)
		val studentsScores = Array(
			Tuple2(1,100),
			Tuple2(2,98),
			Tuple2(3,70)
		)
		val S = sc.parallelize(students)
		val score = sc.parallelize(studentsScores)
		val s_join_score = S.join(score)
		s_join_score.collect().foreach(println)
		/** result 
		 *	(1,(spark,100))
		 *	(3,(hadoop,65))
		 *	(2,(techyon,95))
		 *
		 */ 
	}
	// cogroup 是spark 中第二重要的算子 ，
	def cogroupT(sc:SparkContext){

	}
}