from django.utils.translation import ugettext as _

Categorias = (
    ('Ministerio de Salud', _("Ministerio de Salud")),
    ('Municipal', _("Municipal")),
    ('Privado', _("Privado")),
    ('Otro', _("Otro")),
)

Actividades = (
    ('Hospital', _("Hospital")),
    ('Centro de Salud', _("Centro de Salud")),
    ('Clínica', _("Clínica")),
    ('Sanatorio', _("Sanatorio")),
    ('Tatuajes', _("Tatuajes")),
    ('Cirugia', _("Cirugia")),
    ('Centro Diagnóstico', _("Centro Diagnóstico")),
    ('Centro Vacunación', _("Centro Vacunación")),
    ('Consultorio Médico', _("Consultorio Médico")),
    ('Investigación', _("Investigación")),
    ('Maternidad', _("Maternidad")),
    ('Pediatría', _("Pediatría")),
    ('Laboratorio', _("Laboratorio")),
    ('Psiquiátrico/Neuro-psiquiátrico', _("Psiquiátrico/Neuro-psiquiátrico")),
    ('Geriátrico', _("Geriátrico")),
    ('Banco de Sangre', _("Banco de Sangre")),
    ('Ambulancias/Emergencias Médicas', _("Ambulancias/Emergencias Médicas")),
    ('Enfermería', _("Enfermería")),
    ('Hemodiálisis', _("Hemodiálisis")),
    ('Odontología', _("Odontología")),
    ('Oftalmología', _("Oftalmología")),
    ('Farmacia/Droguería', _("Farmacia/Droguería")),
    ('Veterinaria', _("Veterinaria")),
    ('Morgue', _("Morgue")),
    ('Neomatología', _("Neomatología")),
    ('Podología', _("Podología")),
    ('Otros', _("Otros")),
)

Accesos = (
    ('Asfalto', _("Asfalto")),
    ('Ripio', _("Ripio")),
    ('Tierra', _("Tierra")),
    ('Camino consolidado', _("Camino consolidado")),
)

TiposResiduos = (
    ('Contaminantes no Patogénicos', _("Contaminantes no Patogénicos")),
    ('Contaminantes Patogénicos', _("Contaminantes Patogénicos")),
    ('Contaminantes Peligrosos', _("Contaminantes Peligrosos")),
)

Acceso_sector_acopio = (
    ('Pasillo interno del centro asistencial', _("Pasillo interno del centro asistencial")),
    ('Pasillo externo/lateral', _("Pasillo externo/lateral")),
    ('Escalera', _("Escalera")),
    ('Ascensor', _("Ascensor")),
    ('Acceso para tránsito vehicular interno', _("Acceso para tránsito vehicular interno")),
)

Dias = (
    ('0', _("Domingo")),
    ('1', _("Lunes")),
    ('2', _("Martes")),
    ('3', _("Miercoles")),
    ('4', _("Jueves")),
    ('5', _("Viernes")),
    ('6', _("Sábado")),
)

Impuesto_Ganancias = (
    ('Inscripto', _("Inscripto")),
    ('No Inscripto', _("No Inscripto")),
    ('Excento', _("Excento")),
    ('Agente de Retención', _("Agente de Retención")),
)

Impuesto_Valor_Agregado = (
    ('Responsable Inscripto', _("Responsable Inscripto")),
    ('Responsable Excento', _("Responsable Excento")),
    ('Consumidor Final', _("Consumidor Final")),
    ('Monotributista', _("Monotributista")),
    ('Agente de Retención', _("Agente de Retención")),
)

Ingresos_Brutos = (
    ('Contribuyente Directo', _("Contribuyente Directo")),
    ('Pasible de Retención/Percepción', _("Pasible de Retención/Percepción")),

)

E_S = (
    ('Entrada', _("Entrada")),
    ('Salida', _("Salida")),
)

Capacidad_balde = (
    ('10', _("10")),
    ('20', _("20")),
    ('50', _("50")),
    ('120', _("120")),
    ('240', _("240")),
)
