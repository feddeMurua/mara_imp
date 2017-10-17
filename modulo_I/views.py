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
            persona = cliente_form.save(commit=False)
            persona.domicilio_legal = domicilio_form.save()
            persona.save()
            return redirect('listado_clientes')
        else:
            return render(request, "cliente/cliente_form.html", {'cliente_form': cliente_form, 'domicilio_form': domicilio_form})
    else:
        cliente_form = AltaClienteForm
        domicilio_form = DomicilioForm
        return render(request, "cliente/cliente_form.html", {'cliente_form': cliente_form, 'domicilio_form': domicilio_form})
