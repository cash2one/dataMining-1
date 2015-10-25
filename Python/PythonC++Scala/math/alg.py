import sys
def fib(n):
    result=[]
    a,b=0,1
    while(b<=n):
        a,b=b,a+b
        result.append(a)
    return result  
x=int(sys.argv[1])      
print fib(x)                      