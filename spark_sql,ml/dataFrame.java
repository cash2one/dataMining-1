package bigData.spark.sql.DataFrame ;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.SQLContext;
/**
 *使用Java的方式实战DataFrame;
 *
 */
public class DataFrameops{
	public static void main(String[] args){
		// 创建sparkConf，
		SparkConf conf = new SparkConf().setAppName("DataFrameops");
		// 创建JavaSparkContext
		JavaSparkContext sc = new JavaSparkContext(conf);
		// HiveContext 是SQLContext 的子类，而SQLContexr 只支持sql作为查询语言
		// HiveContext 支持不同的SQL 方言，如HQL等。
		SQLContext sqlContext = new SQLContext(sc) ;
		// 创建DataFrame,可以简单的认为DataFrame是一张表
		DataFrame df = sqlContext.read().json("hdfs:master:9000/library/people.json");
		// select * from table ;
		df.show();
		// describe table ;
		df.printSchema();
		// 选择具体某一列数据，select name from table ;
		df.select("name").show();
		df.select(df.col("name"),df.col("age").plus(10)).show();
		// 面向对象编程给软件开发人员提供了较为
		// select * from tablename where age > 20 ;
		df.filter(df.col("age").gt(10)).show();
		// select age，count(1) from tablename group by age ；
		df.groupBy(df.col("age")).count().show();
	}
}