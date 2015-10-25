from django.conf.urls import patterns, include, url
from blog.views import search 
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'dj.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    # url(r'^admin/',include('django.contrib.admin.urls')),

    url(r'^admin/', include(admin.site.urls)),
    # url(r'^index/$','blog.views.index'),
    url(r'^search/$','blog.views.search'),
)
