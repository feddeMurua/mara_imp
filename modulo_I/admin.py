from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Cliente)
admin.site.register(EstablecimientoGenerador)
admin.site.register(Domicilio)
admin.site.register(Localidad)
admin.site.register(Provincia)
admin.site.register(Nacionalidad)
