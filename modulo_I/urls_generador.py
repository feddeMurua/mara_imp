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
    url(r'^alta/sector/?$', new_sector, name="nuevo_sector"),
    #Cuadrantes
    url(r'^listado/cuadrantes/$', listado_cuadrantes, name="listado_cuadrantes"),
    url(r'^alta/cuadrante/$', alta_cuadrantes, name="alta_cuadrantes"),
    url(r'^modificar/cuadrantes/(?P<id_cuadrante>\d+)/$', modificar_cuadrantes, name="modificar_cuadrantes"),
    url(r'^baja/cuadrantes/$', baja_cuadrantes, name="baja_cuadrantes"),
    url(r'^alta/cuadrante/?$', new_cuadrante, name="nuevo_cuadrante"),
    #BALDES PACTADOS
    url(r'^listado/baldes/pactados/(?P<nro_generador>\d+)/$', listado_baldes_pactados, name="listado_baldes_pactados"),
    url(r'^alta/balde/pactado/$', alta_balde_pactado, name="alta_balde_pactado"),
    url(r'^alta/balde/(?P<nro_generador>\d+)/$', alta_balde_pactado_mod, name="alta_balde_pactado_mod"), #Esta url es desde la vista ABM
    url(r'^baja/balde/pactado/hoja/$', baja_balde_pactado, name="baja_balde_pactado"),
    url(r'^modificación/balde/(?P<nro_balde>\d+)/$', modif_balde_pactado, name="modif_balde_pactado"),

]
