from modulo_I import views as v
import factory
import factory.fuzzy
import datetime


class PersonaFactory(factory.django.DjangoModelFactory):
    apellido = factory.fuzzy.FuzzyText(length=20)
    nombre = factory.fuzzy.FuzzyText(length=25)
    documento = factory.fuzzy.FuzzyText(length=25)
    telefono_fijo = factory.fuzzy.FuzzyText(length=10)
    celular = factory.fuzzy.FuzzyText(length=10)
    email = factory.fuzzy.FuzzyText(length=10)

    class Meta:
        model = v.Persona


class NacionalidadFactory(factory.django.DjangoModelFactory):
    nombre = factory.fuzzy.FuzzyText(length=25)

    class Meta:
        model = v.Nacionalidad


class ProvinciaFactory(factory.django.DjangoModelFactory):
    nombre = factory.fuzzy.FuzzyText(length=25)
    nacionalidad = factory.Iterator(v.Nacionalidad.objects.all())

    class Meta:
        model = v.Provincia


class LocalidadFactory(factory.django.DjangoModelFactory):
    nombre = factory.fuzzy.FuzzyText(length=25)
    cp = factory.fuzzy.FuzzyInteger(9000)
    provincia = factory.Iterator(v.Provincia.objects.all())

    class Meta:
        model = v.Localidad


class DomicilioFactory(factory.django.DjangoModelFactory):
    barrio = factory.fuzzy.FuzzyText(length=20)
    calle = factory.fuzzy.FuzzyText(length=50)
    calle_entre1 = factory.fuzzy.FuzzyText(length=50)
    calle_entre2 = factory.fuzzy.FuzzyText(length=50)
    nro = factory.fuzzy.FuzzyInteger(0)
    dpto = factory.fuzzy.FuzzyText(length=50)
    piso = factory.fuzzy.FuzzyInteger(0)
    localidad = factory.Iterator(v.Localidad.objects.all())
    comarca = factory.fuzzy.FuzzyText(length=50)

    class Meta:
        model = v.Domicilio


'''
ESTABLECIMIENTO GENERADOR
'''


'''
CLIENTES
'''


class DatoImpositivoFactory(factory.django.DjangoModelFactory):
    impuestos_ganancias = factory.fuzzy.FuzzyChoice(['Inscripto','No Inscripto','Excento', 'Agente de Retención'])
    impuestos_valor_agregado = factory.fuzzy.FuzzyChoice(['Responsable Inscripto','Responsable Excento','Consumidor Final', 'Monotributista','Agente de Retención'])
    ingresos_brutos = factory.fuzzy.FuzzyChoice(['Contribuyente Directo','Pasible de Retención/Percepción'])
    nro_iibb = factory.fuzzy.FuzzyInteger(0, 15)

    class Meta:
        model = v.DatoImpositivo


class ClienteFactory(factory.django.DjangoModelFactory):
    razon_social = factory.fuzzy.FuzzyText(length=20)
    domicilio_legal = factory.Iterator(v.Domicilio.objects.all())
    apoderado = factory.Iterator(v.Persona.objects.all())
    contacto_comercial = factory.Iterator(v.Persona.objects.all())
    cargo = factory.fuzzy.FuzzyText(length=20)
    dato_impositivo = factory.Iterator(v.DatoImpositivo.objects.all())
    fecha = factory.fuzzy.FuzzyDate(datetime.date(2000, 1, 1))
    fecha_vinculo= factory.fuzzy.FuzzyDate(datetime.date(2000, 1, 1))
    cuit_cuil = factory.fuzzy.FuzzyText(length=20)

    class Meta:
        model = v.Cliente
