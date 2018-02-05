# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from django.utils.translation import ugettext as _
from django.contrib.auth.forms import AuthenticationForm
from .models import *
from functools import partial
import re
from django.template.loader import render_to_string

DateInput = partial(forms.DateInput, {'class': 'datepicker'})
regex_alfabetico = re.compile(r"^[a-zñA-ZÑ]+((\s[a-zñA-ZÑ]+)+)?$") #expresiones regulares para control
regex_alfanumerico = re.compile(r"^[a-zñA-ZÑ0-9]+((\s[a-zñA-ZÑ0-9]+)+)?$")

'''
CLASES IMPORTANTES
'''

class SelectPersonaWithPop(forms.Select):
    def render(self, name, *args, **kwargs):
        html = super(SelectPersonaWithPop, self).render(name, *args, **kwargs)
        popupplus = render_to_string("base/popupplus_persona.html", {'field': name})
        return html+popupplus


class SelectLocalidadWithPop(forms.Select):
    def render(self, name, *args, **kwargs):
        html = super(SelectLocalidadWithPop, self).render(name, *args, **kwargs)
        popupplus = render_to_string("base/popupplus_localidad.html", {'field': name})
        return html+popupplus


class PersonaForm(forms.ModelForm):

    class Meta:
        model = Persona
        exclude = '__all__'

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
LOCALIDADES
'''


class NacionalidadForm(forms.ModelForm):
    class Meta:
        model = Nacionalidad
        fields = '__all__'


class ProvinciaForm(forms.ModelForm):
    class Meta:
        model = Provincia
        fields = '__all__'


class LocalidadForm(forms.ModelForm):
    class Meta:
        model = Localidad
        fields = '__all__'


'''
CLIENTES
'''

class DatosImpositivosForm(forms.ModelForm):

    class Meta:
        model = DatoImpositivo
        fields = '__all__'


class ClienteForm(forms.ModelForm):
    fecha_vinculo = forms.DateField(widget=DateInput(), label="Fecha creación vínculo")
    apoderado = forms.ModelChoiceField(Persona.objects, widget=SelectPersonaWithPop)
    contacto_comercial = forms.ModelChoiceField(Persona.objects, widget=SelectPersonaWithPop)

    class Meta:
        model = Cliente
        exclude = ['domicilio_legal', 'fecha','dato_impositivo',]


class DomicilioForm(forms.ModelForm):
    localidad = forms.ModelChoiceField(Localidad.objects, widget=SelectLocalidadWithPop)
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
BALDES
'''


class BaldeUtilizadoForm(forms.ModelForm):
    class Meta:
        model = BaldeUtilizado
        exclude = ['hoja_ruta',]


class BaldeForm(forms.ModelForm):
    class Meta:
        model = Balde
        exclude = ['estado',]


'''
HOJAS DE RUTA
'''

class HojaRutaForm(forms.ModelForm):
    fecha_recorrido = forms.DateField(widget=DateInput(), label="Fecha creación vínculo")
    class Meta:
        model = HojaRuta
        fields = '__all__'


'''
GENERADORES
'''

class GeneradorForm(forms.ModelForm):
    fecha_vinculo = forms.DateField(widget=DateInput(), label="Fecha creación vínculo")
    responsable_residuos = forms.ModelChoiceField(Persona.objects, widget=SelectPersonaWithPop)
    responsable_suplente = forms.ModelChoiceField(Persona.objects, widget=SelectPersonaWithPop)
    responsable_tecnico = forms.ModelChoiceField(Persona.objects, widget=SelectPersonaWithPop)
    class Meta:
        model = EstablecimientoGenerador

        exclude = ['via_acceso','tipo_actividad','domicilio','ambito_dependencia',
                   'dia_atención','hora_atención','tipo_actividad', 'caract_generales',
                   'via_acceso', 'ambito_dependencia','fecha' ]

        widgets = {
            'observaciones_comentarios': forms.Textarea(attrs={'rows': 4, 'cols': 10}),
        }


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

    class Meta:
        model = HorarioAtencion
        exclude = ['establecimiento_generador','fecha',]


class ResiduoGeneradorForm(forms.ModelForm):

    class Meta:
        model = ResiduoGenerador
        exclude = ['establecimiento_generador',]
