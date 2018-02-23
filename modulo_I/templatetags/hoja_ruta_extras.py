from django import template
from modulo_I.models import DetalleHojaRuta,BaldePactado

register = template.Library()

@register.filter
def hojas_validas(hoja):
    '''
    FUNCION que se encarga de permitir borrar la hoja de ruta si no tiene detalle.
    '''
    baldes = DetalleHojaRuta.objects.filter(hoja_ruta__fecha_recorrido=hoja)
    if (len(baldes)) == 0 :
        return True
    else:
        return False


@register.filter
def baldes_pactados(generador):
    '''
    FUNCION que se encarga de devolver los baldes pactados del generador
    '''
    baldes_pactados = BaldePactado.objects.filter(establecimiento_generador__id=generador.id)

    lista = []
    for b in baldes_pactados:
        lista.append(("Capacidad: " + str(b.capacidad_balde) + "dm", "Precinto: " + str(b.color_precinto), "Cantidad: " + str(b.cantidad)))

    if lista:
        return lista
    else:
        return ""
