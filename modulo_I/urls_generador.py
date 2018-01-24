from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado/generadores/$', listado_generadores, name="listado_generadores"),
    url(r'^detalle/generadores/(?P<nro_inscripcion>\d+)/$', detalle_generadores, name="detalle_generadores"),
    url(r'^alta/generadores/$', alta_modif_generadores, name="alta_modif_generadores"),
    url(r'^baja/generadores/$', baja_generadores, name="baja_generadores"),
    url(r'^modificar/generadores/(?P<nro_inscripcion>\d+)/$', alta_modif_generadores, name="alta_modif_generadores"),    
    #horarios del centro de generador
    url(r'^listado/horarios/(?P<nro_inscripcion>\d+)/$', listado_horarios, name="listado_horarios"),
    url(r'^alta/horarios/(?P<nro_inscripcion>\d+)/$', alta_modif_horarios, name="alta_modif_horarios"),
    url(r'^baja/horarios/$', baja_horarios, name="baja_horarios"),
    url(r'^modificar/horarios/(?P<nro_inscripcion>\d+)/(?P<id_horario>\d+)/$', alta_modif_horarios, name="alta_modif_horarios"),
    #residuos del centro generador
    url(r'^listado/residuos/(?P<nro_inscripcion>\d+)/$', listado_residuos, name="listado_residuos"),
    url(r'^alta/residuos/(?P<nro_inscripcion>\d+)/$', alta_modif_residuos, name="alta_modif_residuos"),
    url(r'^baja/residuos/$', baja_residuos, name="baja_residuos"),
    url(r'^modificar/residuos/(?P<nro_inscripcion>\d+)/(?P<id_residuo>\d+)/$', alta_modif_residuos, name="alta_modif_residuos"),
]
