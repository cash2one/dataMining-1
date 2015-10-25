#-*-coding: utf-8 -*-

'''
三种鸡的总数目n
满足问题的数目k,公鸡，母鸡，小鸡的只数g[],m[],s[]
'''
"""def chickenQuestion(n):
    g=[]
    m=[]
    s=[]
    for a in range(n+1):
        for b in range(n+1):
            for c in range(n+1):
                if ((a+b+c==n) and (5*a+3*b+c/3==n)and (c%3==0)):
                    g.append(a)
                    m.append(b)
                    s.append(c)
    return g,m,s                
g1,m1,s1=chickenQuestion(100)
print g1,m1,s1                    
"""
'''
def chickenQuestion(n):
    g=[];m=[];s=[]
    k=0
    for a in range(n+1):
        for b in range(n+1):
            for c in range(n+1):
                if ((a+b+c==n) and (5*a+3*b+c/3==n)and (c%3==0)):
                    g[k]=a
                    m[k]=b
                    s[k]=c
                    k=k+1
    return g,m,s                
g1,m1,s1=chickenQuestion(100)
print g1,m1,s1    
'''                
for a in range(4,12):
    for b in range(4,12):
        for c in range(4,12):
            for d in range(16,128):
                if d ==129-a*a-b*b-c*c and (a*a-b*b)*(a*a-c*c)*(b*b-c*c)!=0:  
                    print a*a,b*b,c*c,d   


