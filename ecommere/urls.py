from unicodedata import name
from django.urls import path
from ecommere import views as fun
urlpatterns = [
    
    path('cart/',fun.getCart),
    path('deletecartitem/<str:type>/<int:id>', fun.deleteCartItem),
    path('checkout/', fun.checkout, name='chekout'),
]