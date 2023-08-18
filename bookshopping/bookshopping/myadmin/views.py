from urllib import request
from django.shortcuts import redirect, render
from django.contrib import auth
from myadmin.models import Inquiry
from .models import *
from django.contrib import messages

from .form import ChangePasswordForm


# Create your views here.
def sign_in(request):
    if request.method == 'POST':
        username = request.POST['username']
        password  = request.POST['password']

        result = auth.authenticate(username=username,password=password)
        if result is None :
            print('Invalid username or password')
        else:
            auth.login(request, result)
            messages.success(request, 'Login Successful')
            if result.profile.role_id == 2:
                return redirect('customer_home')
            else:
                return redirect('admin_dashboard')
        
    return render(request,'admin/sign_in.html')

def admin_logout(request):
    auth.logout(request)
    return redirect('sign_in')

def admin_dashboard(request):
    return render(request,'admin/admin_dashboard.html')

def change_password(request):
    if request.method == 'POST':
        form = ChangePasswordForm(data=request.POST, user=request.user)
        print(form)
        if form.is_valid():
            form.save()
            messages.success(request, 'Password Changed Successfully')
            # update_session_auth_hash(request=request, user=request.user)
            return redirect('change_password')
    else:
        form = ChangePasswordForm(user=request.user)
    return render(request,'admin/change_password.html',{'form':form})

def feedback(request):
    list_feedback = Feedback.objects.all()
    return render(request,'admin/feedback.html',{'list_feedback':list_feedback})

def all_users(request):
    user = Profile.objects.filter(role=2)
    return render(request,'admin/all_users.html',{'user':user})

def all_users_details(request,id):
    user = Profile.objects.get(pk=id)
    return render(request,'admin/all_users_details.html',{'user':user})

def all_user_delete(request,id):
    result = User.objects.get(pk=id)
    result.delete()
    messages.warning(request, f'{result} Deleted')
    return redirect('all_users')

    #-------------category---------------
def add_category(request):
    if request.method == 'POST':
        category_name = request.POST['category']
        Category.objects.create(category_name=category_name)
        messages.success(request, f'{category_name} added successfully')
        return redirect('view_category')
    return render(request,'admin/add_category.html')

def edit_category(request,id):
    edite_result = Category.objects.get(pk=id)
    return render(request,'admin/edit_category.html',{'result':edite_result})

def view_category(request):
    category = Category.objects.all()
    return render(request,'admin/view_category.html',{'cat':category})

def delet_category(request,id):
    result = Category.objects.get(pk=id)
    result.delete()
    messages.warning(request, f'{result} Deleted')
    return redirect('view_category')

def update_category(request,id):
    category_name = request.POST['category']
    Category.objects.update_or_create(pk=id, defaults={'category_name':category_name})
    messages.info(request, f'{category_name} updated successfully')
    return redirect('view_category')


 #-------------subcategory---------------
def add_subcategory(request):
    category_all = Category.objects.all()
    if request.method =='POST':
        subcategory_name = request.POST['subcategory']
        category_name = request.POST['category']
        Subcategory.objects.create(subcategory_name=subcategory_name,category=Category.objects.get(pk=int(category_name)))
        messages.success(request, f'{subcategory_name} added successfully')
        return redirect('view_subcategory')
    return render(request,'admin/add_subcategory.html',{'categoryall':category_all})

def edit_subcategory(request,id):
    cat = Category.objects.all()
    subcat= Subcategory.objects.get(pk=id)
    return render(request,'admin/edit_subcategory.html',{'cat':cat,'subcat':subcat})

def view_subcategory(request):
    subcategory = Subcategory.objects.all()
    return render(request,'admin/view_subcategory.html',{'subcategory':subcategory})

def delet_subcategory(request,id):
    result = Subcategory.objects.get(pk=id)
    result.delete()
    messages.warning(request, f'{result} Deleted')
    return redirect('view_subcategory')

def update_subcategory(request,id):
    subcategory = Subcategory.objects.get(pk=id)
    subcategory_name = request.POST['subcategory']
    category_name = Category.objects.get(pk=int(request.POST['category']))
    Subcategory.objects.update_or_create(pk=id, defaults={'subcategory_name':subcategory_name,'category':category_name})
    messages.info(request, f'{subcategory} updated successfully')
    return redirect('view_subcategory')


 #-------------Product---------------

# def add_product(request):
#     category_all = Category.objects.all()
#     subcategory_all = Subcategory.objects.all()
#     if request.method == 'POST':
#         pname = request.POST['productname']
#         category = Category.objects.get(pk=int(request.POST['category']))
#         subcategory = Subcategory.objects.get(pk=int(request.POST['subcategory']))
#         description = request.POST['descrption']
#         quantity = request.POST['quantity']
#         price = request.POST['price']
#         image = request.FILES['file']
#         Product.objects.create(product_name=pname, category=category,subcategory=subcategory,description=description,price=price,quantity=quantity,image=image)
#         return redirect('view_products') 
#     return render(request,'admin/add_product.html',{'cate':category_all,'subcate':subcategory_all})

# def edit_products(request,id):
#     product = Product.objects.get(pk=id)
#     category_all = Category.objects.all()
#     subcategory_all = Subcategory.objects.all()
#     return render(request,'admin/edit_product.html',{'cate':category_all,'subcate':subcategory_all,'prod':product})

# def view_products(request):
#     product = Product.objects.all()
#     return render(request,'admin/view_products.html',{'prod':product})

# def products_details(request,id):
#     product = Product.objects.get(pk=id)
#     return render(request,'admin/products_details.html',{'prod':product})

# def update_product(request,id):
#     product = Product.objects.get(pk=id)
#     pname = request.POST['productname']
#     category = Category.objects.get(pk=int(request.POST['category']))
#     subcategory = Subcategory.objects.get(pk=int(request.POST['subcategory']))
#     description = request.POST['descrption']
#     quantity = request.POST['quantity']
#     price = request.POST['price']
#     if request.FILES.get('file', False):
#         image = request.FILES['file']
#     else:
#         image = product.image
#     Product.objects.update_or_create(pk=id, defaults={'product_name':pname,'subcategory_name':subcategory,'category':category,'description':description,'price':price,'quantity':quantity,'image':image})

#     return redirect('view_products')


# def delete_product(request,id):
#     result = Product.objects.get(pk=id)
#     result.delete()
#     return redirect('view_products')





#-------------Orders---------------

def customer_all_orders(request):
    all_ords = Order.objects.all()
    return render(request, 'admin/customer_all_orders.html', {'all_ords':all_ords})

def customer_all_order_details(request, id):
    items = Orderitem.objects.filter(order=id)
    if items:
        uname = items[0].order.user.username
        contact = items[0].order.user.customerprofile.contact_number
        date = items[0].order.date    
        saddress = Shippingaddress.objects.filter(user=items[0].order.user).last()
        baddress = Billingaddress.objects.filter(user=items[0].order.user).last()

    context = {
        'uname':uname,
        'contact':contact,
        'date':date,
        'items':items,
        'saddress':saddress, 
        'baddress':baddress,
    }
    
    return render(request, 'admin/customer_all_order_details.html',context)

 #-------------Inquiry---------------

def inquiry(request):
    inquiry = Inquiry.objects.all()
    return render(request,'admin/inquiry.html',{'inquiry':inquiry,})