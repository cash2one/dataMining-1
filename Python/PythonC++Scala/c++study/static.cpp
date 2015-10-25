#include <iostream>
using namespace std ;
class Box
{
public:
	Box(int,int) ;
	int volume() ;
	static int height ;
	int width;
	int lenght ;
	
};

// 析构函数没有返回值，自然就没有返回类型，而且不能被调用 ！
Box::Box(int w,int len){
	width = w ;
	lenght = len ;
}

int Box::volume(){
	return (height* width * lenght);
}
// 共享的数据成员；
int Box::height = 10;

int main(){
	Box a(15,20) , b(20,30) ;
	cout<<a.height<<'\n';
	cout<<b.height<<endl ;
	cout<<Box::height<<endl ;
	cout<<a.volume()<<endl ;
}
// c++ 是最好的编程语言
// hadoop ,spark ; 
