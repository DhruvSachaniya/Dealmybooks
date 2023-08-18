"""bookshopping URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myadmin import views
urlpatterns = [
   

   #---------myadmin----------

    path('sign_in/', views.sign_in, name='sign_in'),
    path('admin_logout/', views.admin_logout, name='admin_logout'),
    path('admin_dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('change_password/', views.change_password, name='change_password'),
    path('feedback/', views.feedback, name='feedback'),
    path('inquiry/', views.inquiry, name='inquiry'),
    path('all_users/', views.all_users, name='all_users'),
    path('all_user_delete/<int:id>/', views.all_user_delete, name='all_user_delete'),
    path('all_users_details/<int:id>/', views.all_users_details, name='all_users_details'),

    #-------category--------
    path('add_category/', views.add_category, name='add_category'),
    path('edit_category/<int:id>/', views.edit_category, name='edit_category'),
    path('update_category/<int:id>/', views.update_category, name='update_category'),
    path('view_category/', views.view_category, name='view_category'),
    path('delet_category/<int:id>/', views.delet_category, name='delet_category'),

    #---------subcategory---------
    path('add_subcategory/', views.add_subcategory, name='add_subcategory'),
    path('edit_subcategory/<int:id>/', views.edit_subcategory, name='edit_subcategory'),
    path('update_subcategory/<int:id>/', views.update_subcategory, name='update_subcategory'),
    path('view_subcategory/', views.view_subcategory, name='view_subcategory'),
    path('delete_subcategory/<int:id>/', views.delet_subcategory, name='delete_subcategory'),

    #---------product---------
    # path('add_product/', views.add_product, name='add_product'),
    # path('edit_product/<int:id>/', views.edit_products, name='edit_product'),
    # path('update_product/<int:id>/', views.update_product, name='update_product'),
    # path('view_products/', views.view_products, name='view_products'),
    # path('products_details/<int:id>/', views.products_details, name='products_details'),
    # path('delete_product/<int:id>/', views.delete_product, name='delete_product'),

    #---------Orders---------
    path('customer_all_orders/', views.customer_all_orders, name='customer_all_orders'),

]
