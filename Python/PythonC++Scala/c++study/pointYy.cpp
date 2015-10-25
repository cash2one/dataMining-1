// 传递指针的结果 ；
#include <iostream>
using namespace std ;
int m_value = 1 ;
/*
void func(int *p)
{
    p = &m_value ; // 形参改变了，但是实参没有改变 ，也就是说函数内部改变了 ；
    //return *p ;  // 函数运行完毕后 ，形参释放掉了
}

int main(int argc, char *argv[])
{
    int n = 2 ;
    int *pn = &n ;
    cout << *pn << endl ;
    // int x = func(pn); // pn 实参写的是pn的值，
    func(pn);
    cout << x <<endl;
    return 0;
}
// 2 
// 2 
*/

//  指针的引用结果就是这样！
void func(int *&p)
{
    p = &m_value;
    // 也可以根据你的需求分配内存
    //p = new int;
    //*p = 5;

}

int main(int argc, char *argv[])
{
    int n = 2;
    int *pn = &n;   
    cout << *pn << endl;
    func(pn);
    cout << *pn <<endl;
    return 0;
}