from django.contrib import messages
from email.policy import default
from django.shortcuts import render,redirect,HttpResponseRedirect,HttpResponse
from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth import update_session_auth_hash
from myadmin.form import ChangePasswordForm
from myadmin.models import Category,Subcategory,Product,Feedback,Cart,Wishlist,Order,Orderitem,Shippingaddress,Billingaddress,Inquiry,Profile
import razorpay
# Create your views here.
# ---------------------- customer ----------------------
cat     = Category.objects.all()
subcat  = Subcategory.objects.all()
catdict = {}
for i in cat:
    subcatlist = []
    for j in Subcategory.objects.filter(category=i):
        subcatlist.append(j.subcategory_name)    
    catdict.update({i.category_name:subcatlist})




#--------------signin----------------


def signin_page(request):
    if request.method == 'POST':
        username   = request.POST['username']
        password   = request.POST['password']
        result     = auth.authenticate(username=username, password=password)
        if result is None:
            print('Invalid Email or password')
        else:
            auth.login(request, result)
            messages.success(request, 'Login Successful')
            return redirect('/customer/home/')
    return render(request, 'customer/signin_page.html',{'catdict':catdict,})



#--------------signup----------------


def signup_page(request):
    if request.method == 'POST':
        username    = request.POST['username']
        email       = request.POST['email']
        contact     = request.POST['contact']
        address     = request.POST['address']
        password    = request.POST['password']
        conpassword = request.POST['confirmpassword']

        if password == conpassword:
            user = User.objects.create_user(username=username,email=email,password=password)
            Profile.objects.create(contact=contact,address=address,user_id=user.id,role_id=2)
            messages.success(request, f'Account created for {user.username}')
            return redirect('/customer/signin_page/')
    return render(request, 'customer/signup_page.html',{'catdict':catdict,})




#----------------------Logout---------------------


def user_logout(request):
    auth.logout(request)
    messages.warning(request, 'Logout Successfully')
    return redirect('/customer/signin_page/')


#--------------Home Page-----------------

def customer_home(request):
    category_list = Category.objects.all()
    new_arrivals  = Product.objects.all().order_by('-id')[:10:-1]
    return render(request, 'customer/customer_home.html',{'new_arrivals':new_arrivals,'category_list':category_list, 'catdict':catdict,})



#--------------About Page-----------------


def customer_abouts(request):
    return render(request, 'customer/customer_abouts.html',{'catdict':catdict,})

def main_category(request,cat):
    catobj      = Category.objects.filter(category_name=cat).first()
    prods       = Product.objects.filter(category=catobj)
    return render(request, 'customer/customer_prods.html',{'catdict':catdict,'prods':prods,})




#--------------Feedback Page-----------------


def customer_feedback(request):
    if request.method == 'POST':
        cname   = request.POST['customer']
        email   = request.POST['email']
        message = request.POST['message']
        Feedback.objects.create(customer=cname,email=email,message=message)
        messages.success(request, 'Feedback Sent Successfully')
    return render(request, 'customer/customer_feedback.html',{'catdict':catdict,})




#--------------Inquiry Page-----------------


def customer_inquiry(request):
    if request.method == 'POST':
        cname   = request.POST['cutomername']
        email   = request.POST['email']
        subject = request.POST['subject']
        message = request.POST['message']
        Inquiry.objects.create(name=cname,email=email,subject=subject,message=message)
        messages.success(request, 'Inquiry Sent Successfully')
    return render(request, 'customer/customer_inquiry.html',{'catdict':catdict,})



#----------------Customer Profile----------------


def customer_profile(request):
    profile     = Profile.objects.filter(user=request.user).first()
    return render(request, 'customer/customer_profile.html',{'profile':profile,'catdict':catdict,})

def customer_update_profile(request,id):
    print(id)
    username    = request.POST['username']
    email       = request.POST['email']
    dob       = request.POST['dob']
    gender       = request.POST['gender']
    contact     = request.POST['contact']
    address     = request.POST['address']
    User.objects.update_or_create(pk=request.user.id, defaults={'username':username, 'email':email})
    Profile.objects.update_or_create(pk=id, defaults={'contact':contact,'gender':gender, 'dob':dob, 'address':address})
    messages.success(request, 'Profile Updated Successfully')
    return redirect('customer_profile')




#-----------------Change Passord---------------


def customer_change_password(request):
    if request.method == 'POST':
        form = ChangePasswordForm(data=request.POST, user=request.user)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request=request, user=request.user)
            messages.success(request, 'Password Changed Successfully')
            return redirect('customer_profile')
    else:
        form = ChangePasswordForm(user=request.user)
    return render(request, 'customer/customer_change_password.html',{'form':form,'catdict':catdict,})



#------------------Product--------------------

def customer_prods(request,ct,subct):
    catobj    = Category.objects.filter(category_name=ct).first()
    subcatobj = Subcategory.objects.filter(category=catobj, subcategory_name=subct).first()
    prods     = Product.objects.filter(category_id=catobj.id).filter(subcategory_id=subcatobj.id)
    return render(request, 'customer/customer_prods.html',{'prods':prods,'catdict':catdict,})



#---------------Orders------------------



def customer_orders(request):
    orders = Order.objects.filter(user=request.user)
    return render(request, 'customer/customer_orders.html',{'orders':orders, 'catdict':catdict,})


def customer_order_details(request,id):
    items = Orderitem.objects.filter(order=id)
    saddress = Shippingaddress.objects.filter(user=items[0].order.user).last()
    baddress = Billingaddress.objects.filter(user=items[0].order.user).last()
    context = {
        'oid':items[0].order.id,
        'items':items,
        'saddress':saddress,
        'baddress':baddress,
        'catdict':catdict,
    }
    return render(request, 'customer/customer_order_details.html', context)




#--------------Add and Removed Wishlist-------------------


def add_remove_wishlist(request, id):
    prod = Product.objects.get(pk=id)
    if  Wishlist.objects.filter(customer=request.user, product=prod).exists():
        data = Wishlist.objects.filter(customer=request.user).filter(product=prod)
        data.delete()
        messages.warning(request, 'Product removed from wishlist')
        return redirect(request.META.get('HTTP_REFERER'))
    else:
        Wishlist(customer=request.user, product=prod).save()
        messages.warning(request, 'Product Added to wishlist')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def customer_wishlist(request):
    products = [p for p in Wishlist.objects.all() if p.customer == request.user]
    return render(request, 'customer/customer_wishlist.html',{'products':products,'catdict':catdict,})

def customer_product_details(request,id):
    prod = Product.objects.get(pk=id)
    # cprod = Cart.objects.filter(user=request.user, product=prod).first()
    return render(request, 'customer/customer_product_details.html',{'prod':prod,'catdict':catdict,})




#--------------------Product Details----------------------



def customer_all_products(request):
    prods = Product.objects.all()
    # cprods = Cart.objects.filter(user=request.user).all()
    return render(request, 'customer/customer_all_products.html',{'prods':prods,'catdict':catdict,})


#--------------------Shipping Address----------------------



def shipping_address(request):
    if request.method == 'POST':
        username = request.POST['name']
        email    = request.POST['email']
        contact  = request.POST['contact']
        address  = request.POST['address']

        shipping = shipping_address.objects.create(username=username,email=email,contact_number=contact,address=address)
        return render(request, 'customer/customer_cart.html',{'shipping':shipping, 'catdict':catdict,})

#--------------------Add to Cart----------------------


def add_to_cart(request, id):
    prod = Product.objects.get(pk=id)
    if not Cart.objects.filter(user=request.user, product=prod).exists():
        Cart(user=request.user, product=prod).save()
        messages.success(request, 'Product Added to Cart')
    else:
        messages.error(request, 'Product Already in Cart')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    
              
def remove_from_cart(request, id):
    prod   = Product.objects.get(pk=id)
    cprod  = Cart.objects.filter(user=request.user, product=prod)
    cprod.delete()
    messages.warning(request, 'Product removed from Cart')
    return redirect(request.META.get('HTTP_REFERER'))



#----------------Cart-------------------



def customer_cart(request):
    profile  = Profile.objects.filter(user=request.user).first()
    prod     = [p for p in Cart.objects.all() if p.user == request.user]
    price_total = 0
    for pr in prod:
        price_total += pr.product.price * pr.quantity
    if request.method == 'POST':
        total_price = request.POST['total_price']
        
        Order.objects.create(user=request.user,total_amount=total_price).save()

        

        bill_check = request.POST.get('bill_check', False)
        if bill_check:
            name1 = request.POST.get('name1')
            email1 = request.POST.get('email1')
            contact1 = request.POST.get('contact1')
            address1 = request.POST.get('address1')
            Billingaddress.objects.create(user=request.user, order=Order.objects.filter(user=request.user).last(), username=name1, email=email1, contact=contact1, address=address1).save()       
        else:
            name2 = request.POST.get('name2')
            email2 = request.POST.get('email2')
            contact2 = request.POST.get('contact2')
            address2 = request.POST.get('address2')
            Billingaddress.objects.create(user=request.user, order=Order.objects.filter(user=request.user).last(), username=name2, email=email2, contact=contact2, address=address2).save()

        sname = request.POST.get('sname')
        semail = request.POST.get('semail')
        scontact = request.POST.get('scontact')
        saddress = request.POST.get('saddress')
        Shippingaddress.objects.create(user=request.user, order=Order.objects.filter(user=request.user).last(), username=sname, email=semail, contact=scontact, address=saddress).save()
        
        # ---------------- PAYMENT- ----------------------

        radio = request.POST.get('payment')
        
        if radio == 'cc':

            key_id = 'rzp_test_Q13PoItwfR4lPG'
            key_secret = 'TbWbzaVxyCnR8aeA8d3iaz0I'


            client = razorpay.Client(auth=(key_id, key_secret))

            data = {
                'amount': price_total * 100,
                'currency': 'INR',
                "receipt":"Bookshopping",
                "notes":{
                    'name' : 'JD',
                    'payment_for':'OCS Test'
                }
            }
            payment = client.order.create(data=data)
            context = {'payment' : payment, 'profile':profile, 'catdict':catdict,}
            return render(request, 'customer/process_payment.html',context)

        else:
            prod = [p for p in Cart.objects.all() if p.user == request.user]
            for i in prod:
                Orderitem.objects.create(product=i.product, order=Order.objects.filter(user=request.user).last(),product_name=i.product.product_name, prices=i.product.price, image=i.product.image, quantity=1).save()
                Cart.objects.filter(product=i.product).first().delete()
            ord = Order.objects.filter(user=request.user).last()
            ord.status = 'Delivered'
            ord.save()
            return render(request,'customer/success.html',{'catdict':catdict})
    return render(request, 'customer/customer_cart.html',{'prod':prod,'catdict':catdict,'price_total':price_total,'profile':profile,})


def success(request):
    prod = [p for p in Cart.objects.all() if p.user == request.user]
    for i in prod:
        Orderitem.objects.create(product=i.product, order=Order.objects.filter(user=request.user).last(),product_name=i.product.product_name, prices=i.product.price, image=i.product.image, quantity=i.quantity).save()
        Cart.objects.filter(product=i.product).first().delete()
    ord = Order.objects.filter(user=request.user).last()
    ord.status = 'Delivered'
    ord.save() 
    return render(request,'customer/success.html')

def update_quantity(request):
    cart_id = request.POST['product_id']
    quantity = request.POST['quantity']
    Cart.objects.update_or_create(pk=cart_id,defaults={'quantity':quantity})
    return HttpResponse(1)




#-----------UserAdd Product-----------



def add_product(request):
    category_all = Category.objects.all()
    subcategory_all = Subcategory.objects.all()
    if request.method == 'POST':
        pname = request.POST['pname']
        category = int(request.POST['category'])
        subcategory = int(request.POST['subcategory'])
        description = request.POST['description']
        quantity = request.POST['quantity']
        price = request.POST['price']
        image = request.FILES['file']
        Product.objects.create(user=request.user, product_name=pname, category_id=category,subcategory_id=subcategory,description=description,price=price,quantity=quantity,image=image)
        messages.success(request, 'Product Added Successfully')
        return redirect('customer_all_products') 
    return render(request,'customer/add_product.html',{'cate':category_all,'subcate':subcategory_all,'catdict':catdict,})


def customer_view_products(request):
    product = Product.objects.filter(user=request.user)
    return render(request,'customer/customer_view_product.html',{'prod':product,'catdict':catdict,})

def customer_view_products_details(request,id):
    product = Product.objects.get(pk=id)
    return render(request,'customer/customer_view_product_details.html',{'prod':product,'catdict':catdict,})

def edit_product(request,id):
    product         = Product.objects.get(pk=id)
    category_all    = Category.objects.all()
    subcategory_all = Subcategory.objects.all()
    return render(request,'customer/edit_product.html',{'cate':category_all,'subcate':subcategory_all,'prod':product, 'catdict':catdict,})

def update_product(request,id):
    product = Product.objects.get(pk=id)
    pname = request.POST['pname']
    category = int(request.POST['category'])
    subcategory = int(request.POST['subcategory'])
    description = request.POST['description']
    quantity = request.POST['quantity']
    price = request.POST['price']
    if request.FILES.get('file', False):
        image = request.FILES['file']
    else:
        image = product.image
    Product.objects.update_or_create(pk=id, defaults={'product_name':pname,'subcategory_id':subcategory,'category_id':category,'description':description,'price':price,'quantity':quantity,'image':image})
    messages.success(request, 'Product Update Successfully')
    return redirect('customer_view_products')

def delete_product(request,id):
    result = Product.objects.get(pk=id)
    result.delete()
    messages.success(request,'Product Deleted Successfully')
    return redirect('customer_view_products')