from django.contrib import admin
from .models import *

"""
Para agregar boton buscar en django.
"""

class BuscarHojaRuta(admin.ModelAdmin):
    search_fields = ['establecimiento_generador__razon_social','nro_precinto']

class BuscarEstablecimiento(admin.ModelAdmin):
    search_fields = ['razon_social','responsable_ambiental','localidad__nombre','cuit']

class BuscarBalde(admin.ModelAdmin):
    search_fields = ['nro_balde']

# Register your models here.
admin.site.register(RegistroHojaRuta,BuscarHojaRuta)
admin.site.register(DetalleHojaRuta)
admin.site.register(EstablecimientoGenerador, BuscarEstablecimiento)
admin.site.register(Balde, BuscarBalde)
admin.site.register(BaldePactado)
admin.site.register(Localidad)
admin.site.register(Provincia)
admin.site.register(Recorrido)
