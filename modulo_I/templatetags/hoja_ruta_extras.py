from django import template
from modulo_I.models import DetalleHojaRuta,BaldePactado, EstablecimientoGenerador

register = template.Library()

@register.filter
def hojas_validas(hoja):
    '''
    FUNCION que se encarga de permitir borrar la hoja de ruta si no tiene detalle.
    '''

    baldes = DetalleHojaRuta.objects.filter(registro_hoja_ruta__fecha_recorrido=hoja)
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
    detalles = DetalleHojaRuta.objects.filter(registro_hoja_ruta__fecha_recorrido__month=balde_utilizado.registro_hoja_ruta.fecha_recorrido.month,
                                                registro_hoja_ruta__fecha_recorrido__day=balde_utilizado.registro_hoja_ruta.fecha_recorrido.day, registro_hoja_ruta__establecimiento_generador__id=balde_utilizado.registro_hoja_ruta.establecimiento_generador.id, tipo="Retiro")

    acumu = 0
    for d in detalles:
        acumu+= int(d.balde.capacidad)
    return acumu


@register.filter
def cant_establecimientos(recorrido):
    '''
    FUNCION que se encarga de devolver total de establecimientos en el recorrido
    '''
    if EstablecimientoGenerador.objects.filter(recorrido__id=recorrido, recorrido__extra=False).count() > 0:
        return True
    elif EstablecimientoGenerador.objects.filter(recorrido_extra__id=recorrido).count() > 0:
        return True
    else:
        return False
