
#include <iostream>
using namespace std;
/*void maopao(int arr[],int length){
	int temp;
	for(int i=0;i<length-1;i++){
		for (int j=length-1;j>i;j--){
			if  (arr[j]<arr[j-1]){
				temp = arr[j];
				arr[j]=arr[j-1];
				arr[j-1]=temp;
			}
		}
	}
}
int main(){
	int arr[10]={9, 2, 8, 2, 3, 2, 4, 10, 34, 5}; 
	maopao(arr,10);
	for (int i = 0; i < 10; ++i)
    {
        cout<<arr[i]<<" ";
    }
    cout<<endl;
    return 0;
}*/

template <class T>
void Swap(T &x,T &y){
	T temp ;
	temp = x ;
	x = y  ;
	y = temp ;

}

template <class T>
void Bubble(T a[],int n){
	for(int i = 0; i < n-1; i++){
		if (a[i]>a[i+1]) Swap(a[i],a[i+1]);
	}
}

template <class T>
void BubbleSort(T a [] ,int n){
	for (int i = n ; i>1; i--){
		Bubble(a,i);
	}
}    
int main(){
	int a[] = {8,9,6,5,3,4,5,2,1};
	BubbleSort(a,9);
	for (int i = 0; i<9;i++){
		cout<<a[i]<<'\n';
	}
	return 0 ;

}