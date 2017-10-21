from django.conf.urls import url
from .views import *
from modulo_I import views as mIviews

urlpatterns = [
    url(r'^listado_clientes/$', mIviews.listado_clientes, name="cliente_listado"),
    url(r'^detalle_clientes/(?P<documento>\d+)/$', mIviews.detalle_clientes, name="detalle_clientes"),
    url(r'^alta_clientes/$', mIviews.alta_clientes, name="alta_clientes"),
    url(r'^baja_clientes/$', mIviews.baja_clientes, name="baja_clientes"),
    url(r'^modificar_clientes/(?P<documento>\d+)/$', mIviews.modificar_clientes, name="modificar_clientes"),
]