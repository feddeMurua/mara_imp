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
GENERADOR RESIDUOS
'''

class EstablecimientoGenerador(models.Model):
    nro_inscripcion = models.BigIntegerField(unique=True, blank=True, null=True, default=None) # N° inscripcion registro de generadores provincia del chubut
    activo = models.BooleanField(default=False)
    razon_social = models.CharField(max_length=50)
    direccion = models.CharField(max_length=100)
    tipo_actividad = MultiSelectField(choices=Actividades)
    recoleccion = MultiSelectField(choices=Dias, blank=True, null=True)
    localidad = models.ForeignKey('Localidad', on_delete=models.CASCADE)
    telefono = models.CharField(max_length=50, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    responsable_ambiental = models.CharField(max_length=50, blank=True, null=True)
    cuit = models.CharField(max_length=20, blank=True, null=True)
    sector = models.IntegerField(blank=True, null=True) # cuadrante que pertenece a la ciudad el generador
    #TENER EN CUENTA QUE PODRIA DARSE un orden dentro de sector para la hoja de ruta (puede ser null)

    def __str__(self):
        return "%s" % (self.razon_social)

    def to_json(self):
        return {'razon_social': self.razon_social}

'''
Hoja de Ruta

*obs
volumen retirado: cantidad de balde y capacidad de cada uno (adjunto en el correo para modificar)
cambiar: nro de precinto es POR BALDE con el requerimiento de arriba.
n° de balde mismo, cambia el precinto
asociar n° balde al tamaño -> ej balde 1 20dm3 para seguridad (por el retiro)
Agregar clase balde.
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


class BaldeUtilizado(models.Model):
    '''
    Clase compuesta por balde utilizado en la hoja de ruta.
    '''
    balde = models.ForeignKey('Balde') #balde_entrega
    establecimiento_generador = models.ForeignKey('EstablecimientoGenerador')
    hoja_ruta = models.ForeignKey('HojaRuta')
    nro_precinto = models.BigIntegerField(unique=True)
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
    hora_llegada = models.TimeField()
    hora_salida = models.TimeField()

    def __str__(self):
        return "Fecha Recorrido: %s" % (self.fecha_recorrido)
