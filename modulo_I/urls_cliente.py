from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado_clientes/$', listado_clientes, name="listado_clientes"),
    url(r'^detalle_clientes/(?P<id_cliente>\d+)/$', detalle_clientes, name="detalle_clientes"),
    url(r'^add/persona/?$', new_persona, name="nueva_persona"),
    url(r'^alta/clientes/$', alta_modif_clientes, name="alta_modif_clientes"),
    url(r'^modificación/clientes/(?P<id_cliente>\d+)/$', alta_modif_clientes, name="alta_modif_clientes"),
    url(r'^baja_clientes/$', baja_clientes, name="baja_clientes"),    
]
