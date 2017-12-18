# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from django.utils.translation import ugettext as _
from django.contrib.auth.forms import AuthenticationForm
from .models import *
from .choices import *
from functools import partial
import re

DateInput = partial(forms.DateInput, {'class': 'datepicker'})
regex_alfabetico = re.compile(r"^[a-zñA-ZÑ]+((\s[a-zñA-ZÑ]+)+)?$") #expresiones regulares para control
regex_alfanumerico = re.compile(r"^[a-zñA-ZÑ0-9]+((\s[a-zñA-ZÑ0-9]+)+)?$")

'''
CLASES IMPORTANTES
'''


class PersonaForm(forms.ModelForm):

    class Meta:
        model = Persona
        fields = '__all__'

    def clean_apellido(self):
        apellido = self.cleaned_data['apellido']
        if not regex_alfabetico.match(apellido):
            raise forms.ValidationError('El apellido de la persona, solo puede contener letras y/o espacios')
        return apellido

    def clean_nombre(self):
        nombre = self.cleaned_data['nombre']
        if not regex_alfabetico.match(nombre):
            raise forms.ValidationError('El nombre de la persona, solo puede contener letras y/o espacios')
        return nombre


    def clean_documento(self):
        documento = self.cleaned_data['documento']
        if not re.match(r"^[0-9]{7,}$", documento):
            raise forms.ValidationError('El documento de la persona debe contener al menos 7 digitos y ser númerico')
        return documento

    def clean_telefono_fijo(self):
        telefono_fijo = self.cleaned_data['telefono_fijo']
        if telefono_fijo:
            if not re.match(r"^[0-9]{2,}-[0-9]{6,}$", telefono_fijo):
                raise forms.ValidationError('Teléfono inválido, por favor siga este formato PREFIJO-NUMERO (yyyy-nnnnnnnn)')
        return telefono_fijo

    def clean_celular(self):
        celular = self.cleaned_data['celular']
        if celular:
            if not re.match(r"^[0-9]{2,}-[0-9]{6,}$", celular):
                raise forms.ValidationError('Celular inválido, por favor siga este formato PREFIJO-NUMERO (yyyy-nnnnnnnn)')
        return celular


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
CLIENTES
'''

class DatosImpositivosForm(forms.ModelForm):

    class Meta:
        model = DatoImpositivo
        fields = '__all__'


class ClienteForm(forms.ModelForm):
    fecha_vinculo = forms.DateField(widget=DateInput(), label="Fecha creación vínculo")

    class Meta:
        model = Cliente
        exclude = ['domicilio_legal', 'fecha','dato_impositivo',]


class DomicilioForm(forms.ModelForm):

    class Meta:
        model = Domicilio
        fields = '__all__'


class LocalidadForm(forms.ModelForm):

    class Meta:
        model = Localidad
        fields = '__all__'
        labels = {
            'cp': _("Código postal")
        }


'''
HOJAS DE RUTA
'''

class HojaRutaForm(forms.ModelForm):

    class Meta:
        model = HojaRuta
        fields = '__all__'


'''
GENERADORES
'''

class GeneradorForm(forms.ModelForm):
    #fecha_vinculo = forms.DateField(widget=DateInput(), label="Fecha creación vínculo")
    class Meta:
        model = EstablecimientoGenerador
        fields='__all__'
        '''
        exclude = ['via_acceso','tipo_actividad','domicilio','ambito_dependencia',
                   'dia_atención','hora_atención','tipo_actividad', 'caract_generales',
                   'via_acceso', 'ambito_dependencia','fecha' ]

        widgets = {
            'observaciones_comentarios': forms.Textarea(attrs={'rows': 4, 'cols': 10}),
        }
        '''


class ActividadesForm(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador

        fields = ['tipo_actividad',]

class AmbitoDependenciaForm(forms.ModelForm):

    class Meta:
        model = AmbitoDependencia
        fields = '__all__'


class CaracteristicasGeneralesForm(forms.ModelForm):

    class Meta:
        model = CaracteristicasGenerales
        fields = '__all__'


class AcopioTransitorioForm(forms.ModelForm):

    class Meta:
        model = AcopioTransitorio
        fields = '__all__'


class ViaAccesoSectorForm(forms.ModelForm):

    class Meta:
        model = ViaAccesoSector
        fields = ['tipo',]


class HorarioAtencionForm(forms.ModelForm):

    hora_desde_m = forms.CharField(widget=forms.TextInput(attrs={'class' : 'hs_timepicker'}))
    hora_hasta_m = forms.CharField(widget=forms.TextInput(attrs={'class' : 'hs_timepicker'}))
    hora_desde_t = forms.CharField(widget=forms.TextInput(attrs={'class' : 'hs_timepicker'}))
    hora_hasta_t = forms.CharField(widget=forms.TextInput(attrs={'class' : 'hs_timepicker'}))
    horario_retiro = forms.CharField(widget=forms.TextInput(attrs={'class' : 'hs_timepicker'}))

    class Meta:
        model = HorarioAtencion
        exclude = ['establecimiento_generador',]
