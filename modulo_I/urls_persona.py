from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado/personas/$', listado_personas, name="listado_personas"),
    url(r'^detalle/personas/(?P<id_persona>\d+)/$', detalle_personas, name="detalle_personas"),
    url(r'^alta/personas/$', alta_personas, name="alta_personas"),
    url(r'^baja/personas/$', baja_personas, name="baja_personas"),
    url(r'^modificar/personas/(?P<id_persona>\d+)/$', modificar_personas, name="modificar_personas"),
]
