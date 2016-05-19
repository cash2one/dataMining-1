import org.apache.spark.{SparkContext,SparkConf}

object second_sort_dt{
	def main(args:Array[String]){
		val conf = new SparkConf()
		conf.setAppName("secondary sort ")
		conf.setMaster("local")
		val sc = new SparkContext(conf)
		val lines = sc.textFile('path')
		val pairWithSortKey = lines.map(line=>(
			new secondSortKey(line.split(" ")(0).toInt,line.split(" ")(1).toInt),line 
			))
		val sorted  = pairWithSortKey.sortByKey(false)
		val sortRe  = sorted.map(x=>x_.(2))
		sortRe.collect().foreach(println)
	}
}