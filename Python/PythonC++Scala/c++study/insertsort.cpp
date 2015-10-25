#include <iostream>
using namespace std; 
// 插入排序的过程;
void InsertSort(int arr[], int length)
{
     int temp;
     for (int i = 1; i < length; ++i) // 从数组中的第二个元素开始
     {
          temp = arr[i]; // 记录当前的元素
          int j = i - 1;
          while (j >= 0 && temp < arr[j]) // 将当前元素与之前的已经排序好的序列元素进行挨个比较
          {
               arr[j + 1] = arr[j]; // 已经排序好的序列整体向后移动
               --j;
          }
          arr[j + 1] = temp; // 插入当前的元素
     }
}
 
int main()
{
     int arr[10] = {9, 2, 8, 2, 3, 2, 4, 10, 34, 5}; 
     InsertSort(arr, 10);
     for (int i = 0; i < 10; ++i)
     {
          cout<<arr[i]<<" ";
     }
     cout<<endl;
     return 0;
}
