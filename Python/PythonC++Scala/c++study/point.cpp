#include <iostream>
#include <string.h>
using namespace std ;
int main(){
	void sort(char * name[],int n); // 函数的排序声明
	void print(char * name[], int n) ; // 函数的排序声明
	char * name[] = {"BASIC","FORTRAN","C++","Pascal","COBOL","Scala","Java"};
	int n = 7 ;
	sort(name,n);
	print(name,n);
}
void sort(char * name[],int n){
	char * temp ;
	int i ,j , k ;
	for (i = 0;i<n-1;i++){
		k = i ;
		for(j=i+1;j<n;j++)
			if (strcmp(name[k],name[j])>0) k = j ;
		if(k!=i){
			temp = name[i];name[i]=name[k];name[k] = temp ;
		}
	}
}
void print(char * name[],int n){
	for(int i = 0 ;i<n ;i++){
		cout<<name[i]<<endl;
	}
}