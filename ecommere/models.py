# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Account(models.Model):
    customerid = models.ForeignKey('Customer', models.DO_NOTHING, db_column='customerid')
    username = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    password = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'account'


class Address(models.Model):
    customerid = models.ForeignKey('Customer', models.DO_NOTHING, db_column='customerid')
    no = models.IntegerField()
    street = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    district = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    city = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    mail = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    phone = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'address'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Author(models.Model):
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    biography = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'author'


class Book(models.Model):
    bookitemid = models.ForeignKey('Bookitem', models.DO_NOTHING, db_column='bookitemid')
    categoryid = models.ForeignKey('Category', models.DO_NOTHING, db_column='categoryid')
    publisherid = models.ForeignKey('Publisher', models.DO_NOTHING, db_column='publisherid')
    authorid = models.ForeignKey(Author, models.DO_NOTHING, db_column='authorid')
    barcode = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    title = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    language = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    numberofpage = models.IntegerField()
    summary = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'book'


class Bookitem(models.Model):
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    itemcode = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    currentprice = models.FloatField()
    image = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    discount = models.FloatField()
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bookitem'


class Cart(models.Model):
    status = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    note = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    total = models.FloatField()

    class Meta:
        managed = False
        db_table = 'cart'


class CartBookitem(models.Model):
    cartid = models.ForeignKey(Cart, models.DO_NOTHING, db_column='cartid')
    bookitemid = models.ForeignKey(Bookitem, models.DO_NOTHING, db_column='bookitemid')
    itemtype = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    quantity = models.IntegerField()
    price = models.FloatField()

    class Meta:
        managed = False
        db_table = 'cart_bookitem'


class Category(models.Model):
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    image = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'category'


class Clothes(models.Model):
    stylesid = models.ForeignKey('Styles', models.DO_NOTHING, db_column='stylesid')
    nanufactureid = models.ForeignKey('Manufacture', models.DO_NOTHING, db_column='nanufactureid')
    barcode = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clothes'


class Clothesitem(models.Model):
    cartid = models.ForeignKey(Cart, models.DO_NOTHING, db_column='cartid')
    clothesid = models.ForeignKey(Clothes, models.DO_NOTHING, db_column='clothesid')
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    clothescode = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    currentprice = models.FloatField()
    image = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    discount = models.FloatField()
    status = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clothesitem'


class Comment(models.Model):
    bookitemid = models.ForeignKey(Bookitem, models.DO_NOTHING, db_column='bookitemid')
    customerid = models.ForeignKey('Customer', models.DO_NOTHING, db_column='customerid')
    content = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    createat = models.DateTimeField(blank=True, null=True)
    rate = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'comment'


class Customer(models.Model):
    ccode = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    status = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    member = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    note = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'customer'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Fullname(models.Model):
    customerid = models.ForeignKey(Customer, models.DO_NOTHING, db_column='customerid')
    firstname = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    midname = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    lastname = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'fullname'


class Laptop(models.Model):
    typeid = models.ForeignKey('Type', models.DO_NOTHING, db_column='typeid')
    producerid = models.ForeignKey('Producer', models.DO_NOTHING, db_column='producerid')
    barcode = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    warranty = models.IntegerField()
    specification = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'laptop'


class Laptopitem(models.Model):
    cartid = models.ForeignKey(Cart, models.DO_NOTHING, db_column='cartid')
    laptopid = models.ForeignKey(Laptop, models.DO_NOTHING, db_column='laptopid')
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    laptopcode = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    currentprice = models.FloatField()
    image = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    discount = models.FloatField()
    status = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'laptopitem'


class Manufacture(models.Model):
    brand = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    address = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'manufacture'


class Order(models.Model):
    customerid = models.ForeignKey(Customer, models.DO_NOTHING, db_column='customerid')
    cartid = models.ForeignKey(Cart, models.DO_NOTHING, db_column='cartid')
    ordercode = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    status = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    createat = models.DateTimeField(blank=True, null=True)
    updateat = models.DateTimeField(blank=True, null=True)
    note = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order'


class Payment(models.Model):
    orderid = models.ForeignKey(Order, models.DO_NOTHING, db_column='orderid')
    provider = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    type = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    discount = models.FloatField()
    note = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    total = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'payment'


class Producer(models.Model):
    brand = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    address = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'producer'


class Publisher(models.Model):
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    address = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'publisher'


class Shipment(models.Model):
    orderid = models.ForeignKey(Order, models.DO_NOTHING, db_column='orderid')
    provider = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    address = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    type = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    note = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'shipment'


class Styles(models.Model):
    name = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    size = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    color = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    material = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'styles'


class Type(models.Model):
    ram = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    cpu = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    screensize = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    gpu = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)
    description = models.CharField(max_length=255, db_collation='utf8_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'type'
