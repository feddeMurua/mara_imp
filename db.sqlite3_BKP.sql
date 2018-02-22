BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `modulo_I_sector` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre_sector`	varchar ( 50 ) NOT NULL UNIQUE,
	`localidad_id`	integer NOT NULL,
	FOREIGN KEY(`localidad_id`) REFERENCES `modulo_I_localidad`(`id`)
);
CREATE TABLE IF NOT EXISTS `modulo_I_provincia` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre`	varchar ( 25 ) NOT NULL
);
INSERT INTO `modulo_I_provincia` (id,nombre) VALUES (1,'CHUBUT');
CREATE TABLE IF NOT EXISTS `modulo_I_localidad` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre`	varchar ( 25 ) NOT NULL,
	`cp`	integer NOT NULL UNIQUE,
	`provincia_id`	integer NOT NULL,
	FOREIGN KEY(`provincia_id`) REFERENCES `modulo_I_provincia`(`id`)
);
INSERT INTO `modulo_I_localidad` (id,nombre,cp,provincia_id) VALUES (1,'RAWSON',9103,1);
INSERT INTO `modulo_I_localidad` (id,nombre,cp,provincia_id) VALUES (2,'TRELEW',9100,1);
INSERT INTO `modulo_I_localidad` (id,nombre,cp,provincia_id) VALUES (3,'MADRYN',9120,1);
CREATE TABLE IF NOT EXISTS `modulo_I_hojaruta` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`fecha_recorrido`	date NOT NULL
);
CREATE TABLE IF NOT EXISTS `modulo_I_establecimientogenerador` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nro_inscripcion`	bigint UNIQUE,
	`activo`	bool NOT NULL,
	`razon_social`	varchar ( 50 ) NOT NULL,
	`direccion`	varchar ( 100 ) NOT NULL,
	`tipo_actividad`	varchar ( 400 ),
	`recoleccion`	varchar ( 13 ),
	`telefono`	varchar ( 50 ),
	`email`	varchar ( 200 ),
	`responsable_ambiental`	varchar ( 50 ),
	`cuit`	varchar ( 20 ),
	`nro_parada`	integer,
	`cuadrante_id`	integer,
	`localidad_id`	integer NOT NULL,
	FOREIGN KEY(`localidad_id`) REFERENCES `modulo_I_localidad`(`id`),
	FOREIGN KEY(`cuadrante_id`) REFERENCES `modulo_I_cuadrante`(`id`)
);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (1,NULL,'','ALMA TATTOO','Av. Roca 297','Tatuajes','1,3,5','154563399','s/d','Villavicencio Sergio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (2,NULL,'','ALPHA MEDICINA OCUPACIONAL','25 de Mayo 125 P. B.','Consultorio médico','1,3,5','4472252','alphamedoc@live.com.ar','Lorea Nestor Francisco','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (3,NULL,'','ANAKAINOSIS','M.T. Alvear 395','Hogar de ancianos','1,3,5','4454185','s/d','Cadagan Viviana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (4,NULL,'','ASESORIA MEDICA DEL TRABAJO SH','Belgrano 359','Consultorio médico','1,3,5','4451410','cemelab@speedy.com.ar','Roitberg Victor- Panigadi Guillermo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (5,NULL,'','ASOCIACIÓN ARGENTINA DE CAPITANES Y PATRONES DE PESCA (Farmacia C Pesca)','Roque S. Peña 386','farmacia','1,3,5','4450315','s/d','Nicosia Elvecia Pilar Elizabeth','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (6,NULL,'','ASOCIACIÓN CIVIL CIUDADANOS COMPROMETIDOS CON LA SOCIEDAD','Mendoza 950','Consultorio médico','1,3,5','154363357','s/d','Campos Aldo R.','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (7,NULL,'','ASOCIACION DE OBRAS SOCIALES DE TRELEW - ADOS','Mitre 476','Farmacia','1,3,5','4470366','farmaciaadospm@hotmail.com','Tirador Milagros','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (8,NULL,'','BANCO DE SANGRE DE PUERTO MADRYN','Estivariz 260','Laboratorio de análisis clínicos','1,2,3,4,5','4456000','s/d','Manera Guillermo Oscar','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (9,NULL,'','BIOMAD S.R.L.','Belgrano 198 - Of. 7','Laboratorio de análisis clínicos','1,2,3,4,5','154604101','s/d','Heck Graciela Alicia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (10,NULL,'','BRANDO NORBERTO','Av. Roca 353. 1º Piso','Consultorio médico','1,3,5','4451638','s/d','Brando Norberto','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (11,NULL,'','BUSTAMANTE HERNAN CARLOS','28 de julio 570','Consultorio odontológico','1,3,5','154620355 - 4458795','herbus@speddy.com.ar','Bustamante Hernan Carlos','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (12,NULL,'','CABRAL EDA','Av. Roca 353. 5to Piso. Ofic. 2','Consultorio odontológico','1,3,5','4475883','consultoriomoz@yahoo.com','Cabral Eda','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (13,NULL,'','CARDIAL PUERTO MADRYN S.A.','Marcos A. Zar 646','Centro de hemodiálisis','1,2,3,4,5','4457548 - 4458669','cardialmadryn@speedy.com.ar','Tartaglione Julio Cesar','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (14,NULL,'','CATALAN LUIS ALBERTO','Los Aromos - Quintas el Mirador','Hogar de ancianos','1,3,5','4474316 - 154590430','s/d','Catalan Luis Alberto','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (15,NULL,'','CECVA S/H','Av. Roca 353 - 4º Piso - Ed. Roca II - Dto 6','Consultorio médico','1,3,5','4455892','s/d','Bauk Lucas - Costa Hector A.','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (16,NULL,'','CEDIM','Gales 148','Centro de diagnostico por imágenes','1,3,5','4456357','info@cedimdigital.com.ar','Tempesta Rodrigo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (17,NULL,'','CENTRO DE LA VISIÓN','Marcos A. Zar 537','Consultorio médico','1,2,3,4,5','4455500','centrodelavision@infovia.com.ar','Federico Luis','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (18,NULL,'','CENTRO DE ORTODONCIA: Reule','25 de Mayo 364 1º Piso. Of. 3','Consultorio odontológico','1,3,5','4455539','centrodeortodonciacr@gmail.com','Reule María Carolina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (19,NULL,'','CENTRO DE REHABILITACION PEDIATRICO','San Martin 720','Consultorio médico','1,3,5','s/d','amparo_ledesma@hotmail.com','Ledesma Lozano Maria Amparo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (20,NULL,'','CENTRO DIAGNOSTICO SAN JORGE S.R.L.','Gob. Maiz 830','Centro de diagnóstico','1,2,3,4,5','','ecodoppler@yahoo.com.ar.','Schonfeld Daniel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (21,NULL,'','CENTRO MEDICO DE LA AVENIDA','Av. Gales 246','Consultorio médico','1,2,3,4,5','4471737 - 4471682','graprovidencia@yahoo.com.ar','Perez Maria Graciela','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (22,NULL,'','CENTRO ODONTOLOGICO PUERTO MADRYN','Roque S. Peña 399','Consultorio odontológico','1,3,5','4454774','s/d','Etcharran Ricardo Julio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (23,NULL,'','CENTRO OFTALMOLOGICO PUERTO MADRYN','Mitre 770','Consultorio médico','1,2,3,4,5','4475088','jlinaresdelacal@hotmail.com','Linares de la Cal Jorge A.','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (24,NULL,'','CENTRO ONCOLOGICO PUERTO MADRYN','Moreno 165','Consultorio médico','1,2,3,4,5','4456699','s/d','Gallina Nanni Carlos Roman','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (25,NULL,'','CEVET SUR','Av. Roca 1488','Veterinaria','1,3,5','4474783','martinez gonzalesluis@hotmail.com','Martinez Gonzalez Luis Alberto','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (26,NULL,'','CHICHI MAGDALENA','San Martin 286','Consultorio médico','1,3,5','154600170','magdalenachichi@hotmail.com','Chichi Magdalena','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (27,NULL,'','CHP','Rivadavia 257','Consultorio médico','1,3,5','4455254','marboero@speedy.com.ar','Boeno Marta Sara','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (28,NULL,'','CIK','25 de Mayo 566','Consultorio de kinesiologia','1,3,5','154604653','cik_puertomadryn@yahoo.com.ar','Basilico Sonia Beatriz','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (29,NULL,'','CITEN','Mitre 483','Consultorio médico','1,3,5','154457064','s/d','Meternicht Marisa','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (30,NULL,'','CLINICA ADOS','Mitre 472','Consultorio médico','1,2,3,4,5','4472548','santamaria-pm@hotmail.com','Nuñez Guillermo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (31,NULL,'','CLINICA MEDICA VITANGELO DANIELE','España 215','Consultorio médico','1,3,5','154342664','s/d','Vitangelo Daniele','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (32,NULL,'','CLINICA ODONTOLOGICA MONICA GIL','Juan Muzzio 886','Consultorio odontológico','1,3,5','154303727','s/d','Gil Monica','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (33,NULL,'','CLINICA VETERINARIA HUELLA','Sarmiento 858','Veterinaria','1,3,5','154518400','s/d','Sylwan Diego Jorge','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (34,NULL,'','CLINICA VETERINARIA PATAGONICA','Mitre 2310','Veterinaria','1,3,5','154407295','silvinarode@infovia.com.ar','Rodriguez Silvina Vanesa','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (35,NULL,'','CLINICA Y MATERNIDAD SANTA MARIA','Mitre 651','Clínica','1,2,3,4,5','4458726 - 4472548','santamaria-pm@hotmail.com','Nuñez Guillermo Federico','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (36,NULL,'','COE','Yrigoyen 650','Consultorio odontológico','1,3,5','4470423','s/d','Koenig  Diego Martin David','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (37,NULL,'','COGUAI YENU','Tierra del Fuego y Estivariz','Veterinaria','1,3,5','154402968','s/d','D´Aragona Estefania','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (38,NULL,'','CONSALUD S.H','Mitre 696','Consultorio médico','1,3,5','4452020','consultoioconsalud@gmail.com','Castillo Gisela Vanesa','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (39,NULL,'','CONSULTORIO CARDIOLOGIA: Soumolou','ed. Roca II piso 8 of. 3','Consultorio médico','1,3,5','4482872 - 154673088','s/d','Soumoulou Juan','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (40,NULL,'','CONSULTORIO DE FONOAUDIOLOGIA: Dominguez','Av. Roca 353 - 4º Piso - Ed. Roca II - Dto 4','Consultorio médico','1,3,5','154567311','s/d','Dominguez Laura Daniela','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (41,NULL,'','CONSULTORIO De KINESIOLOGIA SUR','Av. Roca 1639','Consultorio de kinesiologia','1,3,5','4474437','jazminpeñaloza@hotmail.com','Peñalozo Veronica','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (42,NULL,'','CONSULTORIO DE KLOGIA','Sarmiento  427','Kinesiología','1,3,5','4474799','s/d','Allende Maxwell Cecilia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (43,NULL,'','CONSULTORIO DE LA COSTA','España 4','Consultorio médico','1,3,5','4456699','s/d','Vacarezza Viviana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (44,NULL,'','CONSULTORIO DE MADRYN','San Martin 596','Consultorio médico','1,3,5','154273282','s/d','Arguelles Ana A.','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (45,NULL,'','CONSULTORIO DE PODOLOGIA: Munar','Av. Gales 246','Consultorio médico','1,3,5','154670805','s/d','Munar Monasterio Cristian','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (46,NULL,'','CONSULTORIO GINECOLOGICO MONICA BLUM','Estivariz 233','Consultorio médico','1,3,5','4472223','aymblum@yahoo.com.ar','Dyksztein de Blum Monica','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (47,NULL,'','CONSULTORIO MEDICO','Av. Roca 353 6º piso. Of. B','Consultorio médico','1,3,5','4458868','s/d','Juarez Manuel Sebastian','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (48,NULL,'','CONSULTORIO MEDICO DE LA MUJER','28 de Julio 348','Consultorio médico','1,3,5','4450136','njgambande@hotmail.com','Gambande Nelida Josefina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (49,NULL,'','CONSULTORIO MEDICO DR. ARCE','Estivariz 197','Consultorio médico','1,3,5','154507777','drfla@yahoo.com','Arce Fernando Luís','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (50,NULL,'','CONSULTORIO MEDICO FERNANDEZ','Belgrano 198','Consultorio médico','1,3,5','4457579','s/d','Fernández Ana Maria','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (51,NULL,'','Consultorio Médico LLapemn','H. Yrigoyen 673. 1piso. Of. 2','Consultorio Médico','1,3,5','4475692 - 154292477','hcorbalanc2@hotmail.com','Corbalan Hugo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (52,NULL,'','CONSULTORIO MEDICO: ABRANY','Mitre 107 - 5º Piso','Consultorio médico','1,3,5','4472627','s/d','Abrany Fortunato','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (53,NULL,'','CONSULTORIO MEDICO: ALEJANDRO BLUM','Av. Roca 353. Piso 7','Consultorio médico','1,3,5','4472223 - 4474344','aymblum@yahoo.com.ar','Blum Alejandro','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (54,NULL,'','CONSULTORIO MEDICO: FARJA','s/d','Consultorio médico','1,3,5','s/d','s/d','Farja Carlos','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (55,NULL,'','CONSULTORIO NEUROREHABILITACION','Villarino 250','Consultorio médico','1,3,5','154585142','pauslu@hotmail.com.ar','Slucinse Paula','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (56,NULL,'','CONSULTORIO ODONTOLOGICO','Sarmiento 181','Consultorio odontológico','1,3,5','s/d','s/d','Santano Matias','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (57,NULL,'','CONSULTORIO ODONTOLOGICO ARRECHEA','Roque S. Peña 399','Consultorio odontológico','1,3,5','4454774','s/d','Arrechea Ismael Lisandro','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (58,NULL,'','CONSULTORIO ODONTOLOGICO COSENTINO','Agustin Pujol 706','Consultorio odontológico','1,3,5','154455539','centrodeortodonciacr@gmail.com','Cosentino Lorena Andrea','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (59,NULL,'','CONSULTORIO ODONTOLOGICO CRISTINA ALCUAZ','Sarmiento 181','Consultorio odontológico','1,3,5','4456324','s/d','Alcuaz Maria','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (60,NULL,'','CONSULTORIO ODONTOLOGICO GIORDANO','Roque S. Peña 399','Consultorio odontológico','1,3,5','s/d','s/d','Giordano Silvina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (61,NULL,'','CONSULTORIO ODONTOLOGICO GONZALEZ PUNTER','Roque S. Peña 399','Consultorio odontológico','1,3,5','4454774','s/d','Gonzalez Punter Mauricio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (62,NULL,'','CONSULTORIO ODONTOLOGICO HIGUERA','Roque S. peña 399','Consultorio odontológico','1,3,5','154418505','s/d','Higuera Magdalena','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (63,NULL,'','CONSULTORIO ODONTOLOGICO LAURA GUERRERO','Sarmiento 181','Consultorio odontológico','1,3,5','4456324','s/d','Guerrero Laura','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (64,NULL,'','CONSULTORIO ODONTOLOGICO LAZARO','Agustin Pujol 706','Consultorio odontológico','1,3,5','154360418 - 4457974','s/d','Lazaro Andrea Laura','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (65,NULL,'','CONSULTORIO ODONTOLOGICO MACCIONE','25 de Mayo 1254','Consultorio odontológico','1,3,5','4457630','madryndent@yahoo.com','Macchione Victorio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (66,NULL,'','CONSULTORIO ODONTOLOGICO MARIO MARIN','Sarmiento 181','Consultorio odontológico','1,3,5','4456324','s/d','Marin Mario','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (67,NULL,'','CONSULTORIO ODONTOLOGICO MILANESIO','25 de Mayo 484','Consultorio odontológico','1,3,5','s/d','s/d','Milanesio Natalia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (68,NULL,'','CONSULTORIO ODONTOLOGICO MONICA SEGOVIA','Av. Roca 353 entrepiso oficina 11','Consultorio odontológico','1,3,5','4452072','dramonicasegovia@yahoo.com.ar','Segovia Mónica','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (69,NULL,'','CONSULTORIO ODONTOLOGICO QUAINTENNE','25 de Mayo 1254','Consultorio odontológico','1,3,5','4457630','s/d','Quaintenne Pablo R.','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (70,NULL,'','CONSULTORIO ODONTOLOGICO REDONDO','28 de Julio 247 1ºB','Consultorio odontológico','1,3,5','4456192','consultorioesteticadental@hotmail.com','Redondo Carlos Alcides','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (71,NULL,'','CONSULTORIO ODONTOLOGICO SANTANO','Mitre 477','Consultorio odontológico','1,3,5','154946432','s/d','Santano Matias Ezequiel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (72,NULL,'','CONSULTORIO ODONTOLOGICO SEMPER NATALIA','Triunvirato 286','Consultorio odontológico','1,3,5','154600340','dra.nataliasemper@yahoo.com.ar','Semper Natalia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (73,NULL,'','CONSULTORIO ODONTOLOGICO: Baggio','Love Parry 109','Consultorio odontológico','1,3,5','4458428','maferbaggio@yahoo.com.ar','Baggio Maria Fernanda','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (74,NULL,'','CONSULTORIO ODONTOLOGICO: Kfuri','Love Parry 109','Consultorio odontológico','1,3,5','4458428','s/d','Kfuri Natalia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (75,NULL,'','CONSULTORIO ODONTOLÓGICO: LOPEZ GERARDO','Av. Roca 353 Entrepiso A','Consultorio odontológico','1,3,5','154577931','gerarlopez@hotmail.com','Lopez Gerardo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (76,NULL,'','CONSULTORIO ODONTOLOGICO: Ruiz','Love Parry 109','Consultorio odontológico','1,3,5','4458428','s/d','Ruiz Daniel C.','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (77,NULL,'','CONSULTORIO ODONTOLOGICO: Savachuck','28 de julio 348','Consultorio odontológico','1,3,5','4450135','s/d','Savachuck Marcio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (78,NULL,'','CONSULTORIO ODONTOLOGICO: Vera','Av. Roca 353 - entrepiso - Dto. A','Consultorio odontológico','1,3,5','4456026','verapablo@gmail.com','Vera Pablo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (79,NULL,'','CONSULTORIO ODONTOLOGICO: Ziegenbalg','s/d','Consultorio odontológico','1,3,5','s/d','s/d','Ziegenbalg Carina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (80,NULL,'','CONSULTORIO OFTALMOLOGICO DE ALTA COMPLEJIDAD','25 de mayo 560','Consultorio médico','1,2,3,4,5','4471282','s/d','Mazzeo Maria Gabriela','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (81,NULL,'','CONSULTORIO ORTODONCIA: Monsalve','Av. Roca 353. Piso 8. Of. 3','Consultorio odontológico','1,3,5','4472872','s/d','Monsalve Miriam Zulli','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (82,NULL,'','CONSULTORIO PILAR','España 125','Consultorio médico','1,3,5','4455821','s/d','Garcia Perez Fernando','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (83,NULL,'','CONSULTORIO PRIVADO: Calandra','Av. Roca 353 4º piso dpto 4','Consultorio odontológico','1,2,3,4,5','4475566','alfredocalandra@speedy.com.ar','Calandra Alfredo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (84,NULL,'','CONSULTORIO PSICOLOGICO','San Martin 286','Consultorio psicologico','1,3,5','154205483','s/d','Vera Maria Agustina Marta','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (85,NULL,'','CONSULTORIO PSICOLOGICO','Belgrano 198','Consultorio psicologico','1,3,5','154613102','s/d','Medici Analia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (86,NULL,'','CONSULTORIO PSICOLOGICO: Guañabens','Av. Roca 353 Piso Nº 3 Ofic. 2','Consultorio médico','1,3,5','154666527','s/d','Guañabens Pablo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (87,NULL,'','CONSULTORIO PSICOLOGICO: Medici','Belgrano 198 oficina 9','Consultorio médico','1,3,5','154613102','s/d','Medici Analía Verónica','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (88,NULL,'','CONSULTORIO REY','Albarracin 264','Consultorio odontológico','1,3,5','154722514','s/d','Rey Alberto Sebastián','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (89,NULL,'','CONSULTORIO TRAUMATOLOGÍA: Barbosa','25 de Mayo 1094','Consultorio médico','1,3,5','4457333','s/d','Barbosa Lucas Martin','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (90,NULL,'','CONSULTORIO: IRIARTE','Sarmiento 79','Consultorio médico','1,3,5','4451657','s/d','Iriarte Juan Carlos','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (91,NULL,'','CONSULTORIOS BAROS','Av. Gales 486','Consultorio médico','1,3,5','154546862','s/d','Taiariol Maria Teresa','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (92,NULL,'','CONSULTORIOS DEL CENTRO','28 de Julio 329','Consultorio médico','1,3,5','4474118','consul.centro@hotmail.com','Saenz Hernan Jose','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (93,NULL,'','CONSULTORIOS DEL MAR','Roca 791','Consultorio odontológico','1,3,5','***','malcuaz@hotmail.com','Alcuaz Maria Cristina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (94,NULL,'','CONSULTORIOS DEL PILAR','España 125','Consultorio médico','1,3,5','4455821','s/d','Garcia Perez Fernando','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (95,NULL,'','CONSULTORIOS DEL SOL','Av. Roca 2506','Consultorio médico','1,3,5','154633318','consdelsol@gmail.com','Duscher Paola','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (96,NULL,'','CONSULTORIOS MEDICOS DE HERNANDEZ Y TOYPELLA','Av. Roca 353. 1º Piso. Dto 4','Consultorio médico','1,3,5','4472626','s/d','Hernandez Rodolfo y Toypella Mabel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (97,NULL,'','CONSULTORIOS MEDICOS: Pajariño','s/d','Consultorio médico','1,3,5','s/d','s/d','Pajariño Susana Beatriz','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (98,NULL,'','CONSULTORIOS MITRE','Mitre 143 locales 5-6-9','Consultorio médico','1,3,5','4476262','s/d','Gomez Anibal Gabriel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (99,NULL,'','CONSULTORIOS SUR','Mitre 536','Consultorio odontológico','1,3,5','154511367','monicaplano@hotmail.com.ar','Plano Mónica Mariana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (100,NULL,'','CRUZ AZUL S.H.','Sarmiento 79','Consultorio médico','1,2,3,4,5','4451657','s/d','Iriarte Juan Carlos','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (101,NULL,'','CUARTA DIMENSIÓN TATTO 1','9 de Julio 52','Tatuajes','1,3,5','154656556','s/d','León Gustavo Felipe y León Laura','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (102,NULL,'','CUARTA DIMENSIÓN TATTO 2','9 de Julio 52','Tatuajes','1,3,5','154656556','s/d','León Marcelo y León Gabriela','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (103,NULL,'','DE ANNA OFELIA DELFINA','Marcos A. Zar 253','Consultorio médico','1,3,5','4471821','ofelia.de.anna@gmail.com','De Anna Ofelia Delfina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (104,NULL,'','DESCUBREPUENTES SRL','Rawson 1241','Consultorio médico','1,3,5','154564069','s/d','Gonzalo Puntillo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (105,NULL,'','DIOGENES','28 de julio 457','Veterinaria','1,3,5','154411024','mascomadryn@hotmail.com','Gallego Maria  Beatriz','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (106,NULL,'','ENTRELAZADAS CONSULTORIOS','Av. Gales 545','Consultorio médico','1,3,5','154564333 - 154606042','entrelazadas@live.com.ar','Lopez Romina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (107,NULL,'','ENTRELAZADAS CONSULTORIOS','Av. Gales 545','Consultorio médico','1,3,5','154606042','entrelazadas@live.com.ar','Bellorini Mariana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (108,NULL,'','ENTRELAZADAS CONSULTORIOS','Av. Gales 546','Consultorio médico','1,3,5','154381320','s/d','Santos Maria Nelida','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (109,NULL,'','ENTRELAZADAS CONSULTORIOS','Av. Gales 547','Consultorio médico','1,3,5','154573613','s/d','Altube Mara Lia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (110,NULL,'','ESTANCIA MADRYN','Rosales 541','Hogar de ancianos','1,2,3,4,5','4472744','estanciamadryn@arnet.com.ar','Estancia Madryn S.A','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (111,NULL,'','ESTUDIO ECO','Gob. Maiz 225 Of. 1','Consultorio médico','1,3,5','154344117','maryottoclaps@hotmail.com','Claps Maria Sol- Bares Conrado','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (112,NULL,'','FARMA SRL - FARMACIAS PATAGONICAS','San Martin y 28 de julio','Farmacia','1,3,5','4453708','pedidos28dejulio@farmaciaspatagonicas.com','Amoroso Sergio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (113,NULL,'','FARMA SRL - FARMACIAS PATAGONICAS','Av. Roca 315','Farmacia','1,3,5','4474555','costanera@farmaciaspatagonicas.com','Querol Fernandez Pablo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (114,NULL,'','FARMA SRL - FARMACIAS PATAGONICAS','Av. Roca 315','Farmacia','1,3,5','4474555','costanera@farmaciaspatagonicas.com','Querol Fernandez Pablo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (115,NULL,'','FARMACIA ALZA','Villarino 746','Farmacia','1,3,5','0291-154271532','ezealza@hotmail.com','Alza Roberto Ezequiel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (116,NULL,'','FARMACIA AMPAL','Uruguay 211','Farmacia','1,3,5','2804457927','farmacia@ampal.org.ar','Filippini Silvina P.','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (117,NULL,'','FARMACIA CENTRAL','25 de Mayo 272','Farmacia','1,3,5','4454804','grujana@farcentral.com.ar','Rujana Gerardo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (118,NULL,'','FARMACIA CENTRAL Y PERFUMERIA PM S.R.L','Av.Gales 701','Farmacia','1,3,5','4473124','sucursalatlantica@farcentral.com.ar','Irrazabal Cintia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (119,NULL,'','FARMACIA CURCIO','Av. Juan Muzzio 412','Farmacia','1,3,5','154689449','s/d','Curcio Adrian Ulises','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (120,NULL,'','FARMACIA DASU','Marcos A. Zar 297','Farmacia','1,3,5','4470247','s/d','Morbidoni Gabriela','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (121,NULL,'','FARMACIA DEL GOLFO','Pedro Derbes 480','Farmacia','1,3,5','154456383','farmaciadelgolfo@gmail.com','Galar Maria Eugenia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (122,NULL,'','FARMACIA DOMECQ GARCIA','Domecq García 401','Farmacia','1,3,5','4457771','farmadomecq@hotmail.com','Julio Aldo Ruben','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (123,NULL,'','FARMACIA EVA SH','España 1530','Farmacia','1,3,5','154209707 - 4470361','leslietomasroberts@gmail.com','Roberts Leslie Tomás','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (124,NULL,'','FARMACIA GALES','Av. Roca 2438','Farmacia','1,3,5','4456288','farmaciagales@speedy.com.ar','Grassl Ana Maria','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (125,NULL,'','FARMACIA GLOBAL','Av. Gales 1310','Farmacia','1,3,5','s/d','mlanz@farmaciasglobal.com.ar','Lanz Mauro','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (126,NULL,'','FARMACIA GLOBAL','Mitre 357','Farmacia','1,3,5','4458254','madrynmitre357efarmavasglobal.com.ar','Casimano Georgina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (127,NULL,'','FARMACIA LA GUARDIA','H.Yrigoyen 802','Farmacia','1,3,5','4455825','s/d','Grzeszuk Elena Nieves','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (128,NULL,'','FARMACIA MENDEZ','Domecq Garcia 356','Farmacia','1,3,5','154416946','gladys@hotmail.com','Mendez Beatriz','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (129,NULL,'','FARMACIA MODERNA','Mitre 502','Farmacia','1,3,5','4473788','s/d','Ada Manuela Sassi','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (130,NULL,'','FARMACIA OESTE','25 de Mayo 59','Farmacia','1,3,5','4451119','farmacia.oeste@speedy.com.ar','Demasi Gustavo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (131,NULL,'','FARMACIA PROSALUD','Mitre 719','Farmacia','1,3,5','4473895','amatinleiva@hotmail.com','Leiva Angel Martin','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (132,NULL,'','FARMACIA SAN CAYETANO','Pedro Derbes 480','Farmacia','1,3,5','154377401','jmtortola@hotmail.com','Tortola Jorge M.','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (133,NULL,'','FERNANDEZ GISELA EDITH','Av. Roca 353 Piso 7 Of. 4','Consultorio odontologico','1,3,5','154006624','s/d','Fernandez Gisela Edith','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (134,NULL,'','FKT PATAGONIA','Alem 255','Kinesiología','1,3,5','154593374','fktpatagonia@gmail.com','Williams Erica','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (135,NULL,'','FUNDACION EL SOLAR','Marcos A. Zar 243','Hogar de ancianos','1,2,3,4,5','154551182','patriciae@hotmail.com.ar','Barac Patricia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (136,NULL,'','GABINETE DE KINESIOLOGIA','Marcos A. Zar 24','Consultorio médico','1,3,5','154572722','s/d','Garcia Gustavo Marcelo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (137,NULL,'','GATICA PAOLA','Av. Gales 246','Consultorio odontológico','1,3,5','s/d','s/d','Gatica Paola','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (138,NULL,'','IDECH S.R.L.','Juan B. Justo 496','Centro de diagnóstico','1,2,3,4,5','4474338 - 4450548','idechpmsrl@speedy.com.ar','Massenzio Alejandro','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (139,NULL,'','IKAP','Paulina Escardo 177','Consultorio médico','1,3,5','154314265','williams_mariela@hotmail.com','Williams Nilda Mariela','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (140,NULL,'','INSTITUTO PRIVADO DE ANALISIS CLINICOS','25 de Mayo 408','Laboratorio de análisis clínicos','1,2,3,4,5','4454777','pedrolodes@gmail.com','Lodes Pedro Alfredo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (141,NULL,'','IPAMER S.R.L.','25 de mayo 969','Consultorios Médicos y Laboratorio','1,2,3,4,5','154313663','marcela0103@yahoo.com.ar','Iglesias Nelida Marcela','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (142,NULL,'','IPRO SRL','Albarracin 336','Consultorio odontológico','1,3,5','4471226 - 4476138','ipro@speedy.com.ar','Barrientos Ermes Rene','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (143,NULL,'','IPRO SRL','Albarracin 357','Servicios de diagnosticos por imágenes','1,3,5','4471226 - 4451184','administracion@ipromadryn.com.ar','Barrientos Ermes Rene','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (144,NULL,'','IREZUMI TATOO','Marcos A. Zar 705','Tatuajes','1,3,5','154604005','s/d','Castel Juan Ignacio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (145,NULL,'','JURE LUIS CESAR','Villarino 297','Consultorio odontológico','1,3,5','4454610','consultoriojure@yahoo.com.ar','Jure Luis Cesar','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (146,NULL,'','KIAK','H. Yrigoyen 820','Consultorio médico','1,3,5','154565572','s/d','Francisquelo Mariana Elisa','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (147,NULL,'','KIDET','Av. Gales 24','Kinesiología','1,3,5','s/d','s/d','Monochio Nicolas','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (148,NULL,'','KINAR','Newbery 609 esquina Alvear','Consultorio médico','1,3,5','154664870','kinasur@yahoo.com.ar','Sosa Gerardo Fabian','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (149,NULL,'','KINEA','España  1242','Kinesiología','1,3,5','154607217','s/d','Arce Elizabeth del Carmen','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (150,NULL,'','KINESIOLOGIA','25 de Mayo 1094','Consultorio médico','1,3,5','4457333','cesarhar@hotmail.com','Harguimteguy Cesar','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (151,NULL,'','KINESIS','Av. Roca 2573','Consultorio de kinesiologia','1,3,5','154563150','s/d','Nudelman Matias','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (152,NULL,'','KINETIC','San Martin 286','Consultorio médico','1,3,5','154513001','agustinadelrio@hotmail.com','Del Río Maria Agustina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (153,NULL,'','LABOR AUSTRAL','Laprida 42','Consultorio médico','1,2,3,4,5','4457378 - 4475789','gerencialabaustral@speedy.com.ar','Kanter Beatriz May','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (154,NULL,'','LABORAL MADRYN S.H.','Albarracin 335','Consultorio médico','1,3,5','4475721','laboralmadryn@hotmail.com','Stenti Beatriz','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (155,NULL,'','LABORATORIO BIOMADRYN','25 de Mayo 125. 1º Piso','Laboratorio de análisis clínicos','1,2,3,4,5','4471116 - 154454505','lbearzi@biomadryn.com.ar','Bearzi Wargon Liliana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (156,NULL,'','LABORATORIO BIOSUD DE VALERIA KOWALJOW','Laprida 42','Laboratorio de análisis clínicos','1,2,3,4,5','4470163','biosud@speedy.com.ar','Kowaljow Valeria','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (157,NULL,'','LABORATORIO BRIVEL','Sarmiento 676','Laboratorio de análisis clínicos','1,2,3,4,5','154621937','labritos@yahoo.com','Britos Manriquez Lucas Federico','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (158,NULL,'','LABORATORIO CLINICO DE PUERTO MADRYN','Estivariz 260','Laboratorio de análisis clínicos','1,2,3,4,5','154369903','mcpretell@gmail.com','Pretell Mariana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (159,NULL,'','LABORATORIO DE ANALISIS CLINICOS','Gob. Maiz 830','Laboratorio de analisis clinicos','1,2,3,4,5','4454505','s/d','Beazzi Liliana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (160,NULL,'','LABORATORIO DE ANALISIS CLINICOS','Mitre 476 PB','Laboratorio de análisis clínicos','1,2,3,4,5','4456291','quiros.gustavo@gmail.com','Quiros Gustavo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (161,NULL,'','LABORATORIO DE ANALISIS CLINICOS','Sarmiento 125','Laboratorio de análisis clínicos','1,2,3,4,5','4450709','labruiz-heck@hotmail.com','Ruiz Ana Maria','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (162,NULL,'','LABORATORIO DEL CENTRO','28 de Julio 329','Laboratorio de análisis clínicos','1,2,3,4,5','4456398','lbearzi@biomadryn.com.ar','Bearzi Wargon Liliana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (163,NULL,'','LABORATORIO SAN JOSE','Juan B. Justo 799','Laboratorio de analisis clinicos','1,2,3,4,5','154001174','s/d','Rodriguez Calvo Vilma - Veliz Oscar Enrique','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (164,NULL,'','LACyB SH','9 de Julio 458','Laboratorio de análisis clínicos','1,2,3,4,5','4471082','lacybsh@speedy.com.ar','Santamaría Emilio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (165,NULL,'','LOPEZ MARIA LAURA','25 de Mayo 364. 1º Piso. Of. 3','Consultorio odontológico','1,3,5','2262610990','mlaura_164@hotmail.com','Lopez Maria Laura','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (166,NULL,'','LOS CHARITOS','Juan B. Justo 1366','Veterinaria','1,3,5','4475638','s/d','Melchi Marcelo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (167,NULL,'','LOS PARAISOS','Los Olmos 2225','Hogar de ancianos','1,2,3,4,5','44533851','crisjuulzbogado@hotmail.com','Bogado Cristina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (168,NULL,'','LUCKY TATTOO ESTUDIO','Av. Roca 904 local 2','Tatuajes','1,3,5','154636049','laureano@gmail.com','Ortega Laureano','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (169,NULL,'','LUCKY TATTOO STUDIO','Av. Roca 904','Tatuajes','1,3,5','154636049','laureanoo@gmail.com','Ortega Laureano','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (170,NULL,'','LUZ DE ESPERANZA','Arrayanes 3925','Hogar de ancianos','1,2,3,4,5','154027668','s/d','Zappella Roberto Daniel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (171,NULL,'','MANUEL VILLEGAS','Av. Gales 246','Consultorio odontológico','1,3,5','4456611','manuvillegas@hotmail.com','Villegas Manuel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (172,NULL,'','MARIA BELEN MATTEO','Av. Roca 353 Piso Nº 1','Consultorio odontológico','1,3,5','3,81154E+11','s/d','Matteo Maria Belen','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (173,NULL,'','MATICES','Villegas 507','Consultorio médico','1,3,5','4455372 -154720451','msaborit@hotmail.com','Saborit Calvo Maria Belen','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (174,NULL,'','MEC','Mendoza 950','Consultorio Medico','1,3,5','4453774','s/d','Campos Aldo Ruben','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (175,NULL,'','MEDICINA LABORAL SAN CAMILO','Mitre 650','Consultorio médico','1,3,5','4472291','federicoditata@hotmail.com','Buschittari Viviana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (176,NULL,'','MEDICINA LABORAL SAN CAMILO','Mitre 650','Laboratorio de análisis clínicos','1,2,3,4,5','4472117','bioclin@speedy.com.ar','Buschittari Viviana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (177,NULL,'','MEDISUR  MUTUAL','Mosconi 187','Farmacia','1,3,5','4457260','s/d','Fortunato Abrany','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (178,NULL,'','MEDLAB','B.Mitre 632','Laboratorio de análisis clínicos','1,2,3,4,5','154341451','buschittari@hotmail.com','Buschittari Viviana','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (179,NULL,'','MONTAÑO MARCELA','Mitre 880','Consultorio médico','1,3,5','154562404','s/d','Montaño Marcela','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (180,NULL,'','N Y K ODONTOLOGIA','Mitre 675','Consultorio odontológico','1,3,5','154696126','kv_martin@hotmail.com','Martin Karina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (181,NULL,'','NEXO MEDICINA LABORAL S.H.','Domecq García Norte 37','Consultorio médico','1,3,5','4454298','s/d','Cuello Gustavo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (182,NULL,'','ODONTAR','Av. Roca 353 local 4 Piso 7','Consultorio odontológico','1,3,5','4470124','s/d','Fernandez Gisela Edith','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (183,NULL,'','ODONTOLOGIA ADRIAN GARCIA','Estivariz 245','Consultorio odontológico','1,3,5','4455645','s/d','Garcia José Adrian','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (184,NULL,'','ODONTOLOGIA GALES','Av. Roca 791','Consultorio odontológico','1,3,5','154653202','ivinf@yahoo.com.ar','Fernandez Ivana Noemi','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (185,NULL,'','ODONTOLOGIA GENERAL','Av. Roca 353. Piso 2. Cons. 3','Consultorio médico','1,3,5','4455328','magdamadryn@hotmail.com','Ellert Magda Ingrid','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (186,NULL,'','ODONTOLOGIA MADRYN','25 de Mayo 786','Consultorio odontológico','1,3,5','154402289','s/d','Ortiz Gonzalo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (187,NULL,'','ODONTOLOGIA MADRYN','25 de Mayo 786','Consultorio odontológico','1,3,5','4457407','odontologiamadryn1@gmail.com','Ortiz Gonzalo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (188,NULL,'','OFTALMOMADRYN','25 de Mayo 560','Consultorio médico oftalmologico','1,2,3,4,5','4471282','kagringuita@yahoo.com.ar','Chavez Raraz Quiniano','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (189,NULL,'','PCM KINESIOLOGIA PISCIUM s.r.l','Sarmiento 151','Kinesiología','1,3,5','154503868','s/d','Moretta Gustavo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (190,NULL,'','QUINTAS DEL MIRADOR','Los Aromos 2525','Hogar de ancianos','1,3,5','154022578','s/d','Liranzo Peralta Ana Julia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (191,NULL,'','RADIOLOGIA DIGITAL','25 de Mayo 364. 1ºPiso. Of. 3','Centro de diagnóstico','1,3,5','4455539','s/d','Reule Carolina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (192,NULL,'','RAZA TATTOO AND PIERCING','Roque S. Peña 172 Local 5','Tatuajes','1,3,5','154613838','s/d','Muñoz Victor Antonio','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (193,NULL,'','RUIZ - HECK LABORATORIO DE ANALISIS CLINICO','España 6','Laboratorio de análisis clínicos','1,2,3,4,5','4450709','labruiz-heck@hotmail.com','Ruiz Ana Maria','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (194,NULL,'','SALK S.R.L','Marcos A. Zar 398','Farmacia','1,3,5','154450857','s/d','Cecchi Ponzi Carolina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (195,NULL,'','SALUD ODONTOLOGIA','Juan B. Justo 834','Consultorio odontológico','1,3,5','154190352','drmereles@hotmail.com','Mereles Cristian Rubén','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (196,NULL,'','SAN IGNACIO S.R.L.','Reconquista 651','Psiquiatría','1,3,5','4471661 - 154661824','san-ignacio@speedy.com.ar','Cogliandro Roberto','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (197,NULL,'','SANATORIO DE LA CIUDAD SRL','Laprida 42','Clínica','1,2,3,4,5','4451270 - 154406526','gerenciasnciudad@speedy.com.ar - snciudad@speedy.com.ar','Kanter Marcelo Luis','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (198,NULL,'','SEP SRL','Sarmiento 125','Consultorio médico','1,2,3,4,5','154660895','marcelovaccaro2000@yahoo.com.ar','Vaccaro Marcelo Fabian','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (199,NULL,'','SERFARMA','España 914','Farmacia','1,3,5','4458515','serfarmapm@gmail.com','Pritchard Esteban Marcos','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (200,NULL,'','SERVICIO RADIOLOGICO SEP','Sarmiento 125','Servicios radiológicos','1,3,5','154649629','s/d','Arballo Fabian','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (201,NULL,'','SINDICATO DE EMPLEADOS DE COMERCIO','Fuerte San Jose 346','Consultorio médico','1,2,3,4,5','4470344- 4472423','robertocasanoba58@hotmail.com','Smit Guillermo Luis','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (202,NULL,'','TALIERCIO THELMA NATALIA','Av.Roca 353 PB Of. 8','Consultorio odontológico','1,3,5','154196266','s/d','Taliercio Thelma Natalia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (203,NULL,'','TEMPESTA - FIORENZA','28 de Julio 173 PB','Consultorio odontológico','1,3,5','221-155628581','s/d','Tempesta Rodrigo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (204,NULL,'','UTHAGRA','Gob. Maiz 516','Consultorio Médico','1,3,5','4452893','s/d','Rosales Patricio - Dignoti Maria Belen','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (205,NULL,'','VALLE SOL','Quintas del Mirador - Calafate 3980','Hogar de ancianos','1,2,3,4,5','154882208','s/d','Liranzo Peralta Ana Julia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (206,NULL,'','VERA AGUSTINA MARCIA','San Martín 286','Psicología','1,3,5','154205483','s/d','Vera Agustina Marcia','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (207,NULL,'','VETERINARIA DR. MIÑONES','Mitre 463','Veterinaria','1,3,5','4472410','s/d','Miñones Jose Alberto','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (208,NULL,'','VETERINARIA EL QUEBRACHO','Domecq Garcia 317','Veterinaria','1,3,5','154416679','gparodi@speedy.com.ar','Parodi Guillermo','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (209,NULL,'','VETERINARIA HOCICOS Y BIGOTES','Juan B. Justo 1576','Veterinaria','1,3,5','154563353','4470656','Bracchi Daniel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (210,NULL,'','VETERINARIA HOCICOS Y BIGOTES 2','Albarracin 375','Veterinaria','1,3,5','154563353','s/d','Bracchi  Daniel','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (211,NULL,'','VETERINARIA LUAN','H. Yrigoyen 925','Veterinaria','1,3,5','154580309','s/d','Escobar Milner Sol Ena','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (212,NULL,'','VETERINARIA PASTEUR','Fournier 1385','Veterinaria','1,3,5','154351869','s/d','Fernandez Malvina Brenda','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (213,NULL,'','VETERINARIA PEUMAYEN','Zampa 2385','Veterinaria','1,3,5','154583472','s/d','Wolawsky Marina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (214,NULL,'','VETERINARIA SAN CARLOS','Albarracin 375','Veterinaria','1,3,5','154606841','silviacabezon@yahoo.com.ar','Cabezon Silvia Josefina','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (215,NULL,'','VETERINARIA VIDAL','San Martin 998','Veterinaria','1,3,5','4471790','jhonyvidal@yahoo.com.ar','Vidal Davila Jhony Riderth','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (216,NULL,'','VETERNIARIA VIDAL','Av. Roca 1143','Veterinaria','1,3,5','4471790','s/d','Ortiz Lorena Vanesa','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (217,NULL,'','VIRTUAL','25 de Mayo 725','Consultorio médico','1,2,3,4,5','4471498','dravizcay@hotmail.com','Vizcay Vivian','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (218,NULL,'','VITALIS PUERTO MADRYN','Av. Roca 1024 lc. 2','Consultorio odontologico','1,3,5','4453644','s/d','Amieva Mariela Soledad','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (219,NULL,'','ZOO VITAL','s/d','Veterinaria','1,3,5','s/d','s/d','Alemán Mayra','',NULL,NULL,3);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (220,NULL,'','SERVICIOS VETERINARIOS','25 DE MAYO Nº 1588','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (221,NULL,'','FARMACIA CENTRAL','25 DE MAYO Nº1116','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (222,NULL,'','FARMACIA QUEROL','25 DE MAYO Nº401','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (223,NULL,'','PERIF. ABEL AMAYA','25 DE MAYO Y GASTRE NORTE','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (224,NULL,'','ARCADIA','28 DE JULIO 371','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (225,NULL,'','EVANS OSVALDO JAVIER','28 DE JULIO 484','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (226,NULL,'','SONEYRA RAUL','28 DE JULIO 527','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (227,NULL,'','LLOYD CRISTIAN','28 DE JULIO 548','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (228,NULL,'','ALTUNA MARIO','28 DE JULIO 548 (CENTRO ESTETICA ODONTOLOGICA)','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (229,NULL,'','PFISTER FABIANA','28 DE JULIO 553','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (230,NULL,'','LADIAC','28 DE JULIO 613','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (231,NULL,'','VILLANI CARLOS ANGEL','28 DE JULIO 623','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (232,NULL,'','VILLANI MARCELO-BOTELA CECILIA','28 DE JULIO 629','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (233,NULL,'','STICCO ABEL','28 DE JULIO 708','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (234,NULL,'','DENTO IMAGEN S.H.','28 DE JULIO 708','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (235,NULL,'','ARCE AIDA ESTER','28 DE JULIO 784','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (236,NULL,'','PEREZ PATRICIA','28 DE JULIO 793','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (237,NULL,'','HOSPITAL ZONAL TRELEW','28 DE JULIO Nº 140','HOSPITAL','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (238,NULL,'','COOP. ELECTRICA DE TW. (SEPELIO)','28 DE JULIO Nº 1860','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (239,NULL,'','CONSULTORIOS EXTERNOS (H.Z.T.)','28 DE JULIO Nº 434','HOSPITAL','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (240,NULL,'','STAGNITTA GRACIELA','28 DE JULIO Nº 527','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (241,NULL,'','FARMACIA YRIGOYEN','28 DE JULIO Nº 660','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (242,NULL,'','DE MORENO MARISA','28 DE JULIO Nº 702','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (243,NULL,'','CARDOSO CRISTINA','28 DE JULIO Nº 708','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (244,NULL,'','LEYRIA FERNANDO','28 DE JULIO Nº 784','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (245,NULL,'','ROBERTO MARTINEZ','28 DE JULIO Nº 831','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (246,NULL,'','QUIROGA LILIANA','28 DE JULIO Nº527','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (247,NULL,'','CONTINI HECTOR','28 DE JULIO Nº553','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (248,NULL,'','FARMACIA ADOS','28 DE JULIO Nº722','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (249,NULL,'','ENFERMERIA FLEMING','9 DE JULIO 427','ENFERMERÍAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (250,NULL,'','LOSTRA OSCAR','9 DE JULIO 742','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (251,NULL,'','SANCHEZ CORDI MARIANO','9 DE JULIO 742','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (252,NULL,'','DA FONSECA PABLO','9 DE JULIO 772','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (253,NULL,'','CUART ORLANDO GABRIEL','9 DE JULIO 772','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (254,NULL,'','CEMOD','9 DE JULIO Nº 128-LOC 2','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (255,NULL,'','CLINICA VETERINARIA DEL SUR GUSTAVO TALAVERA','9 DE JULIO Nº 138','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (256,NULL,'','CUERPO MEDICO FORENSE (ZARATE)','9 DE JULIO Nº 261','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (257,NULL,'','ADMINISTRACION JUDICIAL TRELEW (SECUESTROS)','9 DE JULIO Nº 261 2º PISO','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (258,NULL,'','MINIST.PUB.FISCAL(SECUESTROS BIOLOGICOS)','9 DE JULIO Nº 261 2º PISO','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (259,NULL,'','BALUL LEILA','9 DE JULIO Nº 772','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (260,NULL,'','FARMACIA ANIKA','9 DE JULIO Y MITRE','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (261,NULL,'','TENOVSKI MONICA','A P BELL 655','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (262,NULL,'','LIMA CRISTIAN','A.P.BELL Nº 702','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (263,NULL,'','CENTRO DE ESPEC. MEDICAS Y ODONTOLOGICAS','ALBERDI Nº 466','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (264,NULL,'','LUXOR S.R.L.','ALEM Nº 325','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (265,NULL,'','COLANTONIO LEANDRO','ALEM Nº 825 (ENTRE CARRASCO Y MUZIO)','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (266,NULL,'','PERIF. VILLA ITALIA','ALEM Y LOVE PARRI','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (267,NULL,'','DIAGNÓSTICO CARDIOVASCULAR','AMEGHINO N°264','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (268,NULL,'','FRACASSO AMELA','AMEGHINO N°275','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (269,NULL,'','DAYLOPLAS DE JOSE LUIS SUAREZ','AMEGHINO N°375','PODOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (270,NULL,'','S.A.P.P. S.R.L.','AMEGHINO N°447','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (271,NULL,'','AUSTRAL','AMEGHINO N°447','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (272,NULL,'','VETERINARIA CANTO','AMEGHINO N°473','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (273,NULL,'','MEDICINA NUCLEAR S.R.L.','AMEGHINO N°474 1º PISO','ENFERMERÍAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (274,NULL,'','NATIVUS S.R.L','AMEGHINO N°902 ESQ. LIBERTAD','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (275,NULL,'','PERIF. ETCHEPARE','ARTIGAS Y CAMBRIN','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (276,NULL,'','BIANCOTTI-BONAFINA','AV. GALES 323','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (277,NULL,'','FARMACIA CHANGO MAS (WALMART S.R.L)','AVDA. EVA PERÓN Nº719','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (278,NULL,'','LOPEZ JULIAN MARINO','AVENIDA RAWSON Nº 423','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (279,NULL,'','SOLIVELLA MARIA SILVIA','Bª LOS MIMBRES-CHACRA 86','PODOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (280,NULL,'','KRISTOFIS CLAUDIA','BELGRANO N° 240 2° B','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (281,NULL,'','GIL GUERRERO FRANCISCO','BELGRANO N° 240 2º "A"','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (282,NULL,'','CASTAN PABLO','BELGRANO N° 525','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (283,NULL,'','FESTA ROBERTO','BELGRANO N° 558','PODOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (284,NULL,'','CICCIA ADRIAN','BELGRANO N° 586','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (285,NULL,'','MAIRAL EDUARDO','BELGRANO N° 618','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (286,NULL,'','NEUROCIENCIA S.A','BELGRANO N°1008 ESQ      RONDEAU','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (287,NULL,'','CONSULTORIOS CABOT DE CALANDRIA JOSÉ','BELGRANO N°1097','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (288,NULL,'','NAZAR MARIA CRISTINA','BOLIVIA 662 EX 30','OTALMOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (289,NULL,'','PERIF. CORRADI','BURMEISTER Y PASCUAL DALEOSO','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (290,NULL,'','VALENCIA ELISA','CABOT 410','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (291,NULL,'','CIMADEVILLA MARIANA','CABOT 684','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (292,NULL,'','VETERINARIA YOPPEN','CABOT Nº 680','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (293,NULL,'','GALIANO DANIEL','CAMBRIN 1562','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (294,NULL,'','ORBUJ ALDO','CAMBRYN Y BELGRANO','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (295,NULL,'','PERIF. SAN MARTIN','CARLOS GARDEL Y SOLDADO ORTEGA','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (296,NULL,'','LOCATELLI  NICOLAS LUCIANO','CENTENARIO 51','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (297,NULL,'','PEREYRA PABLO','CENTENARIO 51','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (298,NULL,'','SALUD MENTAL Y ADICCIONES DEL HOSPITAL ZONAL TW','CHILE 37','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (299,NULL,'','VETERINARIA DIAGNOVET S.R.L.','CHILE 73','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (300,NULL,'','MARTINEZ HAYDEE','CHILE Nº 173','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (301,NULL,'','GODOY ELSA','CONDARCO Y BROWN','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (302,NULL,'','ARANEDA GUSTAVO','DON BOSCO N° 194','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (303,NULL,'','LOPEZ RUIZ DIAZ JULIO','DON BOSCO N° 291','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (304,NULL,'','BARTELS SERGIO','DON BOSCO N° 291','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (305,NULL,'','BRAMUGLIA BETINA','DON BOSCO N° 291','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (306,NULL,'','BISCONTI LAURA ANTONELLA','DON BOSCO N° 291','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (307,NULL,'','PEREZ ANNA JOSE MAXIMILIANO','DON BOSCO N° 370','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (308,NULL,'','PERIF. LA LOMA','ECUADOR Y RAMON Y CAJAL','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (309,NULL,'','S.E.C. TRELEW','EDISON 330','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (310,NULL,'','GÉNESIS S.H','EDISON N° 430','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (311,NULL,'','FARMACIA SALK','EDISON Y SAN MARTIN','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (312,NULL,'','RENTERIA BELTRAN RUBEN','ESPAÑA 270','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (313,NULL,'','PERIF. CONSTITUCION','ESTADOS ARABES Y AV.LA PLATA','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (314,NULL,'','ACOSTA MONICA','FONTANA 494 ESQ.DON BOSCO','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (315,NULL,'','INST.DEL DIAG.DEL ESTE DEL CH.','GALINA 650','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (316,NULL,'','PRC CHUBUT','GALO LOBATO Nº 5003-PARQUE INDUSTRIAL','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (317,NULL,'','PERIF. PLANTA DE GAS','HERNANDEZ Y JOSE BARRETA S/N','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (318,NULL,'','PAMI','INMIGRANTES N° 122','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (319,NULL,'','ORIVE STELLA MARIS','INMIGRANTES N° 428','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (320,NULL,'','LLARGUES JAVIER','INMIGRANTES N° 490','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (321,NULL,'','INSTITUTO DEL CORAZÓN DEL RÍO DE LA PLATA S.A','INMIGRANTES N° 50','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (322,NULL,'','TREMED S.R.L.','INMIGRANTES N° 50','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (323,NULL,'','PUGH RICARDO','INMIGRANTES N° 53','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (324,NULL,'','CARDIAL TRELEW S.R.L','INMIGRANTES N° 567','CTRO. HEMAT. Y HEMODIALISIS','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (325,NULL,'','LABORATORIO DE ANATOMÍA PATOLÓGICA','ITALIA','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (326,NULL,'','LOPEZ BERTA','ITALIA 170','PODOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (327,NULL,'','PROSATE S.S','ITALIA Y MORENO','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (328,NULL,'','AREA PROGRAMATICA TRELEW','ITALIA Y MORENO','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (329,NULL,'','ADOS TRELEW','ITALIA Y PJE.JUJUY','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (330,NULL,'','ROMBYS NOEMI','JUAN MANUEL DE ROSAS 1639','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (331,NULL,'','ZARO PAULA','JULIO A. ROCA 255 OF 4 E/MITRE Y RIVADAVIA-TW','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (332,NULL,'','SCHULMAN ALBERTO','JULIO A. ROCA N° 123','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (333,NULL,'','GOLDARACENA EDUARDO','JULIO A. ROCA N° 204','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (334,NULL,'','KRAUS MAURICIO','JULIO A. ROCA N° 253','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (335,NULL,'','FALCON MARIA LAURA','JULIO A. ROCA N° 505','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (336,NULL,'','CETHA CARDIOVASCULAR S.R.L.','JULIO A. ROCA N° 850','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (337,NULL,'','VETERINARIA PATAGÓNICA-TRELEW','JULIO A. ROCA Nº 1239 (E/URUGUAY Y ENTRE RÍOS)','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (338,NULL,'','RODRIGUEZ SILVIO','JULIO A. ROCA Nº 607','OTALMOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (339,NULL,'','UNIVERSIDAD SAN JUAN','JULIO A. ROCA Y BELGRANO','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (340,NULL,'','PERIF. DON BOSCO','LOS ANDES NORTE Nº410','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (341,NULL,'','RES.GER. PEWEN KUKU S.R.L.','LOTE 2-CHACRA 93 SUR','GERIATRICOS Y ASILOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (342,NULL,'','VETERINARIA PATAS','MARCONI (N) N° 118','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (343,NULL,'','FELDMAN SERGIO','MARCONI N° 144','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (344,NULL,'','MASSONI NILDA','MARCONI N° 374','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (345,NULL,'','GOMEZ OSCAR','MARCONI N° 374 Y AMEGHINO 503','CTRO. HEMAT. Y HEMODIALISIS','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (346,NULL,'','CLÍNICA SAN PABLO','MARCONI N° 438','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (347,NULL,'','BOVCON FERNANDO','MARCONI N° 508','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (348,NULL,'','BRUNT MAURICIO FABIAN','MARCONI N° 594','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (349,NULL,'','SAHAGUN GARCIA','MITRE 604','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (350,NULL,'','VETERINARIA LAGO-ARAUJO','MITRE Nº 1131','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (351,NULL,'','CORIA CAROLINA YOLANDA','MITRE Nº 183','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (352,NULL,'','FARMA S.R.L (PATAGÓNICA)','MITRE Nº 598','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (353,NULL,'','VETERINARIA DEL SOL','MITRE Nº 674','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (354,NULL,'','ISSS','MITRE Y RAWSON','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (355,NULL,'','CENTRO VETERINARIO TRELEW','MORENO N° 1479 (ENTRE GALINA Y ARON JENKIS)','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (356,NULL,'','LAC TRELEW S.RL','MORENO N° 326Y CABOT Y BE','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (357,NULL,'','INSTITUTO MÉDICO DEL SUR','MORENO N° 333','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (358,NULL,'','ALVAREZ RICARDO','MORENO N° 473','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (359,NULL,'','GRACI GISEL','MORENO N° 473','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (360,NULL,'','CENTRO DE DIA','PARAGUAY N° 237','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (361,NULL,'','CEMIT S.R.L.','PARAGUAY N° 25','EMERGENCIAS MED.','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (362,NULL,'','EMSA SA (SUC TRELEW)','PARAGUAY N° 37','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (363,NULL,'','ASOCIACIÓN DE SANATORIOS','PARAGUAY N° 74','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (364,NULL,'','HAMZE JOSE LUIS','PARAGUAY N° 749','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (365,NULL,'','ELIAS GUSTAVO ENRIQUE','PARAGUAY N° 749-ROCA 1865-PTO MADRYN','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (366,NULL,'','LUNA VICTOR','PECORARO N° 314','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (367,NULL,'','SANATORIO TRELEW S.R.L','PECORARO N° 460','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (368,NULL,'','CAPORALINI   S.A','PECORARO N° 480','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (369,NULL,'','CENTRO DE PEDICURIA','PECORARO N° 567','PODOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (370,NULL,'','VETERINARIA SAN JORGE DE ROXANA GIOVENALE','PECORARO NORTE N° 183','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (371,NULL,'','FERNANDEZ  ALBERTO  EMILIO','PECORARO Y 9 DE JULIO','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (372,NULL,'','FERNANDEZ  ALBERTO  EMILIO','PECORARO Y 9 DE JULIO','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (373,NULL,'','TATOO MAX´S TRELEW','PELLEGRINI N° 1326','TATUAJES','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (374,NULL,'','FARMACIAS PELLEGRINI','PELLEGRINI N° 1632','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (375,NULL,'','VETERINARIA CHUBUT','PELLEGRINI N° 1896','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (376,NULL,'','OSDE BINARIO','PELLEGRINI N° 262','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (377,NULL,'','ALANIZ MARIA LAURA','PELLEGRINI N° 278 OFICINA 3','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (378,NULL,'','NEW MEDIC S.R.L.','PELLEGRINI N° 504','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (379,NULL,'','TAC S.A.','PELLEGRINI N° 590','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (380,NULL,'','CLÍNICA MÉDICA DEL VALLE','PELLEGRINI N° 631','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (381,NULL,'','ANTONENA PATRICIA','PELLEGRINI N° 631','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (382,NULL,'','SCOZZINA JOSE DANIEL','PELLEGRINI N° 631','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (383,NULL,'','ARAMAYO VALERIA','PELLEGRINI N° 655 ESQUINA PARAGUAY','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (384,NULL,'','SEIMANDI LAURA','PELLEGRINI N° 93','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (385,NULL,'','SEIMANDI RAUL','PELLEGRINI N° 93','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (386,NULL,'','VERWAY JOHANNA','PELLEGRINI N° 93','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (387,NULL,'','SPINOSA MARCELA','PERÚ N° 59 CASI SARMIENTO','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (388,NULL,'','ALTA COMPLEJIDAD MÉDICA','PJE. CÓRDOBA 479','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (389,NULL,'','DROGUERIA BRIO S.R.L','PJE. SAN JUAN N° 454','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (390,NULL,'','ASOC.ODONTOLOGICA DEL N.E.CH.','PJE. SAN LUIS N° 455','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (391,NULL,'','FERNANDEZ MARIELA','PJE.SAN JUAN N° 320 2º PISO','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (392,NULL,'','28 DE JULIO Nº 702','PJE.SAN JUAN N° 383','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (393,NULL,'','RES. GERIATRICO"LA FAMILIA"','PJE.SAN LUIS NORTE Nº 704 CASA 267','GERIATRICOS Y ASILOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (394,NULL,'','MOYA CARLOS','PJE.SANTA CRUZ Nº 420','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (395,NULL,'','ARANO PATRICIA GRACIELA','RAMON Y CAJAL Nº 795','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (396,NULL,'','MENDEZ MANUEL MARCELO','RAWSON Nº 437 1º "B"','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (397,NULL,'','ABDALA ALBERTO','RAWSON Nº 580','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (398,NULL,'','MUNICIPALIDAD DE TRELEW','RIVADAVIA N°  390','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (399,NULL,'','CAPACCIONI SUSANA','RIVADAVIA N°  668 1º PISO','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (400,NULL,'','SCHEMBARI JORGE','RIVADAVIA N° 1005 ESQUINA RONDEAU','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (401,NULL,'','FARMACIA PLAZA','RIVADAVIA N° 348','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (402,NULL,'','CLINICA VETERINARIA DR.GARZON MARIO','RIVADAVIA N° 553','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (403,NULL,'','VILA NATHALIA','RIVADAVIA N° 866','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (404,NULL,'','BASE AERONAVAL ALMIRANTE ZAR','Ruta 3 S/N','ENFERMERÍAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (405,NULL,'','PERIF. TIRO FEDERAL','SAAVEDRA Y LEZANA NORTE','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (406,NULL,'','CENTRO MÉDICO GAIMAN S.R.L','SAN MARTÍN N° 1251','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (407,NULL,'','MOLINA MARIANO','SAN MARTIN N° 1579','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (408,NULL,'','YUNES JOSE FRANCISCO','SAN MARTIN N° 306- 1 PISO OF 4','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (409,NULL,'','CARBONE ANA LUCIA','SAN MARTIN N° 541','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (410,NULL,'','GANDOLFO GUSTAVO','SAN MARTIN N° 549','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (411,NULL,'','ERASO EDGARDO','SAN MARTÍN N° 549','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (412,NULL,'','SANATORIO SAN MARTIN','SAN MARTÍN N° 696','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (413,NULL,'','MATERNO INFANTIL','SAN MARTÍN N° 696','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (414,NULL,'','DE MARZO SANDRA NOEMI','SAN MARTÍN N° 697','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (415,NULL,'','ENFERMERIA INTEGRAL','SAN MARTIN N° 815','ENFERMERÍAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (416,NULL,'','DOLHEGUY BRAVO FLORENCIA','SAN MARTIN N° 875','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (417,NULL,'','CLINICA SAN MIGUEL (MERKER SERGIO)','SAN MARTÍN N° 898','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (418,NULL,'','SOFIMED S.R.L','SAN MARTÍN N° 898','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (419,NULL,'','TERAPIA INTENSIVA NATIVUS S.R.L','SAN MARTÍN N° 899 1° PISO','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (420,NULL,'','DROGUERIA MEDICAL TOOLS S.R.L','SAN MARTIN Nº 1182','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (421,NULL,'','CAORSI LUIS FRANCISCO','SAN MARTIN Nº 624','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (422,NULL,'','ROSTAGNO JIUDICI LUCIANO MARIO','SAN MARTIN Nº 624','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (423,NULL,'','DI.B.A.C   S. R. L','SAN MARTIN Nº 856','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (424,NULL,'','CARRIZO LIDIA','SAN MARTIN Nº 898','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (425,NULL,'','MEDIVEN S.A','SAN MARTIN Nº 971','LABORATORIO','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (426,NULL,'','SOSA CABALLERO','SAN MARTIN Y PECORARO','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (427,NULL,'','FARMACIA DASU','SARMIENTO N° 325','FARMACIAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (428,NULL,'','D.A.S.U.(CONSULT.ODONTOLÓGICO)','SARMIENTO N° 340','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (429,NULL,'','MARIGUAL JORGE','SARMIENTO N° 595','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (430,NULL,'','MOHR EDGARDO','SARMIENTO Nº 268','PODOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (431,NULL,'','WHITE TRASH TATOO','SARMIENTO Nº 523','TATUAJES','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (432,NULL,'','RITUAL TATOO & PIERCING','SARMIENTO Nº 584','TATUAJES','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (433,NULL,'','WILLIAMS DIANA KARINA','SARMIENTO Nº 594 (ENTRE PERÚ Y HONDURAS)','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (434,NULL,'','MARIGUAL CARLOS','SARMIENTO Nº 595','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (435,NULL,'','HOGAR “LOS NONOS”','SCALABRINI ORTIZ Y MAIPÚ','GERIATRICOS Y ASILOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (436,NULL,'','ALCAIDIA POLICIAL-CENTRO DE DETENCIÓN','SOB. NAC. Y CUBA-LOBATO Y PATRICIAS ARG.','ENFERMERÍAS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (437,NULL,'','VETERINARIA LOS CENCERROS','SOB.NACIONAL Y PELLEGRINI','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (438,NULL,'','HOG.DE ANCIANOS"PEDRO DETTORI"','SOBERANÍA NACIONAL 2000','GERIATRICOS Y ASILOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (439,NULL,'','CAMPOS ANTONIO','SOBERANÍA NACIONAL N° 410(CONS. DR CAMPOS)','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (440,NULL,'','BUGALLO SEBASTIAN PABLO','SOBERANÍA NACIONAL N° 801(ESQ.MARCONI)','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (441,NULL,'','GONZALEZ PUNTER ANDREA','SOBERANÍA NACIONAL N° 96','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (442,NULL,'','POLANCO HÉCTOR','SOBERANÍA NACIONAL N° 99','ODONTÓLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (443,NULL,'','CENTRO ESPECIALIDADES OFTALMOLÓGICAS (CEO)','SOBERANÍA NACIONAL Nº 284','OTALMOLOGOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (444,NULL,'','HOGAR DE ADULTOS MAYORES" LA CASA DE LILI"','SOBERANÍA NACIONAL Nº 3440','GERIATRICOS Y ASILOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (445,NULL,'','VETERINARIA DIOGENES','SOBERANÍA NACIONAL Y BELGRANO','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (446,NULL,'','VETERINARIA SURVET','URQUIZA Nº 1041','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (447,NULL,'','OBRA SOCIAL DE COND. CAMIONEROS','URQUIZA Nº 255','VARIOS','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (448,NULL,'','PERIF. SARMIENTO','VEGWYN ENTRE BS.AS Y URUGUAY','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (449,NULL,'','NICADPI','VELERO MIMOSA Y ALEM','CENTROS DE SALUD','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (450,NULL,'','VETERINARIA BRYN GWYN','YRIGOYEN N° 1580','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (451,NULL,'','VETERINARIA ANIMAL','YRIGOYEN N° 2013','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (452,NULL,'','ATHENEA S.A.','YRIGOYEN N° 2315','CLINICAS Y SANAT.','1,2,3,4,5','','','','',NULL,NULL,2);
INSERT INTO `modulo_I_establecimientogenerador` (id,nro_inscripcion,activo,razon_social,direccion,tipo_actividad,recoleccion,telefono,email,responsable_ambiental,cuit,nro_parada,cuadrante_id,localidad_id) VALUES (453,NULL,'','CLINICA VETERINARIA INTEGRAL','YRIGOYEN Nº 846','VETERINARIA','1,3,5','','','','',NULL,NULL,2);
CREATE TABLE IF NOT EXISTS `modulo_I_detallehojaruta` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`hora_llegada`	time,
	`hora_salida`	time,
	`nro_precinto`	bigint UNIQUE,
	`tipo`	varchar ( 15 ) NOT NULL,
	`balde_id`	bigint NOT NULL,
	`establecimiento_generador_id`	integer NOT NULL,
	`hoja_ruta_id`	integer NOT NULL,
	FOREIGN KEY(`balde_id`) REFERENCES `modulo_I_balde`(`nro_balde`),
	FOREIGN KEY(`hoja_ruta_id`) REFERENCES `modulo_I_hojaruta`(`id`),
	FOREIGN KEY(`establecimiento_generador_id`) REFERENCES `modulo_I_establecimientogenerador`(`id`)
);
CREATE TABLE IF NOT EXISTS `modulo_I_cuadrante` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nombre_cuadrante`	varchar ( 50 ) NOT NULL UNIQUE,
	`sector_id`	integer,
	FOREIGN KEY(`sector_id`) REFERENCES `modulo_I_sector`(`id`)
);
CREATE TABLE IF NOT EXISTS `modulo_I_baldepactado` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`capacidad_balde`	varchar ( 5 ) NOT NULL,
	`color_precinto`	varchar ( 15 ) NOT NULL,
	`cantidad`	integer NOT NULL UNIQUE,
	`establecimiento_generador_id`	integer,
	FOREIGN KEY(`establecimiento_generador_id`) REFERENCES `modulo_I_establecimientogenerador`(`id`)
);
CREATE TABLE IF NOT EXISTS `modulo_I_balde` (
	`nro_balde`	bigint NOT NULL,
	`capacidad`	varchar ( 5 ) NOT NULL,
	`estado`	varchar ( 15 ) NOT NULL,
	`establecimiento_generador_id`	integer,
	PRIMARY KEY(`nro_balde`),
	FOREIGN KEY(`establecimiento_generador_id`) REFERENCES `modulo_I_establecimientogenerador`(`id`)
);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (1,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (2,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (3,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (4,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (5,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (6,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (7,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (8,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (9,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (10,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (11,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (12,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (13,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (14,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (15,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (16,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (17,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (18,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (19,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (20,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (21,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (22,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (23,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (24,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (25,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (26,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (27,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (28,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (29,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (30,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (31,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (32,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (33,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (34,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (35,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (36,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (37,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (38,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (39,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (40,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (41,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (42,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (43,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (44,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (45,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (46,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (47,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (48,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (49,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (50,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (51,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (52,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (53,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (54,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (55,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (56,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (57,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (58,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (59,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (60,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (61,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (62,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (63,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (64,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (65,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (66,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (67,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (68,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (69,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (70,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (71,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (72,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (73,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (74,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (75,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (76,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (77,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (78,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (79,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (80,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (81,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (82,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (83,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (84,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (85,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (86,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (87,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (88,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (89,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (90,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (91,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (92,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (93,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (94,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (95,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (96,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (97,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (98,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (99,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (100,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (101,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (102,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (103,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (104,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (105,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (106,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (107,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (108,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (109,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (110,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (111,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (112,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (113,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (114,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (115,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (116,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (117,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (118,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (119,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (120,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (121,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (122,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (123,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (124,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (125,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (126,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (127,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (128,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (129,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (130,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (131,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (132,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (133,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (134,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (135,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (136,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (137,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (138,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (139,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (140,'50','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (141,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (142,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (143,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (144,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (145,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (146,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (147,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (148,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (149,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (150,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (151,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (152,'120','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (153,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (154,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (155,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (156,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (157,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (158,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (159,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (160,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (161,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (162,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (163,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (164,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (165,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (166,'240','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (167,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (168,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (169,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (170,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (171,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (172,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (173,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (174,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (175,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (176,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (177,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (178,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (179,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (180,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (181,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (182,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (183,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (184,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (185,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (186,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (187,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (188,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (189,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (190,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (191,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (192,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (193,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (194,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (195,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (196,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (197,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (198,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (199,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (200,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (201,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (202,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (203,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (204,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (205,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (206,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (207,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (208,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (209,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (210,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (211,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (212,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (213,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (214,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (215,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (216,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (217,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (218,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (219,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (220,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (221,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (222,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (223,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (224,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (225,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (226,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (227,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (228,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (229,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (230,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (231,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (232,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (233,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (234,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (235,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (236,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (237,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (238,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (239,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (240,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (241,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (242,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (243,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (244,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (245,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (246,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (247,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (248,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (249,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (250,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (251,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (252,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (253,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (254,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (255,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (256,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (257,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (258,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (259,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (260,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (261,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (262,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (263,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (264,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (265,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (266,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (267,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (268,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (269,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (270,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (271,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (272,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (273,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (274,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (275,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (276,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (277,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (278,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (279,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (280,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (281,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (282,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (283,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (284,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (285,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (286,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (287,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (288,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (289,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (290,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (291,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (292,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (293,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (294,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (295,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (296,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (297,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (298,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (299,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (300,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (301,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (302,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (303,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (304,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (305,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (306,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (307,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (308,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (309,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (310,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (311,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (312,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (313,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (314,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (315,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (316,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (317,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (318,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (319,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (320,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (321,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (322,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (323,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (324,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (325,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (326,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (327,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (328,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (329,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (330,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (331,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (332,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (333,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (334,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (335,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (336,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (337,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (338,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (339,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (340,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (341,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (342,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (343,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (344,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (345,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (346,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (347,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (348,'10','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (349,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (350,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (351,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (352,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (353,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (354,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (355,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (356,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (357,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (358,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (359,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (360,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (361,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (362,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (363,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (364,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (365,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (366,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (367,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (368,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (369,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (370,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (371,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (372,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (373,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (374,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (375,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (376,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (377,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (378,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (379,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (380,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (381,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (382,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (383,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (384,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (385,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (386,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (387,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (388,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (389,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (390,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (391,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (392,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (393,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (394,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (395,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (396,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (397,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (398,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (399,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (400,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (401,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (402,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (403,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (404,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (405,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (406,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (407,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (408,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (409,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (410,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (411,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (412,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (413,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (414,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (415,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (416,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (417,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (418,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (419,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (420,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (421,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (422,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (423,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (424,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (425,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (426,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (427,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (428,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (429,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (430,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (431,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (432,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (433,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (434,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (435,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (436,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (437,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (438,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (439,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (440,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (441,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (442,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (443,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (444,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (445,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (446,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (447,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (448,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (449,'20','En Planta',NULL);
INSERT INTO `modulo_I_balde` (nro_balde,capacidad,estado,establecimiento_generador_id) VALUES (450,'20','En Planta',NULL);
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar ( 40 ) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
INSERT INTO `django_session` (session_key,session_data,expire_date) VALUES ('6h3y860hcc2o8l1qz7l2aahzh0jsxl6w','MzQxZmNhNjk5ZmY0ZmUxOGZlZjM5YTg1Y2U5N2Y0NjkxY2I5ZDNjNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4Y2FkMTA2M2Y2ODRiZTRkMWRiOGUwYjMxMzcxMTk5ZThmNzQ4NDZhIn0=','2018-03-08 14:46:15.996639');
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app`	varchar ( 255 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	`applied`	datetime NOT NULL
);
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (1,'modulo_I','0001_initial','2018-02-22 14:45:37.997302');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (2,'contenttypes','0001_initial','2018-02-22 14:45:41.882050');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (3,'auth','0001_initial','2018-02-22 14:45:42.035403');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (4,'admin','0001_initial','2018-02-22 14:45:42.224240');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (5,'admin','0002_logentry_remove_auto_add','2018-02-22 14:45:42.412559');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (6,'contenttypes','0002_remove_content_type_name','2018-02-22 14:45:42.642490');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (7,'auth','0002_alter_permission_name_max_length','2018-02-22 14:45:42.825590');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (8,'auth','0003_alter_user_email_max_length','2018-02-22 14:45:43.000286');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (9,'auth','0004_alter_user_username_opts','2018-02-22 14:45:43.199882');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (10,'auth','0005_alter_user_last_login_null','2018-02-22 14:45:43.366596');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (11,'auth','0006_require_contenttypes_0002','2018-02-22 14:45:43.471321');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (12,'auth','0007_alter_validators_add_error_messages','2018-02-22 14:45:43.650013');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (13,'auth','0008_alter_user_username_max_length','2018-02-22 14:45:43.818273');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (14,'sessions','0001_initial','2018-02-22 14:45:43.982864');
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
INSERT INTO `django_content_type` (id,app_label,model) VALUES (7,'modulo_I','balde');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (8,'modulo_I','baldepactado');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (9,'modulo_I','cuadrante');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (10,'modulo_I','detallehojaruta');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (11,'modulo_I','establecimientogenerador');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (12,'modulo_I','hojaruta');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (13,'modulo_I','localidad');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (14,'modulo_I','provincia');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (15,'modulo_I','sector');
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
INSERT INTO `auth_user` (id,password,last_login,is_superuser,first_name,last_name,email,is_staff,is_active,date_joined,username) VALUES (1,'pbkdf2_sha256$36000$fotsmvIoQhDD$QCvkKHzwVW8RGQWhS2vmbGJjlShxusL/RqAw5PnJXAk=','2018-02-22 14:46:15.891543',1,'','','',1,1,'2018-02-22 14:45:55.033533','fedde');
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
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (19,7,'add_balde','Can add balde');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (20,7,'change_balde','Can change balde');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (21,7,'delete_balde','Can delete balde');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (22,8,'add_baldepactado','Can add balde pactado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (23,8,'change_baldepactado','Can change balde pactado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (24,8,'delete_baldepactado','Can delete balde pactado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (25,9,'add_cuadrante','Can add cuadrante');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (26,9,'change_cuadrante','Can change cuadrante');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (27,9,'delete_cuadrante','Can delete cuadrante');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (28,10,'add_detallehojaruta','Can add detalle hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (29,10,'change_detallehojaruta','Can change detalle hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (30,10,'delete_detallehojaruta','Can delete detalle hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (31,11,'add_establecimientogenerador','Can add establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (32,11,'change_establecimientogenerador','Can change establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (33,11,'delete_establecimientogenerador','Can delete establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (34,12,'add_hojaruta','Can add hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (35,12,'change_hojaruta','Can change hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (36,12,'delete_hojaruta','Can delete hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (37,13,'add_localidad','Can add localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (38,13,'change_localidad','Can change localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (39,13,'delete_localidad','Can delete localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (40,14,'add_provincia','Can add provincia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (41,14,'change_provincia','Can change provincia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (42,14,'delete_provincia','Can delete provincia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (43,15,'add_sector','Can add sector');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (44,15,'change_sector','Can change sector');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (45,15,'delete_sector','Can delete sector');
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`),
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`)
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 80 ) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS `modulo_I_sector_localidad_id_540f145e` ON `modulo_I_sector` (
	`localidad_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_localidad_provincia_id_f1042493` ON `modulo_I_localidad` (
	`provincia_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_localidad_id_568a56ed` ON `modulo_I_establecimientogenerador` (
	`localidad_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_cuadrante_id_4a7c9e5e` ON `modulo_I_establecimientogenerador` (
	`cuadrante_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_detallehojaruta_hoja_ruta_id_01c32260` ON `modulo_I_detallehojaruta` (
	`hoja_ruta_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_detallehojaruta_establecimiento_generador_id_33e9f576` ON `modulo_I_detallehojaruta` (
	`establecimiento_generador_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_detallehojaruta_balde_id_364b2447` ON `modulo_I_detallehojaruta` (
	`balde_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_cuadrante_sector_id_02195739` ON `modulo_I_cuadrante` (
	`sector_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_baldepactado_establecimiento_generador_id_cb0f0b20` ON `modulo_I_baldepactado` (
	`establecimiento_generador_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_balde_establecimiento_generador_id_baae9b57` ON `modulo_I_balde` (
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
