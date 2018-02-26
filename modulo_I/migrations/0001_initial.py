# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-02-25 22:23
from __future__ import unicode_literals

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import multiselectfield.db.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Balde',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nro_balde', models.CharField(max_length=15, unique=True)),
                ('capacidad', models.CharField(choices=[('5', '5'), ('10', '10'), ('20', '20'), ('50', '50'), ('120', '120'), ('200', '200'), ('240', '240')], max_length=5)),
                ('estado', models.CharField(choices=[('En Planta', 'En Planta'), ('Ocupado', 'Ocupado')], default='En Planta', max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='BaldePactado',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('capacidad_balde', models.CharField(choices=[('5', '5'), ('10', '10'), ('20', '20'), ('50', '50'), ('120', '120'), ('200', '200'), ('240', '240')], max_length=5)),
                ('color_precinto', models.CharField(choices=[('Amarillo', 'Amarillo'), ('Rojo', 'Rojo')], max_length=15)),
                ('cantidad', models.IntegerField(validators=[django.core.validators.MinValueValidator(1)])),
            ],
        ),
        migrations.CreateModel(
            name='DetalleHojaRuta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nro_precinto', models.BigIntegerField(blank=True, null=True, unique=True)),
                ('tipo', models.CharField(choices=[('Entrega', 'Entrega'), ('Retiro', 'Retiro')], max_length=15)),
                ('balde', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modulo_I.Balde')),
            ],
        ),
        migrations.CreateModel(
            name='EstablecimientoGenerador',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nro_inscripcion', models.BigIntegerField(blank=True, default=None, null=True, unique=True)),
                ('activo', models.BooleanField(default=False)),
                ('razon_social', models.CharField(max_length=50)),
                ('direccion', models.CharField(max_length=100)),
                ('tipo_actividad', multiselectfield.db.fields.MultiSelectField(blank=True, choices=[('Ambulancias/Emergencias Médicas', 'Ambulancias/Emergencias Médicas'), ('Banco de Sangre', 'Banco de Sangre'), ('Centro Diagnóstico', 'Centro Diagnóstico'), ('Centro Vacunación', 'Centro Vacunación'), ('Centro de Salud', 'Centro de Salud'), ('Cirugia', 'Cirugia'), ('Clínica', 'Clínica'), ('Consultorio Médico', 'Consultorio Médico'), ('Enfermería', 'Enfermería'), ('Farmacia/Droguería', 'Farmacia/Droguería'), ('Geriátrico', 'Geriátrico'), ('Hemodiálisis', 'Hemodiálisis'), ('Hogar de Ancianos', 'Hogar de Ancianos'), ('Hospital', 'Hospital'), ('Investigación', 'Investigación'), ('Kinesiología', 'Kinesiología'), ('Laboratorio', 'Laboratorio'), ('Maternidad', 'Maternidad'), ('Morgue', 'Morgue'), ('Neomatología', 'Neomatología'), ('Odontología', 'Odontología'), ('Oftalmología', 'Oftalmología'), ('Otros', 'Otros'), ('Pediatría', 'Pediatría'), ('Podología', 'Podología'), ('Psiquiátrico/Neuro-psiquiátrico', 'Psiquiátrico/Neuro-psiquiátrico'), ('Sanatorio', 'Sanatorio'), ('Tatuajes', 'Tatuajes'), ('Veterinaria', 'Veterinaria')], max_length=400, null=True)),
                ('recoleccion', multiselectfield.db.fields.MultiSelectField(blank=True, choices=[('0', 'Domingo'), ('1', 'Lunes'), ('2', 'Martes'), ('3', 'Miercoles'), ('4', 'Jueves'), ('5', 'Viernes'), ('6', 'Sábado')], max_length=13, null=True)),
                ('telefono', models.CharField(blank=True, max_length=50, null=True)),
                ('email', models.CharField(blank=True, max_length=200, null=True)),
                ('responsable_ambiental', models.CharField(blank=True, max_length=50, null=True)),
                ('cuit', models.CharField(blank=True, max_length=20, null=True)),
                ('nro_parada', models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(1)])),
            ],
        ),
        migrations.CreateModel(
            name='Localidad',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25)),
                ('cp', models.IntegerField(unique=True, validators=[django.core.validators.MinValueValidator(1)])),
            ],
        ),
        migrations.CreateModel(
            name='Provincia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=25)),
            ],
        ),
        migrations.CreateModel(
            name='Recorrido',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50, unique=True)),
                ('dia', models.CharField(choices=[('0', 'Domingo'), ('1', 'Lunes'), ('2', 'Martes'), ('3', 'Miercoles'), ('4', 'Jueves'), ('5', 'Viernes'), ('6', 'Sábado')], max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='RegistroHojaRuta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_recorrido', models.DateField()),
                ('hora_llegada', models.CharField(blank=True, max_length=5, null=True)),
                ('hora_salida', models.CharField(blank=True, max_length=5, null=True)),
                ('establecimiento_generador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modulo_I.EstablecimientoGenerador')),
            ],
        ),
        migrations.AddField(
            model_name='localidad',
            name='provincia',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modulo_I.Provincia'),
        ),
        migrations.AddField(
            model_name='establecimientogenerador',
            name='localidad',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='modulo_I.Localidad'),
        ),
        migrations.AddField(
            model_name='establecimientogenerador',
            name='recorrido',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='modulo_I.Recorrido'),
        ),
        migrations.AddField(
            model_name='detallehojaruta',
            name='registro_hoja_ruta',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modulo_I.RegistroHojaRuta'),
        ),
        migrations.AddField(
            model_name='baldepactado',
            name='establecimiento_generador',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='modulo_I.EstablecimientoGenerador'),
        ),
        migrations.AddField(
            model_name='balde',
            name='establecimiento_generador',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='modulo_I.EstablecimientoGenerador'),
        ),
        migrations.AlterUniqueTogether(
            name='baldepactado',
            unique_together=set([('establecimiento_generador', 'capacidad_balde', 'color_precinto')]),
        ),
    ]
