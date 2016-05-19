import scala.reflect.Manifest 
def arrayMake[T:Manifest](first:T,second:T)={
	val r = new Array[T](2) // 实例化一个泛型 
	r(0)=first
	r(1)=second 
	r 
}
import scala.reflact.ClassTag  

// classTag 主要是运行时指定，在编译时未知的类型信息

def mkArray[T:ClassTag](ele:T*)=Array[T](ele:_*)

// 如果精通python，scala 编程统一起来学习