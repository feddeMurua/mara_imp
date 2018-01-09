from django.contrib import admin
from .models import *

"""
Para agregar boton buscar en django.
"""
class BuscarPersona(admin.ModelAdmin):
    search_fields = ['documento','nombre','apellido']

# Register your models here.
admin.site.register(Persona, BuscarPersona)
admin.site.register(Cliente)
admin.site.register(DatoImpositivo)
admin.site.register(HojaRuta)
admin.site.register(HorarioAtencion)
admin.site.register(EstablecimientoGenerador)
admin.site.register(AmbitoDependencia)
admin.site.register(CaracteristicasGenerales)
admin.site.register(AcopioTransitorio)
admin.site.register(ResiduoGenerador)
admin.site.register(ViaAccesoSector)
admin.site.register(Domicilio)
admin.site.register(Localidad)
admin.site.register(Provincia)
admin.site.register(Nacionalidad)
