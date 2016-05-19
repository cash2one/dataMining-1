// 全面掌握java ，spark ，scala 代码实战操作，独步江湖 。
import org.apache.spark._ 
import org.apache.spark.{SparkContext,SparkConf}
object SecondarySort {
  def main(args: Array[String]) {
    val sparkConf = new SparkConf().setAppName(" Secondary Sort ")
    sparkConf.set("mapreduce.framework.name", "yarn")
        sparkConf.set("spark.rdd.compress", "true")
        sparkConf.set("spark.serializer","org.apache.spark.serializer.KryoSerializer") // 设置序列化方式
        sparkConf.set("spark.storage.memoryFraction", "0.5")
        sparkConf.set("spark.akka.frameSize", "100")
        sparkConf.set("spark.default.parallelism", "1")
    val sc = new SparkContext(sparkConf)
    val file = sc.textFile("hdfs://namenode:9000/test/secsortdata")
    // 先groupByKey ，再sortByKey 的操作，再对值进行sortWith 
    val rdd = file.map(line => line.split("\t")).map(x => (x(0),x(1))).groupByKey().sortByKey(true).map(x => (x._1,x._2.toList.sortWith(_>_)))
    val rdd2 = rdd.flatMap{
      x =>
      val len = x._2.length
      val array = new Array[(String,String)](len)
      for(i <- 0 until len) {
        array(i) = (x._1,x._2(i))
      }
      array  
    }
    sc.stop()
  }
}