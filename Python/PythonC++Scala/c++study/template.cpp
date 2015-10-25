#include <iostream>
using namespace std ;
template<class T>
class compare
{
public:
	compare(T a,T b){
		x = a ;
		y = b ;
	};
	//~compare();
    T max(){
    	return ((x>y)? x:y) ;
    }
    T min (){
    	return ((x<y)? x:y) ;
    }
private:
	T x , y ;
	/* data */
};
template <class type>
type func(type x){
	return x*x;
}
int main(){
	// compare <int> cp = new compare(12,3);
	compare<int> cp(23,36) ;
	// compare <int> *po ;
	// compare <int> *po = new compare(2,3);
	//po =&cp ;
	int a = func(4); // 函数模板的调用比类模板的调用要简单，
	cout<<cp.max()<<'\n' ;
	cout<<cp.min()<<'\n' ;
	cout<<a<<endl;
    return 0;
}