# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-16 14:13
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('modulo_I', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='establecimientogenerador',
            name='hora_atención',
        ),
    ]
