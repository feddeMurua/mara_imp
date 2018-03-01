# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-03-01 18:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modulo_I', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='recorrido',
            name='nombre',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterUniqueTogether(
            name='recorrido',
            unique_together=set([('nombre', 'dia')]),
        ),
    ]
