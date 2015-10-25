'''
import MySQLdb
conn=MySQLdb.connect(unix_socket='/opt/lampp/var/mysql/mysql.sock', host='localhost',user='root',passwd='')
array=[]
cur=conn.cursor()
conn.select_db('test')
#sql='create table if not exists ap(id char(100),buy char(100))'
sql1='select * from ap'
#cur.execute(sql)
#array=[line.split(",") for line in open('ap.txt')]
#matrix1=[[i for i in array[j] if i!=""and i!="\r\n"] for j in range(len(array))]
#matrix2=[[int(matrix1[j][i]) for i in range(23)] for j in range(len(array))]
#values=[]
#for i in range(len(matrix2)):
#    values.append((str(i+1),str(matrix2[i])))
#cur.executemany('inert into ap(id,buy) values(%s,%s)',values)
#conn.commit() 
cur.execute(sql1)
results = cur.fetchall()
mat=[i[1].strip('[').strip(']').split(',') for i in results]
dataSet=[[int(i) for i in mat[j]] for j in range(len(mat))]
print dataSet
'''
# only tuple can be written in mysql
# input the dataset,convert to matrix

import MySQLdb
def mysql():
    mat=[]
    conn = MySQLdb.connect(host='localhost',user='root',passwd='ruige')
    cur = conn.cursor()
    conn.select_db('ktrain')
    sql1='create table if not exists train(id1 float,id2 float,id3 float,id4 float,lable int)'
    #sql2='create table if not exists test(id1 float,id2 float,id3 float,id4 float,lable int)'
    cur.execute(sql1)
    #cur.execute(sql2)
    f=open('/home/ruige/KNN/trainIris.txt')
    #g=open('/home/ruige/KNN/testIris.txt')
    lines = f.readlines()
    #lines2=f.readlines()
    array = [lines[i].strip().split(',') for i in range(len(lines))]
    for i in range(len(array)):
        mat.append((tuple(array[i])))
    cur.executemany('insert into train(id1,id2,id3,id4,lable) values(%s,%s,%s,%s,%s)',mat) 
    conn.commit()       
    return array,mat
array1,mat=mysql()
print array1,mat    

'''
import MySQLdb
def mysql():
    mat=[]
    conn = MySQLdb.connect(host='localhost',user='root',passwd='ruige')
    cur = conn.cursor()
    conn.select_db('ktrain')
    #ql1='create table if not exists train(id1 float,id2 float,id3 float,id4 float,lable int)'
    sql2='create table if not exists test(id1 float,id2 float,id3 float,id4 float,lable int)'
    #cur.execute(sql1)
    cur.execute(sql2)
    #f=open('/home/ruige/KNN/trainIris.txt')
    g=open('/home/ruige/KNN/testIris.txt')
    lines = g.readlines()
    #lines2=f.readlines()
    array = [lines[i].strip().split(',') for i in range(len(lines))]
    for i in range(len(array)):
        mat.append((tuple(array[i])))
    cur.executemany('insert into test(id1,id2,id3,id4,lable) values(%s,%s,%s,%s,%s)',mat) 
    conn.commit()       
    return array,mat
array1,mat=mysql()
print array1,mat    
'''

