from urllib import response
from django.db import transaction
from django.shortcuts import redirect, render
from .models import Customer, Account, Fullname, Address
# Create your views here.
def login(request):
    response = render(request, 'login.html')
    response.delete_cookie('userID')
    return response

def dologin(request):
    username = request.POST.dict()['username']
    password = request.POST.dict()['password']

    acc = Account.objects.filter(username=username, password=password)[0]
    userID = acc.customerid.id
    if acc != None:
        response = redirect('/home/')
        response.set_cookie('userID', userID)
   
    return response

def register(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        lastname = request.POST.get("lastname")
        fistname = request.POST.get("fistname")
        homenumber = request.POST.get("homenumber")
        street = request.POST.get("street")
        district = request.POST.get("district")
        city = request.POST.get("city")
        country = request.POST.get("country")
        sex = request.POST.get("sex")
        phone = request.POST.get("phone")
        email = request.POST.get("email")
        print(username, password, lastname, fistname, homenumber, street, district,  city, country, sex, phone, email)
        try:
            with transaction.atomic():
                user = Customer.objects.create(username=username, password=password, sex=sex, phone=phone, email=email, role="Cus")
                fullname = Fullname.objects.create(userid=user, last=lastname, first=fistname)
                address = Address.objects.create(userid=user, homenum=homenumber, street=street, district=district, city=city, country=country)
            return redirect("/login/")
            # messages.success(request, "Your item deleted from your cart.")
        except:
            print("insert faild")
            return redirect("/register")

    else:
        return render(request, 'register.html')
