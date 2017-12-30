from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado_clientes/$', listado_clientes, name="listado_clientes"),
    url(r'^detalle_clientes/(?P<id_cliente>\d+)/$', detalle_clientes, name="detalle_clientes"),
    url(r'^alta_personas/$', alta_personas, name="alta_personas"),    
    url(r'^alta_clientes/$', alta_clientes, name="alta_clientes"),
    url(r'^baja_clientes/$', baja_clientes, name="baja_clientes"),
    url(r'^modificar_clientes/(?P<id_cliente>\d+)/$', modificar_clientes, name="modificar_clientes"),
]
