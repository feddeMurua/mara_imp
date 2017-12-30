from django.db import models
from django.utils.timezone import now
from .choices import *
from multiselectfield import MultiSelectField
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils.translation import ugettext as _
# Create your models here.
'''
CLASES IMPORTANTES
'''

class Localidad(models.Model):
    nombre = models.CharField(max_length=25)
    cp = models.IntegerField(validators=[MinValueValidator(1)])
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
    documento = models.CharField(max_length=50, unique=True)
    telefono_fijo = models.CharField(max_length=50, null=True, blank=True)
    celular = models.CharField(max_length=50, null=True, blank=True)
    email = models.EmailField(max_length=50, null=True, blank=True)

    def __str__(self):
        return "%s, %s - %s" % (self.apellido, self.nombre, self.documento)


class Domicilio(models.Model):
    barrio = models.CharField(max_length=50)
    calle = models.CharField(max_length=50)
    calle_entre1 = models.CharField(max_length=50, null=True, blank=True)
    calle_entre2 = models.CharField(max_length=50, null=True, blank=True)
    nro = models.IntegerField(default=1,validators=[MinValueValidator(1)])
    piso = models.IntegerField(blank=True, null=True, validators=[MinValueValidator(1)])
    dpto = models.CharField(max_length=50, blank=True, null=True)
    localidad = models.ForeignKey('Localidad', on_delete=models.CASCADE)
    comarca = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return "B° %s, %s  N° %s" % (self.barrio, self.calle, self.nro)


'''
GENERADOR RESIDUOS
'''


class AmbitoDependencia(models.Model):
    categoria = models.CharField(max_length=50, choices=Categorias)
    municipalidad = models.CharField(max_length=50, blank=True, null=True)
    centro_que_depende = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        if self.municipalidad and self.centro_que_depende:
            return "Categoria: %s || Municipalidad: %s || Centro del que Depende: %s" % \
            (self.categoria, self.municipalidad, self.centro_que_depende)
        elif self.municipalidad:
            return "Categoría: %s || Municipalidad: %s" % (self.categoria, self.municipalidad)
        elif self.centro_que_depende:
            return "Centro del que Depende: %s || Municipalidad: %s" % (self.centro_que_depende, self.municipalidad)
        else:
            return "Categoría: %s" % self.categoria


class CaracteristicasGenerales(models.Model):
    cant_quirofanos = models.IntegerField(default=0,validators=[MinValueValidator(0)])
    nro_camas = models.IntegerField(default=0,validators=[MinValueValidator(0)])
    poblacion_promedio_atendida = models.FloatField(default=0) # (al mes)
    poblacion_promedio_atendida_365 = models.FloatField(default=0) # (al año)
    via_acceso = MultiSelectField(choices=Accesos)

    def __str__(self):
        return "Cant. Quirófanos: %s || N° camas: %s || Via Acceso: %s" % \
        (self.cant_quirofanos, self.nro_camas, self.via_acceso)


class ResiduoGenerador(models.Model):
    tipo = models.CharField(max_length=80, choices=TiposResiduos)
    volumen_mensual_estimado = models.FloatField(default=0)
    kgs_mensual_estimado = models.FloatField(default=0)
    establecimiento_generador = models.ForeignKey('EstablecimientoGenerador', on_delete=models.CASCADE)

    class Meta:
        unique_together = ('tipo', 'establecimiento_generador')


    def __str__(self):
        return "Tipo: %s || Volumen Mensual Estimado: %s || Kgs Mensual Estimado: %s" % \
        (self.tipo, self.volumen_mensual_estimado, self.kgs_mensual_estimado)


class AcopioTransitorio(models.Model):
    sector_interno_p_estacionar = models.BooleanField()
    dimension_sector = models.CharField(max_length=50, blank=True, null=True)
    camara_frio = models.BooleanField()
    dimension_camara_frio = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        if self.sector_interno_p_estacionar and self.camara_frio:
            return "Dimensión Sector interno para estacionar:%s || Dmensión Cámara Frío:%s" % \
            (self.dimension_sector, self.dimension_camara_frio)
        elif self.sector_interno_p_estacionar:
            return "Dimensión Sector interno para estacionar:%s" % (self.dimension_sector)
        elif self.camara_frio:
            return "Dimensión Cámara Frío:%s" % (self.dimension_camara_frio)
        else:
            return ""


class ViaAccesoSector(models.Model):
    acopio_transitorio = models.ForeignKey('AcopioTransitorio', on_delete=models.CASCADE)
    tipo =MultiSelectField(choices=Acceso_sector_acopio)

    def __str__(self):
        return "%s - %s" % (self.acopio_transitorio, self.tipo)


class HorarioAtencion(models.Model):
    dia = models.CharField(max_length=20, choices=Dias)
    hora_desde_m = models.IntegerField(_(u"Hora desde (Mañana)"), default=0, null=True, validators=[MaxValueValidator(2400),MinValueValidator(0)]) # Turno mañana
    hora_hasta_m = models.IntegerField(_(u"Hora hasta (Mañana)"), default=0, null=True, validators=[MaxValueValidator(2400),MinValueValidator(0)])
    hora_desde_t = models.IntegerField(_(u"Hora desde (Tarde)"), default=0, null=True, validators=[MaxValueValidator(2400),MinValueValidator(0)]) # Turno tarde
    hora_hasta_t = models.IntegerField(_(u"Hora hasta (Tarde)"), default=0, null=True, validators=[MaxValueValidator(2400),MinValueValidator(0)])
    horario_retiro = models.IntegerField(_(u"Horario Retiro"), default=0, null=True, validators=[MaxValueValidator(2400),MinValueValidator(0)]) #fundamental para crear la hoja de ruta (ordenar por horario retiro)
    establecimiento_generador = models.ForeignKey('EstablecimientoGenerador', on_delete=models.CASCADE)

    class Meta:
        unique_together = ('dia', 'establecimiento_generador')

    def __str__(self):
        return "%s || %s" % (self.dia, self.establecimiento_generador)


class EstablecimientoGenerador(models.Model):
    tipo_actividad = MultiSelectField(choices=Actividades)
    nro_inscripcion = models.BigIntegerField(primary_key=True) # N° inscripcion registro de generadores provincia del chubut
    razon_social = models.CharField(max_length=50)
    telefono = models.CharField(max_length=50)
    email = models.EmailField(max_length=50, blank=True, null=True)
    director_responsable = models.ForeignKey('Cliente', related_name='director_responsable', on_delete=models.CASCADE)
    responsable_residuos = models.ForeignKey('Persona', related_name='responsable_residuos', on_delete=models.CASCADE)
    responsable_suplente = models.ForeignKey('Persona', related_name='responsable_suplente', on_delete=models.CASCADE)
    responsable_tecnico = models.ForeignKey('Persona', related_name='responsable_tecnico', on_delete=models.CASCADE)
    fecha_vinculo = models.DateField() #fecha deL Vinculo que se confeccionó el formulario
    fecha = models.DateField(default=now)
    observaciones_comentarios = models.TextField(max_length=200, default='', blank=True, null=True)
    caract_generales = models.ForeignKey('CaracteristicasGenerales', on_delete=models.CASCADE)
    domicilio = models.ForeignKey('Domicilio', on_delete=models.CASCADE)
    ambito_dependencia = models.ForeignKey('AmbitoDependencia', on_delete=models.CASCADE)
    via_acceso = models.ForeignKey('ViaAccesoSector', on_delete=models.CASCADE)
    tipo_actividad = MultiSelectField(choices=Actividades)
    sector = models.IntegerField() # cuadrante que pertenece a la ciudad el generador

    def __str__(self):
        return "%s || %s" % (self.nro_inscripcion, self.razon_social)


'''
Hoja de Ruta
'''

'''
REQUIERIMENTO INFORMAL:
-el sistema debera:
* el operadorar seleccionara el dia y el sistema devolvera los establecimientos correspondientes
contemplar los feriados. (elegir dia excepcional que plantee el generador, de forma manual)
'''

class HojaRuta(models.Model):
    establecimiento_generador = models.ForeignKey('EstablecimientoGenerador', on_delete=models.CASCADE)
    hora_programada = models.CharField(max_length=15)
    hora_llegada = models.CharField(max_length=15)
    hora_salida = models.CharField(max_length=15)
    volumen_retirado = models.CharField(max_length=15)
    nro_precinto = models.BigIntegerField(unique=True) #unico para el dia
    nro_balde_entrega = models.BigIntegerField(unique=True) #unico para el dia
    nro_balde_retiro = models.BigIntegerField(unique=True) #unico para el dia

    def __str__(self):
        return "%s || N° precinto: %s " % (self.establecimiento_generador, self.nro_precinto)


'''
Clientes
'''


class DatoImpositivo(models.Model):
    impuestos_ganancias = MultiSelectField(choices=Impuesto_Ganancias)
    impuestos_valor_agregado = MultiSelectField(choices=Impuesto_Valor_Agregado)
    ingresos_brutos = MultiSelectField(choices=Ingresos_Brutos)
    nro_iibb = models.BigIntegerField(primary_key=True)

    def __str__(self):
        return "IIBB:%s || Ganancias:%s || Valor Agregado:%s || Ingresos Brutos:%s" % (self.nro_iibb, self.impuestos_ganancias, self.impuestos_valor_agregado, self.ingresos_brutos)


class Cliente(models.Model):
    razon_social = models.CharField(max_length=50) # puede ser distinta de la del generador
    domicilio_legal = models.ForeignKey('Domicilio', on_delete=models.CASCADE) # (para facturacion)
    apoderado = models.ForeignKey('Persona', related_name='apoderado', on_delete=models.CASCADE)
    contacto_comercial = models.ForeignKey('Persona', related_name='contact_comercial', on_delete=models.CASCADE)
    cargo = models.CharField(max_length=50)
    dato_impositivo = models.OneToOneField('DatoImpositivo', on_delete=models.CASCADE)
    fecha = models.DateField(default=now) #fecha de hoy
    fecha_vinculo = models.DateField() #fecha deL Vinculo que se confeccionó el formulario
    cuit_cuil = models.CharField(max_length=20)

    def __str__(self):
        return "%s, %s - %s" % (self.apoderado.apellido, self.apoderado.nombre, self.apoderado.documento)
