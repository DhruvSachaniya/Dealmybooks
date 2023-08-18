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
from customer import views
urlpatterns = [
   

   #---------customer----------
    path('signin_page/', views.signin_page, name='signin_page'),
    path('signup_page/', views.signup_page, name='signup_page'),
    path('logout/', views.user_logout, name='logout'),
    path('home/', views.customer_home, name='customer_home'),
    path('main_category/<cat>/', views.main_category, name='main_category'),
    path('customer_abouts/', views.customer_abouts, name='customer_abouts'),
    path('customer_feedback/', views.customer_feedback, name='customer_feedback'),
    path('customer_inquiry/', views.customer_inquiry, name='customer_inquiry'),
    path('customer_profile/', views.customer_profile, name='customer_profile'),
    path('customer_update_profile/<int:id>/', views.customer_update_profile, name='customer_update_profile'),
    path('customer_change_password/', views.customer_change_password, name='customer_change_password'),
    path('customer_orders/', views.customer_orders, name='customer_orders'),
    path('customer_order_details/<int:id>/', views.customer_order_details, name='customer_order_details'),
    path('customer_wishlist/', views.customer_wishlist, name='customer_wishlist'),
    path('add_products/', views.add_product, name='add_products'),
    path('edit_product/<int:id>/', views.edit_product, name='edit_product'),
    path('update_product/<int:id>/', views.update_product, name='update_product'),
    path('delete_product/<int:id>/', views.delete_product, name='delete_product'),
    path('customer_view_products/', views.customer_view_products, name='customer_view_products'),
    path('customer_view_products_details/<int:id>/', views.customer_view_products_details, name='customer_view_products_details'),
    path('add_remove_wishlist/<int:id>/', views.add_remove_wishlist, name='add_remove_wishlist'),
    path('add_to_cart/<int:id>/', views.add_to_cart, name='add_to_cart'),
    path('remove_from_cart/<int:id>/', views.remove_from_cart, name='remove_from_cart'),
    path('customer_cart/', views.customer_cart, name='customer_cart'),
    path('customer_product_details/<int:id>/', views.customer_product_details, name='customer_product_details'),
    path('customer_all_products/', views.customer_all_products, name='customer_all_products'),
    path('customer_prods/<ct>/<subct>/', views.customer_prods, name='customer_prods'),
    path('success/', views.success, name='success'),
    path('update_quantity/', views.update_quantity, name='update_quantity'),
]
