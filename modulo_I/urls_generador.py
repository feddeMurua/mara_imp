from django.conf.urls import url
from .views import *
from modulo_I import views as mIviews

urlpatterns = [
    url(r'^listado_generadores/$', mIviews.listado_generadores, name="listado_generadores"),
    url(r'^detalle_generadores/(?P<nro_inscripcion>\d+)/$', mIviews.detalle_generadores, name="detalle_generadores"),
    url(r'^alta_generadores/$', mIviews.alta_generadores, name="alta_generadores"),
    url(r'^baja_generadores/$', mIviews.baja_generadores, name="baja_generadores"),
    url(r'^modificar_generadores/(?P<nro_inscripcion>\d+)/$', mIviews.modificar_generadores, name="modificar_generadores"),
]
