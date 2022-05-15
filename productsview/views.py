
from django.shortcuts import redirect, render
from .models import *
import pandas as pd
# Home.
def get_OnlineStore(request):

    allLaptop = Laptop.objects.raw("select laptop.id, laptop.name, laptopitem.image, laptopitem.discount, laptopitem.currentprice from laptop join laptopitem on laptop.id = laptopitem.laptopid;")
    
    allBook = Book.objects.raw("select book.id, book.bookitemid, book.title, book.language, bookitem.currentprice, bookitem.image, bookitem.discount from book join bookitem on book.bookitemid = bookitem.id;")
    
    allClothes = Clothes.objects.raw("select electronics.id, electronics.name, electronicsitem.image, electronics.specifications, electronicsitem.discount, electronicsitem.price from electronics join electronicsitem on electronics.ElectronicsItemid = electronicsitem.id;")

    cate = Category.objects.all()
    types = Type.objects.all()
    context = {
        'allLaptop': allLaptop,
        'allBook' : allBook,
        'allClothes': allClothes,
        'cate': cate,
        'types': types,
    }
    return render(request, 'index.html', context)

# Book
def detailBook(request, id):
    temp = str(id)
    allObject = Book.objects.raw("select book.id, categoryid,authorid,publisherid,barcode,title,language,numberofpage,summary,currentprice,image,discount from book join bookitem on book.bookitemid = bookitem.id where book.id="+temp)
    aut = 0
    pub = 0
    for obj in allObject:
        aut = obj.authorid
        pub = obj.publisherid
    author = Author.objects.filter(id= aut.id)
    publisher = Publisher.objects.filter(id = pub.id)
    cate = Category.objects.all()
    types = Type.objects.all()
    context = {
        'book' : allObject,
        'author' : author,
        'publisher' : publisher,
        'cate': cate,
        'types': types,
    }
    return render(request, 'book_detail.html', context)

def filterBook(request):
    if request.method =='GET':

        allObject = Book.objects.raw("select book.id, book.bookitemid, book.title, book.language, bookitem.currentprice, bookitem.image, bookitem.discount from book join bookitem on book.bookitemid = bookitem.id;")
        cate = Category.objects.all()
        types = Type.objects.all()
        context = {
            'obj' : allObject,
            'cate': cate,
            'types': types,
        }
        return render(request, 'book_filter.html', context)

        
def filterLaptop (request):
    allLaptop = Laptop.objects.raw("select laptop.id, laptop.name, laptopitem.image, laptopitem.discount, laptopitem.currentprice from laptop join laptopitem on laptop.id = laptopitem.laptopid;")
    
    cate = Category.objects.all()
    types = Type.objects.all()
    context = {
        'obj' : allLaptop,
        'cate': cate,
        'types': types,
    }
    return render(request, 'laptop_filter.html',context)

def filterClothes (request):
    allObject = Book.objects.raw("select book.id, book.bookitemid, book.title, book.language, bookitem.currentprice, bookitem.image, bookitem.discount from book join bookitem on book.bookitemid = bookitem.id;")
    cate = Category.objects.all()
    types = Type.objects.all()
    context = {
        'obj' : allObject,
        'cate': cate,
        'types': types,
    }
    return render(request, 'clothes_filter.html')