# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-02-03 00:50
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('modulo_I', '0004_auto_20180202_2150'),
    ]

    operations = [
        migrations.AlterField(
            model_name='baldeutilizado',
            name='balde',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='modulo_I.Balde'),
        ),
    ]
