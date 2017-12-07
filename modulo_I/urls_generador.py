from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado_generadores/$', listado_generadores, name="listado_generadores"),
    url(r'^detalle_generadores/(?P<nro_inscripcion>\d+)/$', detalle_generadores, name="detalle_generadores"),
    url(r'^alta_generadores/$', alta_generadores, name="alta_generadores"),
    url(r'^baja_generadores/$', baja_generadores, name="baja_generadores"),
    url(r'^modificar_generadores/(?P<nro_inscripcion>\d+)/$', modificar_generadores, name="modificar_generadores"),
]
