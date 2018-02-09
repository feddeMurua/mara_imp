BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `modulo_I_viaaccesosector` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`tipo`	varchar ( 119 ) NOT NULL,
	`acopio_transitorio_id`	integer NOT NULL,
	FOREIGN KEY(`acopio_transitorio_id`) REFERENCES `modulo_I_acopiotransitorio`(`id`)
);
INSERT INTO `modulo_I_viaaccesosector` (id,tipo,acopio_transitorio_id) VALUES (1,'Pasillo interno del centro asistencial',1);
INSERT INTO `modulo_I_viaaccesosector` (id,tipo,acopio_transitorio_id) VALUES (2,'Pasillo interno del centro asistencial',2);
CREATE TABLE IF NOT EXISTS `modulo_I_residuogenerador` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`tipo`	varchar ( 80 ) NOT NULL,
	`volumen_mensual_estimado`	real NOT NULL,
	`kgs_mensual_estimado`	real NOT NULL,
	`establecimiento_generador_id`	bigint NOT NULL,
	FOREIGN KEY(`establecimiento_generador_id`) REFERENCES `modulo_I_establecimientogenerador`(`nro_inscripcion`)
);
INSERT INTO `modulo_I_residuogenerador` (id,tipo,volumen_mensual_estimado,kgs_mensual_estimado,establecimiento_generador_id) VALUES (1,'Contaminantes no Patogénicos',11.0,0.0,312);
INSERT INTO `modulo_I_residuogenerador` (id,tipo,volumen_mensual_estimado,kgs_mensual_estimado,establecimiento_generador_id) VALUES (2,'Contaminantes Patogénicos',49.0,0.0,231);
CREATE TABLE IF NOT EXISTS `modulo_I_provincia` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre`	varchar ( 25 ) NOT NULL,
	`nacionalidad_id`	integer NOT NULL,
	FOREIGN KEY(`nacionalidad_id`) REFERENCES `modulo_I_nacionalidad`(`id`)
);
INSERT INTO `modulo_I_provincia` (id,nombre,nacionalidad_id) VALUES (1,'CHUBUT',1);
CREATE TABLE IF NOT EXISTS `modulo_I_persona` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`apellido`	varchar ( 50 ) NOT NULL,
	`nombre`	varchar ( 50 ) NOT NULL,
	`documento`	varchar ( 50 ) NOT NULL UNIQUE,
	`telefono_fijo`	varchar ( 50 ),
	`celular`	varchar ( 50 ),
	`email`	varchar ( 50 )
);
INSERT INTO `modulo_I_persona` (id,apellido,nombre,documento,telefono_fijo,celular,email) VALUES (1,'Murua','Federico','37147540',NULL,NULL,NULL);
INSERT INTO `modulo_I_persona` (id,apellido,nombre,documento,telefono_fijo,celular,email) VALUES (2,'xxxxxxxx','nnnnnnn','1111111111',NULL,NULL,NULL);
CREATE TABLE IF NOT EXISTS `modulo_I_nacionalidad` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre`	varchar ( 25 ) NOT NULL UNIQUE
);
INSERT INTO `modulo_I_nacionalidad` (id,nombre) VALUES (1,'ARGENTINA');
CREATE TABLE IF NOT EXISTS `modulo_I_localidad` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre`	varchar ( 25 ) NOT NULL,
	`cp`	integer NOT NULL UNIQUE,
	`provincia_id`	integer NOT NULL,
	FOREIGN KEY(`provincia_id`) REFERENCES `modulo_I_provincia`(`id`)
);
INSERT INTO `modulo_I_localidad` (id,nombre,cp,provincia_id) VALUES (1,'RAWSON',9103,1);
CREATE TABLE IF NOT EXISTS `modulo_I_horarioatencion` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`dia`	varchar ( 20 ) NOT NULL,
	`hora_desde_m`	time,
	`hora_hasta_m`	time,
	`hora_desde_t`	time,
	`hora_hasta_t`	time,
	`horario_retiro`	time,
	`establecimiento_generador_id`	bigint NOT NULL,
	FOREIGN KEY(`establecimiento_generador_id`) REFERENCES `modulo_I_establecimientogenerador`(`nro_inscripcion`)
);
INSERT INTO `modulo_I_horarioatencion` (id,dia,hora_desde_m,hora_hasta_m,hora_desde_t,hora_hasta_t,horario_retiro,establecimiento_generador_id) VALUES (1,'3','09:00:00','13:00:00',NULL,NULL,'09:10:00',231);
INSERT INTO `modulo_I_horarioatencion` (id,dia,hora_desde_m,hora_hasta_m,hora_desde_t,hora_hasta_t,horario_retiro,establecimiento_generador_id) VALUES (2,'3','09:00:00','14:00:00',NULL,NULL,'10:00:00',312);
CREATE TABLE IF NOT EXISTS `modulo_I_hojaruta` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`fecha_recorrido`	date NOT NULL,
	`hora_llegada`	time NOT NULL,
	`hora_salida`	time NOT NULL
);
CREATE TABLE IF NOT EXISTS `modulo_I_establecimientogenerador` (
	`nro_inscripcion`	bigint NOT NULL,
	`razon_social`	varchar ( 50 ) NOT NULL,
	`telefono`	varchar ( 50 ) NOT NULL,
	`email`	varchar ( 50 ),
	`fecha_vinculo`	date NOT NULL,
	`fecha`	date NOT NULL,
	`observaciones_comentarios`	text,
	`tipo_actividad`	varchar ( 369 ) NOT NULL,
	`sector`	integer NOT NULL,
	`ambito_dependencia_id`	integer NOT NULL,
	`caract_generales_id`	integer NOT NULL,
	`director_responsable_id`	integer NOT NULL,
	`domicilio_id`	integer NOT NULL,
	`responsable_residuos_id`	integer NOT NULL,
	`responsable_suplente_id`	integer NOT NULL,
	`responsable_tecnico_id`	integer NOT NULL,
	`via_acceso_id`	integer NOT NULL,
	FOREIGN KEY(`responsable_tecnico_id`) REFERENCES `modulo_I_persona`(`id`),
	FOREIGN KEY(`director_responsable_id`) REFERENCES `modulo_I_cliente`(`id`),
	FOREIGN KEY(`responsable_residuos_id`) REFERENCES `modulo_I_persona`(`id`),
	FOREIGN KEY(`ambito_dependencia_id`) REFERENCES `modulo_I_ambitodependencia`(`id`),
	PRIMARY KEY(`nro_inscripcion`),
	FOREIGN KEY(`domicilio_id`) REFERENCES `modulo_I_domicilio`(`id`),
	FOREIGN KEY(`caract_generales_id`) REFERENCES `modulo_I_caracteristicasgenerales`(`id`),
	FOREIGN KEY(`via_acceso_id`) REFERENCES `modulo_I_viaaccesosector`(`id`),
	FOREIGN KEY(`responsable_suplente_id`) REFERENCES `modulo_I_persona`(`id`)
);
INSERT INTO `modulo_I_establecimientogenerador` (nro_inscripcion,razon_social,telefono,email,fecha_vinculo,fecha,observaciones_comentarios,tipo_actividad,sector,ambito_dependencia_id,caract_generales_id,director_responsable_id,domicilio_id,responsable_residuos_id,responsable_suplente_id,responsable_tecnico_id,via_acceso_id) VALUES (231,'una razon social','5555555',NULL,'2018-02-07','2018-02-07','','Hospital',2,1,1,1,2,2,2,2,1);
INSERT INTO `modulo_I_establecimientogenerador` (nro_inscripcion,razon_social,telefono,email,fecha_vinculo,fecha,observaciones_comentarios,tipo_actividad,sector,ambito_dependencia_id,caract_generales_id,director_responsable_id,domicilio_id,responsable_residuos_id,responsable_suplente_id,responsable_tecnico_id,via_acceso_id) VALUES (312,'una empresa','5555555',NULL,'2018-02-15','2018-02-07','','Hospital',1,2,2,1,3,2,2,2,2);
CREATE TABLE IF NOT EXISTS `modulo_I_domicilio` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`barrio`	varchar ( 50 ) NOT NULL,
	`calle`	varchar ( 50 ) NOT NULL,
	`calle_entre1`	varchar ( 50 ),
	`calle_entre2`	varchar ( 50 ),
	`nro`	integer NOT NULL,
	`piso`	integer,
	`dpto`	varchar ( 50 ),
	`comarca`	varchar ( 50 ),
	`localidad_id`	integer NOT NULL,
	FOREIGN KEY(`localidad_id`) REFERENCES `modulo_I_localidad`(`id`)
);
INSERT INTO `modulo_I_domicilio` (id,barrio,calle,calle_entre1,calle_entre2,nro,piso,dpto,comarca,localidad_id) VALUES (1,'un barrio','una calle',NULL,NULL,231,NULL,NULL,NULL,1);
INSERT INTO `modulo_I_domicilio` (id,barrio,calle,calle_entre1,calle_entre2,nro,piso,dpto,comarca,localidad_id) VALUES (2,'un barrio','una calle',NULL,NULL,31,NULL,NULL,NULL,1);
INSERT INTO `modulo_I_domicilio` (id,barrio,calle,calle_entre1,calle_entre2,nro,piso,dpto,comarca,localidad_id) VALUES (3,'un barrio','una calle',NULL,NULL,231,NULL,NULL,NULL,1);
CREATE TABLE IF NOT EXISTS `modulo_I_datoimpositivo` (
	`impuestos_ganancias`	varchar ( 50 ) NOT NULL,
	`impuestos_valor_agregado`	varchar ( 93 ) NOT NULL,
	`ingresos_brutos`	varchar ( 53 ) NOT NULL,
	`nro_iibb`	bigint NOT NULL,
	PRIMARY KEY(`nro_iibb`)
);
INSERT INTO `modulo_I_datoimpositivo` (impuestos_ganancias,impuestos_valor_agregado,ingresos_brutos,nro_iibb) VALUES ('Inscripto','Responsable Inscripto','Contribuyente Directo',441);
CREATE TABLE IF NOT EXISTS `modulo_I_cliente` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`razon_social`	varchar ( 50 ) NOT NULL,
	`cargo`	varchar ( 50 ) NOT NULL,
	`fecha`	date NOT NULL,
	`fecha_vinculo`	date NOT NULL,
	`cuit_cuil`	varchar ( 20 ) NOT NULL,
	`apoderado_id`	integer NOT NULL,
	`contacto_comercial_id`	integer NOT NULL,
	`dato_impositivo_id`	bigint NOT NULL UNIQUE,
	`domicilio_legal_id`	integer NOT NULL,
	FOREIGN KEY(`domicilio_legal_id`) REFERENCES `modulo_I_domicilio`(`id`),
	FOREIGN KEY(`apoderado_id`) REFERENCES `modulo_I_persona`(`id`),
	FOREIGN KEY(`contacto_comercial_id`) REFERENCES `modulo_I_persona`(`id`),
	FOREIGN KEY(`dato_impositivo_id`) REFERENCES `modulo_I_datoimpositivo`(`nro_iibb`)
);
INSERT INTO `modulo_I_cliente` (id,razon_social,cargo,fecha,fecha_vinculo,cuit_cuil,apoderado_id,contacto_comercial_id,dato_impositivo_id,domicilio_legal_id) VALUES (1,'una razon social','un cargo copado','2018-02-07','2018-02-07','20-37147540-1',1,2,441,1);
CREATE TABLE IF NOT EXISTS `modulo_I_caracteristicasgenerales` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`cant_quirofanos`	integer NOT NULL,
	`nro_camas`	integer NOT NULL,
	`poblacion_promedio_atendida`	real NOT NULL,
	`poblacion_promedio_atendida_365`	real NOT NULL,
	`via_acceso`	varchar ( 39 ) NOT NULL
);
INSERT INTO `modulo_I_caracteristicasgenerales` (id,cant_quirofanos,nro_camas,poblacion_promedio_atendida,poblacion_promedio_atendida_365,via_acceso) VALUES (1,0,0,0.0,0.0,'Asfalto');
INSERT INTO `modulo_I_caracteristicasgenerales` (id,cant_quirofanos,nro_camas,poblacion_promedio_atendida,poblacion_promedio_atendida_365,via_acceso) VALUES (2,0,0,0.0,0.0,'Asfalto');
CREATE TABLE IF NOT EXISTS `modulo_I_baldeutilizado` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nro_precinto`	bigint NOT NULL UNIQUE,
	`tipo`	varchar ( 15 ) NOT NULL,
	`balde_id`	bigint NOT NULL UNIQUE,
	`establecimiento_generador_id`	bigint NOT NULL,
	`hoja_ruta_id`	integer NOT NULL,
	FOREIGN KEY(`establecimiento_generador_id`) REFERENCES `modulo_I_establecimientogenerador`(`nro_inscripcion`),
	FOREIGN KEY(`balde_id`) REFERENCES `modulo_I_balde`(`nro_balde`),
	FOREIGN KEY(`hoja_ruta_id`) REFERENCES `modulo_I_hojaruta`(`id`)
);
CREATE TABLE IF NOT EXISTS `modulo_I_balde` (
	`nro_balde`	bigint NOT NULL,
	`capacidad`	varchar ( 5 ) NOT NULL,
	`estado`	varchar ( 15 ) NOT NULL,
	PRIMARY KEY(`nro_balde`)
);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (1,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (2,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (3,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (4,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (5,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (6,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (7,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (8,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (9,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (10,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (11,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (12,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (13,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (14,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (15,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (16,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (17,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (18,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (19,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (20,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (21,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (22,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (23,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (24,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (25,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (26,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (27,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (28,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (29,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (30,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (31,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (32,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (33,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (34,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (35,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (36,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (37,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (38,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (39,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (40,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (41,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (42,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (43,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (44,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (45,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (46,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (47,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (48,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (49,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (50,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (51,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (52,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (53,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (54,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (56,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (57,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (58,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (59,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (60,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (61,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (62,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (63,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (64,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (65,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (66,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (67,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (68,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (69,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (70,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (71,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (72,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (73,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (74,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (75,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (76,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (77,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (78,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (79,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (80,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (81,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (82,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (83,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (84,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (85,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (86,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (87,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (88,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (89,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (90,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (91,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (92,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (93,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (94,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (95,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (96,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (97,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (98,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (99,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (100,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (101,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (102,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (103,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (104,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (105,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (106,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (107,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (108,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (109,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (110,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (55,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (111,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (112,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (113,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (114,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (115,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (116,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (117,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (118,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (119,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (120,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (121,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (122,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (123,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (124,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (125,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (126,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (127,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (128,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (129,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (130,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (131,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (132,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (133,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (134,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (135,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (136,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (137,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (138,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (139,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (140,'50','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (141,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (142,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (143,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (144,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (145,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (146,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (147,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (148,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (149,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (150,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (151,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (152,'120','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (153,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (154,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (155,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (156,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (157,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (158,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (159,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (160,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (161,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (162,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (163,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (164,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (165,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (166,'240','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (167,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (168,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (169,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (170,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (171,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (172,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (173,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (174,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (175,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (176,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (177,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (178,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (179,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (180,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (181,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (182,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (183,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (184,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (185,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (186,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (187,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (188,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (189,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (190,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (191,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (192,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (193,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (194,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (195,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (196,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (197,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (198,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (199,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (200,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (201,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (202,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (203,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (204,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (205,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (206,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (207,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (208,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (209,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (210,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (211,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (212,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (213,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (214,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (215,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (216,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (217,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (218,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (219,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (220,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (221,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (222,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (223,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (224,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (225,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (226,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (227,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (228,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (229,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (230,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (231,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (232,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (233,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (234,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (235,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (236,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (237,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (238,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (239,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (240,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (241,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (242,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (243,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (244,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (245,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (246,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (247,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (248,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (249,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (250,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (251,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (252,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (253,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (254,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (255,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (256,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (257,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (258,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (259,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (260,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (261,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (262,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (263,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (264,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (265,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (266,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (267,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (268,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (269,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (270,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (271,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (272,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (273,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (274,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (275,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (276,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (277,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (278,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (279,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (280,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (281,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (282,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (283,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (284,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (285,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (286,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (287,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (288,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (289,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (290,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (291,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (292,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (293,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (294,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (295,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (296,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (297,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (298,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (299,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (300,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (301,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (302,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (303,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (304,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (305,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (306,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (307,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (308,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (309,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (310,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (311,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (312,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (313,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (314,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (315,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (316,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (317,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (318,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (319,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (320,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (321,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (322,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (323,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (324,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (325,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (326,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (327,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (328,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (329,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (330,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (331,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (332,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (333,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (334,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (335,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (336,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (337,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (338,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (339,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (340,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (341,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (342,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (343,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (344,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (345,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (346,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (347,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (348,'10','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (349,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (350,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (351,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (352,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (353,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (354,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (355,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (356,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (357,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (358,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (359,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (360,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (361,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (362,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (363,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (364,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (365,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (366,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (367,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (368,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (369,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (370,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (371,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (372,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (373,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (374,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (375,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (376,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (377,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (378,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (379,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (380,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (381,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (382,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (383,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (384,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (385,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (386,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (387,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (388,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (389,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (390,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (391,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (392,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (393,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (394,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (395,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (396,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (397,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (398,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (399,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (400,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (401,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (402,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (403,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (404,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (405,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (406,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (407,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (408,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (409,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (410,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (411,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (412,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (413,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (414,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (415,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (416,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (417,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (418,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (419,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (420,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (421,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (422,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (423,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (424,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (425,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (426,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (427,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (428,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (429,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (430,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (431,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (432,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (433,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (434,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (435,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (436,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (437,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (438,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (439,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (440,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (441,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (442,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (443,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (444,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (445,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (446,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (447,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (448,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (449,'20','En Planta');
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado) VALUES (450,'20','En Planta');
CREATE TABLE IF NOT EXISTS `modulo_I_ambitodependencia` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`categoria`	varchar ( 50 ) NOT NULL,
	`municipalidad`	varchar ( 50 ),
	`centro_que_depende`	varchar ( 50 )
);
INSERT INTO `modulo_I_ambitodependencia` (id,categoria,municipalidad,centro_que_depende) VALUES (1,'Privado',NULL,NULL);
INSERT INTO `modulo_I_ambitodependencia` (id,categoria,municipalidad,centro_que_depende) VALUES (2,'Privado',NULL,NULL);
CREATE TABLE IF NOT EXISTS `modulo_I_acopiotransitorio` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`sector_interno_p_estacionar`	bool NOT NULL,
	`dimension_sector`	varchar ( 50 ),
	`camara_frio`	bool NOT NULL,
	`dimension_camara_frio`	varchar ( 50 )
);
INSERT INTO `modulo_I_acopiotransitorio` (id,sector_interno_p_estacionar,dimension_sector,camara_frio,dimension_camara_frio) VALUES (1,0,NULL,0,NULL);
INSERT INTO `modulo_I_acopiotransitorio` (id,sector_interno_p_estacionar,dimension_sector,camara_frio,dimension_camara_frio) VALUES (2,0,NULL,0,NULL);
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar ( 40 ) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
INSERT INTO `django_session` (session_key,session_data,expire_date) VALUES ('ck0r5fhsqzjkt13z2d68ir8ctx3y7w3k','ZDAxMWZmM2Q2NjMxODdlYTYwYjFjYTBlMjBkZGZmNGVlNzZkYjVmMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzA2NTA0MDg2YTRkMGIzYTJjZGY5MDFlMjc1NjI5MjE2ZGY1ZTA4In0=','2018-02-21 19:26:57.244607');
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app`	varchar ( 255 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	`applied`	datetime NOT NULL
);
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (1,'contenttypes','0001_initial','2018-02-07 19:25:24.539891');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (2,'auth','0001_initial','2018-02-07 19:25:24.722247');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (3,'admin','0001_initial','2018-02-07 19:25:24.897320');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (4,'admin','0002_logentry_remove_auto_add','2018-02-07 19:25:25.110901');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (5,'contenttypes','0002_remove_content_type_name','2018-02-07 19:25:25.321953');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (6,'auth','0002_alter_permission_name_max_length','2018-02-07 19:25:25.489953');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (7,'auth','0003_alter_user_email_max_length','2018-02-07 19:25:25.660430');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (8,'auth','0004_alter_user_username_opts','2018-02-07 19:25:25.831215');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (9,'auth','0005_alter_user_last_login_null','2018-02-07 19:25:25.994547');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (10,'auth','0006_require_contenttypes_0002','2018-02-07 19:25:26.082030');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (11,'auth','0007_alter_validators_add_error_messages','2018-02-07 19:25:26.247725');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (12,'auth','0008_alter_user_username_max_length','2018-02-07 19:25:26.410720');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (13,'modulo_I','0001_initial','2018-02-07 19:25:26.806424');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (14,'sessions','0001_initial','2018-02-07 19:25:26.952783');
CREATE TABLE IF NOT EXISTS `django_content_type` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app_label`	varchar ( 100 ) NOT NULL,
	`model`	varchar ( 100 ) NOT NULL
);
INSERT INTO `django_content_type` (id,app_label,model) VALUES (1,'admin','logentry');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (2,'auth','permission');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (3,'auth','group');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (4,'auth','user');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (5,'contenttypes','contenttype');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (6,'sessions','session');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (7,'modulo_I','acopiotransitorio');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (8,'modulo_I','ambitodependencia');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (9,'modulo_I','balde');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (10,'modulo_I','baldeutilizado');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (11,'modulo_I','caracteristicasgenerales');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (12,'modulo_I','cliente');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (13,'modulo_I','datoimpositivo');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (14,'modulo_I','domicilio');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (15,'modulo_I','establecimientogenerador');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (16,'modulo_I','hojaruta');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (17,'modulo_I','horarioatencion');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (18,'modulo_I','localidad');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (19,'modulo_I','nacionalidad');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (20,'modulo_I','persona');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (21,'modulo_I','provincia');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (22,'modulo_I','residuogenerador');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (23,'modulo_I','viaaccesosector');
CREATE TABLE IF NOT EXISTS `django_admin_log` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`object_id`	text,
	`object_repr`	varchar ( 200 ) NOT NULL,
	`action_flag`	smallint unsigned NOT NULL,
	`change_message`	text NOT NULL,
	`content_type_id`	integer,
	`user_id`	integer NOT NULL,
	`action_time`	datetime NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`),
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`)
);
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (1,'1','ARGENTINA',1,'[{"added": {}}]',19,1,'2018-02-07 19:28:00.645822');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (2,'1','CHUBUT - ARGENTINA',1,'[{"added": {}}]',21,1,'2018-02-07 19:28:03.836847');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (3,'1','RAWSON - 9103 - CHUBUT - ARGENTINA',1,'[{"added": {}}]',18,1,'2018-02-07 19:28:06.277943');
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`),
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`)
);
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`)
);
CREATE TABLE IF NOT EXISTS `auth_user` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`password`	varchar ( 128 ) NOT NULL,
	`last_login`	datetime,
	`is_superuser`	bool NOT NULL,
	`first_name`	varchar ( 30 ) NOT NULL,
	`last_name`	varchar ( 30 ) NOT NULL,
	`email`	varchar ( 254 ) NOT NULL,
	`is_staff`	bool NOT NULL,
	`is_active`	bool NOT NULL,
	`date_joined`	datetime NOT NULL,
	`username`	varchar ( 150 ) NOT NULL UNIQUE
);
INSERT INTO `auth_user` (id,password,last_login,is_superuser,first_name,last_name,email,is_staff,is_active,date_joined,username) VALUES (1,'pbkdf2_sha256$36000$rzS5OfQjgl8H$q5IcsWezqMLkybay0HL2AdnzF3yotM72Q4CxY29sECs=','2018-02-07 19:26:57.146762',1,'','','',1,1,'2018-02-07 19:26:36.128328','fedde');
CREATE TABLE IF NOT EXISTS `auth_permission` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`content_type_id`	integer NOT NULL,
	`codename`	varchar ( 100 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`)
);
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (4,2,'add_permission','Can add permission');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (5,2,'change_permission','Can change permission');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (6,2,'delete_permission','Can delete permission');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (7,3,'add_group','Can add group');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (8,3,'change_group','Can change group');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (9,3,'delete_group','Can delete group');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (10,4,'add_user','Can add user');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (11,4,'change_user','Can change user');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (12,4,'delete_user','Can delete user');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (13,5,'add_contenttype','Can add content type');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (14,5,'change_contenttype','Can change content type');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (15,5,'delete_contenttype','Can delete content type');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (16,6,'add_session','Can add session');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (17,6,'change_session','Can change session');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (18,6,'delete_session','Can delete session');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (19,7,'add_acopiotransitorio','Can add acopio transitorio');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (20,7,'change_acopiotransitorio','Can change acopio transitorio');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (21,7,'delete_acopiotransitorio','Can delete acopio transitorio');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (22,8,'add_ambitodependencia','Can add ambito dependencia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (23,8,'change_ambitodependencia','Can change ambito dependencia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (24,8,'delete_ambitodependencia','Can delete ambito dependencia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (25,9,'add_balde','Can add balde');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (26,9,'change_balde','Can change balde');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (27,9,'delete_balde','Can delete balde');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (28,10,'add_baldeutilizado','Can add balde utilizado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (29,10,'change_baldeutilizado','Can change balde utilizado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (30,10,'delete_baldeutilizado','Can delete balde utilizado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (31,11,'add_caracteristicasgenerales','Can add caracteristicas generales');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (32,11,'change_caracteristicasgenerales','Can change caracteristicas generales');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (33,11,'delete_caracteristicasgenerales','Can delete caracteristicas generales');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (34,12,'add_cliente','Can add cliente');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (35,12,'change_cliente','Can change cliente');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (36,12,'delete_cliente','Can delete cliente');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (37,13,'add_datoimpositivo','Can add dato impositivo');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (38,13,'change_datoimpositivo','Can change dato impositivo');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (39,13,'delete_datoimpositivo','Can delete dato impositivo');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (40,14,'add_domicilio','Can add domicilio');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (41,14,'change_domicilio','Can change domicilio');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (42,14,'delete_domicilio','Can delete domicilio');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (43,15,'add_establecimientogenerador','Can add establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (44,15,'change_establecimientogenerador','Can change establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (45,15,'delete_establecimientogenerador','Can delete establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (46,16,'add_hojaruta','Can add hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (47,16,'change_hojaruta','Can change hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (48,16,'delete_hojaruta','Can delete hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (49,17,'add_horarioatencion','Can add horario atencion');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (50,17,'change_horarioatencion','Can change horario atencion');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (51,17,'delete_horarioatencion','Can delete horario atencion');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (52,18,'add_localidad','Can add localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (53,18,'change_localidad','Can change localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (54,18,'delete_localidad','Can delete localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (55,19,'add_nacionalidad','Can add nacionalidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (56,19,'change_nacionalidad','Can change nacionalidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (57,19,'delete_nacionalidad','Can delete nacionalidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (58,20,'add_persona','Can add persona');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (59,20,'change_persona','Can change persona');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (60,20,'delete_persona','Can delete persona');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (61,21,'add_provincia','Can add provincia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (62,21,'change_provincia','Can change provincia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (63,21,'delete_provincia','Can delete provincia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (64,22,'add_residuogenerador','Can add residuo generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (65,22,'change_residuogenerador','Can change residuo generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (66,22,'delete_residuogenerador','Can delete residuo generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (67,23,'add_viaaccesosector','Can add via acceso sector');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (68,23,'change_viaaccesosector','Can change via acceso sector');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (69,23,'delete_viaaccesosector','Can delete via acceso sector');
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`),
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`)
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 80 ) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS `modulo_I_viaaccesosector_acopio_transitorio_id_801f9a2b` ON `modulo_I_viaaccesosector` (
	`acopio_transitorio_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `modulo_I_residuogenerador_tipo_establecimiento_generador_id_7d3ab7a3_uniq` ON `modulo_I_residuogenerador` (
	`tipo`,
	`establecimiento_generador_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_residuogenerador_establecimiento_generador_id_49ec48b5` ON `modulo_I_residuogenerador` (
	`establecimiento_generador_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_provincia_nacionalidad_id_4c47edff` ON `modulo_I_provincia` (
	`nacionalidad_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_localidad_provincia_id_f1042493` ON `modulo_I_localidad` (
	`provincia_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_horarioatencion_establecimiento_generador_id_dafd4cd8` ON `modulo_I_horarioatencion` (
	`establecimiento_generador_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `modulo_I_horarioatencion_dia_establecimiento_generador_id_c6edff88_uniq` ON `modulo_I_horarioatencion` (
	`dia`,
	`establecimiento_generador_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_via_acceso_id_7665fe63` ON `modulo_I_establecimientogenerador` (
	`via_acceso_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_responsable_tecnico_id_30a65531` ON `modulo_I_establecimientogenerador` (
	`responsable_tecnico_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_responsable_suplente_id_0446ca1d` ON `modulo_I_establecimientogenerador` (
	`responsable_suplente_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_responsable_residuos_id_ee7863e0` ON `modulo_I_establecimientogenerador` (
	`responsable_residuos_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_domicilio_id_f1da7799` ON `modulo_I_establecimientogenerador` (
	`domicilio_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_director_responsable_id_eba1b7bc` ON `modulo_I_establecimientogenerador` (
	`director_responsable_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_caract_generales_id_a2ad9179` ON `modulo_I_establecimientogenerador` (
	`caract_generales_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_ambito_dependencia_id_7885a66b` ON `modulo_I_establecimientogenerador` (
	`ambito_dependencia_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_domicilio_localidad_id_067eace6` ON `modulo_I_domicilio` (
	`localidad_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_cliente_domicilio_legal_id_aaa19818` ON `modulo_I_cliente` (
	`domicilio_legal_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_cliente_contacto_comercial_id_08e4307c` ON `modulo_I_cliente` (
	`contacto_comercial_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_cliente_apoderado_id_372b5e26` ON `modulo_I_cliente` (
	`apoderado_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_baldeutilizado_hoja_ruta_id_f2eaaaf3` ON `modulo_I_baldeutilizado` (
	`hoja_ruta_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_baldeutilizado_establecimiento_generador_id_6a20c57f` ON `modulo_I_baldeutilizado` (
	`establecimiento_generador_id`
);
CREATE INDEX IF NOT EXISTS `django_session_expire_date_a5c62663` ON `django_session` (
	`expire_date`
);
CREATE UNIQUE INDEX IF NOT EXISTS `django_content_type_app_label_model_76bd3d3b_uniq` ON `django_content_type` (
	`app_label`,
	`model`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_user_id_c564eba6` ON `django_admin_log` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_content_type_id_c4bce8eb` ON `django_admin_log` (
	`content_type_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ON `auth_user_user_permissions` (
	`user_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_a95ead1b` ON `auth_user_user_permissions` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_permission_id_1fbb5f2c` ON `auth_user_user_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_groups_user_id_group_id_94350c0c_uniq` ON `auth_user_groups` (
	`user_id`,
	`group_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_user_id_6a12ed8b` ON `auth_user_groups` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_group_id_97559544` ON `auth_user_groups` (
	`group_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_permission_content_type_id_codename_01ab375a_uniq` ON `auth_permission` (
	`content_type_id`,
	`codename`
);
CREATE INDEX IF NOT EXISTS `auth_permission_content_type_id_2f476e4b` ON `auth_permission` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_permission_id_84c5c92e` ON `auth_group_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ON `auth_group_permissions` (
	`group_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_group_id_b120cbf9` ON `auth_group_permissions` (
	`group_id`
);
COMMIT;
