from django.shortcuts import render
from .models import *

# Create your views here.

#@login_required(login_url='login')
def listado_clientes(request):
    listado_clientes = Cliente.objects.all()
    return render(request, 'cliente/listado_clientes.html', {'listado_clientes': listado_clientes})
