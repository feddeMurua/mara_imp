"""mara_imp URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from .views import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', login_usuario, name="login"),
    url(r'^logout/$', logout_usuario, name="logout"),
    url(r'^signup/$', signup_usuario, name="signup"),
    url(r'^password/$', cambiar_ctr, name="cambiar_contraseña"),
    url(r'^clientes/', include('modulo_I.urls_cliente', namespace='clientes')),
    url(r'^personas/', include('modulo_I.urls_persona', namespace='personas')),
    url(r'^generadores/', include('modulo_I.urls_generador', namespace='generadores')),
    url(r'^hojas-de-Ruta/', include('modulo_I.urls_hojaRuta', namespace='hojaRuta')),
    url(r'^baldes/', include('modulo_I.urls_balde', namespace='baldes')),
    url(r'^localidades/', include('modulo_I.urls_localidad', namespace='localidades')),
]
