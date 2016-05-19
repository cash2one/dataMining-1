// scala 函数式编程 ，， 高阶函数编程 
/**
* 函数与变量是同等的 
*/
def function(name:String){
	println(name)
}
val fun1 = function _ 
// 匿名函数 
val f = (content：String)=>println(content)
// 高阶函数 
def hiScala = (content:String)=>println(content)

def bigData(func:(String) => Unit,content:String){func(content)}

// map 实际就是一个高阶函数

def func_return(content:String)=(message:String)=>println(message+":"+content )


def spark(func:(String)=>Unit,name:String){func(name)}


//函数闭包
def scala(content:String)=(message:String)=>println(content + " " + message )

// curry 化，一个函数有两个参数，一个函数会接受第一个函数，再接受第二个参数 
def sum(x:Int)(y:Int) =x+y 

sum(1)(2)

(1 to 100).reduceleft(_+_)

val list = List("scala","spark","flink")
list.map("the content is :scala"+ _)

scala 面向对象编程 ，，
scala 基本语法 


