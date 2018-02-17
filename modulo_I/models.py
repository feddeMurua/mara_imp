from django.db import models
from django.utils.timezone import now
from .choices import *
from multiselectfield import MultiSelectField
from django.core.validators import MinValueValidator
from django.utils.translation import ugettext as _

# Create your models here.
'''
CLASES IMPORTANTES
'''

class Localidad(models.Model):
    nombre = models.CharField(max_length=25)
    cp = models.IntegerField(validators=[MinValueValidator(1)], unique=True)
    provincia = models.ForeignKey('Provincia', on_delete=models.CASCADE)

    def __str__(self):
        return "%s - %s - %s" % (self.nombre, self.provincia.nombre, self.cp)


class Provincia(models.Model):
    nombre = models.CharField(max_length=25)

    def __str__(self):
        return "%s" % (self.nombre)


'''
ESTABLECIMIENTO GENERADOR
'''


class Sector(models.Model):
    nombre_sector = models.CharField(max_length=50, unique=True)
    localidad = models.ForeignKey('Localidad', on_delete=models.CASCADE)

    def __str__(self):
        return "%s" % (self.nombre_sector)


class Cuadrante(models.Model):
    nro_parada = models.IntegerField(validators=[MinValueValidator(1)], blank=True, null=True)
    sector = models.ForeignKey('Sector', on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        unique_together = (("nro_parada", "sector"),)

    def __str__(self):
        return "Sector: %s, N°: %s " % (self.sector, self.nro_parada)


class BaldePactado(models.Model):
    establecimiento_generador = models.ForeignKey('EstablecimientoGenerador', blank=True, null=True, default=None)
    capacidad_balde = models.CharField(max_length=5, choices=Capacidad_balde) # en dm3
    color_precinto = models.CharField(max_length=15, choices=Color_precinto) # en dm3
    cantidad = models.IntegerField(validators=[MinValueValidator(1)], unique=True)


class EstablecimientoGenerador(models.Model):
    nro_inscripcion = models.BigIntegerField(unique=True, blank=True, null=True, default=None) # N° inscripcion registro de generadores provincia del chubut
    activo = models.BooleanField(default=False)
    razon_social = models.CharField(max_length=50)
    direccion = models.CharField(max_length=100)
    tipo_actividad = MultiSelectField(choices=sorted(Actividades))
    recoleccion = MultiSelectField(choices=Dias, blank=True, null=True)
    localidad = models.ForeignKey('Localidad', on_delete=models.CASCADE)
    telefono = models.CharField(max_length=50, blank=True, null=True)
    email = models.CharField(max_length=200, blank=True, null=True)
    responsable_ambiental = models.CharField(max_length=50, blank=True, null=True)
    cuit = models.CharField(max_length=20, blank=True, null=True)
    cuadrante = models.ForeignKey('Cuadrante',blank=True, null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return "%s" % (self.razon_social)

    def to_json(self):
        return {'razon_social': self.razon_social}

'''
HOJA DE RUTA
'''

'''
Fuente: https://stackoverflow.com/questions/14844498/how-to-dynamically-create-a-ul-li-with-appended-text-from-input-with-jquery
PARA GENERAR HOJA DE RUTA: http://jsfiddle.net/J5nCS/1/
'''

class Balde(models.Model):
    nro_balde = models.BigIntegerField(primary_key=True) #identificador
    capacidad = models.CharField(max_length=5, choices=Capacidad_balde) # en dm3
    estado = models.CharField(max_length=15, choices=Estado, default='En Planta')
    establecimiento_generador = models.ForeignKey('EstablecimientoGenerador', blank=True, null=True, default=None)

    def __str__(self):
        return "N°: %s" % (self.nro_balde)

    def to_json(self):
        return {'nro_balde': self.nro_balde}


class DetalleHojaRuta(models.Model):
    hoja_ruta = models.ForeignKey('HojaRuta')
    establecimiento_generador = models.ForeignKey('EstablecimientoGenerador')
    hora_llegada = models.TimeField(blank=True, null=True)
    hora_salida = models.TimeField(blank=True, null=True)
    balde = models.ForeignKey('Balde') #balde_entrega
    nro_precinto = models.BigIntegerField(unique=True, blank=True, null=True)
    tipo = models.CharField(max_length=15, choices=Entrega_Retiro)

    def __str__(self):
        return "%s || N° precinto: %s" % (self.balde, self.nro_precinto)

    def to_json(self):
        return {
            'balde': {'nro_balde': self.balde.nro_balde},
            'establecimiento_generador': {'razon_social': self.establecimiento_generador.razon_social},
            'nro_precinto': self.nro_precinto,
            'tipo': self.tipo,
        }


class HojaRuta(models.Model):
    fecha_recorrido = models.DateField() #fecha del dia que se imprimió la hoja de ruta

    def __str__(self):
        return "Fecha Recorrido: %s" % (self.fecha_recorrido)
