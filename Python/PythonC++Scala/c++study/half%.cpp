#include<iostream>
#include<windows.h>
using namespace std;
int main()
{
    for(; ;)
    {
        for (int i=0; i<9600000;i++)
            ;
        Sleep(10);
    }
    return 0;
}
