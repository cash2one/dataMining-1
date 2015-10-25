#include <iostream>
#include "student.h"
#include <string>
student::student(int nu,string na,char s){
	num = nu ;
	name = na ;
	sex = s ;
}
void student::display(){
	cout<<"num:"<<num<<endl ;
	cout<<"name:"<<name<<endl;
	cout<<"sex:"<<sex<<endl;
}