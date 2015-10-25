import datetime
starttime = datetime.datetime.now()
for i in range(100):
	
	print i**2
endtime = datetime.datetime.now()
print (endtime - starttime).seconds