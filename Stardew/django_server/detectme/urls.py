from django.urls import path

from .import views

urlpatterns = [
    path('', views.home),
    # path('start/', views.start),
    path('streaming/', views.streaming),
    path('on/', views.on),
]