from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado/localidades/$', listado_localidades, name="listado_localidades"),
    url(r'^alta/localidades/$', alta_localidades, name="alta_localidades"),
    url(r'^alta/localidad/?$', new_localidad, name="nueva_localidad"),
    url(r'^baja/localidades/$', baja_localidades, name="baja_localidades"),
    url(r'^modificar/localidades/(?P<id_localidad>\d+)/$', modificar_localidades, name="modificar_localidades"),
]
