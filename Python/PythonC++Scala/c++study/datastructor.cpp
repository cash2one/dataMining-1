// 数据的逻辑结构类型 集合，线性结构，树形结构，图形结构 
#include <string>
#include <iostream>
#define MaxSize 50 ;
using namespace std ;
struct teacher
{
	int no ;
	char name[5];
	int age ;
	string xin ;
};
int main(){ 
	teacher t ;
	t.no = 10 ;
	t.name[5] = 'ruig';
	t.age = 18 ;
	t.xin  = "guorui";
	string a = "hello world " ;
	cout <<a<<'\n' ;
	cout<<t.no<<'\n';
	return 0;
}

// 顺序表的结构
typedef char elemtype ; // 结构体对象在c++ 中都用class 给取代了！
typedef struct 
{
	elemtype data[MaxSize]; // 就是C++ 中的数组的机制，
	int lenght ;
} Sqlist ;

// 线性表的链式存储结构

typedef struct LNode {
	elemtype data ;
	struct LNode * next ;
}LinkList;
// 创建头结点 
void init(LinkList *&L){
	
}

//高级c++ 设计师