# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-02-24 16:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modulo_I', '0003_auto_20180224_1322'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cuadrante',
            name='nombre_cuadrante',
            field=models.CharField(max_length=50),
        ),
    ]
