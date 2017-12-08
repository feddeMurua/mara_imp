from django.conf.urls import url, include
from django.contrib import admin
from .views import *

urlpatterns = [
    url(r'^listado_hojas_de_ruta/$', listado_hojas_de_ruta, name="listado_hojas_de_ruta"),
    url(r'^alta_hoja_ruta/$', alta_hoja_ruta, name="alta_hoja_ruta"),
]
