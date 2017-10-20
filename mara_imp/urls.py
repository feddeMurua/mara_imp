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
from django.conf.urls import url
from django.contrib import admin
from .views import inicio
from modulo_I import views as mIviews

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', inicio, name="inicio"),
    url(r'^listado_clientes/$', mIviews.listado_clientes, name="listado_clientes"),
    url(r'^alta_clientes/$', mIviews.alta_clientes, name="alta_clientes"),
    url(r'^baja_clientes/$', mIviews.baja_clientes, name="baja_clientes"),
    url(r'^modificar_clientes/(?P<documento>\d+)/$', mIviews.modificar_clientes, name="modificar_clientes"),
]
