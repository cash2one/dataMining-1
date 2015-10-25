#include <iostream>
#include <string>
using namespace std ;
    string reverseString(string &str) {
    int i=0;
    int j; 
	int count=0;
	char* ch=new char[4];
	int n=str.length();
	int k=0;
	string s(str);
	if(n<0 || n>1024)
		return 0;
	else{
	//判断字符串是否都是字母
	while(k<n){
		if(str.at(k)>'z' ||  str.at(k)<'A' || (str.at(k)>'Z'&& str.at(k)<'a')){
			str.erase(k,1);
			n=str.length();
			k--;
		}
		k++;
	}
	n=str.length();
	if(n<=0)
		return 0;
	else
	{
		while(i<n)

		{
				j=i;
				while(str.at(j)==str.at(i)){
					count++;
					j++;
					if(j>=n)
						break;
				}

					if(count==1){
						str.insert(i+1,1,'1');
						i=i+2;
					}
					else
					{
						sprintf(ch,"%d",count);
						str.replace(i+1,count-1,ch);
						if(count<10)
							i=i+2;
						else if(count>=10 && count<100)
							i=i+3;
						else if(count>=100 && count<1000)
							i=i+4;
						else
							i=i+5;
					}
			count=0;
			n=str.length();
		}
	}
		
	}
		return str;
			    
    }


void  main()
{
	string s;
	getline(s);
	cin>>a>>b;
	cout<<a<<endl;
	cout<<b<<endl;
	//cout<<s<<endl;
	string s2=reverseString(s);
	cout<<s2;
	system("pause");
}
