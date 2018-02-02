from django.conf.urls import url, include
from django.contrib import admin
from .views import *

urlpatterns = [
    url(r'^listado/hojas_de_ruta/$', listado_hojas_de_ruta, name="listado_hojas_de_ruta"),
    url(r'^detalle/hoja_ruta/(?P<id_hoja>\d+)/$', detalle_hojas_de_ruta, name="detalle_hojas_de_ruta"),
    url(r'^alta/hoja_ruta/$', alta_modif_hoja_ruta, name="alta_modif_hoja_ruta"),
    url(r'^baja/hoja_ruta/$', baja_hoja_ruta, name="baja_hoja_ruta"),
    url(r'^modificación/hoja_ruta/(?P<id_hoja>\d+)/$', alta_modif_hoja_ruta, name="alta_modif_hoja_ruta"),
    url(r'^generar/hoja_ruta/$', generar_hoja_ruta, name="generar_hoja_ruta"),
    url(r'^detalle/horario_atencion/(?P<id_horario>\d+)/$', detalle_horario_atencion, name="detalle_horario_atencion"),
    url(r'^hoja_ruta/PDF/(?P<dia>\d+)/$', HojaRutaPdf.as_view(), name= 'hoja_ruta_pdf'),    
    #liquidacion mensual
    url(r'^liquidacion/PDF/(?P<mes>\d+)/$', LiquidacionPdf.as_view(), name= 'liquidacion_pdf'),
]
