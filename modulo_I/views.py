from django.shortcuts import render, redirect
from django.http import JsonResponse
from .models import *
from .forms import *
from django.template.loader import render_to_string

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
            cliente.domicilio_legal = domicilio_form.save()
            cliente.dato_impositivo= datos_impositivos_form.save()
            cliente.save()
            return redirect('clientes:listado_clientes')

    else:
        cliente_form = AltaClienteForm
        domicilio_form = DomicilioForm
        datos_impositivos_form = DatosImpositivosForm

    persona_form = PersonaForm


    contexto= {'cliente_form': cliente_form,
                'domicilio_form': domicilio_form,
                'datos_impositivos_form':datos_impositivos_form,
                'persona_form':PersonaForm
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
        if cliente_form.is_valid() & domicilio_form.is_valid():
            domicilio_form.save()
            cliente_form.save()
            return redirect('clientes:listado_clientes')
    else:
        cliente_form = ModificacionClienteForm(instance=cliente)
        domicilio_form = DomicilioForm(instance=cliente.domicilio_legal)
    return render(request, "cliente/cliente_form.html", {'cliente_form': cliente_form, 'domicilio_form': domicilio_form})

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
        if generador_form.is_valid() & actividades_form.is_valid():
            generador = generador_form.save(commit=False)
            tipo_actividad = actividades_form.cleaned_data.get('tipo_actividad')
            generador.tipo_actividad = tipo_actividad
            generador.save()
            return redirect('generadores:listado_generadores')
    else:
        generador_form = AltaGeneradorForm
        actividades_form = ActividadesForm
    return render(request, "establecimiento/generador_form.html", {'generador_form': generador_form, 'actividades_form': actividades_form})


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
