def hello(){
	println("hello,world")
}
hello()

var capital = Map("us"->"ws","Fs"->"ps")
capital+=("cap"->"tokyo")
println(capital)

def fac(x:BigInt): BigInt=if (x==0) 1 else x*fac(x-1)
println(fac(30))
val str = new Array[String](3)
str(0)="hello"
str(1)=","
str(2)="world!\n"
for (i<-0 to 2){
	print(str(i))
}
val numbers = Array("zero","one","two")
import scala.math._
val answer = sqrt(2)
println(answer)
var n =3
while(n>0){
	n=n-1
	println(n)
}
var sum=0
for(ch<-"hello scala"){
	sum+=ch // 隐类型转换
	println(sum)
}
/***
spark 的消息处理机制就是这样的
***/

import akka.actor.Actor
import akka.actor.ActorSystem
import akka.actor.Props
 
class HelloActor extends Actor {
  def receive = {
    case "hello" => println("world")
    case _  => println("huh?")
  }
}
// val system = ActorSystem("HelloSystem")
  // default Actor constructor
// val helloActor = system.actorOf(Props[HelloActor], name ="helloactor")
object Timer {
def oncePerSecond(callback: () => Unit) {
while (true) { callback(); Thread sleep 1000 }
}
	def timeFlies() {
	println("time flies like an arrow...")
	}
	def main(args: Array[String]) {
	oncePerSecond(timeFlies)
	}
}


class HelloScala{


} 
object HelloScala{
	def hello(name :String):String = {
		"hello "+ name
	}

	def helloScala(){
		println("HelloScala,this is rocky")
	}
	def add=(x:Int,y:Int)=>x+y
	val sum = (x:Int,y:Int)=>x+y
	def main(args:Array[String]){
		println("hello scala!!!")
		println(hello("scala"))
        helloScala
        println(add(1,2))
		println(sum(1,2))
	}
	
}
val h= new HelloScala