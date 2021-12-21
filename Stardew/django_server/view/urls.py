from django.urls import path

from .import views

urlpatterns = [
    # path('view/viewstart/', views.viewstart),
    path('home/', views.home),
    path('view/', views.viewstart)
]