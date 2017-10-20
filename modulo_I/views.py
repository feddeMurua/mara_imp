from django.shortcuts import render, redirect
from .models import *
from .forms import *

# Create your views here.

#@login_required(login_url='login')
def listado_clientes(request):
    listado_clientes = Cliente.objects.all()
    return render(request, 'cliente/listado_clientes.html', {'listado_clientes': listado_clientes})

#@login_required(login_url='login')
def alta_clientes(request):
    if request.method == 'POST':
        cliente_form = AltaClienteForm(request.POST)
        domicilio_form = DomicilioForm(request.POST)
        if cliente_form.is_valid() & domicilio_form.is_valid():
            cliente = cliente_form.save(commit=False)
            cliente.domicilio_legal = domicilio_form.save()
            cliente.save()
            return redirect('listado_clientes')
    else:
        cliente_form = AltaClienteForm
        domicilio_form = DomicilioForm
    return render(request, "cliente/cliente_form.html", {'cliente_form': cliente_form, 'domicilio_form': domicilio_form})


#@login_required(login_url='login')
def baja_clientes(request):
    documento = request.POST.get('cliente_id')
    cliente = Cliente.objects.get(documento=documento)
    cliente.delete()
    response = {}
    return JsonResponse(response)


#@login_required(login_url='login')
def modificar_clientes(request, documento):
    cliente = Cliente.objects.get(documento=documento)
    if request.method == 'POST':
        cliente_form = ModificacionClienteForm(request.POST, instance=cliente)
        domicilio_form = DomicilioForm(request.POST,instance=cliente.domicilio_legal)
        if cliente_form.is_valid() & domicilio_form.is_valid():
            domicilio_form.save()
            cliente_form.save()
            return redirect('listado_clientes')
    else:
        cliente_form = ModificacionClienteForm(instance=cliente)
        domicilio_form = DomicilioForm(instance=cliente.domicilio_legal)
    return render(request, "cliente/cliente_form.html", {'cliente_form': cliente_form, 'domicilio_form': domicilio_form})
