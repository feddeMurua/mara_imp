from django.shortcuts import render, redirect
from django.http import JsonResponse
from .models import *
from .forms import *
from django.template.loader import render_to_string
from django.contrib import messages

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
    data['html_form'] = render_to_string('cliente/partial_persona_alta.html',
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
            documento = request.POST.get('persona') #Obtengo documento del selector
            doc_contacto_personal = request.POST.get('contacto') #Obtengo documento del selector
            if doc_contacto_personal:
                cliente.contacto_comercial = Persona.objects.get(documento=doc_contacto_personal)
            if documento:
                cliente.apoderado = Persona.objects.get(documento=documento)
                cliente.domicilio_legal = domicilio_form.save()
                cliente.dato_impositivo= datos_impositivos_form.save()
                cliente.save()
                return redirect('clientes:listado_clientes')
            else:
                messages.add_message(request, messages.WARNING, 'Atención: No ingresó ningún apoderado')
    else:
        cliente_form = AltaClienteForm
        domicilio_form = DomicilioForm
        datos_impositivos_form = DatosImpositivosForm

    persona_form = PersonaForm
    listado_personas = Persona.objects.all()

    contexto= {'cliente_form': cliente_form,
                'domicilio_form': domicilio_form,
                'datos_impositivos_form':datos_impositivos_form,
                'persona_form':PersonaForm,
                'listado_personas':listado_personas,
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
    if request.method == 'POST':
        generador_form = AltaGeneradorForm(request.POST)
        actividades_form = ActividadesForm(request.POST)
        domicilio_form = DomicilioForm(request.POST)
        ambito_dpcia_form = AmbitoDependenciaForm(request.POST)
        caract_generales_form = CaracteristicasGeneralesForm(request.POST)
        #via_acceso_form = ViaAccesoSectorForm(request.POST)
        if generador_form.is_valid() & actividades_form.is_valid() & domicilio_form.is_valid() \
            & ambito_dpcia_form.is_valid() & caract_generales_form.is_valid():

            generador = generador_form.save(commit=False)
            tipo_actividad = actividades_form.cleaned_data.get('tipo_actividad')
            generador.tipo_actividad = tipo_actividad
            documento_director = request.POST.get('director_responsable') #Obtengo documento del selector
            documento_responsable = request.POST.get('responsable_residuos')
            documento_suplente = request.POST.get('responsable_suplente')
            documento_tecnico = request.POST.get('responsable_tecnico')
            generador.director_responsable = Persona.objects.get(documento=documento_director)
            generador.responsable_residuos = Persona.objects.get(documento=documento_responsable)
            generador.responsable_suplente = Persona.objects.get(documento=documento_suplente)
            generador.responsable_tecnico = Persona.objects.get(documento=documento_tecnico)
            generador.domicilio = domicilio_form.save()
            generador.ambito_dependencia = ambito_dpcia_form.save()
            generador.caract_generales = caract_generales_form.save()
            generador.via_acceso = via_acceso_form.save()
            generador.save()
            return redirect('generadores:listado_generadores')
    else:
        generador_form = AltaGeneradorForm
        actividades_form = ActividadesForm
        domicilio_form = DomicilioForm
        ambito_dpcia_form = AmbitoDependenciaForm
        caract_generales_form = CaracteristicasGeneralesForm
        via_acceso_form = ViaAccesoSectorForm
        acopio_transitorio_form = AcopioTransitorioForm
        horario_atencion_form = HorarioAtencionForm
        persona_form = PersonaForm
        listado_personas = Persona.objects.all()

    contexto= {'generador_form': generador_form,
               'actividades_form': actividades_form,
               'persona_form':PersonaForm,
               'listado_personas':listado_personas,
               'domicilio_form':domicilio_form,
               'ambito_dpcia_form':ambito_dpcia_form,
               'caract_generales_form':caract_generales_form,
               'via_acceso_form':via_acceso_form,
               'acopio_transitorio_form':acopio_transitorio_form,
               'horario_atencion_form':horario_atencion_form
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
