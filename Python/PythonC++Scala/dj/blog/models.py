from django.db import models
# Create your models here.
class KNN(models.Model):
    name=models.CharField(max_length=20)
    def __unicode__(self):
        return self.name
'''
class Author(models.Model):
    name=models.CharField(max_length=20)
    def __unicode__(self):
        return self.name
'''        
'''
class Book(models.Model):
    """docstring for Book"""
    name=models.CharField(max_length=20)      
    authors=models.ManyToManyField(Author)

    def __unicode__(self):
        return self.name  
'''                  
