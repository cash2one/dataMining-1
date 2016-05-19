import org.apache.spark.{SparkConf,SparkContext} 

object RDD_Base{
	def main(args:Array[String]){
		// 创建一个scala 集合
		val conf = new SparkConf()
		conf.setAppName("collection")
		conf.setMaster("local")
		val sc = new SparkContext(conf)
		val numbers  = 1 to 100
		val rdd = sc.parallelize(numbers)
		val sum = rdd.reduce(_+_)
		println("1+2+3+...+100="+sum)

	}
}