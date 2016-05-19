package scut.renTiData;
import org.apache.spark.SparkConf ;
import org.apache.spark.api.java.JavaRDD ;
import org.apache.spark.api.java.JavaSparkContext ;
import scut.renTiData.SecondSortKey;
import scala.Tuple2;

/**
 * Created by ruige on 2016/1/26.
 * dt_大数据梦工厂第19次课程学习
 * 第一步：按照Ordered 和Serrializable 接口自定义排序的key
 * 第二步：将要进行二次排序的文件加载进来生成<key,value> 类型的RDD
 * 第三步：使用sortByKey ,基于自定义的key 进行排序
 * 第四步：去掉排序的key，只保留排序的结果
 */
public class SecondSortApp {
    public static  void  main(String[] args ){
        SparkConf conf = new SparkConf().setMaster("local").setAppName("Second Sort ");
        JavaSparkContext sc= new JavaSparkContext();
        JavaRDD<String> lines = sc.textFile("C:\\spark-1.6.0-bin-hadoop2.6\\secondSort.txt");
        JavaPairRDD<SecondSortKey> pairs = lines.mapToPair(new PairFunction<String,SecondSortKey,String>(){
            @override
            public Tuple2<SecondSortKey,String> call(String line) throws Exception{
                String[] splited = line.split(" ");
                SecondSortKey key = new SecondSortKey(Integer.valueOf(splited[0]),Integer.valueOf(splited[1]));
                return new Tuple2<SecondSortKey,String>(key,line);
            }
        });
        JavaPairRDD<SecondSortKey,String> sorted = pairs.sortByKey(false); // 完成二次排序 ；
        JavaPairRDD<String> secondSorted = sorted.map(new Function<Tuple2<SecondSortKey,String>,String>(){
            @override
            public String call(Tuple2<SecondSortKey,String> sortedContent) throws  Exception{
                return sortedContent._2;
            }
        });
        secondSorted.collect().foreach(new voidFunction<String>(){
           public void call(String s){
               System.out.println(s);
           }
        });
    }
}
