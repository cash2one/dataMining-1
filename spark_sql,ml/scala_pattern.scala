// 类型匹配

import java.io._
def exception(e:Exception){
	e match {
		case fileException: FileNotFoundException => println("file not found" + fileException)
		case e :Exception =>println("Exception getting thread dump from exwcutor ! ")
	}	
}

// 数组匹配
def data(array:Array[String]){
	array match {
		case Array(scala) => println("scala")
		case Array(spark,hadoop,flink) => println(spark+":"+hadoop+":"+flink)
		case Array("spark",_*) => println("spark....")
		case _ => println("Unknow") 
	}
}

// case class 匹配 
class Person
case class Worker(name:String,salary:Double) extends Person
case class Student(name:String,score:Double) extends Person 
def sayHi(person:Person){
	person match {
		case Student(name,score)=>println(name+score)
		case Worker(name,score) => println("i am a worker ")
		case _ => println("some others ")
	}
}

// 二、scala 的类型参数(泛型) 
// 泛型类，泛型函数 

class Person[T](val content:T){
	def getContent(id:T) = id + " _ " + content
}

// 类型的边界限制，，，
/**
*View Bounds 视图界定 <%  对类型进行隐式转换 
*/

// Ording 的方法
class Compare[T : Ordering](val n1: T, val n2: T){

    def bigger(implicit ordered: Ordering[T]) = if(ordered.compare(n1, n2) > 0) n1 else n2 
}

// 继承的方式是

// 作业：阅读Spark源码 RDD、HadoopRDD、SparkContext、Master、Worker的源码，并分析里面使用的所有的模式匹配和类型参数的内容