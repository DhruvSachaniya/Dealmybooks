
from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class Category(models.Model):
    category_name = models.CharField(max_length=200)

    class Meta:
        db_table = "category"

class Subcategory(models.Model):
    subcategory_name = models.CharField(max_length=200)
    category = models.ForeignKey(Category,on_delete=models.CASCADE)
    class Meta:
        db_table = "subcategory"

class Product(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    product_name = models.CharField(max_length=300)
    category = models.ForeignKey(Category,on_delete=models.CASCADE)
    subcategory = models.ForeignKey(Subcategory,on_delete=models.CASCADE)
    description = models.CharField(max_length=1000)
    price = models.IntegerField()
    image = models.FileField(upload_to='admin')
    quantity = models.IntegerField(default=0, null=True)
    date = models.DateField(auto_now_add=True)

    class Meta:
        db_table = "product"

class Inquiry(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    subject = models.CharField(max_length=100)
    message = models.CharField(max_length=1000)
    date = models.DateField(auto_now_add=True)

    class Meta:
        db_table = 'inquiry'

class Feedback(models.Model):
    customer = models.CharField(max_length=100)
    email = models.EmailField(default='')
    message = models.CharField(max_length=1000)
    date = models.DateField(auto_now_add=True)

    class Meta:
        db_table = 'feedback'

class Role(models.Model):
	role = models.CharField(max_length=30)

	class Meta:
		db_table = 'role'


class Profile(models.Model):
    user    = models.OneToOneField(User, on_delete=models.CASCADE)
    role    = models.ForeignKey(Role, on_delete=models.CASCADE)
    contact = models.CharField(max_length=50, null=True, blank=True)
    address = models.TextField(null=True, blank=True)
    date    = models.DateField(auto_now_add=True)
    dob = models.DateField(null=True)
    gender = models.CharField(null=True, max_length=100)

    class Meta:
        db_table = 'profile'

class Wishlist(models.Model):
    customer = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    class Meta:
        db_table = 'wishlist'

class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(max_length=11, default=1)
    class Meta:
        db_table = 'cart'

class Order(models.Model):
    date = models.DateField(auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    total_amount = models.IntegerField()
    status = models.CharField(max_length=200, default='Pending')
    class Meta:
        db_table = 'order'

class Orderitem(models.Model):
    product = models.ForeignKey(Product,on_delete=models.CASCADE)
    order = models.ForeignKey(Order,on_delete=models.CASCADE)
    product_name = models.CharField(max_length=200)
    prices = models.IntegerField()
    image = models.ImageField(upload_to='customer/orderitem/images', null=True)
    quantity = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = 'orderitem'
	


class Shippingaddress(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    username = models.CharField(max_length=100)
    email = models.EmailField()
    address = models.CharField(max_length=1000)
    contact = models.PositiveBigIntegerField()
    class Meta:
        db_table = 'shippingaddress'

class Billingaddress(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    username = models.CharField(max_length=100)
    email = models.EmailField()
    contact = models.PositiveBigIntegerField()
    address = models.CharField(max_length=1000)
    class Meta:
        db_table = 'billingaddress'



