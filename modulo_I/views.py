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
import datetime
from django.utils.html import escape
from .choices import Capacidad_balde, Dias, Meses
import json

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


@login_required
def new_recorrido(request):
    return handlePopAdd(request, RecorridoForm, 'recorrido')


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
    listado_baldes = Balde.objects.all()
    return render(request, 'balde/balde_listado.html', {'listado_baldes': listado_baldes})


@login_required
def alta_modif_balde(request, nro_balde=None):
    try:
        balde = Balde.objects.get(nro_balde=nro_balde)
    except:
        balde = None
    if request.method == 'POST':
        balde_form = BaldeForm(request.POST, instance=balde)
        try:
            balde.delete()
        except:
            pass
        if balde_form.is_valid():
            balde_form.save()
            return redirect('baldes:listado_baldes')
    else:
        balde_form = BaldeForm(instance=balde)
    return render(request, "balde/balde_form.html", {'balde_form': balde_form})


@login_required
def baja_balde(request):
    balde_nro = request.POST.get('balde_nro')
    balde = Balde.objects.get(id=balde_nro)
    balde.delete()
    response = {}
    return JsonResponse(response)


@login_required
def reset_balde(request, nro_balde):
    balde = Balde.objects.get(nro_balde=nro_balde)
    balde.Estado = "En Planta"
    balde.establecimiento_generador = None
    balde.save()
    return redirect('baldes:listado_baldes')


'''
HOJAS DE RUTA
'''


@login_required
def listado_general_hojas_de_ruta(request):

    listado_general = RegistroHojaRuta.objects.values('fecha_recorrido').distinct()

    if 'baldes_utilizados' in request.session:
        del request.session['baldes_utilizados']
    request.session['baldes_utilizados'] = []

    #Devuelve diccionario con numero y nombre mes
    meses = {}
    mes_nombre = ""

    for fecha in RegistroHojaRuta.objects.all().values("fecha_recorrido").distinct().order_by("fecha_recorrido"):
        mes_actual = fecha['fecha_recorrido'].month
        anio_hoja_ruta = fecha['fecha_recorrido'].year
        meses[mes_actual] = (Meses[mes_actual-1][1],anio_hoja_ruta)

    #Para cada diá de la hoja de ruta
    dias_semana = Dias[1:len(Dias)]

    return render(request, 'registroHojaRuta/hojaruta_listado_general.html', {'listado_general': listado_general, 'meses':meses, 'dias_semana':dias_semana})


@login_required
def alta_modif_hoja_ruta(request):
    baldeutilizado_form = BaldeUtilizadoForm()

    if request.method == 'POST':
        hojaruta_form = HojaRutaForm(request.POST)
        if hojaruta_form.is_valid():
            hoja_ruta = hojaruta_form.save()
            request.session['fecha'] = str(hojaruta_form.cleaned_data.get('fecha_recorrido')) # Para controlar que no haya un balde repetido en mas de un generador
            carga_baldes_utilizados(request, hoja_ruta)

            #se chequea que la hoja de ruta no quede sin detalle
            registros = DetalleHojaRuta.objects.filter(registro_hoja_ruta=hoja_ruta).count()
            if registros == 0:
                hoja_ruta.delete()

            if 'btn-guardar' in request.POST:
                return redirect('registroHojaRuta:listado_general')
            else:
                request.session['baldes_utilizados'] = []
                return redirect('registroHojaRuta:alta_modif_hoja_ruta')
        else:
            messages.add_message(request, messages.ERROR, 'Ya se cargó el registro del establecimiento solicitado de la hoja de ruta de este día.')
    else:
        hojaruta_form = HojaRutaForm()

    return render(request, "registroHojaRuta/hojaruta_form.html", {'hojaruta_form': hojaruta_form, 'baldeutilizado_form':baldeutilizado_form})


@login_required
def baja_hoja_ruta(request):

    fecha = request.POST.get('fecha')
    hoja_rutas = RegistroHojaRuta.objects.get(fecha_recorrido=fecha)
    hoja_rutas.delete()
    response = {}
    return JsonResponse(response)


@login_required
def generar_hoja_ruta(request, dia):

    if dia!='0' and dia!='6':
        establecimientos_recorrido = EstablecimientoGenerador.objects.filter(recoleccion__icontains=dia, recorrido__extra=False).values('recorrido')
        listado_recorridos = Recorrido.objects.filter(id__in=establecimientos_recorrido)
    else:
        establecimientos_recorrido_extra = EstablecimientoGenerador.objects.filter(recoleccion__icontains=dia).values('recorrido_extra')
        listado_recorridos = Recorrido.objects.filter(id__in=establecimientos_recorrido_extra)

    #PARA MOSTRAR NOMBRE DEL DIA: get_dia_display()
    return render(request, "registroHojaRuta/hojaruta_impresion.html", {'listado_recorridos': listado_recorridos, 'dia':Dias[int(dia)]})


@login_required
def agregar_itinerario(request, id_recorrido, dia):

    if request.method == 'POST':
        generador = EstablecimientoGenerador.objects.get(id=request.POST.get('establecimiento'))
        recorrido= (Recorrido.objects.get(id=id_recorrido))

        if recorrido.extra:
            generador.recorrido_extra = recorrido
            if request.POST.get('nro_parada_generador'):
                generador.nro_parada_extra = request.POST.get('nro_parada_generador')
            else:
                generador.nro_parada_extra = None
        else:
            generador.recorrido = recorrido
            if request.POST.get('nro_parada_generador'):
                generador.nro_parada = request.POST.get('nro_parada_generador')
            else:
                generador.nro_parada = None
        generador.save()
        return redirect('generadores:listado_establecimientos_recorrido', id_recorrido=id_recorrido, dia=dia)

    establecimientos = EstablecimientoGenerador.objects.filter(recoleccion__icontains=dia, activo=True) #Solo establecimientos que atienden ese dia

    contexto= {'recorrido':id_recorrido, 'establecimientos':establecimientos, 'dia':dia}
    return render(request, "registroHojaRuta/itinerario/agregar_generador_form.html", contexto)


'''
def actualizar_nro_parada(generador_nro_parada, id_recorrido, dia):
    lista_nro_paradas = EstablecimientoGenerador.objects.filter(recorrido__id=id_recorrido, recoleccion__icontains=dia).order_by('nro_parada')

    flag = False

    for i in range(generador_nro_parada,len(lista_nro_paradas)):
        print(i)
        #
        if lista_nro_paradas[i].nro_parada == generador_nro_parada:
            lista_nro_paradas[i].nro_parada+=1
            flag = True
        if flag:
            lista_nro_paradas[i].nro_parada = i

        lista_nro_paradas[i].save()
'''


@login_required
def modificar_itinerario(request, id_generador, id_recorrido, dia):
    if dia!='0' and dia!='6':
        generador = EstablecimientoGenerador.objects.get(id=id_generador, recorrido__id=id_recorrido, recoleccion__icontains=dia)
    else:
        generador = EstablecimientoGenerador.objects.get(id=id_generador, recorrido_extra__id=id_recorrido, recoleccion__icontains=dia)

    if request.method == 'POST':
        if dia!='0' and dia!='6':
            generador_form = ItinerarioForm(request.POST, instance=generador)
        else:
            generador_form = ItinerarioFormExtra(request.POST, instance=generador)
        if generador_form.is_valid():
            generador = generador_form.save()
            #actualizar_nro_parada(generador.nro_parada, id_recorrido, dia)
            return redirect('generadores:listado_establecimientos_recorrido', id_recorrido=id_recorrido, dia=dia)
    else:
        if dia!='0' and dia!='6':
            generador_form = ItinerarioForm(instance=generador)
        else:
            generador_form = ItinerarioFormExtra(instance=generador)

    contexto= {'generador_form': generador_form, 'recorrido':id_recorrido, 'dia':dia}
    return render(request, "registroHojaRuta/itinerario/itinerario_form.html", contexto)


@login_required
def baja_itinerario(request, id_generador, id_recorrido, dia):
    if dia!='0' and dia!='6':
        generador = EstablecimientoGenerador.objects.get(id=id_generador, recorrido__id=id_recorrido, recoleccion__icontains=dia)
        generador.recoleccion.remove(dia)
        generador.save()
    else:
        generador = EstablecimientoGenerador.objects.get(id=id_generador, recorrido_extra__id=id_recorrido, recoleccion__icontains=dia)
        generador.recoleccion.remove(dia)
        generador.save()

    # si no se repite la linea del save y del remove no elimina el dia de la lista.

    return redirect('generadores:listado_establecimientos_recorrido', id_recorrido=id_recorrido, dia=dia)


class HojaRutaPdf(LoginRequiredMixin, PDFTemplateView):

    template_name = 'registroHojaRuta/hoja_ruta_pdf.html'
    title = "Planilla de Hoja de Ruta del dia: "
    sub_title = "Fecha de Impresión: " + f"{datetime.datetime.now():%d/%m/%y}"

    login_url = '/accounts/login/'
    redirect_field_name = 'next'

    def get_context_data(self, dia, recorrido):
        if dia!='0' and dia!='6':
            establecimientos = EstablecimientoGenerador.objects.filter(recoleccion__icontains=dia, activo=True, recorrido__id=recorrido).order_by('nro_parada')
        else:
            establecimientos = EstablecimientoGenerador.objects.filter(recoleccion__icontains=dia, activo=True, recorrido_extra__id=recorrido).order_by('nro_parada')


        return super(HojaRutaPdf, self).get_context_data(
            pagesize="A4",
            establecimientos=establecimientos,
            recorrido=Recorrido.objects.get(id=recorrido),
            dia=Dias[int(dia)]
        )


'''
BALDES UTILIZADOS
'''


@login_required
def listado_baldes_utilizados(request, anio, mes, dia):
    fecha_recorrido = datetime.date(int(anio), int(mes), int(dia))
    listado_baldes = DetalleHojaRuta.objects.filter(registro_hoja_ruta__fecha_recorrido__year=int(anio), registro_hoja_ruta__fecha_recorrido__month=int(mes), registro_hoja_ruta__fecha_recorrido__day=int(dia))
    return render(request, 'registroHojaRuta/baldes_utilizados/baldeutilizado_listado.html', {'listado_baldes': listado_baldes})


@login_required
def detalle_balde_utilizado(request, id_balde):
    balde_utilizado = DetalleHojaRuta.objects.get(id=id_balde)
    return render(request, 'registroHojaRuta/baldes_utilizados/baldeutilizado_detalle.html', {'balde_utilizado': balde_utilizado})


#MODIFICACION EN EL LISTADO DE BALDES
@login_required
def modif_balde_utilizado(request, id_hoja=None, id_balde=None):
    try:
        balde = DetalleHojaRuta.objects.get(balde__id=id_balde, registro_hoja_ruta__id=id_hoja)
    except:
        balde = None
    if request.method == 'POST':
        balde_form = ActualizarBaldeUtilizadoForm(request.POST, instance=balde)
        if balde_form.is_valid():
            balde = balde_form.save(commit=False)
            balde.registro_hoja_ruta = RegistroHojaRuta.objects.get(id=id_hoja)
            balde_generado = Balde.objects.get(id=id_balde)
            if balde.tipo == "Entrega":
                balde_generado.estado = "Ocupado"
            else:
                balde_generado.estado = "En Planta"
            balde_generado.save()
            balde.balde = balde_generado
            balde.save()
            fecha_recorrido = balde.registro_hoja_ruta.fecha_recorrido
            anio = fecha_recorrido.year
            mes = fecha_recorrido.month
            dia = fecha_recorrido.day
            return redirect('registroHojaRuta:listado_baldes_utilizados', anio=anio, mes=mes, dia=dia)
    else:
        balde_form = ActualizarBaldeUtilizadoForm(instance=balde)
    hoja_ruta = RegistroHojaRuta.objects.get(id=id_hoja) # Para obtener la fecha recorrido
    return render(request, "registroHojaRuta/baldes_utilizados/baldeutilizado_form.html", {'balde_form': balde_form, 'hoja_ruta':hoja_ruta})


@login_required(login_url='login')
def alta_balde_utilizado(request):
    form = BaldeUtilizadoForm(request.POST)
    success = True
    if form.is_valid():
        balde_utilizado = form.save(commit=False)
        if existe_balde_utilizado(request, balde_utilizado):
            success = False
        else:
            request.session['baldes_utilizados'].append(balde_utilizado.to_json())
            request.session.modified = True
    return JsonResponse({'success': success, 'baldes_utilizados': request.session['baldes_utilizados']})


def existe_balde_utilizado(request, balde_utilizado):
    for item in request.session['baldes_utilizados']:
        if (((item['nro_precinto'] == balde_utilizado.nro_precinto and (item['nro_precinto'] != None))) or (item['balde']['nro_balde'] == balde_utilizado.balde.nro_balde)):
            return True
    return False


def carga_baldes_utilizados(request, registro_hoja_ruta):
    for b_utilizado in request.session['baldes_utilizados']:
        balde = Balde.objects.get(nro_balde=b_utilizado['balde']['nro_balde'])
        if b_utilizado['tipo'] =="Entrega":
            balde.estado = "Ocupado"
            balde.establecimiento_generador = registro_hoja_ruta.establecimiento_generador
        else:
            balde.estado = "En Planta"
        balde.save()
        if not DetalleHojaRuta.objects.filter(registro_hoja_ruta__fecha_recorrido=request.session['fecha'], balde=balde): # No tiene qe existir el nro balde cargado ese dia en otro lugar
            item = DetalleHojaRuta(balde=balde, registro_hoja_ruta=registro_hoja_ruta,nro_precinto=b_utilizado['nro_precinto'], tipo=b_utilizado['tipo'])
            item.save()


@login_required
def baja_balde_utilizado(request):
    balde_nro = request.POST.get('balde_nro')
    balde_utilizado = DetalleHojaRuta.objects.get(id=balde_nro)
    balde = Balde.objects.get(id=balde_utilizado.balde.id)
    balde.estado = "En Planta"
    balde.save()
    balde_utilizado.delete()
    response = {}
    return JsonResponse(response)


'''
RECORRIDO
'''


@login_required
def listado_recorridos(request):
    listado_recorridos = Recorrido.objects.all()
    return render(request, 'establecimiento/recorrido/recorrido_listado.html', {'listado_recorridos': listado_recorridos})


@login_required
def listado_establecimientos_recorrido(request, id_recorrido, dia):
    flag = True
    if dia!='0' and dia!='6':
        listado_establecimientos = EstablecimientoGenerador.objects.filter(activo=True, recorrido__id=id_recorrido, recoleccion__icontains=dia)
    else:
        listado_establecimientos = EstablecimientoGenerador.objects.filter(activo=True, recorrido_extra__id=id_recorrido, recoleccion__icontains=dia)
        flag = False

    return render(request, 'establecimiento/recorrido/establecimientos_recorrido_listado.html', {'flag':flag, 'listado_establecimientos': listado_establecimientos, 'recorrido':Recorrido.objects.get(id=id_recorrido), 'dia':dia})


@login_required
def alta_recorridos(request):
    data = dict()

    if request.method == 'POST':
        form = RecorridoForm(request.POST)
        if form.is_valid():
            form.save()
            data['form_is_valid'] = True
        else:
            data['form_is_valid'] = False
    else:
        form = RecorridoForm()

    context = {'form': form}
    data['html_form'] = render_to_string('establecimiento/recorrido/partial_recorrido_alta.html',
        context,
        request=request
    )
    return JsonResponse(data)


@login_required
def modificar_recorridos(request, id_recorrido):
    recorrido = Recorrido.objects.get(id=id_recorrido)
    if request.method == 'POST':
        recorrido_form = RecorridoForm(request.POST, instance=recorrido)

        if recorrido_form.is_valid():
            recorrido_form.save()
            return redirect('generadores:listado_recorridos')
    else:
        recorrido_form = RecorridoForm(instance=recorrido)

    return render(request, "establecimiento/recorrido/recorrido_form.html", {'recorrido_form': recorrido_form})


@login_required
def baja_recorridos(request):
    recorrido_id = request.POST.get('recorrido_id')
    recorrido = Recorrido.objects.get(id=recorrido_id)
    recorrido.delete()
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
    baldepactado_form = BaldePactadoForm()

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

            if generador_form.cleaned_data.get('recorrido_extra'):
                if (not('6' in generador.tipo_actividad)): #Agrego que atiene el sabado si no lo seleccionó el usuario
                    generador.recoleccion.append('6')
            generador.save()
            carga_baldes(request, generador)
            return redirect('generadores:listado_generadores')
        else:
            messages.add_message(request, messages.ERROR, 'Se produjo un error, por favor, revise los datos ingresados.')
    else:

        generador_form = GeneradorForm(instance=generador)
        actividades_form = ActividadesForm(instance=generador)
        dias_form = RecoleccionForm(instance=generador)
        itinerario_form = ItinerarioForm(instance=generador)

    if 'baldes_pactados' in request.session:
        del request.session['baldes_pactados']
    request.session['baldes_pactados'] = []

    contexto= {'generador_form': generador_form,
               'actividades_form': actividades_form,
               'dias_form': dias_form,
               'itinerario_form': itinerario_form,
               'recorridos':Recorrido.objects.all(),
               'baldepactado_form':baldepactado_form,
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
BALDES PACTADOS
'''


@login_required
def listado_baldes_pactados(request, nro_generador):
    listado_baldes = BaldePactado.objects.filter(establecimiento_generador__id=nro_generador)
    generador = EstablecimientoGenerador.objects.get(id=nro_generador)
    return render(request, 'establecimiento/baldes_pactados/baldepactado_listado.html', {'listado_baldes': listado_baldes, 'nro_generador':nro_generador, 'generador':generador})


@login_required(login_url='login')
def alta_balde_pactado(request):
    form = BaldePactadoForm(request.POST)
    success = True
    if form.is_valid():
        balde_pactado = form.save(commit=False)
        if existe_balde(request, balde_pactado):
            success = False
        else:
            request.session['baldes_pactados'].append(balde_pactado.to_json())
            request.session.modified = True
    return JsonResponse({'success': success, 'baldes_pactados': request.session['baldes_pactados']})


def existe_balde(request, balde_pactado):
    for item in request.session['baldes_pactados']:
        if ((item['capacidad_balde'] == balde_pactado.capacidad_balde) and (item['color_precinto'] == balde_pactado.color_precinto)):
            return True
    return False


def carga_baldes(request, generador):
    for b_pactado in request.session['baldes_pactados']:
        item = BaldePactado(establecimiento_generador=generador,capacidad_balde=b_pactado['capacidad_balde'], color_precinto=b_pactado['color_precinto'], cantidad=b_pactado['cantidad'])
        item.save()


@login_required
def alta_balde_pactado_mod(request, nro_generador):

    if request.method == 'POST':
        baldepactado_form = BaldePactadoForm(request.POST)
        if baldepactado_form.is_valid():
            balde = baldepactado_form.save(commit=False)
            generador = EstablecimientoGenerador.objects.get(id=nro_generador)
            balde.establecimiento_generador=generador
            try:
                balde.save()
                return redirect('generadores:listado_baldes_pactados', nro_generador=nro_generador)
            except:
                messages.add_message(request, messages.ERROR, 'Ya está cargada esta capacidad de baldes y color de precinto.')
    else:
        baldepactado_form = BaldePactadoForm()

    return render(request, "establecimiento/baldes_pactados/baldepactado_form.html", {'baldepactado_form': baldepactado_form, 'nro_generador':nro_generador})


@login_required
def modif_balde_pactado(request, nro_balde=None):

    balde = BaldePactado.objects.get(id=nro_balde)

    if request.method == 'POST':
        baldepactado_form = BaldePactadoForm(request.POST, instance=balde)
        if baldepactado_form.is_valid():
            balde = baldepactado_form.save()
            return redirect('generadores:listado_baldes_pactados', nro_generador=balde.establecimiento_generador.id)
    else:
        baldepactado_form = BaldePactadoForm(instance=balde)

    return render(request, "establecimiento/baldes_pactados/baldepactado_form.html", {'baldepactado_form': baldepactado_form, 'nro_generador':balde.establecimiento_generador.id})


@login_required
def baja_balde_pactado(request):
    balde_nro = request.POST.get('balde_nro')
    balde_pactado = BaldePactado.objects.get(id=balde_nro)
    balde_pactado.delete()
    response = {}
    return JsonResponse(response)


'''
LIQUIDACIONES MENSUALES
'''


class LiquidacionPdf(LoginRequiredMixin, PDFTemplateView):

    template_name = 'registroHojaRuta/liquidacion_mensual_pdf.html'
    title = "LIQUIDACIÓN MENSUAL DE RETIROS"
    sub_title = "Fecha de Impresión: " + f"{datetime.datetime.now():%d/%m/%y}"

    login_url = '/accounts/login/'
    redirect_field_name = 'next'

    def get_context_data(self, mes, nombre_mes, anio):

        establecimientos = {}

        total_baldes = DetalleHojaRuta.objects.filter(registro_hoja_ruta__fecha_recorrido__month=mes, registro_hoja_ruta__establecimiento_generador__activo=True, registro_hoja_ruta__establecimiento_generador__recorrido__isnull=False, tipo="Retiro")

        for b in total_baldes:

            baldes_utilizados = {}
            total_envases = 0

            for c in Capacidad_balde: #Capacidad_balde: tupla del choices.py

                cant_envases = DetalleHojaRuta.objects.filter(registro_hoja_ruta__establecimiento_generador__id=b.registro_hoja_ruta.establecimiento_generador.id, registro_hoja_ruta__fecha_recorrido__month=b.registro_hoja_ruta.fecha_recorrido.month, balde__capacidad=c[0], tipo="Retiro").count() #baldes en cada hoja
                baldes_utilizados[c[0]] = cant_envases
                total_envases+=cant_envases #acumulador por cada tipo de balde

                c_envases = DetalleHojaRuta.objects.filter(registro_hoja_ruta__establecimiento_generador__id=b.registro_hoja_ruta.establecimiento_generador.id, registro_hoja_ruta__fecha_recorrido__month=b.registro_hoja_ruta.fecha_recorrido.month, tipo='Retiro').values_list('balde__capacidad')
                acumu = 0

                for env in c_envases:
                    acumu += int(env[0])

            establecimientos[b.registro_hoja_ruta.establecimiento_generador.razon_social] = (baldes_utilizados, total_envases, acumu) #diccionario de baldes, total de envases, total de dm3

        return super(LiquidacionPdf, self).get_context_data(
            pagesize="A4",
            establecimientos=establecimientos,
            nombre_mes=nombre_mes,
            anio=anio
        )
