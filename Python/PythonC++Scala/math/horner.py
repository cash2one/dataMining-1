def polynomial(A,x,n):
    value=0
    for i in range(n):       
        value = value*x+A[i]
    return value
result = polynomial([1,2,3,4],2,4)   
print result       