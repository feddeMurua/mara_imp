from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^listado_personas/$', listado_personas, name="listado_personas"),
    url(r'^alta_personas/$', alta_personas, name="alta_personas"),
    url(r'^baja_personas/$', baja_personas, name="baja_personas"),
]
