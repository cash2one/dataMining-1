// SparkSQl 的应用开发
// sc is an existing SparkContext.
/**
*spark 中scala 的应用编程开发每时每刻要对类型系统严格的定义 ；
*/
import org.apache._
import org.apache.spark.sql.SQLContext
// Import Row.
import org.apache.spark.sql.Row
// Import Spark SQL data types
import org.apache.spark.sql.types.{StructType,StructField,StringType}

object scala_spark{
	val sc = new SparkConf().setAppName("body_science")
	val sqlContext = new SQLContext(sc)

	def get_tnb(path:String):Unit = {
		val tnb = sc.textFile(path)
		val schemaString = "tjliu tjhao tjtime p_name age kahao xuhao zdtime keshi zdicd zdname"
		val schema = StructType(schemaString.split(" ").map(fieldName =>StructField(fieldName,StringType,true)))
		val rowRdd = tnb.map(_.split("\t")).map(p=>Row(p(0),p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10)))
		val tnbDataFrame = sqlContext.createDataFrame(rowRdd,schema)
		tnbDataFrame.registerTempTable("tnb")
		val results = sqlContext.sql(" SELECT * FROM tnb limit 10 ")
		sc.stop()
		results.collect().foreach(println)
	}

	def tj_jy(path:String):Unit = {
		val tj_jy = sc.textFile(path)
		val schemaString_jy = "tjliu tjhao tjtime p_name age kahao sample_type sample_name value0 value1 value2 unit"
		val schema_jy = StructType(schemaString_jy.split(" ").map(fieldName =>StructField(fieldName,StringType,true)))
		val rowRdd_jy = tj_jy.map(_.split(",")).map(p=>Row(p(0),p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10),p(11)))
		val jyDataFrame = sqlContext.createDataFrame(rowRdd_jy,schema_jy)
		jyDataFrame.registerTempTable("jy")
		val results = sqlContext.sql("SELECT * FROM jy limit 10 ")
		sc.stop()
		results.collect().foreach(println)
	}

	def main(args:Array[String]):Unit = {
		val path = "hdfs://localhost:9000/test/tnb"
		val path2 = "hdfs://localhost:9000/test/tj_jy"
		get_data(path)
	}
}
// 样例数据  T008448420091016,T0084484,2009-10-16 07:52:41.267,吕万梅,43,1906780000021805,尿液,颜色（Color）,淡黄色,0,9,NULL