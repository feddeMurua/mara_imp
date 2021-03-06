# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from django.utils.translation import ugettext as _
from django.contrib.auth.forms import AuthenticationForm
from .models import *
from functools import partial
import re
import datetime
from django.template.loader import render_to_string
from django.db.models import Q


DateInput = partial(forms.DateInput, {'class': 'datepicker'})
regex_alfabetico = re.compile(r"^[a-zñA-ZÑ]+((\s[a-zñA-ZÑ]+)+)?$") #expresiones regulares para control
regex_alfanumerico = re.compile(r"^[a-zñA-ZÑ0-9]+((\s[a-zñA-ZÑ0-9]+)+)?$")

'''
CLASES IMPORTANTES
'''

class SelectLocalidadWithPop(forms.Select):
    def render(self, name, *args, **kwargs):
        html = super(SelectLocalidadWithPop, self).render(name, *args, **kwargs)
        popupplus = render_to_string("base/popupplus_localidad.html", {'field': name})
        return html+popupplus


class SelectRecorridoWithPop(forms.Select):
    def render(self, name, *args, **kwargs):
        html = super(SelectRecorridoWithPop, self).render(name, *args, **kwargs)
        popupplus = render_to_string("base/popupplus_recorrido.html", {'field': name})
        return html+popupplus


class FormularioUsuario(AuthenticationForm):
    '''
    Corresponde al formulario que permite el acceso al sistema por parte del usuario.
    '''
    def __init__(self, *args, **kwargs):
        super(FormularioUsuario, self).__init__(*args, **kwargs)
        self.fields['username'].label = "Usuario"
        self.fields['username'].widget.attrs['placeholder'] = " Ingrese su usuario"
        self.fields['password'].widget.attrs['placeholder'] = " Ingrese su contraseña"


'''
LOCALIDADES
'''


class ProvinciaForm(forms.ModelForm):
    class Meta:
        model = Provincia
        fields = '__all__'


class LocalidadForm(forms.ModelForm):

    class Meta:
        model = Localidad
        fields = '__all__'
        labels = {
            'cp': _("Código postal")
        }


'''
BALDES
'''


class BaldeUtilizadoForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super(BaldeUtilizadoForm, self).__init__(*args, **kwargs)
        self.fields['balde'].queryset = Balde.objects.all().order_by('nro_balde')

    class Meta:
        model = DetalleHojaRuta
        exclude = ['registro_hoja_ruta',]


class ActualizarBaldeUtilizadoForm(forms.ModelForm):
    class Meta:
        model = DetalleHojaRuta
        exclude = ['registro_hoja_ruta','balde',]


class BaldeForm(forms.ModelForm):
    class Meta:
        model = Balde
        exclude = ['estado',]


'''
HOJAS DE RUTA
'''


class HojaRutaForm(forms.ModelForm):
    fecha_recorrido = forms.DateField(widget=DateInput(), label="Fecha creación vínculo")

    def __init__(self, *args, **kwargs):
        super(HojaRutaForm, self).__init__(*args, **kwargs)
        self.fields['establecimiento_generador'].queryset = EstablecimientoGenerador.objects.filter(Q(activo=True) &  Q(recorrido__isnull=False) | Q(recorrido_extra__isnull=False))

    class Meta:
        model = RegistroHojaRuta
        fields = '__all__'


'''
GENERADORES
'''


class BaldePactadoForm(forms.ModelForm):

    class Meta:
        model = BaldePactado
        exclude = ['establecimiento_generador', ]



class ItinerarioForm(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador
        fields = ['nro_parada', 'recorrido' ]


class ItinerarioFormExtra(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador
        fields = ['nro_parada_extra', 'recorrido_extra' ]


class RecorridoForm(forms.ModelForm):

    class Meta:
        model = Recorrido
        fields = '__all__'


class GeneradorForm(forms.ModelForm):
    localidad = forms.ModelChoiceField(Localidad.objects, widget=SelectLocalidadWithPop)
    recorrido = forms.ModelChoiceField(Recorrido.objects.filter(extra=False), widget=SelectRecorridoWithPop, required=False,)
    recorrido_extra = forms.ModelChoiceField(Recorrido.objects.filter(extra=True), widget=SelectRecorridoWithPop, required=False,)

    class Meta:
        model = EstablecimientoGenerador
        exclude = ['domicilio','fecha' ]


class ActividadesForm(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador

        fields = ['tipo_actividad',]


class RecoleccionForm(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador

        fields = ['recoleccion',]
