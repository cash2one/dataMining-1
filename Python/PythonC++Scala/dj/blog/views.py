from django.template import RequestContext
from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.template import loader,Context,Template
from KNN.KNN import Test 
from numpy import *
# Create your views here.
'''
def index(request):
    imageData=open("/home/ruige/plot.jpg","rb").read()
    #return HttpResponse(imageData,mimetype="image/jpg")
    return HttpResponse(imageData,mimetype="image/jpg")
'''
'''    
def index(req):
    t=loader.get_template('index.html')
    error,lable=Test('/home/ruige/KNN/trainIris.txt','/home/ruige/KNN/testIris.txt')
    c=Context({'ruige':'1','lable':lable})
    #return HttpResponse('<h1>hello welcome to django! </h1>')
    return HttpResponse(t.render(c))
'''
'''
class Person(object):
    """docstring for Person"""
    def __init__(self, name, age, sex):
        #super(Person, self).__init__()
        self.name = name
        self.age = age
        self.sex = sex
    def say(self):
        return self.name    
'''
'''
def index(req):
    user=Person('tom',33,'male')
    #user={'name':'tom','age':33,'sex':'male'}
    booklist=['c','python','java']
    return render_to_response('index.html',{'title':'mypage','user':user,'booklist':booklist})
'''
'''    
def index(req):
    t=Template('<h1>hello{{uname}}</h1>')
    c=Context({'uname':'ruige'})
    return HttpResponse(t.render(c))   
'''    
'''
from blog.models import Employee
from blog.models import Employee
def index(req):
    emps=Employee.objects.all()
    return render_to_response('index.html',{'emps':emps})
'''
'''
from django import forms
#from django import newforms as forms

#get,post,form 


class UserForm(forms.Form):
    name=forms.CharField()

def search(req):
    if req.method=='POST':
        form = UserForm(req.POST)
        if form.is_valid():
            print form.cleaned_data
            return HttpResponse('ok')
    else:
        form=UserForm()
    return render_to_response('search.html',{'form':form})

'''
'''
import datetime
def current_datetiem(request):
    now=datetime.datetime.now()
    html="<html><body> It is now %s.</body></html>"%now
    return HttpResponse(html) 
   
def index(request):
    return render_to_response('index.html',{'user':'1'},context_instance=RequestContext(request))
'''

'''
import MySQLdb
def index(request): 
    conn = MySQLdb.connect(host='localhost',user='root',passwd='ruige',db='ktrain')
    cur = conn.cursor()
    sql1='select * from train'
    sql2='select * from test'
    cur.execute(sql1)
    trainData=cur.fetchall()
    trainData1=[list(item) for item in trainData]
    cur.execute(sql2)
    testData=cur.fetchall()
    testData1=[list(item) for item in testData]
    errorRate,labels=Test(trainData1,testData1)
    return render_to_response('index.html',{'trainData':trainData,
                                            'testData':testData,
                                            'errorRate':round(errorRate,2),
                                            'labels':labels
                                            })

'''
                                       
'''
def search(request):
    query=request.GET.get('q','')
    return render_to_response('search.html',{'query':query})
'''

    
