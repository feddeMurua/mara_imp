from django.db import models
from django.utils.timezone import now
from .choices import *
from multiselectfield import MultiSelectField

# Create your models here.
'''
CLASES IMPORTANTES
'''


class Localidad(models.Model):
    nombre = models.CharField(max_length=25)
    cp = models.IntegerField()
    provincia = models.ForeignKey('Provincia', on_delete=models.CASCADE)

    def __str__(self):
        return "%s - %s - %s - %s" % (self.nombre, self.cp, self.provincia.nombre, self.provincia.nacionalidad)


class Provincia(models.Model):
    nombre = models.CharField(max_length=25)
    nacionalidad = models.ForeignKey('Nacionalidad', on_delete=models.CASCADE)

    def __str__(self):
        return "%s - %s" % (self.nombre, self.nacionalidad)


class Nacionalidad(models.Model):
    nombre = models.CharField(max_length=25, unique=True)

    def __str__(self):
        return "%s" % self.nombre


class Persona(models.Model):
    apellido = models.CharField(max_length=50)
    nombre = models.CharField(max_length=50)
    documento = models.CharField(max_length=50)
    telefono_fijo = models.CharField(max_length=50, null=True, blank=True)
    celular = models.CharField(max_length=50, null=True, blank=True)
    email = models.EmailField(max_length=50, null=True, blank=True)

    def __str__(self):
        return "%s -%s -%s" % (self.apellido, self.nombre, self.documento)


'''
GENERADOR RESIDUOS
'''


class AmbitoDependencia(models.Model):
    categoria = models.CharField(max_length=50, choices=Categorias)
    municipalidad = models.CharField(max_length=50, blank=True, null=True)
    centro_que_depende = models.CharField(max_length=50, blank=True, null=True)


class CaracteristicasGenerales(models.Model):
    cant_quirofanos = models.IntegerField(blank=True, null=True)
    nro_camas = models.IntegerField(blank=True, null=True)
    poblacion_promedio_atendida = models.FloatField() # (al mes)
    poblacion_promedio_atendida_365 = models.FloatField() # (al año)
    via_acceso = MultiSelectField(choices=Accesos)


class ResiduoGenerador(models.Model):
    tipo = models.CharField(max_length=80, choices=TiposResiduos) # MAS DE UNO
    volumen_mensual_estimado = models.CharField(max_length=50)
    kgs_mensual_estimado = models.CharField(max_length=50, null=True, blank=True)


class AcopioTransitorio(models.Model):
    sector_interno_p_estacionar = models.BooleanField()
    dimension_sector = models.CharField(max_length=50, blank=True, null=True)
    camara_frio = models.BooleanField()
    dimension_camara_frio = models.CharField(max_length=50, blank=True, null=True)


class ViaAccesoSector(models.Model):
    tipo = models.CharField(max_length=80, choices=Acceso_sector_acopio)
    acopio_transitorio = models.ForeignKey('AcopioTransitorio')


class Domicilio(models.Model):
    barrio = models.CharField(max_length=50)
    calle = models.CharField(max_length=50)
    calle_entre1 = models.CharField(max_length=50, null=True, blank=True)
    calle_entre2 = models.CharField(max_length=50, null=True, blank=True)
    nro = models.IntegerField()
    piso = models.IntegerField(blank=True, null=True)
    dpto = models.CharField(max_length=50, blank=True, null=True)
    localidad = models.ForeignKey('Localidad', on_delete=models.CASCADE)
    comarca = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return "%s - %s - %s" % (self.barrio, self.calle, self.nro)


class Horario_Atencion(models.Model):
    dia = MultiSelectField(choices=Dias)
    hora = models.TimeField()
    establecimiento_generador = models.ForeignKey('EstablecimientoGenerador', on_delete=models.CASCADE)


class EstablecimientoGenerador(models.Model):
    nro_inscripcion = models.BigIntegerField(primary_key=True) # N° inscripcion registro de generadores provincia del chubut
    razon_social = models.CharField(max_length=50)
    tipo_actividad = MultiSelectField(choices=Actividades)
    '''
    Domicilio = models.ForeignKey('Domicilio', on_delete=models.CASCADE)
    telefono = models.CharField(max_length=50)
    email = models.EmailField(max_length=50, blank=True)
    director_responsable = models.ForeignKey('Cliente', related_name='director_responsable')
    responsable_residuos = models.ForeignKey('Persona', related_name='responsable_residuos')
    responsable_suplente = models.ForeignKey('Persona', related_name='responsable_suplente')
    responsable_tecnico = models.ForeignKey('Persona', related_name='responsable_tecnico')
    nro_inscripcion = models.BigIntegerField(primary_key=True) # N° inscripcion registro de generadores provincia del chubut
    ambito_dependencia = models.ForeignKey('Ambito_Dependencia')
    #tipo_actividad = models.CharField(max_length=50, choices=Actividades)
    caract_generales = models.ForeignKey('Caracteristicas_Generales')
    residuo = models.ForeignKey('Residuo_Generador')
    observaciones_comentarios = models.CharField(max_length=200)
    titular = models.ForeignKey('Persona', related_name='titular')
    fecha = models.DateField(default=now)
    fecha_vinculo = models.DateField() #fecha deL Vinculo que se confeccionó el formulario
    '''

    def __str__(self):
        return "%s - %s" % (self.nro_inscripcion, self.razon_social)


'''
Clientes
'''

class DatoImpositivo(models.Model):
    impuestos_ganancias = MultiSelectField(choices=Impuesto_Ganancias)
    impuestos_valor_agregado = MultiSelectField(choices=Impuesto_Valor_Agregado)
    ingresos_brutos = MultiSelectField(choices=Ingresos_Brutos)
    nro_iibb = models.BigIntegerField(primary_key=True)
        
    def __str__(self):
        return "%s" % self.nro_iibb



class Cliente(models.Model):
    razon_social = models.CharField(max_length=50) # puede ser distinta de la del generador
    domicilio_legal = models.ForeignKey('Domicilio') # (para facturacion)
    apoderado = models.ForeignKey('Persona', related_name='apoderado')
    contacto_comercial = models.ForeignKey('Persona', related_name='contact_comercial', null=True, blank=True)
    '''
    cargo = models.CharField(max_length=50)
    dato_impositivo = models.OneToOneField('DatoImpositivo')
    fecha = models.DateField(default=now) #fecha de hoy
    fecha_vinculo = models.DateField() #fecha deL Vinculo que se confeccionó el formulario
    '''
    def __str__(self):
        return "%s - %s - %s" % (self.nombre, self.apellido, self.documento)
