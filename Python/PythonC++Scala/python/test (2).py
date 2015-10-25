#_*_coding:utf-8-*
class people:  
    #定义基本属性  
    name = ''  # python 也是这样的
    age = 0  
    #定义私有属性,私有属性在类外部无法直接进行访问  
    __weight = 0 
    #定义构造方法  
    def __init__(self,n,price):  
        self.name = n
        self.price = price  
    def getprice():
    	print price
    def add(self,x,y):
        return x+y
    def __private(self,x,y):
    	return x+y    
    def pro(self,x,y):
        return self.__private(x,y)+x
    def speak(self):  
        print("%s is speaking: I am years old " %(self.name))          
p = people('tom',4)
print p.pro(3,4)
print p.name  
#print p.__private(2,3)
p.speak()




    		    

