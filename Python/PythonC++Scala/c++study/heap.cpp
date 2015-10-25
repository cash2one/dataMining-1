#include<iostream>
using namespace std ;

// 编程总是发生手误；
template <class Type> class MinHeap
{
public:
	//MinHeap(int maxsize) const ;
	MinHeap (Type arr[] ,int n) ;
	~MinHeap() {
		delete [] heap ;
	};
	void insert(const Type &x) ;
	Type removeMin(Type &x) ;
	int isEmpty() const {return CurrentSize == 0 ;};
    int isFull() const { return CurrentSize == MaxHeapSize ;}
    void makeEmpty(){CurrentSize  = 0 ;} ;
private:
	enum {defaultSize = 10 } ;
	Type *heap ; // 定义了一个数组指针；
	int CurrentSize ;
	int MaxHeapSize ;
	void filterDown(int i, int m) ;
	void filterUp(int i) ;
};
// 实际应用中对C++ 编写代码的过程较为复杂，但是要自信，不要被打倒！先将对象的大体框架给搭建起来
template <class Type> MinHeap<Type>::MinHeap(Type arr[], int n){
    MaxHeapSize  = defaultSize < n ? n : defaultSize ;
    heap = new Type[MaxHeapSize] ;
	heap = arr;
	CurrentSize = n ;
	int currentPos = (CurrentSize-2)/2 ;
	while (currentPos >= 0){
		filterDown(currentPos,CurrentSize);
		currentPos-- ;
	}
}

template <class Type> void MinHeap<Type>::filterDown(const int start,const int endOfHeap){
	int i = start , j = 2*i+1 ; Type temp = heap[i] ;
	while(j<endOfHeap){
	if(j < endOfHeap && heap[j] > heap[j+1]) j++ ;
    if (temp < heap[j]) break ;
    else { heap[i] = heap[j] ; i = j ; j = 2*j+1; } ;
    };
    heap[i] = temp ;
}

template <class Type> void MinHeap<Type>::filterUp(int start){
	int j = start ,i = (j-1)/2 ;
	Type temp = heap[j];
	while(j>0){
		if (heap[i]<temp) break ;
		else { heap[j] = heap[i]; j=i ; i=(i-1)/2;}
	};
	heap[j] = temp;
}

template <class Type> void MinHeap<Type>::insert(const Type &x){
    if (CurrentSize==MaxHeapSize){
    	cout<<"heap full"<<endl ;
    };
    heap[CurrentSize] = x ;
    filterUp(CurrentSize) ;
    CurrentSize++ ;
    // return 1 ;
};

template <class Type> Type MinHeap<Type>::removeMin(Type &x){
	if(!CurrentSize){cout<<"Heap empty "<<endl ;
    return 0;
    }
    x = heap[0];heap[0]=heap[CurrentSize-1];
    CurrentSize--;
    filterDown(0,CurrentSize-1);
    return x ;
}

// 传递给hp 的arr 一定要是指针；
int main(){
	int arr1[] = {1,2,4,5,98,90,76,54,32,24,43,5,56};
	MinHeap<int> hp(arr1,13) ;
	hp.insert(0) ;
	int x ;
	int y = hp.removeMin(x) ;
	int z ;
	int e = hp.removeMin(z) ;
	cout<<e<<endl ;
	return 0 ;
};
// 堆排序也是一种方法；