from unicodedata import name
from django.urls import path
from productsview import views as fun
urlpatterns = [
    
    path('home/', fun.get_OnlineStore , name='getHome'),
    path('detailBook/<int:id>',fun.detailBook, name='detailBook'),
    path('filterbook/', fun.filterBook, name='filterBook'),

    path('detailLaptop/<int:id>', fun.detailLaptop),
    path('filterlaptop/', fun.filterLaptop, name='filterLaptop'),

    path('detailClothes/<int:id>', fun.detailclothes),
    path('filterclothes/', fun.filterClothes, name='filterClothes'),

    path('addtocart/<str:type>/<int:id>/<int:qty>', fun.addToCart),
    
]