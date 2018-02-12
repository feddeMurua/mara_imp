from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, authenticate
from django.contrib.auth import logout
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import UserCreationForm
from modulo_I.forms import FormularioUsuario


def login_usuario(request):
    '''
    Función Login usuario:
    Es la responsable de permitir el acceso al sistema del usuario.
    :param request: Requerimiento HTTP, el usuario existe en el sistema.
    :return: El usuario ingresa al sistema.
    '''
    if request.method == 'POST':
        form = FormularioUsuario(data=request.POST)
        if form.is_valid():
            usuario= User.objects.get(username=form.cleaned_data['username'])
            login(request, usuario)
            return redirect('generadores:listado_generadores')
    else:
        form = FormularioUsuario()
    return render(request, 'registration/login.html', {'form': form})


@login_required
def logout_usuario(request):
    '''
    Función Logout usuario:
    Se encarga de cerrar la sesión del usuario. Devuelve la vista del login en el sistema.
    :param request: Requerimiento HTTP, Existe un usuario en el sistema.
    :return: Devuelve la vista del login.
    '''
    logout(request)
    return redirect('login')


def signup_usuario(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('generadores:listado_generadores')
    else:
        form = UserCreationForm()
    return render(request, 'registration/signup.html', {'form': form})


@login_required
def cambiar_ctr(request):
    '''
    Función cambiar contraseña:
    Es la responsable de cambiar la contraseña del usuario.
    :param request: Requerimiento HTTP, la persona ingresa contraseña antigua.
    :return: El usuario posee la contraseña actualizada.
    '''
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(request, 'La contraseña fue actualizada correctamente')
            return redirect('generadores:listado_generadores')
        else:
            messages.error(request, 'Por favor corrija los errores señalados')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'registration/change_password.html', {'form': form})
