from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.http import JsonResponse
from .models import *
from .forms import *
from django.template.loader import render_to_string
from django.http import HttpResponse
from easy_pdf.views import PDFTemplateView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from django.db import IntegrityError
from mara_imp import factories
import datetime
from django.utils.html import escape
from .choices import Capacidad_balde
import collections
from django.contrib import messages
# Create your views here.

'''
OTRAS FUNCIONES
'''

def handlePopAdd(request, addForm, field):
    if request.method == "POST":
        form = addForm(request.POST)
        if form.is_valid():
            try:
                newObject = form.save()
            except forms.ValidationError:
                newObject = None
            if newObject:
                return HttpResponse('<script type="text/javascript">opener.dismissAddAnotherPopup(window, "%s", "%s");</script>' % \
                (escape(newObject._get_pk_val()), escape(newObject)))
    else:
        form = addForm()
    pageContext = {'form': form, 'field': field}
    return render(request,"base/popadd.html", pageContext)


@login_required
def new_localidad(request):
    return handlePopAdd(request, LocalidadForm, 'localidad')


'''
LOCALIDADES
'''

@login_required
def listado_localidades(request):
    listado_localidades = Localidad.objects.all()
    return render(request, 'localidad/localidad_listado.html', {'listado_localidades': listado_localidades})


@login_required
def alta_localidades(request):
    data = dict()

    if request.method == 'POST':
        form = LocalidadForm(request.POST)
        if form.is_valid():
            form.save()
            data['form_is_valid'] = True
        else:
            data['form_is_valid'] = False
    else:
        form = LocalidadForm()

    context = {'form': form}
    data['html_form'] = render_to_string('localidad/partial_localidad_alta.html',
        context,
        request=request
    )
    return JsonResponse(data)


@login_required
def baja_localidades(request):
    localidad_id = request.POST.get('localidad_id')
    localidad = Localidad.objects.get(id=localidad_id)
    localidad.delete()
    response = {}
    return JsonResponse(response)


@login_required
def modificar_localidades(request, id_localidad):
    localidad = Localidad.objects.get(id=id_localidad)
    if request.method == 'POST':
        localidad_form = LocalidadForm(request.POST, instance=localidad)

        if localidad_form.is_valid():
            localidad_form.save()
            return redirect('localidades:listado_localidades')
    else:
        localidad_form = LocalidadForm(instance=localidad)

    return render(request, "localidad/localidad_form.html", {'localidad_form': localidad_form})


'''
BALDES
'''


@login_required
def listado_baldes(request):
    listado_baldes = Balde.objects.all().order_by('nro_balde')
    '''
    for i in range (55):
        balde = Balde(nro_balde=(i+1), capacidad=10)
        balde.save()

    for i in range(55,111):
        balde = Balde(nro_balde=(i), capacidad=20)
        balde.save()

    for i in range(111,141):
        balde = Balde(nro_balde=(i), capacidad=50)
        balde.save()

    for i in range(141,153):
        balde = Balde(nro_balde=(i), capacidad=120)
        balde.save()

    for i in range(153,167):
        balde = Balde(nro_balde=(i), capacidad=240)
        balde.save()

    for i in range(167,349):
        balde = Balde(nro_balde=(i), capacidad=10)
        balde.save()
    for i in range(349,451):
        balde = Balde(nro_balde=(i), capacidad=20)
        balde.save()
    '''
    return render(request, 'balde/balde_listado.html', {'listado_baldes': listado_baldes})


@login_required
def alta_modif_balde(request, nro_balde=None):
    try:
        balde = Balde.objects.get(nro_balde=nro_balde)
    except:
        balde = None
    if request.method == 'POST':
        balde_form = BaldeForm(request.POST, instance=balde)
        if balde_form.is_valid():
            balde = balde_form.save(commit=False)
            balde.save()
            return redirect('baldes:listado_baldes')
    else:
        balde_form = BaldeForm(instance=balde)
    return render(request, "balde/balde_form.html", {'balde_form': balde_form})


@login_required
def baja_balde(request):
    balde_nro = request.POST.get('balde_nro')
    balde = Balde.objects.get(nro_balde=balde_nro)
    balde.delete()
    response = {}
    return JsonResponse(response)


'''
HOJAS DE RUTA
'''

@login_required
def alta_itinerario(request):

    listado_sectores = Sector.objects.all()
    listado_cuadrantes = Cuadrante.objects.all()
    listado_generadores = EstablecimientoGenerador.objects.filter(activo=True)


    if request.method == 'POST':
        print("-----------")
        print(request.POST.get('data'))
        print("-----------")

    return render(request, 'hojaRuta/itinerario.html', {'listado_sectores': listado_sectores,'listado_cuadrantes': listado_cuadrantes,'listado_generadores': listado_generadores})


@login_required
def listado_general_hojas_de_ruta(request):

    #form_liq_mensual = LiqMensualForm()
    listado_general = HojaRuta.objects.values('fecha_recorrido').distinct()
    #return render(request, 'hojaRuta/hojaruta_listado_general.html', {'listado_general': listado_general, 'form_liq_mensual':form_liq_mensual})

    if 'baldes_utilizados' in request.session:
        del request.session['baldes_utilizados']
    request.session['baldes_utilizados'] = []

    return render(request, 'hojaRuta/hojaruta_listado_general.html', {'listado_general': listado_general})


@login_required
def alta_modif_hoja_ruta(request):
    baldeutilizado_form = BaldeUtilizadoForm()

    if request.method == 'POST':
        hojaruta_form = HojaRutaForm(request.POST)
        if hojaruta_form.is_valid():
            hoja_ruta = hojaruta_form.save()
            request.session['fecha'] = str(hojaruta_form.cleaned_data.get('fecha_recorrido')) # Para controlar que no haya un balde repetido en mas de un generador
            carga_baldes(request, hoja_ruta)
            if 'btn-guardar' in request.POST:
                return redirect('hojaRuta:listado_general')
            else:
                return redirect('hojaRuta:alta_modif_hoja_ruta')
    else:
        hojaruta_form = HojaRutaForm()

    return render(request, "hojaRuta/hojaruta_form.html", {'hojaruta_form': hojaruta_form, 'baldeutilizado_form':baldeutilizado_form})


@login_required
def baja_hoja_ruta(request):
    fecha = datetime.datetime.strptime(request.POST.get('fecha'), '%d %b. %Y')
    hoja_rutas = HojaRuta.objects.filter(fecha_recorrido=fecha)
    for h in hoja_rutas:
        baldes = DetalleHojaRuta.objects.filter(hoja_ruta__fecha_recorrido=fecha)
        if (len(baldes)) == 0 :
            h.delete()
    response = {}
    return JsonResponse(response)


@login_required
def generar_hoja_ruta(request):
    dia_actual = datetime.datetime.now().strftime("%w") #%w numero dia en la semana (0 domingo, 6 sabado)

    #informacion de los establecimientos que atienden un dia en particular
    establecimientos = EstablecimientoGenerador.objects.filter(recoleccion__icontains=dia_actual, activo=True)

    dia_nombre = ""

    if dia_actual == "0":
        dia_nombre = "Domingo"
    elif dia_actual == "1":
        dia_nombre = "Lunes"
    elif dia_actual == "2":
        dia_nombre = "Martes"
    elif dia_actual == "3":
        dia_nombre = "Miercoles"
    elif dia_actual == "4":
        dia_nombre = "Jueves"
    elif dia_actual == "5":
        dia_nombre = "Viernes"
    elif dia_actual == "6":
        dia_nombre = "Sábado"

    #PARA MOSTRAR NOMBRE DEL DIA: get_dia_display()
    return render(request, "hojaRuta/hojaruta_impresion.html", {'establecimientos': establecimientos, 'dia':dia_nombre,'dia_nro':dia_actual})


'''
BALDES UTILIZADOS
'''


@login_required
def listado_baldes_utilizados(request, anio, mes, dia):
    fecha_recorrido = datetime.date(int(anio), int(mes), int(dia))
    hoja_de_ruta = HojaRuta.objects.filter(fecha_recorrido=fecha_recorrido).first() #Solo importa el primero, para obtener la fecha.
    listado_baldes = DetalleHojaRuta.objects.filter(hoja_ruta__fecha_recorrido=hoja_de_ruta.fecha_recorrido)
    return render(request, 'hojaRuta/baldes_utilizados/baldeutilizado_listado.html', {'listado_baldes': listado_baldes, 'hoja_ruta':hoja_de_ruta})


#MODIFICACION EN EL LISTADO DE BALDES
@login_required
def alta_modif_balde_utilizado(request, id_hoja=None, id_balde=None):
    try:
        balde = DetalleHojaRuta.objects.get(balde__nro_balde=id_balde, hoja_ruta__id=id_hoja)
    except:
        balde = None
    if request.method == 'POST':
        balde_form = ActualizarBaldeUtilizadoForm(request.POST, instance=balde)
        if balde_form.is_valid():
            balde = balde_form.save(commit=False)
            balde.hoja_ruta = HojaRuta.objects.get(id=id_hoja)
            balde_generado = Balde.objects.get(nro_balde=id_balde)
            if balde.tipo == "Entrega":
                balde_generado.estado = "Ocupado"
            else:
                balde_generado.estado = "En Planta"
            balde_generado.save()
            balde.balde = balde_generado
            balde.save()
            fecha_recorrido = balde.hoja_ruta.fecha_recorrido
            anio = fecha_recorrido.year
            mes = fecha_recorrido.month
            dia = fecha_recorrido.day
            return redirect('hojaRuta:listado_baldes_utilizados', anio=anio, mes=mes, dia=dia)
    else:
        balde_form = ActualizarBaldeUtilizadoForm(instance=balde)
    hoja_ruta = HojaRuta.objects.get(id=id_hoja) # Para obtener la fecha recorrido
    return render(request, "hojaRuta/baldes_utilizados/baldeutilizado_form.html", {'balde_form': balde_form, 'hoja_ruta':hoja_ruta})


@login_required(login_url='login')
def alta_balde_utilizado(request):
    form = BaldeUtilizadoForm(request.POST)
    success = True
    if form.is_valid():
        balde_utilizado = form.save(commit=False)
        if existe_balde(request, balde_utilizado):
            success = False
        else:
            request.session['baldes_utilizados'].append(balde_utilizado.to_json())
            request.session.modified = True
    return JsonResponse({'success': success, 'baldes_utilizados': request.session['baldes_utilizados']})


def existe_balde(request, balde_utilizado):
    for item in request.session['baldes_utilizados']:
        if ((item['nro_precinto'] == balde_utilizado.nro_precinto) or (item['balde']['nro_balde'] == balde_utilizado.balde.nro_balde)):
            return True
    return False


def carga_baldes(request, hoja_ruta):
    for b_utilizado in request.session['baldes_utilizados']:
        balde = Balde.objects.get(nro_balde=b_utilizado['balde']['nro_balde'])
        if b_utilizado['tipo'] =="Entrega":
            balde.estado = "Ocupado"
        else:
            balde.estado = "En Planta"
        balde.save()
        establecimiento_generador = EstablecimientoGenerador.objects.get(razon_social=b_utilizado['establecimiento_generador']['razon_social'])
        balde.establecimiento_generador = establecimiento_generador
        balde.save()
        if not DetalleHojaRuta.objects.filter(hoja_ruta__fecha_recorrido=request.session['fecha'], balde=balde): # No tiene qe existir el nro balde cargado ese dia en otro lugar
            item = DetalleHojaRuta(balde=balde, establecimiento_generador=establecimiento_generador,hoja_ruta=hoja_ruta,nro_precinto=b_utilizado['nro_precinto'], tipo=b_utilizado['tipo'])
            item.save()



@login_required
def baja_balde_utilizado(request):
    balde_nro = request.POST.get('balde_nro')
    balde_utilizado = DetalleHojaRuta.objects.get(balde__nro_balde=balde_nro)
    balde = Balde.objects.get(nro_balde=balde_nro)
    balde.estado = "En Planta"
    balde.save()
    balde_utilizado.delete()
    response = {}
    return JsonResponse(response)


class HojaRutaPdf(LoginRequiredMixin, PDFTemplateView):

    template_name = 'hojaRuta/hoja_ruta_pdf.html'
    title = "Planilla de Hoja de Ruta del dia: " + f"{datetime.datetime.now():%d/%m/%y}"

    login_url = '/accounts/login/'
    redirect_field_name = 'next'

    def get_context_data(self, dia):
        establecimientos = EstablecimientoGenerador.objects.filter(recoleccion__icontains=dia, activo=True)

        return super(HojaRutaPdf, self).get_context_data(
            pagesize="A4",
            establecimientos=establecimientos
        )


'''
SECTOR
'''


@login_required
def listado_sectores(request):
    listado_sectores = Sector.objects.all()
    return render(request, 'establecimiento/sector/sector_listado.html', {'listado_sectores': listado_sectores})


@login_required
def alta_sectores(request):
    data = dict()

    if request.method == 'POST':
        form = SectorForm(request.POST)
        if form.is_valid():
            form.save()
            data['form_is_valid'] = True
        else:
            data['form_is_valid'] = False
    else:
        form = SectorForm()

    context = {'form': form}
    data['html_form'] = render_to_string('establecimiento/sector/partial_sector_alta.html',
        context,
        request=request
    )
    return JsonResponse(data)


@login_required
def modificar_sectores(request, id_sector):
    sector = Sector.objects.get(id=id_sector)
    if request.method == 'POST':
        sector_form = SectorForm(request.POST, instance=sector)

        if sector_form.is_valid():
            sector_form.save()
            return redirect('generadores:listado_sectores')
    else:
        sector_form = SectorForm(instance=sector)

    return render(request, "establecimiento/sector/sector_form.html", {'sector_form': sector_form})


@login_required
def baja_sectores(request):
    sector_id = request.POST.get('sector_id')
    sector = Sector.objects.get(id=sector_id)
    sector.delete()
    response = {}
    return JsonResponse(response)


'''
ESTABLECIMIENTOS GENERADORES
'''


@login_required
def listado_generadores(request):
    listado_generadores = EstablecimientoGenerador.objects.all()
    return render(request, 'establecimiento/generador_listado.html', {'listado_generadores': listado_generadores})


@login_required
def detalle_generadores(request, nro_generador):
    generador = EstablecimientoGenerador.objects.get(id=nro_generador)
    return render(request, 'establecimiento/generador_detalle.html', {'generador': generador})


@login_required
def alta_modif_generadores(request, nro_generador=None):

    try:
        generador = EstablecimientoGenerador.objects.get(id=nro_generador)
        modificar = True # para poner el boton guardar antes del final del wizard
    except:
        generador = None
        modificar = False

    if request.method == 'POST':
        generador_form = GeneradorForm(request.POST, instance=generador)
        actividades_form = ActividadesForm(request.POST)
        dias_form = RecoleccionForm(request.POST)

        if generador_form.is_valid() & actividades_form.is_valid() & dias_form.is_valid():

            generador = generador_form.save(commit=False)
            generador.tipo_actividad = actividades_form.cleaned_data.get('tipo_actividad')
            generador.recoleccion = dias_form.cleaned_data.get('recoleccion')
            generador.save()

            return redirect('generadores:listado_generadores')

        else:
            if cuadrante_form.cleaned_data.get('nro_parada') and cuadrante_form.cleaned_data.get('sector'):
                messages.add_message(request, messages.ERROR, 'Se produjo un error, por favor, revise los datos ingresados.')
    else:

        generador_form = GeneradorForm(instance=generador)
        actividades_form = ActividadesForm(instance=generador)
        dias_form = RecoleccionForm(instance=generador)
        cuadrante_form = CuadranteForm(instance=generador)

    contexto= {'generador_form': generador_form,
               'actividades_form': actividades_form,
               'dias_form': dias_form,
               'cuadrante_form': cuadrante_form,
               'modificar':modificar
    }
    return render(request, "establecimiento/generador_form.html", contexto)


@login_required
def baja_generadores(request):
    nro_inscripcion = request.POST.get('generador_id')
    generador = EstablecimientoGenerador.objects.get(id=nro_inscripcion)
    generador.delete()
    response = {}
    return JsonResponse(response)


'''
LIQUIDACIONES MENSUALES
'''


class LiquidacionPdf(LoginRequiredMixin, PDFTemplateView):

    template_name = 'hojaRuta/liquidacion_mensual_pdf.html'
    title = "LIQUIDACIÓN MENSUAL DE RETIROS"

    login_url = '/accounts/login/'
    redirect_field_name = 'next'

    def get_context_data(self, mes):

        establecimientos = {}

        total_baldes = DetalleHojaRuta.objects.filter(hoja_ruta__fecha_recorrido__month=mes, establecimiento_generador__activo=True)

        for b in total_baldes:

            baldes_utilizados = {}
            total_envases = 0

            for c in Capacidad_balde: #Capacidad_balde: tupla del choices.py

                cant_envases = DetalleHojaRuta.objects.filter(establecimiento_generador__id=b.establecimiento_generador.id, hoja_ruta__id=b.hoja_ruta.id, balde__capacidad=c[0], tipo="Retiro").count() #baldes en cada hoja
                baldes_utilizados[c[0]] = cant_envases
                total_envases+=cant_envases #acumulador por cada tipo de balde

                c_envases = DetalleHojaRuta.objects.filter(establecimiento_generador__id=b.establecimiento_generador.id, hoja_ruta__id=b.hoja_ruta.id, tipo='Retiro').values_list('balde__capacidad')
                acumu = 0

                for env in c_envases:
                    acumu += int(env[0])

            establecimientos[b.establecimiento_generador.razon_social] = (baldes_utilizados, total_envases, acumu) #diccionario de baldes, total de envases, total de dm3


        return super(LiquidacionPdf, self).get_context_data(
            pagesize="A4",
            establecimientos=establecimientos
        )
