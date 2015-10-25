

def foo(fn):
    print 'foo'
    def new(*args):
        return fn(*args)
    return new

@foo
def bar(*a):
    print a

bar(1,2,3)

import traceback
try:
    print k
except Exception, e:
    traceback.print_exc()
    print 'OK'

try:
    raise Exception('Ops')
except Exception, e:
    print e

# class T(object):
#     def __init__(self):
#         pass
#     @foo
#     def test(self, *args):
#         print args

# t=T()
# t.test(1,2,3)