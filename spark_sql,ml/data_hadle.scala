/**
*应用scala 进行数据处理是新时期数据挖掘工程师的必备技能 。本代码教会我们怎么从文件中读取结构化的数据 ，
*
*/


// 一，从数据文件中读取文件 ，
import scala.io.Source 
val source = Source.fromFile("myfile.txt","UTF-8")
val lineIterator = source.getLines
// the result is an iterator , 
for (l<- lineIterator) process l

