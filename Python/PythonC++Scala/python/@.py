'''
def deco(func):
    print("before myfunc() called.")
    func()
    print("  after myfunc() called.")
    return func
 
@deco
def myfunc():
    print(" myfunc() called.")
 
#myfunc()
myfunc()
'''

'''
def deco(func):
    def _deco():
        print("before myfunc() called.")
        func()
        print("  after myfunc() called.")
    return _deco
 
@deco
def myfunc():
    print(" myfunc() called.")
    return 'ok'
 
#myfunc()
myfunc()
'''

def deco(func):
    def _deco(a, b):
        print("before myfunc() called.")
        ret = func(a, b)
        print("  after myfunc() called. result: %s" % ret)
        return ret
    return _deco
 
@deco
def myfunc(a, b):
    print(" myfunc(%s,%s) called." % (a, b))
    return a + b
 
myfunc(1, 2)
myfunc(3, 4)
