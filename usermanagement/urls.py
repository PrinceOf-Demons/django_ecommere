from unicodedata import name
from django.urls import path
from usermanagement import views as fun
urlpatterns = [
    path('',fun.login),
    path('login/', fun.dologin),
    path('register/', fun.register)
]