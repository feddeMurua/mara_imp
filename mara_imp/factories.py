from modulo_I import views as v
import factory
import factory.fuzzy
import datetime


'''
#FACTORIES
for x in xrange(8):
    provincia = factories.ProvinciaFactory()

for x in xrange(8):
    localidad = factories.LocalidadFactory()
'''


class ProvinciaFactory(factory.django.DjangoModelFactory):
    nombre = factory.fuzzy.FuzzyText(length=25)    

    class Meta:
        model = v.Provincia


class LocalidadFactory(factory.django.DjangoModelFactory):
    nombre = factory.fuzzy.FuzzyText(length=25)
    cp = factory.fuzzy.FuzzyInteger(9000)
    provincia = factory.Iterator(v.Provincia.objects.all())

    class Meta:
        model = v.Localidad


'''
ESTABLECIMIENTO GENERADOR
'''
