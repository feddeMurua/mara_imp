from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado_generadores/$', listado_generadores, name="listado_generadores"),
    url(r'^detalle_generadores/(?P<nro_inscripcion>\d+)/$', detalle_generadores, name="detalle_generadores"),
    url(r'^alta_generadores/$', alta_generadores, name="alta_generadores"),
    url(r'^baja_generadores/$', baja_generadores, name="baja_generadores"),
    url(r'^modificar_generadores/(?P<nro_inscripcion>\d+)/$', modificar_generadores, name="modificar_generadores"),    
    #horarios del centro de generador
    url(r'^listado_horarios/(?P<nro_inscripcion>\d+)/$', listado_horarios, name="listado_horarios"),
    url(r'^alta_horarios/(?P<nro_inscripcion>\d+)/$', alta_horarios, name="alta_horarios"),
    url(r'^baja_horarios/$', baja_horarios, name="baja_horarios"),
    url(r'^modificar_horarios/(?P<nro_inscripcion>\d+)/(?P<id_horario>\d+)/$', modificar_horarios, name="modificar_horarios"),
    #residuos del centro generador
    url(r'^listado_residuos/(?P<nro_inscripcion>\d+)/$', listado_residuos, name="listado_residuos"),
    url(r'^alta_residuos/(?P<nro_inscripcion>\d+)/$', alta_residuos, name="alta_residuos"),
    url(r'^baja_residuos/$', baja_residuos, name="baja_residuos"),
    url(r'^modificar_residuos/(?P<nro_inscripcion>\d+)/(?P<id_residuo>\d+)/$', modificar_residuos, name="modificar_residuos"),
]
