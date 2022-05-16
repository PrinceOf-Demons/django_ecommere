
from tabnanny import check
from django.http import HttpResponse
from django.shortcuts import redirect, render
from .models import *
import pandas as pd
# Home.
def get_OnlineStore(request):

    allLaptop = Laptop.objects.raw("select DISTINCT laptop.id, laptop.name, laptopitem.image, laptopitem.discount, laptopitem.currentprice from laptop join laptopitem on laptop.id = laptopitem.laptopid;")
    
    allBook = Book.objects.raw("select book.id, book.bookitemid, book.title, book.language, bookitem.currentprice, bookitem.image, bookitem.discount from book join bookitem on book.bookitemid = bookitem.id;")
    
    allClothes = Clothes.objects.raw("select DISTINCT clothes.id, clothes.name, clothesitem.image, clothesitem.discount, clothesitem.currentprice from clothes join clothesitem on clothes.id = clothesitem.clothesid;")

    user_id = request.COOKIES.get('userID','')

    user_name = Fullname.objects.filter(customerid = user_id)[0]

    cate = Category.objects.all()
    types = Type.objects.all()
    context = {
        'allLaptop': allLaptop,
        'allBook' : allBook,
        'allClothes': allClothes,
        'user': user_name,
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

    }
    return render(request, 'book_detail.html', context)

def filterBook(request):
    if request.method =='GET':

        allObject = Book.objects.raw("select book.id, book.bookitemid, book.title, book.language, bookitem.currentprice, bookitem.image, bookitem.discount from book join bookitem on book.bookitemid = bookitem.id;")
        cate = Category.objects.all()
        author = Author.objects.all()
        publisher = Publisher.objects.all()
        context = {
            'obj' : allObject,
            'cate': cate,
        }
        return render(request, 'book_filter.html', context)

# Laptop
def detailLaptop(request, id):
    temp = str(id)
    allObject = Laptop.objects.raw("select DISTINCT laptop.id,laptopid,typeid,producerid,barcode,laptop.name,warranty,specification,image,discount,currentprice from laptop join laptopitem on laptop.id = laptopitem.laptopid where laptop.id="+temp)
    aut = 0
    pub = 0
    for obj in allObject:
        aut = obj.producerid
        pub = obj.typeid

    author = Producer.objects.filter(id= aut.id)
    types = Type.objects.filter(id = pub.id)
    cate = Category.objects.all()

    context = {
        'laptop' : allObject,
        'producer' : author,
        'type' : types,
    }
    return render(request, 'laptop_detail.html', context)        
def filterLaptop (request):
    allLaptop = Laptop.objects.raw("select DISTINCT laptop.id, laptop.name, laptopitem.image, laptopitem.discount, laptopitem.currentprice from laptop join laptopitem on laptop.id = laptopitem.laptopid;")
    
    types = Type.objects.all()
    context = {
        'obj' : allLaptop,
        'types': types,
    }
    return render(request, 'laptop_filter.html',context)

# Clothes
def detailclothes(request, id):
    temp = str(id)
    allObject = Laptop.objects.raw("select DISTINCT clothes.id,clothesid,stylesid,nanufactureid,barcode,clothes.name,clothes.description,image,discount,currentprice from clothes join clothesitem on clothes.id = clothesitem.clothesid where clothes.id="+temp)
    aut = 0
    pub = 0
    for obj in allObject:
        aut = obj.nanufactureid
        pub = obj.stylesid
    author = Manufacture.objects.filter(id= aut)
    types = Styles.objects.filter(id = pub)
    cate = Category.objects.all()

    context = {
        'clothes' : allObject,
        'nanufacture' : author,
        'style' : types,
    }
    return render(request, 'clothes_detail.html', context)  

def filterClothes (request):
    allObject = Book.objects.raw("select DISTINCT clothes.id, clothes.name, clothesitem.image, clothesitem.discount, clothesitem.currentprice from clothes join clothesitem on clothes.id = clothesitem.clothesid;")
    style = Styles.objects.all()
    manu = Manufacture.objects.all()
    context = {
        'obj' : allObject,
        'style': style,
        'nanufacture' : manu,
    }
    return render(request, 'clothes_filter.html', context)

def addToCart(request, type, id, qty):
    cart = Cart.objects.all().last()
    temp = str(id)
    if type == 'book':       
        price = 0
        biid = 0
        bookitem = Bookitem.objects.raw('select bookitem.id, currentprice, discount from bookitem, book where book.bookitemid = bookitem.id and book.id ='+temp)
        for b in bookitem:
            biid = b.id
            price = qty * b.currentprice * (100 - b.discount) / 100

        cartbookitem = CartBookitem.objects.filter(cartid = cart.id)

        check = False
        cartbookitemid = 0
        cartbookitemqty = 0
        cartbookitemprice = 0
        for c in cartbookitem:
            if c.bookitemid.id == biid:
                check = True
                cartbookitemid = c.id
                cartbookitemqty = c.quantity
                cartbookitemprice = c.price
        if check is False:
            CartBookitem.objects.create(cartid = Cart(id = cart.id), bookitemid= Bookitem(id = biid),itemtype= 'F',quantity= qty, price= price )
            Cart.objects.filter(id = cart.id).update(total = cart.total+price)
        else:
            CartBookitem.objects.filter(id = cartbookitemid).update(quantity= qty+cartbookitemqty, price= price+cartbookitemprice)
            Cart.objects.filter(id = cart.id).update(total = cart.total+price)
    if type == 'laptop':
        laptopi = Laptopitem.objects.filter(cartid = 1)
        if laptopi != None:
            for lap in laptopi:
                Laptopitem.objects.filter(id = lap.id).update(cartid = cart.id)
                Cart.objects.filter(id = cart.id).update(total = cart.total + lap.currentprice * (100 - lap.discount) / 100)
                break
        else: return HttpResponse('Hết hàng!') 
    
    if type == 'clothes':
        clothesi = Clothesitem.objects.filter(cartid = 1)
        if clothesi != None:
            for lap in clothesi:
                Clothesitem.objects.filter(id = lap.id).update(cartid = cart.id)
                Cart.objects.filter(id = cart.id).update(total = cart.total + lap.currentprice * (100 - lap.discount) / 100)
                break
        else: return HttpResponse('Hết hàng!') 

    return HttpResponse('Thêm thành công!')

