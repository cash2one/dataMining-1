#include <iostream>
using namespace std ;
// 二叉树结点的定义
//一个结点都至少包扩三个域：数据data，左子女，结点指针，右子女结点指针
template <class Type> class BinaryTree ; // 声明 一个类 
template <class Type> class BinTreeNode {
friend class BinaryTree ;
	public:
		BinTreeNode() : leftChild(NULL),rightChild(NULL){};
		BinTreeNode(Type item ,BinTreeNode<Type> * left = NULL,
			BinTreeNode<Type> * right = NULL ):data(item),leftChild(left),rightChild(right){};
		Type & GetData() const {return data;};                       // 去的结点数据
		BinTreeNode <Type> * GetLeft() const { return leftChild ;};  // 获得左孩子结点指针
		BinTreeNode <Type> * GetRight() const { return rightChild ;} // 获得右孩子结点指针
		void SetData (const Type & item ) { data = item ;};          // 修改结点数据值 
		void SetLeft(BinTreeNode <Type> * L) {leftChild = L ;};      // 修改结点左孩子的指针
        void SetRight(BinTreeNode <Type> * R){rightChild = R ;};     // 修改结点右子女的指针
    private:
    	BinTreeNode <Type> * leftChild,* rightChild;                 //定义了树的结构成员，类似某些书中的struct
    	Type data ;
};
// 二叉树类的定义：
template <class Type> class BinaryTree
{
public:
	BinaryTree():root(NULL){};
	BinaryTree(Type value):RefValue(value),root(NULL){};
	virtual ~BinaryTree(){ destroy(root);};
    virtual int IsEmpty(){ return root == NULL ? 1:0 ;} ;
    virtual BinTreeNode <Type> * Parent()
};