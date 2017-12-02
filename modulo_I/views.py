from django.shortcuts import render, redirect, render_to_response
from django.http import JsonResponse
from .models import *
from .forms import *
from django.template.loader import render_to_string
from django.contrib import messages
from django.template import RequestContext  # For CSRF
from django.forms.formsets import formset_factory, BaseFormSet
from django.http import HttpResponse, HttpResponseRedirect
# Create your views here.

'''
CLIENTES
'''

#@login_required(login_url='login')
def listado_clientes(request):
    listado_clientes = Cliente.objects.all()
    return render(request, 'cliente/cliente_listado.html', {'listado_clientes': listado_clientes})


#@login_required(login_url='login')
def detalle_clientes(request, id_cliente):
    cliente = Cliente.objects.get(id=id_cliente)
    return render(request, 'cliente/cliente_detalle.html', {'cliente': cliente})


#@login_required(login_url='login')
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


#@login_required(login_url='login')
def alta_clientes(request):
    if request.method == 'POST':
        cliente_form = AltaClienteForm(request.POST)
        domicilio_form = DomicilioForm(request.POST)
        datos_impositivos_form = DatosImpositivosForm(request.POST)
        if cliente_form.is_valid() & domicilio_form.is_valid() & datos_impositivos_form.is_valid():
            cliente = cliente_form.save(commit=False)
            cliente.domicilio_legal = domicilio_form.save()
            cliente.dato_impositivo= datos_impositivos_form.save()
            cliente.save()
            return redirect('clientes:listado_clientes')
    else:
        cliente_form = AltaClienteForm
        domicilio_form = DomicilioForm
        datos_impositivos_form = DatosImpositivosForm

    contexto= {'cliente_form': cliente_form,
                'domicilio_form': domicilio_form,
                'datos_impositivos_form':datos_impositivos_form,
    }

    return render(request, "cliente/cliente_form.html", contexto)


#@login_required(login_url='login')
def baja_clientes(request):
    cliente_id = request.POST.get('cliente_id')
    cliente = Cliente.objects.get(id=cliente_id)
    cliente.delete()
    response = {}
    return JsonResponse(response)


#@login_required(login_url='login')
def modificar_clientes(request, id_cliente):
    cliente = Cliente.objects.get(id=id_cliente)
    if request.method == 'POST':
        cliente_form = ModificacionClienteForm(request.POST, instance=cliente)
        domicilio_form = DomicilioForm(request.POST,instance=cliente.domicilio_legal)
        datos_impositivos_form = DatosImpositivosForm(request.POST, instance=cliente.dato_impositivo)
        if cliente_form.is_valid() & domicilio_form.is_valid() & datos_impositivos_form.is_valid():
            domicilio_form.save()
            cliente_form.save()
            datos_impositivos_form.save()
            return redirect('clientes:listado_clientes')
    else:
        cliente_form = ModificacionClienteForm(instance=cliente)
        domicilio_form = DomicilioForm(instance=cliente.domicilio_legal)
        datos_impositivos_form = DatosImpositivosForm(instance=cliente.dato_impositivo)
    return render(request, "cliente/cliente_form.html", {'cliente_form': cliente_form, 'domicilio_form': domicilio_form, 'datos_impositivos_form':datos_impositivos_form})

'''
ESTABLECIMIENTOS GENERADORES
'''


#@login_required(login_url='login')
def listado_generadores(request):
    listado_generadores = EstablecimientoGenerador.objects.all()
    return render(request, 'establecimiento/generador_listado.html', {'listado_generadores': listado_generadores})


#@login_required(login_url='login')
def detalle_generadores(request, nro_inscripcion):
    generador = EstablecimientoGenerador.objects.get(nro_inscripcion=nro_inscripcion)
    return render(request, 'establecimiento/generador_detalle.html', {'generador': generador})


#@login_required(login_url='login')
def alta_generadores(request):

    class RequiredFormSet(BaseFormSet):
        def __init__(self, *args, **kwargs):
            super(RequiredFormSet, self).__init__(*args, **kwargs)
            for form in self.forms:
                form.empty_permitted = False
    ResiduoGeneradorFormSet = formset_factory(ResiduoGeneradorForm, max_num=3, formset=RequiredFormSet)

    if request.method == 'POST':
        generador_form = AltaGeneradorForm(request.POST)
        actividades_form = ActividadesForm(request.POST)
        horario_atencion_form = HorarioAtencionForm(request.POST)
        residuo_generador_formset = ResiduoGeneradorFormSet(request.POST, request.FILES)
        acopio_transitorio_form = AcopioTransitorioForm(request.POST)
        via_acceso_form = ViaAccesoSectorForm(request.POST)
        domicilio_form = DomicilioForm(request.POST)
        ambito_dpcia_form = AmbitoDependenciaForm(request.POST)
        caract_generales_form = CaracteristicasGeneralesForm(request.POST)

        if generador_form.is_valid() & actividades_form.is_valid() & domicilio_form.is_valid() \
            & ambito_dpcia_form.is_valid() & caract_generales_form.is_valid() \
            & via_acceso_form.is_valid() & acopio_transitorio_form.is_valid() \
            & horario_atencion_form.is_valid() & residuo_generador_formset.is_valid():

            generador = generador_form.save(commit=False)

            # Guardo el formset de residuos
            for form in residuo_generador_formset.forms:
                residuo_generador_item = form.save(commit=False)
                residuo_generador_item.establecimiento_generador = generador
                residuo_generador_item.save()

            acopio = acopio_transitorio_form.save()
            via_acceso = ViaAccesoSector() # se crea objeto via_acceso para asignarle sector acopio
            via_acceso.acopio_transitorio = acopio
            via_acceso.tipo = via_acceso_form.cleaned_data.get('tipo')
            via_acceso.save()

            generador.via_acceso = via_acceso
            generador.domicilio = domicilio_form.save()
            generador.ambito_dependencia = ambito_dpcia_form.save()
            generador.caract_generales = caract_generales_form.save()

            generador.tipo_actividad = actividades_form.cleaned_data.get('tipo_actividad')
            horario_atencion = horario_atencion_form.save(commit=False)
            generador.dia_atención= horario_atencion.dia_atención
            generador.hora_atención= horario_atencion.hora_atención

            generador.save()


            return redirect('generadores:listado_generadores')
    else:
        generador_form = AltaGeneradorForm
        horario_atencion_form = HorarioAtencionForm
        actividades_form = ActividadesForm
        residuo_generador_formset = ResiduoGeneradorFormSet()
        acopio_transitorio_form = AcopioTransitorioForm
        via_acceso_form = ViaAccesoSectorForm
        persona_form = PersonaForm # para el Agregado que tiene
        domicilio_form = DomicilioForm
        ambito_dpcia_form = AmbitoDependenciaForm
        caract_generales_form = CaracteristicasGeneralesForm


    contexto= {'generador_form': generador_form,
               'actividades_form': actividades_form,
               'persona_form':PersonaForm,
               'domicilio_form':domicilio_form,
               'ambito_dpcia_form':ambito_dpcia_form,
               'caract_generales_form':caract_generales_form,
               'via_acceso_form':via_acceso_form,
               'acopio_transitorio_form':acopio_transitorio_form,
               'horario_atencion_form':horario_atencion_form,
               'residuo_generador_formset':residuo_generador_formset,
    }

    return render(request, "establecimiento/generador_form.html",contexto)


#@login_required(login_url='login')
def baja_generadores(request):
    nro_inscripcion = request.POST.get('generador_id')
    generador = EstablecimientoGenerador.objects.get(nro_inscripcion=nro_inscripcion)
    generador.delete()
    response = {}
    return JsonResponse(response)


#@login_required(login_url='login')
def modificar_generadores(request, nro_inscripcion):
    generador = EstablecimientoGenerador.objects.get(nro_inscripcion=nro_inscripcion)
    if request.method == 'POST':
        generador_form = ModificacionGeneradorForm(request.POST, instance=generador)
        actividades_form = ActividadesForm(request.POST)
        if generador_form.is_valid() & actividades_form.is_valid():
            generador = generador_form.save(commit=False)
            tipo_actividad = actividades_form.cleaned_data.get('tipo_actividad')
            generador.tipo_actividad = tipo_actividad
            generador.save()
            return redirect('generadores:listado_generadores')
    else:
        generador_form = ModificacionGeneradorForm(instance=generador)
        actividades_form = ActividadesForm(instance=generador)
    return render(request, "establecimiento/generador_form.html", {'generador_form': generador_form, 'actividades_form': actividades_form})
