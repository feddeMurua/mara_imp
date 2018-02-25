from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado/generadores/$', listado_generadores, name="listado_generadores"),
    url(r'^detalle/generadores/(?P<nro_generador>\d+)/$', detalle_generadores, name="detalle_generadores"),
    url(r'^alta/generadores/$', alta_modif_generadores, name="alta_modif_generadores"),
    url(r'^baja/generadores/$', baja_generadores, name="baja_generadores"),
    url(r'^modificar/generadores/(?P<nro_generador>\d+)/$', alta_modif_generadores, name="alta_modif_generadores"),
    #RECORRIDOS
    url(r'^listado/recorridos/$', listado_recorridos, name="listado_recorridos"),
    url(r'^listado/establecimientos/recorrido/(?P<id_recorrido>\d+)/$', listado_establecimientos_recorrido, name="listado_establecimientos_recorrido"),
    url(r'^alta/recorrido/$', alta_recorridos, name="alta_recorridos"),
    url(r'^modificar/recorridos/(?P<id_recorrido>\d+)/$', modificar_recorridos, name="modificar_recorridos"),
    url(r'^baja/recorridos/$', baja_recorridos, name="baja_recorridos"),
    url(r'^alta/recorrido/?$', new_recorrido, name="nuevo_recorrido"),
    #BALDES PACTADOS
    url(r'^listado/baldes/pactados/(?P<nro_generador>\d+)/$', listado_baldes_pactados, name="listado_baldes_pactados"),
    url(r'^alta/balde/pactado/$', alta_balde_pactado, name="alta_balde_pactado"),
    url(r'^alta/balde/(?P<nro_generador>\d+)/$', alta_balde_pactado_mod, name="alta_balde_pactado_mod"), #Esta url es desde la vista ABM
    url(r'^baja/balde/pactado/hoja/$', baja_balde_pactado, name="baja_balde_pactado"),
    url(r'^modificación/balde/(?P<nro_balde>\d+)/$', modif_balde_pactado, name="modif_balde_pactado"),

]
