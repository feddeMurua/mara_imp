from django.db import models
from django.utils.timezone import now
from .choices import *

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


'''
GENERADOR RESIDUOS
'''

class Persona(models.Model):
    apellido = models.CharField(max_length=50)
    nombre = models.CharField(max_length=50)
    telefono_fijo = models.CharField(max_length=50)
    celular = models.CharField(max_length=50)
    email = models.EmailField(max_length=50, blank=True)


class Ambito_Dependencia(models.Model):
    categoria = models.CharField(max_length=50, choices=Categorias)
    municipalidad = models.CharField(max_length=50, blank=True, null=True)
    centro_que_depende = models.CharField(max_length=50, blank=True, null=True)


class Caracteristicas_Generales(models.Model):
    cant_quirofanos = models.IntegerField(blank=True, null=True)
    nro_camas = models.IntegerField(blank=True, null=True)
    poblacion_promedio_atendida = models.FloatField() # (al mes)
    poblacion_promedio_atendida_365 = models.FloatField() # (al año)
    via_acceso = models.CharField(max_length=80, choices=Accesos)


class Residuo_Generador(models.Model):
    tipo = models.CharField(max_length=80, choices=TiposResiduos)


class Detalle_Residuo(models.Model):
    volumen_mensual_estimado = models.CharField(max_length=50)
    kgs_mensual_estimado = models.CharField(max_length=50)
    residuo = models.ForeignKey(Residuo_Generador)


class Acopio_Transitorio(models.Model):
    sector_interno_p_estacionar = models.BooleanField()
    dimension_sector = models.CharField(max_length=50, blank=True, null=True)
    camara_frio = models.BooleanField()
    dimension_camara_frio = models.CharField(max_length=50, blank=True, null=True)


class Via_Acceso_Sector(models.Model):
    tipo = models.CharField(max_length=80, choices=Acceso_sector_acopio)
    acopio_transitorio = models.ForeignKey(Acopio_Transitorio)


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


class Establecimiento_Generador(models.Model):
    razon_social = models.CharField(max_length=50)
    Domicilio = models.ForeignKey(Domicilio, on_delete=models.CASCADE)
    telefono = models.CharField(max_length=50)
    email = models.EmailField(max_length=50, blank=True)
    director_responsable = models.ForeignKey('Cliente', related_name='director_responsable')
    responsable_residuos = models.ForeignKey(Persona, related_name='responsable_residuos')
    responsable_suplente = models.ForeignKey(Persona, related_name='responsable_suplente')
    responsable_tecnico = models.ForeignKey(Persona, related_name='responsable_tecnico')
    nro_inscripcion = models.BigIntegerField() # N° inscripcion registro de generadores provincia del chubut
    ambito_dependencia = models.ForeignKey(Ambito_Dependencia)
    tipo_actividad = models.CharField(max_length=80, choices=Actividades)
    caract_generales = models.ForeignKey(Caracteristicas_Generales)
    residuo = models.ForeignKey(Residuo_Generador)
    observaciones_comentarios = models.CharField(max_length=200)
    titular = models.ForeignKey(Persona, related_name='titular')
    fecha = models.DateField(default=now)


class Horario_Atencion(models.Model):
    dia = models.CharField(max_length=50, choices=Dias)
    hora = models.TimeField()
    establecimiento_generador = models.ForeignKey(Establecimiento_Generador, on_delete=models.CASCADE)


'''
Clientes
'''

class Cliente(Persona):
    domicilio_legal = models.ForeignKey(Domicilio) # (para facturacion)
    cargo = models.CharField(max_length=50)
    impuestos_ganancias = models.CharField(max_length=80, choices=Impuesto_Ganancias)
    impuestos_valor_agregado = models.CharField(max_length=80, choices=Impuesto_Valor_Agregado)
    ingresos_brutos = models.CharField(max_length=80, choices=Ingresos_Brutos)
    nro_iibb = models.BigIntegerField()
    fecha = models.DateField(default=now)

    def __str__(self):
        return "%s - %s" % (self.nombre, self.apellido)
