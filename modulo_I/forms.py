# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from django.utils.translation import ugettext as _
from .models import *
from .choices import *

'''
multipleChoiceField:
https://stackoverflow.com/questions/15393134/django-how-can-i-create-a-multiple-select-form
'''

'''
CLIENTES
'''

class AltaClienteForm(forms.ModelForm):

    class Meta:
        model = Cliente
        exclude = ['domicilio_legal', 'fecha']
        fields = '__all__'


class ModificacionClienteForm(forms.ModelForm):

    class Meta:
        model = Cliente
        fields = ['telefono_fijo','celular', 'email']


class DomicilioForm(forms.ModelForm):

    class Meta:
        model = Domicilio
        fields = '__all__'
        labels = {
            'calle_entre1': _("Entre"),
            'calle_entre2': _("Entre"),
            'nro': _("N°"),
            'dpto': _("Departamento")
        }


class LocalidadForm(forms.ModelForm):

    class Meta:
        model = Localidad
        fields = '__all__'
        labels = {
            'cp': _("Código postal")
        }


'''
GENERADORES
'''

class AltaGeneradorForm(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador
        exclude = ['tipo_actividad']
        fields = '__all__'


class ModificacionGeneradorForm(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador
        exclude = ['tipo_actividad',]
        fields = '__all__'


class ActividadesForm(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador
        fields = ['tipo_actividad',]
