import scala.math.Ordered;
import java.io.Serializable ;
/**
 *  自定义二次排序的key 的设置 
 *
 */
class secondSortKey(val first:Int,val second:Int) extends Ordered[secondSortKey] with Serializable{
	def compare(other:secondSortKey):Int = {
		if (this.first-other.first !=0){
			this.first-other.first
		}else{
			this.second-other.second 
		}
	}
}