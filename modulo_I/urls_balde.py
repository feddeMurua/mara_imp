from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado/baldes/$', listado_baldes, name="listado_baldes"),
    url(r'^alta/balde/$', alta_modif_balde, name="alta_modif_balde"),
    url(r'^modificación/balde/(?P<nro_balde>\d+)/$', alta_modif_balde, name="alta_modif_balde"),
    url(r'^baja/balde/$', baja_balde, name="baja_balde"),
]
