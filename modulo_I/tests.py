from django.test import TestCase

# Create your tests here.
'''
ESTABLECIMMIENTO GENERADOR

-tipo actividad desarrollada: puede ser mas de una

-Caracteristicas_Generales del centro de atencion:
puede ser mas de una

-tipo y cantidad de residuos generador:
puede ser mas de una

por cada tipo tiene:
volumen dm3
equivalente en kg (opcional)

fecha: es del vinculo
agregar fecha hoy.


CLIENTES
**Asumiendo que esa relacionado el apoderado con el establecimiento generador

-razon social: no es la misma que el generador, (caso del consultorio odontologico,
                                                 cada medico indpte.)

razon social de los clientes es distina-


- Domicilio legal: mismo caso que la razon social

- contacto comercial: lo da la misma clase Persona (diferencia responsable o apoderado y contacto comercial)
 el contacto comercial NO es el mismo que el responsable apoderado.
-

DATOS IMPOSITIVOS:
- Se puede ser inscripto y agente de retencion
impuesto al valor agregado (se puede ser un responsable y agente de retencion)


fecha: es del vinculo
agregar fecha hoy.

ingresos brutos: corresponde con un solo cliente.


***************
HOJA DE RUTA
***************

REQUIERIMENTO INFORMAL:
-el sistema debera:
* el operadorar seleccionara el dia y el sistema devolvera los establecimientos correspondientes
contemplar los feriados. (elegir dia excpecional que plantee el generador, de forma manual)


columnas :
hora programanada | hora de llegada (camioneta) | hora de salida | generador ( nombre y direccion )

| volumen retirado y nro precinto (unico para el dia) | baldes entregados (cant) | bolsas (cantidad)

| precintos (cantidad) | firma y aclaracion 






'''
