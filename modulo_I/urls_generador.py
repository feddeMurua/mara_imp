from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado/generadores/$', listado_generadores, name="listado_generadores"),
    url(r'^detalle/generadores/(?P<nro_generador>\d+)/$', detalle_generadores, name="detalle_generadores"),
    url(r'^alta/generadores/$', alta_modif_generadores, name="alta_modif_generadores"),
    url(r'^baja/generadores/$', baja_generadores, name="baja_generadores"),
    url(r'^modificar/generadores/(?P<nro_generador>\d+)/$', alta_modif_generadores, name="alta_modif_generadores"),
    #Sector asociado
    url(r'^listado/sectores/$', listado_sectores, name="listado_sectores"),
    url(r'^alta/sector/$', alta_sectores, name="alta_sectores"),
    url(r'^modificar/sectores/(?P<id_sector>\d+)/$', modificar_sectores, name="modificar_sectores"),
    url(r'^baja/sectores/$', baja_sectores, name="baja_sectores"),    
]
