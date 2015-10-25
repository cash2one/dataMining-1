
def add(arr,x):
	xarr = []
	for i in arr:
		xarr.append(i*x)
	return xarr 	

class self_test:
	def __init__(self,x,y):
		self.x = x 
		self.y = y
	def add(self,arr):
		xarr = []
		for i in arr:
			xarr.append(i*self.x)
		return xarr 
	def mult(self):
		xarr = add([1,2,3,4],4) 	
		yarr = []
		for i in xarr:
			yarr.append(i*self.y)
		return yarr 

if __name__ == '__main__':
	selfTest = self_test(3,4)
	print (selfTest.add([2,5,8]))
	print (selfTest.mult())
