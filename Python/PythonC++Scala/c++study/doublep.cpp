#include <iostream>
using namespace std ;
int main(){
	char **p ;
	char *name[] = {"python","java","hadoop","scala"};
	p =name +2 ; 
	cout<<*p<<endl;
	cout<<**p<<endl; 
}