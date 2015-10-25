import csv
f=open('result5.csv')
array=[line.split(',') for line in f]
filename=open('result5.txt','a+')
user=[]
brand=[]
array1= [[int(i.strip('\n')) for i in array[j]] for j in range(len(array))]
arr=[False for k in range(len(array1))]
for k in range(len(array1)):
    if arr[k]==False:
        user=array1[k][0]
        brand=array1[k][1]
        for j in range(k+1,len(array1)):   
            if (arr[j]==False and array1[j][0]==user):
                brand=str(brand)+','+str(array1[j][1])
                arr[j]=True
        filename.write(str(user)+'\t'+str(brand)+'\n')