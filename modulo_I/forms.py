# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from django.utils.translation import ugettext as _
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


'''
CLIENTES
'''

class DatosImpositivosForm(forms.ModelForm):

    class Meta:
        model = DatoImpositivo
        fields = '__all__'


class AltaClienteForm(forms.ModelForm):
    fecha_vinculo = forms.DateField(widget=DateInput(), label="Fecha creación vínculo")

    class Meta:
        model = Cliente
        exclude = ['domicilio_legal', 'fecha','dato_impositivo','apoderado','contacto_comercial']


class ModificacionClienteForm(forms.ModelForm):

    class Meta:
        model = Cliente
        exclude = ['contacto_comercial','apoderado','domicilio_legal','dato_impositivo',
                    'fecha_vinculo','fecha']


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
        exclude = ['tipo_actividad', 'director_responsable', 'responsable_residuos', 'responsable_suplente', 'responsable_tecnico' ]
        fields = '__all__'


class ModificacionGeneradorForm(forms.ModelForm):

    class Meta:
        model = EstablecimientoGenerador
        exclude = ['tipo_actividad','nro_inscripcion',]
        fields = '__all__'


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
