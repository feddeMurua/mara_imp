from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado/baldes/$', listado_baldes, name="listado_baldes"),
    url(r'^alta/balde/$', alta_modif_balde, name="alta_modif_balde"),
    url(r'^modificación/balde/(?P<nro_balde>\w+)/$', alta_modif_balde, name="alta_modif_balde"),
    url(r'^baja/balde/$', baja_balde, name="baja_balde"),
    url(r'^reset/balde/(?P<nro_balde>\w+)/$', reset_balde, name="reset_balde"),
]
