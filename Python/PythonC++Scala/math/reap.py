B=[]
def reap(n):
    A=[i+1 for i in range(n)]
    while len(func(A)!=0):
        func(A)
    return B   
def func(A):
    for i in range(len(A)/3+1):
        B.append(A[i*3])
        A.pop(i*3)
    return A    
            
print reap(12)            