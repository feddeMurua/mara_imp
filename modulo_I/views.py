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
def new_persona(request):
    return handlePopAdd(request, PersonaForm, 'persona')


'''
PERSONAS
'''


@login_required
def listado_personas(request):
    listado_personas = Persona.objects.all()

    '''
    #FACTORIES
    for x in xrange(45):
        personas = factories.PersonaFactory()

    for x in xrange(8):
        nacionalidad = factories.NacionalidadFactory()

    for x in xrange(8):
        provincia = factories.ProvinciaFactory()

    for x in xrange(8):
        localidad = factories.LocalidadFactory()

    for x in xrange(10):
        domicilio = factories.DomicilioFactory()

    for x in xrange(10):
        datoImpositivo = factories.DatoImpositivoFactory()

    for x in xrange(10):
        cliente = factories.ClienteFactory()
    '''

    return render(request, 'persona/persona_listado.html', {'listado_personas': listado_personas})


@login_required
def detalle_personas(request, id_persona):
    persona = Persona.objects.get(id=id_persona)
    return render(request, 'persona/persona_detalle.html', {'persona': persona})


@login_required
def alta_personas(request):
    data = dict()

    if request.method == 'POST':
        form = PersonaForm(request.POST)
        if form.is_valid():
            form.save()
            data['form_is_valid'] = True
        else:
            data['form_is_valid'] = False
    else:
        form = PersonaForm()

    context = {'form': form}
    data['html_form'] = render_to_string('persona/partial_persona_alta.html',
        context,
        request=request
    )
    return JsonResponse(data)


@login_required
def baja_personas(request):
    persona_id = request.POST.get('persona_id')
    persona = Persona.objects.get(id=persona_id)
    persona.delete()
    response = {}
    return JsonResponse(response)


@login_required
def modificar_personas(request, id_persona):
    persona = Persona.objects.get(id=id_persona)
    if request.method == 'POST':
        persona_form = PersonaForm(request.POST, instance=persona)

        if persona_form.is_valid():
            persona_form.save()
            return redirect('personas:listado_personas')
    else:
        persona_form = PersonaForm(instance=persona)

    return render(request, "persona/persona_form.html", {'persona_form': persona_form})


'''
CLIENTES
'''

@login_required
def listado_clientes(request):
    listado_clientes = Cliente.objects.all()
    return render(request, 'cliente/cliente_listado.html', {'listado_clientes': listado_clientes})


@login_required
def detalle_clientes(request, id_cliente):
    cliente = Cliente.objects.get(id=id_cliente)
    return render(request, 'cliente/cliente_detalle.html', {'cliente': cliente})


@login_required
def alta_modif_clientes(request, id_cliente=None):
    try:
        cliente = Cliente.objects.get(id=id_cliente)
        domicilio = cliente.domicilio_legal
        dato_impositivo = cliente.dato_impositivo
        modificar = True
    except:
        cliente = None
        domicilio = None
        dato_impositivo = None
        modificar = False
    if request.method == 'POST':
        cliente_form = ClienteForm(request.POST, instance=cliente)
        domicilio_form = DomicilioForm(request.POST,instance= domicilio)
        datos_impositivos_form = DatosImpositivosForm(request.POST, instance=dato_impositivo)
        if cliente_form.is_valid() & domicilio_form.is_valid() & datos_impositivos_form.is_valid():
            cliente = cliente_form.save(commit=False)
            cliente.domicilio_legal = domicilio_form.save()
            cliente.dato_impositivo= datos_impositivos_form.save()
            cliente.save()
            return redirect('clientes:listado_clientes')
    else:
        cliente_form = ClienteForm(instance=cliente)
        domicilio_form = DomicilioForm(instance=domicilio)
        datos_impositivos_form = DatosImpositivosForm(instance=dato_impositivo)

    contexto = {
            'cliente_form': cliente_form,
            'domicilio_form': domicilio_form,
            'datos_impositivos_form':datos_impositivos_form,
            'modificar':modificar
    }

    return render(request, "cliente/cliente_form.html", contexto)


@login_required
def baja_clientes(request):
    cliente_id = request.POST.get('cliente_id')
    cliente = Cliente.objects.get(id=cliente_id)
    cliente.delete()
    response = {}
    return JsonResponse(response)


'''
BALDES
'''

@login_required
def listado_baldes(request, id_hoja):
    listado_baldes = BaldeUtilizado.objects.filter(hoja_ruta__id=id_hoja)
    return render(request, 'hojaRuta/balde/balde_listado.html', {'listado_baldes': listado_baldes, 'id_hoja':id_hoja})



@login_required
def alta_modif_balde(request, id_hoja=None, id_balde=None):
    try:
        balde = BaldeUtilizado.objects.get(id=id_balde)
    except:
        balde = None
    if request.method == 'POST':
        balde_form = BaldeUtilizadoForm(request.POST, instance=balde)
        if balde_form.is_valid():
            balde = balde_form.save(commit=False)
            balde.hoja_ruta = HojaRuta.objects.get(id=id_hoja)
            balde.save()
            return redirect('hojaRuta:listado_baldes', id_hoja=id_hoja)
    else:
        balde_form = BaldeUtilizadoForm(instance=balde)

    return render(request, "hojaRuta/balde/balde_form.html", {'balde_form': balde_form, 'id_hoja':id_hoja})


@login_required
def baja_balde(request):
    balde_id = request.POST.get('balde_id')
    balde = BaldeUtilizado.objects.get(id=balde_id)
    balde.delete()
    response = {}
    return JsonResponse(response)


'''
HOJAS DE RUTA
'''

@login_required
def listado_hojas_de_ruta(request):
    listado_hojas_de_ruta = HojaRuta.objects.all()
    return render(request, 'hojaRuta/hojaruta_listado.html', {'listado_hojas_de_ruta': listado_hojas_de_ruta})


@login_required
def detalle_hojas_de_ruta(request, id_hoja):
    hoja_ruta = HojaRuta.objects.get(id=id_hoja)
    return render(request, 'hojaRuta/hoja_ruta_detalle.html', {'hoja_ruta': hoja_ruta})


@login_required
def alta_modif_hoja_ruta(request, id_hoja=None):
    try:
        hoja_ruta = HojaRuta.objects.get(id=id_hoja)
    except:
        hoja_ruta = None
    if request.method == 'POST':
        hojaruta_form = HojaRutaForm(request.POST, instance=hoja_ruta)
        if hojaruta_form.is_valid():
            hoja_ruta = hojaruta_form.save()
            return redirect('hojaRuta:listado_hojas_de_ruta')
    else:
        hojaruta_form = HojaRutaForm(instance=hoja_ruta)

    return render(request, "hojaRuta/hojaruta_form.html", {'hojaruta_form': hojaruta_form})


@login_required
def baja_hoja_ruta(request):
    hoja_ruta_id = request.POST.get('hoja_ruta_id')
    hoja_ruta = HojaRuta.objects.get(id=hoja_ruta_id)
    hoja_ruta.delete()
    response = {}
    return JsonResponse(response)


@login_required
def generar_hoja_ruta(request):
    dia_actual = datetime.datetime.now().strftime("%w") #%w numero dia en la semana (0 domingo, 6 sabado)

    #informacion de los establecimientos que atienden un dia en particular
    establecimientos = HorarioAtencion.objects.filter(dia=dia_actual).order_by('establecimiento_generador__sector').order_by('horario_retiro')

    dia_nombre = ""
    if establecimientos:
        dia_nombre = (establecimientos[0].get_dia_display()).upper()

    #PARA MOSTRAR NOMBRE DEL DIA: get_dia_display()
    return render(request, "hojaRuta/hojaruta_impresion.html", {'establecimientos': establecimientos, 'dia':dia_nombre,'dia_nro':dia_actual})



@login_required
def detalle_horario_atencion(request, id_horario):
    horario_atencion = HorarioAtencion.objects.get(id=id_horario)
    return render(request, 'hojaRuta/horarioatencion_detalle.html', {'horario_atencion': horario_atencion})


class HojaRutaPdf(LoginRequiredMixin, PDFTemplateView):

    template_name = 'hojaRuta/hoja_ruta_pdf.html'
    title = "Planilla de Hoja de Ruta del dia: " + f"{datetime.datetime.now():%d/%m/%y}"

    login_url = '/accounts/login/'
    redirect_field_name = 'next'

    def get_context_data(self, dia):
        establecimientos = HorarioAtencion.objects.filter(dia=dia).order_by('establecimiento_generador__sector').order_by('horario_retiro')

        return super(HojaRutaPdf, self).get_context_data(
            pagesize="A4",
            establecimientos=establecimientos
        )


'''
HORARIOS DE ATENCIÓN
'''


@login_required
def listado_horarios(request, nro_inscripcion):
    listado_horarios = HorarioAtencion.objects.filter(establecimiento_generador__nro_inscripcion=nro_inscripcion)
    return render(request, 'establecimiento/horario_atencion/horario_listado.html', {'listado_horarios': listado_horarios, 'nro_inscripcion':nro_inscripcion})


@login_required
def alta_modif_horarios(request, nro_inscripcion=None, id_horario=None):
    try:
        horario = HorarioAtencion.objects.get(id=id_horario)
    except:
        horario = None
    if request.method == 'POST':
        horario_form = HorarioAtencionForm(request.POST, instance=horario)

        if horario_form.is_valid():
            horario = horario_form.save(commit=False)
            horario.establecimiento_generador = EstablecimientoGenerador.objects.get(nro_inscripcion=nro_inscripcion)
            try:
                horario.save()
                return redirect('generadores:listado_horarios', nro_inscripcion=nro_inscripcion)
            except IntegrityError:
                messages.add_message(request, messages.ERROR, 'Ya existe este día cargado.')
    else:
        horario_form = HorarioAtencionForm(instance=horario)
    return render(request, "establecimiento/horario_atencion/horario_form.html",{'horario_form':horario_form,'nro_inscripcion':nro_inscripcion})


@login_required
def baja_horarios(request):
    horario_id = request.POST.get('horario_id')
    horario = HorarioAtencion.objects.get(id=horario_id)
    horario.delete()
    response = {}
    return JsonResponse(response)


'''
RESIDUOS GENERADORES
'''


@login_required
def listado_residuos(request, nro_inscripcion):
    listado_residuos = ResiduoGenerador.objects.filter(establecimiento_generador__nro_inscripcion=nro_inscripcion)
    return render(request, 'establecimiento/residuo_generador/residuo_listado.html', {'listado_residuos': listado_residuos, 'nro_inscripcion':nro_inscripcion})


@login_required
def alta_modif_residuos(request, nro_inscripcion=None, id_residuo=None):
    try:
        residuo = ResiduoGenerador.objects.get(id=id_residuo)

    except:
        residuo = None
    if request.method == 'POST':
        residuo_form = ResiduoGeneradorForm(request.POST, instance=residuo)

        if residuo_form.is_valid():
            residuo = residuo_form.save(commit=False)
            residuo.establecimiento_generador = EstablecimientoGenerador.objects.get(nro_inscripcion=nro_inscripcion)
            try:
                residuo.save()
                return redirect('generadores:listado_residuos', nro_inscripcion=nro_inscripcion)
            except IntegrityError:
                messages.add_message(request, messages.ERROR, 'Ya existe este tipo de residuo cargado.')
    else:
        residuo_form = ResiduoGeneradorForm(instance=residuo)
    return render(request, "establecimiento/residuo_generador/residuo_form.html",{'residuo_form':residuo_form,'nro_inscripcion':nro_inscripcion})


@login_required
def baja_residuos(request):
    residuo_id = request.POST.get('residuo_id')
    residuo = ResiduoGenerador.objects.get(id=residuo_id)
    residuo.delete()
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
def detalle_generadores(request, nro_inscripcion):
    generador = EstablecimientoGenerador.objects.get(nro_inscripcion=nro_inscripcion)
    return render(request, 'establecimiento/generador_detalle.html', {'generador': generador})


@login_required
def alta_modif_generadores(request, nro_inscripcion=None):

    try:
        generador = EstablecimientoGenerador.objects.get(nro_inscripcion=nro_inscripcion)
        acopio_transitorio = generador.via_acceso.acopio_transitorio
        via_acceso = generador.via_acceso
        domicilio = generador.domicilio
        ambito_dependencia = generador.ambito_dependencia
        caract_generales = generador.caract_generales
        modificar = True # para poner el boton guardar antes del final del wizard
    except:
        generador = None
        acopio_transitorio = None
        via_acceso = None
        domicilio = None
        ambito_dependencia = None
        caract_generales = None
        modificar = False

    if request.method == 'POST':
        generador_form = GeneradorForm(request.POST, instance=generador)
        actividades_form = ActividadesForm(request.POST)
        acopio_transitorio_form = AcopioTransitorioForm(request.POST, instance=acopio_transitorio)
        via_acceso_form = ViaAccesoSectorForm(request.POST, instance=via_acceso)
        domicilio_form = DomicilioForm(request.POST, instance=domicilio)
        ambito_dpcia_form = AmbitoDependenciaForm(request.POST, instance=ambito_dependencia)
        caract_generales_form = CaracteristicasGeneralesForm(request.POST,instance=caract_generales)

        if generador_form.is_valid() & actividades_form.is_valid() & domicilio_form.is_valid() \
            & ambito_dpcia_form.is_valid() & caract_generales_form.is_valid() \
            & via_acceso_form.is_valid() & acopio_transitorio_form.is_valid():

            generador = generador_form.save(commit=False)
            generador.tipo_actividad = actividades_form.cleaned_data.get('tipo_actividad')

            acopio = acopio_transitorio_form.save()
            via_acceso = ViaAccesoSector() # se crea objeto via_acceso para asignarle sector acopio
            via_acceso.acopio_transitorio = acopio
            via_acceso.tipo = via_acceso_form.cleaned_data.get('tipo')
            via_acceso.save()

            generador.via_acceso = via_acceso
            generador.domicilio = domicilio_form.save()
            generador.ambito_dependencia = ambito_dpcia_form.save()
            generador.caract_generales = caract_generales_form.save()

            generador.save()

            return redirect('generadores:listado_generadores')
    else:

        generador_form = GeneradorForm(instance=generador)
        actividades_form = ActividadesForm(instance=generador)
        acopio_transitorio_form = AcopioTransitorioForm(instance=acopio_transitorio)
        via_acceso_form = ViaAccesoSectorForm(instance=via_acceso)
        domicilio_form = DomicilioForm(instance=domicilio)
        ambito_dpcia_form = AmbitoDependenciaForm(instance=ambito_dependencia)
        caract_generales_form = CaracteristicasGeneralesForm(instance=caract_generales)

    contexto= {'generador_form': generador_form,
               'actividades_form': actividades_form,
               'persona_form':PersonaForm,
               'domicilio_form':domicilio_form,
               'ambito_dpcia_form':ambito_dpcia_form,
               'caract_generales_form':caract_generales_form,
               'via_acceso_form':via_acceso_form,
               'acopio_transitorio_form':acopio_transitorio_form,
               'modificar':modificar
    }
    return render(request, "establecimiento/generador_form.html", contexto)


@login_required
def baja_generadores(request):
    nro_inscripcion = request.POST.get('generador_id')
    generador = EstablecimientoGenerador.objects.get(nro_inscripcion=nro_inscripcion)
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
        for hoja in HojaRuta.objects.filter(fecha_impresion__month=mes):
            baldes_utilizados = {}
            total_envases = 0
            for c in Capacidad_balde: #Capacidad_balde: tupla del choices.py
                cant_envases = BaldeUtilizado.objects.filter(hoja_ruta__id=hoja.id, balde__capacidad=c[0], tipo="Salida").count() #baldes en cada hoja
                baldes_utilizados[c[0]] = cant_envases
                total_envases+=cant_envases #acumulador por cada tipo de balde
            establecimientos[hoja.establecimiento_generador.razon_social] = (baldes_utilizados, total_envases)
        
        return super(LiquidacionPdf, self).get_context_data(
            pagesize="A4",
            establecimientos=establecimientos
        )
