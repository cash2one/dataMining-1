#include<iostream>
#include<string.h>
#include<cstdlib>
using namespace std;
class List
{
   char data[15];
public:
    List(const List &l)
  {
      int i;
    for(i=0;i<ListLength(l);i++){
        data[i]=l.data[i];
    }
  }
  void output(List L);

   int ListLength(List  L);
   int LocateElem(List L,char e,int equal);
   void ListInsert(List &L,int i,char e);
   char GetElem(List L,int i,int &e);
   void union1(List &La,List Lb);
};

 int List::ListLength(List L)
 {   int i;
 for(i=0;L.data[i]!='\0';i++)
     return i;
 }
 void List::output(List L)
  {
      int  i;
      for(i=0;i<ListLength(L);i++)
        cout<<L.data[i]<<"\t";
      cout<<endl;
  }
 int List::LocateElem(List L,char e,int equal)
 {
     int i;
     for(i=0;i<ListLength(L);i++)
        if(e==L.data[i])
     {
         return i;break;
     }
    else return 0;
}
char List::GetElem(List L,int i,int &e)
{
    e=L.data[i];
    return e;
}
void List::ListInsert(List &L,int i,char e)
{
    int j;
  char  t;
    t=L.data[i];
    L.data[i]=e;
    j=i+1;
    L.data[j]=t;
    for(j=i+2;j<ListLength(L);j++)
    {L.data[j]=L.data[(i+1)];
    i++;}

}
void List::union1(List &La,List Lb)
{
    int La_len=Listlength(La);
    int Lb_len=Listlength(Lb);
    int i;
    for(i=0;i<Lb_len;i++)
    {
        GetElem(Lb,i,e);
        if(!LocateElem(La,e,equal))
            ListInsert(La,++La_len,e);
    }
}

int main()
{
    List La,Lb,Lc;
    La.data[15]={a,s,d,f,g};
    Lb.data[15]={a,b,c,d};
    Lc=union(List &La, List Lb);
    Lc.output();
}

