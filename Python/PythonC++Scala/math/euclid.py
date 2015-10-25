def euclid(m,n):
    while (n):
        m,n=n,m%n    
    return m
    #print m
b=euclid(4,2)
a=euclid(9,6)
print a,b

'''
def euclid(m,n):
    while True:
        if r!=0:    
            r=m%n
            m=n
            n=r 
    return m
c=euclid(9,6)
print c        
'''