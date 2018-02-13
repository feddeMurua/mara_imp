from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado/generadores/$', listado_generadores, name="listado_generadores"),
    url(r'^detalle/generadores/(?P<nro_generador>\d+)/$', detalle_generadores, name="detalle_generadores"),
    url(r'^alta/generadores/$', alta_modif_generadores, name="alta_modif_generadores"),
    url(r'^baja/generadores/$', baja_generadores, name="baja_generadores"),
    url(r'^modificar/generadores/(?P<nro_generador>\d+)/$', alta_modif_generadores, name="alta_modif_generadores"),        
]
