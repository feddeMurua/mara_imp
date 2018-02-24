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


@register.filter
def calcular_vol(balde_utilizado):
    '''
    FUNCION que se encarga de devolver total de volumen retirado
    '''
    detalles = DetalleHojaRuta.objects.filter(hoja_ruta__fecha_recorrido__month=balde_utilizado.hoja_ruta.fecha_recorrido.month,
                                                hoja_ruta__fecha_recorrido__day=balde_utilizado.hoja_ruta.fecha_recorrido.day, establecimiento_generador__id=balde_utilizado.establecimiento_generador.id, tipo="Retiro")

    acumu = 0
    for d in detalles:
        acumu+= int(d.balde.capacidad)
    return acumu
