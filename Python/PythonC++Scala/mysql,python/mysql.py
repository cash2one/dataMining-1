import MySQLdb
conn=MySQLdb.connect(host="localhost", db="test",user="root",passwd="ruige" )
cur=conn.cursor()
sql1='create temporary table hpp(id char(10),buy char(10))'
sql2='insert into app(id,buy) values(%s,%s)'
values=('a','b')
cur.execute(sql1)
cur.execute(sql2,values)
conn.commit()