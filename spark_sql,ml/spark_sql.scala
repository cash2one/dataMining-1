// sqlContext 的开发 ，，，
import org.apache.spark.sql.hive.HiveContext
import org.apache.spark.{SparkContext, SparkConf}
import org.apache.spark.sql.SQLContext
import org.apache.spark.sql.Row
import org.apache.spark.sql.types.{StructType,StructField,StringType}
val path = "hdfs://localhost:9000/user/hive/warehouse/tnb"
val conf = new SparkConf().setAppName("body_science")
val sc = new SparkContext(conf)
val sqlContext = new SQLContext(sc)
val tnb = sc.textFile(path)
val schemaString = "tjliu tjhao tjtime p_name age kahao xuhao zdtime keshi zdicd zdname"
val schema = StructType(schemaString.split(" ").map(fieldName =>StructField(fieldName,StringType,true)))
val rowRdd = tnb.map(_.split("\t")).map(p=>Row(p(0),p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10)))
val tnbDataFrame = sqlContext.createDataFrame(rowRdd,schema)
tnbDataFrame.registerTempTable("tnb")
val results = sqlContext.sql("SELECT age FROM tnb limit 10 ")
results.collect().foreach(println)



// HiveContext  的开发过程 ，，，
import org.apache.spark.sql.hive.HiveContext
import org.apache.spark.{SparkContext, SparkConf}
import org.apache.spark.sql.Row
import org.apache.spark.sql.types.{StructType,StructField,StringType}

val conf = new SparkConf().setAppName("body_science")
val sc = new SparkContext(conf)
  // val sqlContext = new SQLContext(sc)  // SQLContext
val hiveContext = new HiveContext(sc)
val path = "hdfs://localhost:9000/user/hive/warehouse/tnb"
val tnb = sc.textFile(path)
val schemaString = "tjliu tjhao tjtime p_name age kahao xuhao zdtime keshi zdicd zdname"
val schema = StructType(schemaString.split(" ").map(fieldName =>StructField(fieldName,StringType,true)))
val rowRdd = tnb.map(_.split("\t")).map(p=>Row(p(0),p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10)))
val tnbDataFrame =hiveContext.createDataFrame(rowRdd,schema)
tnbDataFrame.registerTempTable("tnb2")
hiveContext.sql("insert into table2 select * from tnb2 ")
val results = hiveContext.sql(" SELECT * FROM table2 limit 10 ")
results.collect().foreach(println)


package scala.com.spark
/**
  * Created by root on 12/30/15.
  */
import org.apache.sql.
import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.sql.SQLContext
// Import Row.
import org.apache.spark.sql.Row
// Import Spark SQL data types
import org.apache.spark.sql.types.{StructType,StructField,StringType}

object first{

  val sqlContext = new SQLContext(sc)

  def get_tnb(path:String):Unit = {
    val tnb = sc.textFile(path)

    val schemaString = "tjliu tjhao tjtime p_name age kahao xuhao zdtime keshi zdicd zdname"
    val schema = StructType(schemaString.split(" ").map(fieldName =>StructField(fieldName,StringType,true)))
    val rowRdd = tnb.map(_.split("\t")).map(p=>Row(p(0),p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10)))
    val tnbDataFrame = sqlContext.createDataFrame(rowRdd,schema)
    tnbDataFrame.registerTempTable("tnb")
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
    val path = "hdfs://localhost:9000/test/wordcount"
    val conf = new SparkConf().setAppName("body_science")
    val sc = new SparkContext(conf)
    val wordcount = sc.textFile(path).flatMap(_.split(" ")).map(x=>(x,1)).reduceByKey(_+_).collect().foreach(println)
  }
}


package org.spark

import org.apache.spark.{SparkContext, SparkConf}

/**
  * Created by root on 12/30/15.
  */
object spark_app {

  def main(args:Array[String]){
    val conf = new SparkConf().setAppName("wordCount")
    val sc = new SparkContext(conf)
    val path="hdfs://localhost:9000/test/wordcount"
    val wordcount = sc.textFile(path).flatMap(_.split(" ")).map(x=>(x,1)).reduceByKey(_+_).collect().foreach(println)
    sc.stop()
  }
}
// 在spark 开发的过程中应用scala 对模型进行开发建模，即可！