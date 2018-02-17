from django import template
from modulo_I.models import DetalleHojaRuta

register = template.Library()

@register.filter
def hojas_validas(hoja):
    baldes = DetalleHojaRuta.objects.filter(hoja_ruta__fecha_recorrido=hoja)
    print(len(baldes))
    if (len(baldes)) == 0 :
        return True
    else:
        return False
