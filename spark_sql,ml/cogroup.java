import org.apache.SparkConf;
import org.apache.spark.api.java.javaSparkContext;
import java.util.Arrays;

public class CogroupOps{
	public static void main(String[] args){
		SparkConf = conf  = new SparkConf().setAppName("spark WordCount by java !").setMaster("local");
		javaSparkContext sc = new javaSparkContext(conf); // 底层其实是scala sc 的封装 ；
		List<Tuple2<Integer,String>> nameList = Arrays.asList(
			new Tuple2<Integer,String>(1,"spark"),
			new Tuple2<Integer,String>(2,"Tachyon")
			new Tuple2<Integer,String>(3,"Hadoop")
			);
		List<Tuple2<Integer,String>> scoresList = Arrays.asList(
			new Tuple2<Integer,Integer>(1,100),
			new Tuple2<Integer,Integer>(2,90),
			new Tuple2<Integer,Integer>(3,70),
			new Tuple2<Integer,Integer>(1,60),
			new Tuple2<Integer,Integer>(2,70),
			new Tuple2<Integer,Integer>(3,110)
			);
		JavaPairRDD<Integer,String> names = sc.parallelizePairs(nameList); // 此处 不能用parallelize

		JavaPairRDD<Integer,Integer> scores = sc.parallelizePairs(scoresList);
		JavaPairRDD<Integer,Tuple2<Iterable<String>,Iterable<String>>> ns = names.join(scores);
	}
}