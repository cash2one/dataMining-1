#include<iostream>
using namespace std ;
//软件编程的方法就是这样

template <class Type> class MinHeap
{
public:
	//MinHeap(int maxsize) const ;
	MinHeap (Type arr[] ,int n) ;
	~MinHeap() {
		delete [] heap ;
	};
	void insert(const Type &x);
	Type removeMin(Type &x);
	int isEmpty() const {return CurrentSize == 0 ;};
    int isFull() const { return CurrentSize == MaxHeapSize ;}
    void makeEmpty(){CurrentSize  = 0 ;};
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

// 堆的定义与方法结束 ；
template <class Type> class ExtBinaryTree ;

template <class Type> class Element {
	friend class ExtBinaryTree<Type> ;
	private:
		Type data ;
		Element<Type> * leftChild ,* rightChild ;
};

template <class Type> class ExtBinaryTree{      // 扩充二叉树累的定义 ；
	public:
		ExtBinaryTree(ExtBinaryTree<Type> &bt1,ExtBinaryTree<Type> &bt2){
			root->leftChild = bt1.root ;
			root->rightChild = bt2.root ;
			root->data.key = bt1.root->data.key+bt2.root->data.key ;

		};
		ExtBinaryTree<Type> HuffmanTree(Type * fr,int n ,ExtBinaryTree<Type> & newtree);
	protected:
	    const int defaultSize = 20 ;
	    Element<Type> * root ;
	    MinHeap< ExtBinaryTree<Type> >	hp ; // c++  的强大的编程功能，确实不易；
};
// 获取最小的哈夫曼树

template <class Type > ExtBinaryTree<Type> ExtBinaryTree<Type>::HuffmanTree(Type * fr ,int n, ExtBinaryTree<Type> & newtree){
	ExtBinaryTree<Type> &first,&second ;
	int defaultSize = 20 ;
	ExtBinaryTree<Type> Node[defaultSize] ;
	if (n>defaultSize){
		cout<<"exceeds the boundry of array"<<endl ;
	}
	for (int i = 0; i<n; i++){               // 建立存储二叉树扩充最小堆的森林 初始化；
		Node[i].root->data.key = fr[i] ;
		Node[i].root->leftChild = Node[i].root->rightChild = NULL ;
	}
	hp.MinHeap(Node,n) ;
	for(int i = 0 ; i < n-1 ;i++){
		hp.removeMin(first);hp.removeMin(second);
		newtree = new ExtBinaryTree<Type>(first,second) ;
		hp.insert(newtree);
	}
	return hp.removeMin(newtree);
}

int main(){
	int fr[] = {3,4,50,67,89,91,32,11};
	ExtBinaryTree<int> newtree;
	ExtBinaryTree tree=HuffmanTree(fr,8,newtree);
	cout<<tree.data;

}