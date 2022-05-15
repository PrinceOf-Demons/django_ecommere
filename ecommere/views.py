
from django.http import HttpResponse
from django.shortcuts import render
from .models import Cart, CartBookitem, Clothesitem, Laptopitem
def getCart(request):
    cart = Cart.objects.all().last()

    cartidstr = str(cart.id)
    cartBookitem = CartBookitem.objects.raw('select cart_bookitem.id,cartid,bookitemid,quantity,price,name,currentprice,image,discount from cart_bookitem join bookitem on cart_bookitem.bookitemid = bookitem.id where cartid='+cartidstr)

    laptop = Laptopitem.objects.filter(cartid = cart.id)

    clothes = Clothesitem.objects.filter(cartid = cart.id)

    context = {
        'cartBookitem': cartBookitem,
        'laptop':laptop,
        'clothes': clothes,
        'cart' : cart,
    }
    return render(request, 'cart.html',context)

def deleteCartItem (request, type, id):
    cart = Cart.objects.all().last()
    if type == 'book':
        temp = CartBookitem.objects.filter(id = id)
        tempprice = 0
        for t in temp:
            tempprice = t.price
        Cart.objects.filter(id = cart.id).update(total = cart.total - tempprice)
        CartBookitem.objects.filter(id = id).delete()
    if type == 'laptop':
        laptopi = Laptopitem.objects.filter(cartid = cart.id)
        for lap in laptopi:
            Laptopitem.objects.filter(id = lap.id).update(cartid = 1)
            Cart.objects.filter(id = cart.id).update(total = cart.total - lap.currentprice * (100 - lap.discount) / 100)
            break
    if type == 'clothes':
        laptopi = Clothesitem.objects.filter(cartid = cart.id)
        for lap in laptopi:
            Clothesitem.objects.filter(id = lap.id).update(cartid = 1)
            Cart.objects.filter(id = cart.id).update(total = cart.total - lap.currentprice * (100 - lap.discount) / 100)
            break
    return getCart(request)