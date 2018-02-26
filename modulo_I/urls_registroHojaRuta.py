from django.conf.urls import url, include
from django.contrib import admin
from .views import *

urlpatterns = [
    url(r'^listado/general/hojas_de_ruta/$', listado_general_hojas_de_ruta, name="listado_general"),
    url(r'^alta/hoja_ruta/$', alta_modif_hoja_ruta, name="alta_modif_hoja_ruta"),
    url(r'^baja/hoja_ruta/$', baja_hoja_ruta, name="baja_hoja_ruta"),
    url(r'^generar/hoja_ruta/(?P<dia>\d+)/$', generar_hoja_ruta, name="generar_hoja_ruta"),
    url(r'^hoja_ruta/PDF/(?P<dia>\d+)/(?P<recorrido>\w+)/$', HojaRutaPdf.as_view(), name= 'hoja_ruta_pdf'),
    #BALDES UTILIZADOS
    url(r'^listado/hoja_de_ruta/(?P<anio>\d+)/(?P<mes>\d+)/(?P<dia>\d+)/$', listado_baldes_utilizados, name="listado_baldes_utilizados"),
    url(r'^detalle/balde/(?P<id_balde>\d+)/$', detalle_balde_utilizado, name="detalle_balde_utilizado"),
    url(r'^modificación/balde/(?P<id_balde>\d+)/hoja_de_ruta/(?P<id_hoja>\d+)/$', modif_balde_utilizado, name="modif_balde_utilizado"),
    url(r'^alta/balde/utilizado/$', alta_balde_utilizado, name="alta_balde_utilizado"),
    url(r'^baja/balde/utilizado/hoja/$', baja_balde_utilizado, name="baja_balde_utilizado"),
    #liquidacion mensual
    url(r'^liquidacion/PDF/(?P<mes>\d+)/(?P<nombre_mes>\w+)/(?P<anio>\d+)/$', LiquidacionPdf.as_view(), name= 'liquidacion_pdf'),
    #itinerario
    url(r'^modificación/generador/itinerario/(?P<id_generador>\d+)/(?P<id_recorrido>\d+)/$', modificar_itinerario, name="modificar_itinerario"),

]
