BEGIN TRANSACTION;
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
INSERT INTO `modulo_I_localidad` (id,nombre,cp,provincia_id) VALUES (1,'TRELEW',9100,1);
INSERT INTO `modulo_I_localidad` (id,nombre,cp,provincia_id) VALUES (2,'MADRYN',9120,1);
INSERT INTO `modulo_I_localidad` (id,nombre,cp,provincia_id) VALUES (3,'RAWSON',9103,1);
CREATE TABLE IF NOT EXISTS `modulo_I_hojaruta` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`fecha_recorrido`	date NOT NULL,
	`hora_llegada`	time NOT NULL,
	`hora_salida`	time NOT NULL
);
CREATE TABLE IF NOT EXISTS `modulo_I_establecimientogenerador` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`razon_social`	varchar ( 50 ) NOT NULL,
	`direccion`	varchar ( 100 ) NOT NULL,
	`tipo_actividad`	varchar ( 400 ) NOT NULL,
	`recoleccion`	varchar ( 13 ),
	`telefono`	varchar ( 50 ),
	`responsable_ambiental`	varchar ( 50 ),
	`cuit`	varchar ( 20 ),
	`sector`	integer,
	`localidad_id`	integer NOT NULL,
	`email`	varchar ( 50 ),
	FOREIGN KEY(`localidad_id`) REFERENCES `modulo_I_localidad`(`id`)
);
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (1,'ALMA TATTOO','Av. Roca 297','Tatuajes','','154563399','Villavicencio Sergio',NULL,NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (2,'ALPHA MEDICINA OCUPACIONAL','25 de Mayo 125 P. B.','Consultorio médico','1,3,5','4472252','Lorea Nestor Francisco','',NULL,2,'alphamedoc@live.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (3,'ANAKAINOSIS','M.T. Alvear 395','Hogar de ancianos','1,3,5','4454185','Cadagan Viviana','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (4,'ASESORIA MEDICA DEL TRABAJO SH','Belgrano 359','Consultorio médico','1,3,5','4451410','Roitberg Victor- Panigadi Guillermo','',NULL,2,'cemelab@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (5,'ASOCIACIÓN ARGENTINA DE CAPITANES Y PATRONES DE PESCA (Farmacia C Pesca)','Roque S. Peña 386','farmacia','1,3,5','4450315','Nicosia Elvecia Pilar Elizabeth','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (6,'ASOCIACIÓN CIVIL CIUDADANOS COMPROMETIDOS CON LA SOCIEDAD','Mendoza 950','Consultorio médico','1,3,5','154363357','Campos Aldo R.','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (7,'ASOCIACION DE OBRAS SOCIALES DE TRELEW - ADOS','Mitre 476','Farmacia','1,3,5','4470366','Tirador Milagros','',NULL,2,'farmaciaadospm@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (8,'BANCO DE SANGRE DE PUERTO MADRYN','Estivariz 260','Laboratorio de análisis clínicos','1,2,3,4,5','4456000','Manera Guillermo Oscar','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (9,'BIOMAD S.R.L.','Belgrano 198 - Of. 7','Laboratorio de análisis clínicos','1,2,3,4,5','154604101','Heck Graciela Alicia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (10,'BRANDO NORBERTO','Av. Roca 353. 1º Piso','Consultorio médico','1,3,5','4451638','Brando Norberto','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (11,'BUSTAMANTE HERNAN CARLOS','28 de julio 570','Consultorio odontológico','1,3,5','154620355 - 4458795','Bustamante Hernan Carlos','',NULL,2,'herbus@speddy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (12,'CABRAL EDA','Av. Roca 353. 5to Piso. Ofic. 2','Consultorio odontológico','1,3,5','4475883','Cabral Eda','',NULL,2,'consultoriomoz@yahoo.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (13,'CARDIAL PUERTO MADRYN S.A.','Marcos A. Zar 646','Centro de hemodiálisis','1,2,3,4,5','4457548 - 4458669','Tartaglione Julio Cesar','',NULL,2,'cardialmadryn@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (14,'CATALAN LUIS ALBERTO','Los Aromos - Quintas el Mirador','Hogar de ancianos','1,3,5','4474316 - 154590430','Catalan Luis Alberto','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (15,'CECVA S/H','Av. Roca 353 - 4º Piso - Ed. Roca II - Dto 6','Consultorio médico','1,3,5','4455892','Bauk Lucas - Costa Hector A.','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (16,'CEDIM','Gales 148','Centro de diagnostico por imágenes','1,3,5','4456357','Tempesta Rodrigo','',NULL,2,'info@cedimdigital.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (17,'CENTRO DE LA VISIÓN','Marcos A. Zar 537','Consultorio médico','1,2,3,4,5','4455500','Federico Luis','',NULL,2,'centrodelavision@infovia.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (18,'CENTRO DE ORTODONCIA: Reule','25 de Mayo 364 1º Piso. Of. 3','Consultorio odontológico','1,3,5','4455539','Reule María Carolina','',NULL,2,'centrodeortodonciacr@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (19,'CENTRO DE REHABILITACION PEDIATRICO','San Martin 720','Consultorio médico','1,3,5','s/d','Ledesma Lozano Maria Amparo','',NULL,2,'amparo_ledesma@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (20,'CENTRO DIAGNOSTICO SAN JORGE S.R.L.','Gob. Maiz 830','Centro de diagnóstico','1,2,3,4,5','','Schonfeld Daniel','',NULL,2,'ecodoppler@yahoo.com.ar.');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (21,'CENTRO MEDICO DE LA AVENIDA','Av. Gales 246','Consultorio médico','1,2,3,4,5','4471737 - 4471682','Perez Maria Graciela','',NULL,2,'graprovidencia@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (22,'CENTRO ODONTOLOGICO PUERTO MADRYN','Roque S. Peña 399','Consultorio odontológico','1,3,5','4454774','Etcharran Ricardo Julio','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (23,'CENTRO OFTALMOLOGICO PUERTO MADRYN','Mitre 770','Consultorio médico','1,2,3,4,5','4475088','Linares de la Cal Jorge A.','',NULL,2,'jlinaresdelacal@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (24,'CENTRO ONCOLOGICO PUERTO MADRYN','Moreno 165','Consultorio médico','1,2,3,4,5','4456699','Gallina Nanni Carlos Roman','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (25,'CEVET SUR','Av. Roca 1488','Veterinaria','1,3,5','4474783','Martinez Gonzalez Luis Alberto','',NULL,2,'martinez gonzalesluis@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (26,'CHICHI MAGDALENA','San Martin 286','Consultorio médico','1,3,5','154600170','Chichi Magdalena','',NULL,2,'magdalenachichi@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (27,'CHP','Rivadavia 257','Consultorio médico','1,3,5','4455254','Boeno Marta Sara','',NULL,2,'marboero@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (28,'CIK','25 de Mayo 566','Consultorio de kinesiologia','1,3,5','154604653','Basilico Sonia Beatriz','',NULL,2,'cik_puertomadryn@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (29,'CITEN','Mitre 483','Consultorio médico','1,3,5','154457064','Meternicht Marisa','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (30,'CLINICA ADOS','Mitre 472','Consultorio médico','1,2,3,4,5','4472548','Nuñez Guillermo','',NULL,2,'santamaria-pm@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (31,'CLINICA MEDICA VITANGELO DANIELE','España 215','Consultorio médico','1,3,5','154342664','Vitangelo Daniele','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (32,'CLINICA ODONTOLOGICA MONICA GIL','Juan Muzzio 886','Consultorio odontológico','1,3,5','154303727','Gil Monica','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (33,'CLINICA VETERINARIA HUELLA','Sarmiento 858','Veterinaria','1,3,5','154518400','Sylwan Diego Jorge','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (34,'CLINICA VETERINARIA PATAGONICA','Mitre 2310','Veterinaria','1,3,5','154407295','Rodriguez Silvina Vanesa','',NULL,2,'silvinarode@infovia.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (35,'CLINICA Y MATERNIDAD SANTA MARIA','Mitre 651','Clínica','1,2,3,4,5','4458726 - 4472548','Nuñez Guillermo Federico','',NULL,2,'santamaria-pm@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (36,'COE','Yrigoyen 650','Consultorio odontológico','1,3,5','4470423','Koenig  Diego Martin David','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (37,'COGUAI YENU','Tierra del Fuego y Estivariz','Veterinaria','1,3,5','154402968','D´Aragona Estefania','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (38,'CONSALUD S.H','Mitre 696','Consultorio médico','1,3,5','4452020','Castillo Gisela Vanesa','',NULL,2,'consultoioconsalud@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (39,'CONSULTORIO CARDIOLOGIA: Soumolou','ed. Roca II piso 8 of. 3','Consultorio médico','1,3,5','4482872 - 154673088','Soumoulou Juan','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (40,'CONSULTORIO DE FONOAUDIOLOGIA: Dominguez','Av. Roca 353 - 4º Piso - Ed. Roca II - Dto 4','Consultorio médico','1,3,5','154567311','Dominguez Laura Daniela','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (41,'CONSULTORIO De KINESIOLOGIA SUR','Av. Roca 1639','Consultorio de kinesiologia','1,3,5','4474437','Peñalozo Veronica','',NULL,2,'jazminpeñaloza@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (42,'CONSULTORIO DE KLOGIA','Sarmiento  427','Kinesiología','1,3,5','4474799','Allende Maxwell Cecilia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (43,'CONSULTORIO DE LA COSTA','España 4','Consultorio médico','1,3,5','4456699','Vacarezza Viviana','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (44,'CONSULTORIO DE MADRYN','San Martin 596','Consultorio médico','1,3,5','154273282','Arguelles Ana A.','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (45,'CONSULTORIO DE PODOLOGIA: Munar','Av. Gales 246','Consultorio médico','1,3,5','154670805','Munar Monasterio Cristian','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (46,'CONSULTORIO GINECOLOGICO MONICA BLUM','Estivariz 233','Consultorio médico','1,3,5','4472223','Dyksztein de Blum Monica','',NULL,2,'aymblum@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (47,'CONSULTORIO MEDICO','Av. Roca 353 6º piso. Of. B','Consultorio médico','1,3,5','4458868','Juarez Manuel Sebastian','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (48,'CONSULTORIO MEDICO DE LA MUJER','28 de Julio 348','Consultorio médico','1,3,5','4450136','Gambande Nelida Josefina','',NULL,2,'njgambande@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (49,'CONSULTORIO MEDICO DR. ARCE','Estivariz 197','Consultorio médico','1,3,5','154507777','Arce Fernando Luís','',NULL,2,'drfla@yahoo.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (50,'CONSULTORIO MEDICO FERNANDEZ','Belgrano 198','Consultorio médico','1,3,5','4457579','Fernández Ana Maria','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (51,'Consultorio Médico LLapemn','H. Yrigoyen 673. 1piso. Of. 2','Consultorio Médico','1,3,5','4475692 - 154292477','Corbalan Hugo','',NULL,2,'hcorbalanc2@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (52,'CONSULTORIO MEDICO: ABRANY','Mitre 107 - 5º Piso','Consultorio médico','1,3,5','4472627','Abrany Fortunato','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (53,'CONSULTORIO MEDICO: ALEJANDRO BLUM','Av. Roca 353. Piso 7','Consultorio médico','1,3,5','4472223 - 4474344','Blum Alejandro','',NULL,2,'aymblum@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (54,'CONSULTORIO MEDICO: FARJA','s/d','Consultorio médico','1,3,5','s/d','Farja Carlos','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (55,'CONSULTORIO NEUROREHABILITACION','Villarino 250','Consultorio médico','1,3,5','154585142','Slucinse Paula','',NULL,2,'pauslu@hotmail.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (56,'CONSULTORIO ODONTOLOGICO','Sarmiento 181','Consultorio odontológico','1,3,5','s/d','Santano Matias','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (57,'CONSULTORIO ODONTOLOGICO ARRECHEA','Roque S. Peña 399','Consultorio odontológico','1,3,5','4454774','Arrechea Ismael Lisandro','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (58,'CONSULTORIO ODONTOLOGICO COSENTINO','Agustin Pujol 706','Consultorio odontológico','1,3,5','154455539','Cosentino Lorena Andrea','',NULL,2,'centrodeortodonciacr@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (59,'CONSULTORIO ODONTOLOGICO CRISTINA ALCUAZ','Sarmiento 181','Consultorio odontológico','1,3,5','4456324','Alcuaz Maria','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (60,'CONSULTORIO ODONTOLOGICO GIORDANO','Roque S. Peña 399','Consultorio odontológico','1,3,5','s/d','Giordano Silvina','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (61,'CONSULTORIO ODONTOLOGICO GONZALEZ PUNTER','Roque S. Peña 399','Consultorio odontológico','1,3,5','4454774','Gonzalez Punter Mauricio','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (62,'CONSULTORIO ODONTOLOGICO HIGUERA','Roque S. peña 399','Consultorio odontológico','1,3,5','154418505','Higuera Magdalena','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (63,'CONSULTORIO ODONTOLOGICO LAURA GUERRERO','Sarmiento 181','Consultorio odontológico','1,3,5','4456324','Guerrero Laura','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (64,'CONSULTORIO ODONTOLOGICO LAZARO','Agustin Pujol 706','Consultorio odontológico','1,3,5','154360418 - 4457974','Lazaro Andrea Laura','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (65,'CONSULTORIO ODONTOLOGICO MACCIONE','25 de Mayo 1254','Consultorio odontológico','1,3,5','4457630','Macchione Victorio','',NULL,2,'madryndent@yahoo.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (66,'CONSULTORIO ODONTOLOGICO MARIO MARIN','Sarmiento 181','Consultorio odontológico','1,3,5','4456324','Marin Mario','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (67,'CONSULTORIO ODONTOLOGICO MILANESIO','25 de Mayo 484','Consultorio odontológico','1,3,5','s/d','Milanesio Natalia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (68,'CONSULTORIO ODONTOLOGICO MONICA SEGOVIA','Av. Roca 353 entrepiso oficina 11','Consultorio odontológico','1,3,5','4452072','Segovia Mónica','',NULL,2,'dramonicasegovia@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (69,'CONSULTORIO ODONTOLOGICO QUAINTENNE','25 de Mayo 1254','Consultorio odontológico','1,3,5','4457630','Quaintenne Pablo R.','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (70,'CONSULTORIO ODONTOLOGICO REDONDO','28 de Julio 247 1ºB','Consultorio odontológico','1,3,5','4456192','Redondo Carlos Alcides','',NULL,2,'consultorioesteticadental@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (71,'CONSULTORIO ODONTOLOGICO SANTANO','Mitre 477','Consultorio odontológico','1,3,5','154946432','Santano Matias Ezequiel','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (72,'CONSULTORIO ODONTOLOGICO SEMPER NATALIA','Triunvirato 286','Consultorio odontológico','1,3,5','154600340','Semper Natalia','',NULL,2,'dra.nataliasemper@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (73,'CONSULTORIO ODONTOLOGICO: Baggio','Love Parry 109','Consultorio odontológico','1,3,5','4458428','Baggio Maria Fernanda','',NULL,2,'maferbaggio@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (74,'CONSULTORIO ODONTOLOGICO: Kfuri','Love Parry 109','Consultorio odontológico','1,3,5','4458428','Kfuri Natalia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (75,'CONSULTORIO ODONTOLÓGICO: LOPEZ GERARDO','Av. Roca 353 Entrepiso A','Consultorio odontológico','1,3,5','154577931','Lopez Gerardo','',NULL,2,'gerarlopez@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (76,'CONSULTORIO ODONTOLOGICO: Ruiz','Love Parry 109','Consultorio odontológico','1,3,5','4458428','Ruiz Daniel C.','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (77,'CONSULTORIO ODONTOLOGICO: Savachuck','28 de julio 348','Consultorio odontológico','1,3,5','4450135','Savachuck Marcio','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (78,'CONSULTORIO ODONTOLOGICO: Vera','Av. Roca 353 - entrepiso - Dto. A','Consultorio odontológico','1,3,5','4456026','Vera Pablo','',NULL,2,'verapablo@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (79,'CONSULTORIO ODONTOLOGICO: Ziegenbalg','s/d','Consultorio odontológico','1,3,5','s/d','Ziegenbalg Carina','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (80,'CONSULTORIO OFTALMOLOGICO DE ALTA COMPLEJIDAD','25 de mayo 560','Consultorio médico','1,2,3,4,5','4471282','Mazzeo Maria Gabriela','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (81,'CONSULTORIO ORTODONCIA: Monsalve','Av. Roca 353. Piso 8. Of. 3','Consultorio odontológico','1,3,5','4472872','Monsalve Miriam Zulli','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (82,'CONSULTORIO PILAR','España 125','Consultorio médico','1,3,5','4455821','Garcia Perez Fernando','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (83,'CONSULTORIO PRIVADO: Calandra','Av. Roca 353 4º piso dpto 4','Consultorio odontológico','1,2,3,4,5','4475566','Calandra Alfredo','',NULL,2,'alfredocalandra@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (84,'CONSULTORIO PSICOLOGICO','San Martin 286','Consultorio psicologico','1,3,5','154205483','Vera Maria Agustina Marta','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (85,'CONSULTORIO PSICOLOGICO','Belgrano 198','Consultorio psicologico','1,3,5','154613102','Medici Analia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (86,'CONSULTORIO PSICOLOGICO: Guañabens','Av. Roca 353 Piso Nº 3 Ofic. 2','Consultorio médico','1,3,5','154666527','Guañabens Pablo','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (87,'CONSULTORIO PSICOLOGICO: Medici','Belgrano 198 oficina 9','Consultorio médico','1,3,5','154613102','Medici Analía Verónica','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (88,'CONSULTORIO REY','Albarracin 264','Consultorio odontológico','1,3,5','154722514','Rey Alberto Sebastián','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (89,'CONSULTORIO TRAUMATOLOGÍA: Barbosa','25 de Mayo 1094','Consultorio médico','1,3,5','4457333','Barbosa Lucas Martin','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (90,'CONSULTORIO: IRIARTE','Sarmiento 79','Consultorio médico','1,3,5','4451657','Iriarte Juan Carlos','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (91,'CONSULTORIOS BAROS','Av. Gales 486','Consultorio médico','1,3,5','154546862','Taiariol Maria Teresa','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (92,'CONSULTORIOS DEL CENTRO','28 de Julio 329','Consultorio médico','1,3,5','4474118','Saenz Hernan Jose','',NULL,2,'consul.centro@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (93,'CONSULTORIOS DEL MAR','Roca 791','Consultorio odontológico','1,3,5','***','Alcuaz Maria Cristina','',NULL,2,'malcuaz@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (94,'CONSULTORIOS DEL PILAR','España 125','Consultorio médico','1,3,5','4455821','Garcia Perez Fernando','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (95,'CONSULTORIOS DEL SOL','Av. Roca 2506','Consultorio médico','1,3,5','154633318','Duscher Paola','',NULL,2,'consdelsol@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (96,'CONSULTORIOS MEDICOS DE HERNANDEZ Y TOYPELLA','Av. Roca 353. 1º Piso. Dto 4','Consultorio médico','1,3,5','4472626','Hernandez Rodolfo y Toypella Mabel','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (97,'CONSULTORIOS MEDICOS: Pajariño','s/d','Consultorio médico','1,3,5','s/d','Pajariño Susana Beatriz','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (98,'CONSULTORIOS MITRE','Mitre 143 locales 5-6-9','Consultorio médico','1,3,5','4476262','Gomez Anibal Gabriel','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (99,'CONSULTORIOS SUR','Mitre 536','Consultorio odontológico','1,3,5','154511367','Plano Mónica Mariana','',NULL,2,'monicaplano@hotmail.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (100,'CRUZ AZUL S.H.','Sarmiento 79','Consultorio médico','1,2,3,4,5','4451657','Iriarte Juan Carlos','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (101,'CUARTA DIMENSIÓN TATTO 1','9 de Julio 52','Tatuajes','1,3,5','154656556','León Gustavo Felipe y León Laura','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (102,'CUARTA DIMENSIÓN TATTO 2','9 de Julio 52','Tatuajes','1,3,5','154656556','León Marcelo y León Gabriela','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (103,'DE ANNA OFELIA DELFINA','Marcos A. Zar 253','Consultorio médico','1,3,5','4471821','De Anna Ofelia Delfina','',NULL,2,'ofelia.de.anna@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (104,'DESCUBREPUENTES SRL','Rawson 1241','Consultorio médico','1,3,5','154564069','Gonzalo Puntillo','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (105,'DIOGENES','28 de julio 457','Veterinaria','1,3,5','154411024','Gallego Maria  Beatriz','',NULL,2,'mascomadryn@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (106,'ENTRELAZADAS CONSULTORIOS','Av. Gales 545','Consultorio médico','1,3,5','154564333 - 154606042','Lopez Romina','',NULL,2,'entrelazadas@live.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (107,'ENTRELAZADAS CONSULTORIOS','Av. Gales 545','Consultorio médico','1,3,5','154606042','Bellorini Mariana','',NULL,2,'entrelazadas@live.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (108,'ENTRELAZADAS CONSULTORIOS','Av. Gales 546','Consultorio médico','1,3,5','154381320','Santos Maria Nelida','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (109,'ENTRELAZADAS CONSULTORIOS','Av. Gales 547','Consultorio médico','1,3,5','154573613','Altube Mara Lia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (110,'ESTANCIA MADRYN','Rosales 541','Hogar de ancianos','1,2,3,4,5','4472744','Estancia Madryn S.A','',NULL,2,'estanciamadryn@arnet.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (111,'ESTUDIO ECO','Gob. Maiz 225 Of. 1','Consultorio médico','1,3,5','154344117','Claps Maria Sol- Bares Conrado','',NULL,2,'maryottoclaps@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (112,'FARMA SRL - FARMACIAS PATAGONICAS','San Martin y 28 de julio','Farmacia','1,3,5','4453708','Amoroso Sergio','',NULL,2,'pedidos28dejulio@farmaciaspatagonicas.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (113,'FARMA SRL - FARMACIAS PATAGONICAS','Av. Roca 315','Farmacia','1,3,5','4474555','Querol Fernandez Pablo','',NULL,2,'costanera@farmaciaspatagonicas.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (114,'FARMA SRL - FARMACIAS PATAGONICAS','Av. Roca 315','Farmacia','1,3,5','4474555','Querol Fernandez Pablo','',NULL,2,'costanera@farmaciaspatagonicas.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (115,'FARMACIA ALZA','Villarino 746','Farmacia','1,3,5','0291-154271532','Alza Roberto Ezequiel','',NULL,2,'ezealza@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (116,'FARMACIA AMPAL','Uruguay 211','Farmacia','1,3,5','2804457927','Filippini Silvina P.','',NULL,2,'farmacia@ampal.org.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (117,'FARMACIA CENTRAL','25 de Mayo 272','Farmacia','1,3,5','4454804','Rujana Gerardo','',NULL,2,'grujana@farcentral.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (118,'FARMACIA CENTRAL Y PERFUMERIA PM S.R.L','Av.Gales 701','Farmacia','1,3,5','4473124','Irrazabal Cintia','',NULL,2,'sucursalatlantica@farcentral.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (119,'FARMACIA CURCIO','Av. Juan Muzzio 412','Farmacia','1,3,5','154689449','Curcio Adrian Ulises','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (120,'FARMACIA DASU','Marcos A. Zar 297','Farmacia','1,3,5','4470247','Morbidoni Gabriela','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (121,'FARMACIA DEL GOLFO','Pedro Derbes 480','Farmacia','1,3,5','154456383','Galar Maria Eugenia','',NULL,2,'farmaciadelgolfo@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (122,'FARMACIA DOMECQ GARCIA','Domecq García 401','Farmacia','1,3,5','4457771','Julio Aldo Ruben','',NULL,2,'farmadomecq@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (123,'FARMACIA EVA SH','España 1530','Farmacia','1,3,5','154209707 - 4470361','Roberts Leslie Tomás','',NULL,2,'leslietomasroberts@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (124,'FARMACIA GALES','Av. Roca 2438','Farmacia','1,3,5','4456288','Grassl Ana Maria','',NULL,2,'farmaciagales@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (125,'FARMACIA GLOBAL','Av. Gales 1310','Farmacia','1,3,5','s/d','Lanz Mauro','',NULL,2,'mlanz@farmaciasglobal.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (126,'FARMACIA GLOBAL','Mitre 357','Farmacia','1,3,5','4458254','Casimano Georgina','',NULL,2,'madrynmitre357efarmavasglobal.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (127,'FARMACIA LA GUARDIA','H.Yrigoyen 802','Farmacia','1,3,5','4455825','Grzeszuk Elena Nieves','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (128,'FARMACIA MENDEZ','Domecq Garcia 356','Farmacia','1,3,5','154416946','Mendez Beatriz','',NULL,2,'gladys@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (129,'FARMACIA MODERNA','Mitre 502','Farmacia','1,3,5','4473788','Ada Manuela Sassi','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (130,'FARMACIA OESTE','25 de Mayo 59','Farmacia','1,3,5','4451119','Demasi Gustavo','',NULL,2,'farmacia.oeste@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (131,'FARMACIA PROSALUD','Mitre 719','Farmacia','1,3,5','4473895','Leiva Angel Martin','',NULL,2,'amatinleiva@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (132,'FARMACIA SAN CAYETANO','Pedro Derbes 480','Farmacia','1,3,5','154377401','Tortola Jorge M.','',NULL,2,'jmtortola@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (133,'FERNANDEZ GISELA EDITH','Av. Roca 353 Piso 7 Of. 4','Consultorio odontologico','1,3,5','154006624','Fernandez Gisela Edith','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (134,'FKT PATAGONIA','Alem 255','Kinesiología','1,3,5','154593374','Williams Erica','',NULL,2,'fktpatagonia@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (135,'FUNDACION EL SOLAR','Marcos A. Zar 243','Hogar de ancianos','1,2,3,4,5','154551182','Barac Patricia','',NULL,2,'patriciae@hotmail.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (136,'GABINETE DE KINESIOLOGIA','Marcos A. Zar 24','Consultorio médico','1,3,5','154572722','Garcia Gustavo Marcelo','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (137,'GATICA PAOLA','Av. Gales 246','Consultorio odontológico','1,3,5','s/d','Gatica Paola','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (138,'IDECH S.R.L.','Juan B. Justo 496','Centro de diagnóstico','1,2,3,4,5','4474338 - 4450548','Massenzio Alejandro','',NULL,2,'idechpmsrl@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (139,'IKAP','Paulina Escardo 177','Consultorio médico','1,3,5','154314265','Williams Nilda Mariela','',NULL,2,'williams_mariela@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (140,'INSTITUTO PRIVADO DE ANALISIS CLINICOS','25 de Mayo 408','Laboratorio de análisis clínicos','1,2,3,4,5','4454777','Lodes Pedro Alfredo','',NULL,2,'pedrolodes@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (141,'IPAMER S.R.L.','25 de mayo 969','Consultorios Médicos y Laboratorio','1,2,3,4,5','154313663','Iglesias Nelida Marcela','',NULL,2,'marcela0103@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (142,'IPRO SRL','Albarracin 336','Consultorio odontológico','1,3,5','4471226 - 4476138','Barrientos Ermes Rene','',NULL,2,'ipro@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (143,'IPRO SRL','Albarracin 357','Servicios de diagnosticos por imágenes','1,3,5','4471226 - 4451184','Barrientos Ermes Rene','',NULL,2,'administracion@ipromadryn.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (144,'IREZUMI TATOO','Marcos A. Zar 705','Tatuajes','1,3,5','154604005','Castel Juan Ignacio','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (145,'JURE LUIS CESAR','Villarino 297','Consultorio odontológico','1,3,5','4454610','Jure Luis Cesar','',NULL,2,'consultoriojure@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (146,'KIAK','H. Yrigoyen 820','Consultorio médico','1,3,5','154565572','Francisquelo Mariana Elisa','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (147,'KIDET','Av. Gales 24','Kinesiología','1,3,5','s/d','Monochio Nicolas','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (148,'KINAR','Newbery 609 esquina Alvear','Consultorio médico','1,3,5','154664870','Sosa Gerardo Fabian','',NULL,2,'kinasur@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (149,'KINEA','España  1242','Kinesiología','1,3,5','154607217','Arce Elizabeth del Carmen','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (150,'KINESIOLOGIA','25 de Mayo 1094','Consultorio médico','1,3,5','4457333','Harguimteguy Cesar','',NULL,2,'cesarhar@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (151,'KINESIS','Av. Roca 2573','Consultorio de kinesiologia','1,3,5','154563150','Nudelman Matias','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (152,'KINETIC','San Martin 286','Consultorio médico','1,3,5','154513001','Del Río Maria Agustina','',NULL,2,'agustinadelrio@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (153,'LABOR AUSTRAL','Laprida 42','Consultorio médico','1,2,3,4,5','4457378 - 4475789','Kanter Beatriz May','',NULL,2,'gerencialabaustral@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (154,'LABORAL MADRYN S.H.','Albarracin 335','Consultorio médico','1,3,5','4475721','Stenti Beatriz','',NULL,2,'laboralmadryn@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (155,'LABORATORIO BIOMADRYN','25 de Mayo 125. 1º Piso','Laboratorio de análisis clínicos','1,2,3,4,5','4471116 - 154454505','Bearzi Wargon Liliana','',NULL,2,'lbearzi@biomadryn.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (156,'LABORATORIO BIOSUD DE VALERIA KOWALJOW','Laprida 42','Laboratorio de análisis clínicos','1,2,3,4,5','4470163','Kowaljow Valeria','',NULL,2,'biosud@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (157,'LABORATORIO BRIVEL','Sarmiento 676','Laboratorio de análisis clínicos','1,2,3,4,5','154621937','Britos Manriquez Lucas Federico','',NULL,2,'labritos@yahoo.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (158,'LABORATORIO CLINICO DE PUERTO MADRYN','Estivariz 260','Laboratorio de análisis clínicos','1,2,3,4,5','154369903','Pretell Mariana','',NULL,2,'mcpretell@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (159,'LABORATORIO DE ANALISIS CLINICOS','Gob. Maiz 830','Laboratorio de analisis clinicos','1,2,3,4,5','4454505','Beazzi Liliana','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (160,'LABORATORIO DE ANALISIS CLINICOS','Mitre 476 PB','Laboratorio de análisis clínicos','1,2,3,4,5','4456291','Quiros Gustavo','',NULL,2,'quiros.gustavo@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (161,'LABORATORIO DE ANALISIS CLINICOS','Sarmiento 125','Laboratorio de análisis clínicos','1,2,3,4,5','4450709','Ruiz Ana Maria','',NULL,2,'labruiz-heck@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (162,'LABORATORIO DEL CENTRO','28 de Julio 329','Laboratorio de análisis clínicos','1,2,3,4,5','4456398','Bearzi Wargon Liliana','',NULL,2,'lbearzi@biomadryn.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (163,'LABORATORIO SAN JOSE','Juan B. Justo 799','Laboratorio de analisis clinicos','1,2,3,4,5','154001174','Rodriguez Calvo Vilma - Veliz Oscar Enrique','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (164,'LACyB SH','9 de Julio 458','Laboratorio de análisis clínicos','1,2,3,4,5','4471082','Santamaría Emilio','',NULL,2,'lacybsh@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (165,'LOPEZ MARIA LAURA','25 de Mayo 364. 1º Piso. Of. 3','Consultorio odontológico','1,3,5','2262610990','Lopez Maria Laura','',NULL,2,'mlaura_164@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (166,'LOS CHARITOS','Juan B. Justo 1366','Veterinaria','1,3,5','4475638','Melchi Marcelo','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (167,'LOS PARAISOS','Los Olmos 2225','Hogar de ancianos','1,2,3,4,5','44533851','Bogado Cristina','',NULL,2,'crisjuulzbogado@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (168,'LUCKY TATTOO ESTUDIO','Av. Roca 904 local 2','Tatuajes','1,3,5','154636049','Ortega Laureano','',NULL,2,'laureano@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (169,'LUCKY TATTOO STUDIO','Av. Roca 904','Tatuajes','1,3,5','154636049','Ortega Laureano','',NULL,2,'laureanoo@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (170,'LUZ DE ESPERANZA','Arrayanes 3925','Hogar de ancianos','1,2,3,4,5','154027668','Zappella Roberto Daniel','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (171,'MANUEL VILLEGAS','Av. Gales 246','Consultorio odontológico','1,3,5','4456611','Villegas Manuel','',NULL,2,'manuvillegas@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (172,'MARIA BELEN MATTEO','Av. Roca 353 Piso Nº 1','Consultorio odontológico','1,3,5','381154012318','Matteo Maria Belen','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (173,'MATICES','Villegas 507','Consultorio médico','1,3,5','4455372 -154720451','Saborit Calvo Maria Belen','',NULL,2,'msaborit@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (174,'MEC','Mendoza 950','Consultorio Medico','1,3,5','4453774','Campos Aldo Ruben','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (175,'MEDICINA LABORAL SAN CAMILO','Mitre 650','Consultorio médico','1,3,5','4472291','Buschittari Viviana','',NULL,2,'federicoditata@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (176,'MEDICINA LABORAL SAN CAMILO','Mitre 650','Laboratorio de análisis clínicos','1,2,3,4,5','4472117','Buschittari Viviana','',NULL,2,'bioclin@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (177,'MEDISUR  MUTUAL','Mosconi 187','Farmacia','1,3,5','4457260','Fortunato Abrany','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (178,'MEDLAB','B.Mitre 632','Laboratorio de análisis clínicos','1,2,3,4,5','154341451','Buschittari Viviana','',NULL,2,'buschittari@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (179,'MONTAÑO MARCELA','Mitre 880','Consultorio médico','1,3,5','154562404','Montaño Marcela','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (180,'N Y K ODONTOLOGIA','Mitre 675','Consultorio odontológico','1,3,5','154696126','Martin Karina','',NULL,2,'kv_martin@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (181,'NEXO MEDICINA LABORAL S.H.','Domecq García Norte 37','Consultorio médico','1,3,5','4454298','Cuello Gustavo','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (182,'ODONTAR','Av. Roca 353 local 4 Piso 7','Consultorio odontológico','1,3,5','4470124','Fernandez Gisela Edith','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (183,'ODONTOLOGIA ADRIAN GARCIA','Estivariz 245','Consultorio odontológico','1,3,5','4455645','Garcia José Adrian','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (184,'ODONTOLOGIA GALES','Av. Roca 791','Consultorio odontológico','1,3,5','154653202','Fernandez Ivana Noemi','',NULL,2,'ivinf@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (185,'ODONTOLOGIA GENERAL','Av. Roca 353. Piso 2. Cons. 3','Consultorio médico','1,3,5','4455328','Ellert Magda Ingrid','',NULL,2,'magdamadryn@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (186,'ODONTOLOGIA MADRYN','25 de Mayo 786','Consultorio odontológico','1,3,5','154402289','Ortiz Gonzalo','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (187,'ODONTOLOGIA MADRYN','25 de Mayo 786','Consultorio odontológico','1,3,5','4457407','Ortiz Gonzalo','',NULL,2,'odontologiamadryn1@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (188,'OFTALMOMADRYN','25 de Mayo 560','Consultorio médico oftalmologico','1,2,3,4,5','4471282','Chavez Raraz Quiniano','',NULL,2,'kagringuita@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (189,'PCM KINESIOLOGIA PISCIUM s.r.l','Sarmiento 151','Kinesiología','1,3,5','154503868','Moretta Gustavo','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (190,'QUINTAS DEL MIRADOR','Los Aromos 2525','Hogar de ancianos','1,3,5','154022578','Liranzo Peralta Ana Julia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (191,'RADIOLOGIA DIGITAL','25 de Mayo 364. 1ºPiso. Of. 3','Centro de diagnóstico','1,3,5','4455539','Reule Carolina','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (192,'RAZA TATTOO AND PIERCING','Roque S. Peña 172 Local 5','Tatuajes','1,3,5','154613838','Muñoz Victor Antonio','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (193,'RUIZ - HECK LABORATORIO DE ANALISIS CLINICO','España 6','Laboratorio de análisis clínicos','1,2,3,4,5','4450709','Ruiz Ana Maria','',NULL,2,'labruiz-heck@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (194,'SALK S.R.L','Marcos A. Zar 398','Farmacia','1,3,5','154450857','Cecchi Ponzi Carolina','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (195,'SALUD ODONTOLOGIA','Juan B. Justo 834','Consultorio odontológico','1,3,5','154190352','Mereles Cristian Rubén','',NULL,2,'drmereles@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (196,'SAN IGNACIO S.R.L.','Reconquista 651','Psiquiatría','1,3,5','4471661 - 154661824','Cogliandro Roberto','',NULL,2,'san-ignacio@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (197,'SANATORIO DE LA CIUDAD SRL','Laprida 42','Clínica','1,2,3,4,5','4451270 - 154406526','Kanter Marcelo Luis','',NULL,2,'gerenciasnciudad@speedy.com.ar - snciudad@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (198,'SEP SRL','Sarmiento 125','Consultorio médico','1,2,3,4,5','154660895','Vaccaro Marcelo Fabian','',NULL,2,'marcelovaccaro2000@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (199,'SERFARMA','España 914','Farmacia','1,3,5','4458515','Pritchard Esteban Marcos','',NULL,2,'serfarmapm@gmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (200,'SERVICIO RADIOLOGICO SEP','Sarmiento 125','Servicios radiológicos','1,3,5','154649629','Arballo Fabian','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (201,'SINDICATO DE EMPLEADOS DE COMERCIO','Fuerte San Jose 346','Consultorio médico','1,2,3,4,5','4470344- 4472423','Smit Guillermo Luis','',NULL,2,'robertocasanoba58@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (202,'TALIERCIO THELMA NATALIA','Av.Roca 353 PB Of. 8','Consultorio odontológico','1,3,5','154196266','Taliercio Thelma Natalia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (203,'TEMPESTA - FIORENZA','28 de Julio 173 PB','Consultorio odontológico','1,3,5','221-155628581','Tempesta Rodrigo','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (204,'UTHAGRA','Gob. Maiz 516','Consultorio Médico','1,3,5','4452893','Rosales Patricio - Dignoti Maria Belen','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (205,'VALLE SOL','Quintas del Mirador - Calafate 3980','Hogar de ancianos','1,2,3,4,5','154882208','Liranzo Peralta Ana Julia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (206,'VERA AGUSTINA MARCIA','San Martín 286','Psicología','1,3,5','154205483','Vera Agustina Marcia','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (207,'VETERINARIA DR. MIÑONES','Mitre 463','Veterinaria','1,3,5','4472410','Miñones Jose Alberto','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (208,'VETERINARIA EL QUEBRACHO','Domecq Garcia 317','Veterinaria','1,3,5','154416679','Parodi Guillermo','',NULL,2,'gparodi@speedy.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (209,'VETERINARIA HOCICOS Y BIGOTES','Juan B. Justo 1576','Veterinaria','1,3,5','154563353','Bracchi Daniel','',NULL,2,'4470656');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (210,'VETERINARIA HOCICOS Y BIGOTES 2','Albarracin 375','Veterinaria','1,3,5','154563353','Bracchi  Daniel','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (211,'VETERINARIA LUAN','H. Yrigoyen 925','Veterinaria','1,3,5','154580309','Escobar Milner Sol Ena','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (212,'VETERINARIA PASTEUR','Fournier 1385','Veterinaria','1,3,5','154351869','Fernandez Malvina Brenda','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (213,'VETERINARIA PEUMAYEN','Zampa 2385','Veterinaria','1,3,5','154583472','Wolawsky Marina','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (214,'VETERINARIA SAN CARLOS','Albarracin 375','Veterinaria','1,3,5','154606841','Cabezon Silvia Josefina','',NULL,2,'silviacabezon@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (215,'VETERINARIA VIDAL','San Martin 998','Veterinaria','1,3,5','4471790','Vidal Davila Jhony Riderth','',NULL,2,'jhonyvidal@yahoo.com.ar');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (216,'VETERNIARIA VIDAL','Av. Roca 1143','Veterinaria','1,3,5','4471790','Ortiz Lorena Vanesa','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (217,'VIRTUAL','25 de Mayo 725','Consultorio médico','1,2,3,4,5','4471498','Vizcay Vivian','',NULL,2,'dravizcay@hotmail.com');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (218,'VITALIS PUERTO MADRYN','Av. Roca 1024 lc. 2','Consultorio odontologico','1,3,5','4453644','Amieva Mariela Soledad','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (219,'ZOO VITAL','s/d','Veterinaria','1,3,5','s/d','Alemán Mayra','',NULL,2,'s/d');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (220,'SERVICIOS VETERINARIOS','25 DE MAYO Nº 1588','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (221,'FARMACIA CENTRAL','25 DE MAYO Nº1116','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (222,'FARMACIA QUEROL','25 DE MAYO Nº401','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (223,'PERIF. ABEL AMAYA','25 DE MAYO Y GASTRE NORTE','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (224,'ARCADIA','28 DE JULIO 371','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (225,'EVANS OSVALDO JAVIER','28 DE JULIO 484','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (226,'SONEYRA RAUL','28 DE JULIO 527','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (227,'LLOYD CRISTIAN','28 DE JULIO 548','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (228,'ALTUNA MARIO','28 DE JULIO 548 (CENTRO ESTETICA ODONTOLOGICA)','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (229,'PFISTER FABIANA','28 DE JULIO 553','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (230,'LADIAC','28 DE JULIO 613','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (231,'VILLANI CARLOS ANGEL','28 DE JULIO 623','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (232,'VILLANI MARCELO-BOTELA CECILIA','28 DE JULIO 629','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (233,'STICCO ABEL','28 DE JULIO 708','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (234,'DENTO IMAGEN S.H.','28 DE JULIO 708','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (235,'ARCE AIDA ESTER','28 DE JULIO 784','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (236,'PEREZ PATRICIA','28 DE JULIO 793','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (237,'HOSPITAL ZONAL TRELEW','28 DE JULIO Nº 140','HOSPITAL','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (238,'COOP. ELECTRICA DE TW. (SEPELIO)','28 DE JULIO Nº 1860','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (239,'CONSULTORIOS EXTERNOS (H.Z.T.)','28 DE JULIO Nº 434','HOSPITAL','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (240,'STAGNITTA GRACIELA','28 DE JULIO Nº 527','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (241,'FARMACIA YRIGOYEN','28 DE JULIO Nº 660','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (242,'DE MORENO MARISA','28 DE JULIO Nº 702','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (243,'CARDOSO CRISTINA','28 DE JULIO Nº 708','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (244,'LEYRIA FERNANDO','28 DE JULIO Nº 784','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (245,'ROBERTO MARTINEZ','28 DE JULIO Nº 831','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (246,'QUIROGA LILIANA','28 DE JULIO Nº527','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (247,'CONTINI HECTOR','28 DE JULIO Nº553','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (248,'FARMACIA ADOS','28 DE JULIO Nº722','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (249,'ENFERMERIA FLEMING','9 DE JULIO 427','ENFERMERÍAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (250,'LOSTRA OSCAR','9 DE JULIO 742','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (251,'SANCHEZ CORDI MARIANO','9 DE JULIO 742','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (252,'DA FONSECA PABLO','9 DE JULIO 772','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (253,'CUART ORLANDO GABRIEL','9 DE JULIO 772','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (254,'CEMOD','9 DE JULIO Nº 128-LOC 2','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (255,'CLINICA VETERINARIA DEL SUR GUSTAVO TALAVERA','9 DE JULIO Nº 138','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (256,'CUERPO MEDICO FORENSE (ZARATE)','9 DE JULIO Nº 261','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (257,'ADMINISTRACION JUDICIAL TRELEW (SECUESTROS)','9 DE JULIO Nº 261 2º PISO','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (258,'MINIST.PUB.FISCAL(SECUESTROS BIOLOGICOS)','9 DE JULIO Nº 261 2º PISO','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (259,'BALUL LEILA','9 DE JULIO Nº 772','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (260,'FARMACIA ANIKA','9 DE JULIO Y MITRE','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (261,'TENOVSKI MONICA','A P BELL 655','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (262,'LIMA CRISTIAN','A.P.BELL Nº 702','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (263,'CENTRO DE ESPEC. MEDICAS Y ODONTOLOGICAS','ALBERDI Nº 466','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (264,'LUXOR S.R.L.','ALEM Nº 325','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (265,'COLANTONIO LEANDRO','ALEM Nº 825 (ENTRE CARRASCO Y MUZIO)','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (266,'PERIF. VILLA ITALIA','ALEM Y LOVE PARRI','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (267,'DIAGNÓSTICO CARDIOVASCULAR','AMEGHINO N°264','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (268,'FRACASSO AMELA','AMEGHINO N°275','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (269,'DAYLOPLAS DE JOSE LUIS SUAREZ','AMEGHINO N°375','PODOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (270,'S.A.P.P. S.R.L.','AMEGHINO N°447','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (271,'AUSTRAL','AMEGHINO N°447','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (272,'VETERINARIA CANTO','AMEGHINO N°473','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (273,'MEDICINA NUCLEAR S.R.L.','AMEGHINO N°474 1º PISO','ENFERMERÍAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (274,'NATIVUS S.R.L','AMEGHINO N°902 ESQ. LIBERTAD','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (275,'PERIF. ETCHEPARE','ARTIGAS Y CAMBRIN','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (276,'BIANCOTTI-BONAFINA','AV. GALES 323','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (277,'FARMACIA CHANGO MAS (WALMART S.R.L)','AVDA. EVA PERÓN Nº719','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (278,'LOPEZ JULIAN MARINO','AVENIDA RAWSON Nº 423','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (279,'SOLIVELLA MARIA SILVIA','Bª LOS MIMBRES-CHACRA 86','PODOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (280,'KRISTOFIS CLAUDIA','BELGRANO N° 240 2° B','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (281,'GIL GUERRERO FRANCISCO','BELGRANO N° 240 2º "A"','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (282,'CASTAN PABLO','BELGRANO N° 525','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (283,'FESTA ROBERTO','BELGRANO N° 558','PODOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (284,'CICCIA ADRIAN','BELGRANO N° 586','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (285,'MAIRAL EDUARDO','BELGRANO N° 618','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (286,'NEUROCIENCIA S.A','BELGRANO N°1008 ESQ      RONDEAU','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (287,'CONSULTORIOS CABOT DE CALANDRIA JOSÉ','BELGRANO N°1097','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (288,'NAZAR MARIA CRISTINA','BOLIVIA 662 EX 30','OTALMOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (289,'PERIF. CORRADI','BURMEISTER Y PASCUAL DALEOSO','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (290,'VALENCIA ELISA','CABOT 410','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (291,'CIMADEVILLA MARIANA','CABOT 684','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (292,'VETERINARIA YOPPEN','CABOT Nº 680','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (293,'GALIANO DANIEL','CAMBRIN 1562','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (294,'ORBUJ ALDO','CAMBRYN Y BELGRANO','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (295,'PERIF. SAN MARTIN','CARLOS GARDEL Y SOLDADO ORTEGA','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (296,'LOCATELLI  NICOLAS LUCIANO','CENTENARIO 51','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (297,'PEREYRA PABLO','CENTENARIO 51','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (298,'SALUD MENTAL Y ADICCIONES DEL HOSPITAL ZONAL TW','CHILE 37','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (299,'VETERINARIA DIAGNOVET S.R.L.','CHILE 73','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (300,'MARTINEZ HAYDEE','CHILE Nº 173','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (301,'GODOY ELSA','CONDARCO Y BROWN','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (302,'ARANEDA GUSTAVO','DON BOSCO N° 194','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (303,'LOPEZ RUIZ DIAZ JULIO','DON BOSCO N° 291','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (304,'BARTELS SERGIO','DON BOSCO N° 291','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (305,'BRAMUGLIA BETINA','DON BOSCO N° 291','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (306,'BISCONTI LAURA ANTONELLA','DON BOSCO N° 291','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (307,'PEREZ ANNA JOSE MAXIMILIANO','DON BOSCO N° 370','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (308,'PERIF. LA LOMA','ECUADOR Y RAMON Y CAJAL','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (309,'S.E.C. TRELEW','EDISON 330','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (310,'GÉNESIS S.H','EDISON N° 430','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (311,'FARMACIA SALK','EDISON Y SAN MARTIN','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (312,'RENTERIA BELTRAN RUBEN','ESPAÑA 270','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (313,'PERIF. CONSTITUCION','ESTADOS ARABES Y AV.LA PLATA','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (314,'ACOSTA MONICA','FONTANA 494 ESQ.DON BOSCO','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (315,'INST.DEL DIAG.DEL ESTE DEL CH.','GALINA 650','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (316,'PRC CHUBUT','GALO LOBATO Nº 5003-PARQUE INDUSTRIAL','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (317,'PERIF. PLANTA DE GAS','HERNANDEZ Y JOSE BARRETA S/N','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (318,'PAMI','INMIGRANTES N° 122','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (319,'ORIVE STELLA MARIS','INMIGRANTES N° 428','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (320,'LLARGUES JAVIER','INMIGRANTES N° 490','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (321,'INSTITUTO DEL CORAZÓN DEL RÍO DE LA PLATA S.A','INMIGRANTES N° 50','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (322,'TREMED S.R.L.','INMIGRANTES N° 50','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (323,'PUGH RICARDO','INMIGRANTES N° 53','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (324,'CARDIAL TRELEW S.R.L','INMIGRANTES N° 567','CTRO. HEMAT. Y HEMODIALISIS','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (325,'LABORATORIO DE ANATOMÍA PATOLÓGICA','ITALIA','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (326,'LOPEZ BERTA','ITALIA 170','PODOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (327,'PROSATE S.S','ITALIA Y MORENO','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (328,'AREA PROGRAMATICA TRELEW','ITALIA Y MORENO','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (329,'ADOS TRELEW','ITALIA Y PJE.JUJUY','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (330,'ROMBYS NOEMI','JUAN MANUEL DE ROSAS 1639','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (331,'ZARO PAULA','JULIO A. ROCA 255 OF 4 E/MITRE Y RIVADAVIA-TW','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (332,'SCHULMAN ALBERTO','JULIO A. ROCA N° 123','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (333,'GOLDARACENA EDUARDO','JULIO A. ROCA N° 204','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (334,'KRAUS MAURICIO','JULIO A. ROCA N° 253','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (335,'FALCON MARIA LAURA','JULIO A. ROCA N° 505','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (336,'CETHA CARDIOVASCULAR S.R.L.','JULIO A. ROCA N° 850','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (337,'VETERINARIA PATAGÓNICA-TRELEW','JULIO A. ROCA Nº 1239 (E/URUGUAY Y ENTRE RÍOS)','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (338,'RODRIGUEZ SILVIO','JULIO A. ROCA Nº 607','OTALMOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (339,'UNIVERSIDAD SAN JUAN','JULIO A. ROCA Y BELGRANO','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (340,'PERIF. DON BOSCO','LOS ANDES NORTE Nº410','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (341,'RES.GER. PEWEN KUKU S.R.L.','LOTE 2-CHACRA 93 SUR','GERIATRICOS Y ASILOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (342,'VETERINARIA PATAS','MARCONI (N) N° 118','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (343,'FELDMAN SERGIO','MARCONI N° 144','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (344,'MASSONI NILDA','MARCONI N° 374','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (345,'GOMEZ OSCAR','MARCONI N° 374 Y AMEGHINO 503','CTRO. HEMAT. Y HEMODIALISIS','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (346,'CLÍNICA SAN PABLO','MARCONI N° 438','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (347,'BOVCON FERNANDO','MARCONI N° 508','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (348,'BRUNT MAURICIO FABIAN','MARCONI N° 594','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (349,'SAHAGUN GARCIA','MITRE 604','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (350,'VETERINARIA LAGO-ARAUJO','MITRE Nº 1131','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (351,'CORIA CAROLINA YOLANDA','MITRE Nº 183','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (352,'FARMA S.R.L (PATAGÓNICA)','MITRE Nº 598','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (353,'VETERINARIA DEL SOL','MITRE Nº 674','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (354,'ISSS','MITRE Y RAWSON','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (355,'CENTRO VETERINARIO TRELEW','MORENO N° 1479 (ENTRE GALINA Y ARON JENKIS)','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (356,'LAC TRELEW S.RL','MORENO N° 326Y CABOT Y BE','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (357,'INSTITUTO MÉDICO DEL SUR','MORENO N° 333','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (358,'ALVAREZ RICARDO','MORENO N° 473','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (359,'GRACI GISEL','MORENO N° 473','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (360,'CENTRO DE DIA','PARAGUAY N° 237','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (361,'CEMIT S.R.L.','PARAGUAY N° 25','EMERGENCIAS MED.','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (362,'EMSA SA (SUC TRELEW)','PARAGUAY N° 37','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (363,'ASOCIACIÓN DE SANATORIOS','PARAGUAY N° 74','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (364,'HAMZE JOSE LUIS','PARAGUAY N° 749','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (365,'ELIAS GUSTAVO ENRIQUE','PARAGUAY N° 749-ROCA 1865-PTO MADRYN','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (366,'LUNA VICTOR','PECORARO N° 314','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (367,'SANATORIO TRELEW S.R.L','PECORARO N° 460','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (368,'CAPORALINI   S.A','PECORARO N° 480','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (369,'CENTRO DE PEDICURIA','PECORARO N° 567','PODOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (370,'VETERINARIA SAN JORGE DE ROXANA GIOVENALE','PECORARO NORTE N° 183','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (371,'FERNANDEZ  ALBERTO  EMILIO','PECORARO Y 9 DE JULIO','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (372,'FERNANDEZ  ALBERTO  EMILIO','PECORARO Y 9 DE JULIO','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (373,'TATOO MAX´S TRELEW','PELLEGRINI N° 1326','TATUAJES','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (374,'FARMACIAS PELLEGRINI','PELLEGRINI N° 1632','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (375,'VETERINARIA CHUBUT','PELLEGRINI N° 1896','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (376,'OSDE BINARIO','PELLEGRINI N° 262','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (377,'ALANIZ MARIA LAURA','PELLEGRINI N° 278 OFICINA 3','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (378,'NEW MEDIC S.R.L.','PELLEGRINI N° 504','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (379,'TAC S.A.','PELLEGRINI N° 590','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (380,'CLÍNICA MÉDICA DEL VALLE','PELLEGRINI N° 631','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (381,'ANTONENA PATRICIA','PELLEGRINI N° 631','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (382,'SCOZZINA JOSE DANIEL','PELLEGRINI N° 631','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (383,'ARAMAYO VALERIA','PELLEGRINI N° 655 ESQUINA PARAGUAY','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (384,'SEIMANDI LAURA','PELLEGRINI N° 93','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (385,'SEIMANDI RAUL','PELLEGRINI N° 93','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (386,'VERWAY JOHANNA','PELLEGRINI N° 93','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (387,'SPINOSA MARCELA','PERÚ N° 59 CASI SARMIENTO','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (388,'ALTA COMPLEJIDAD MÉDICA','PJE. CÓRDOBA 479','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (389,'DROGUERIA BRIO S.R.L','PJE. SAN JUAN N° 454','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (390,'ASOC.ODONTOLOGICA DEL N.E.CH.','PJE. SAN LUIS N° 455','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (391,'FERNANDEZ MARIELA','PJE.SAN JUAN N° 320 2º PISO','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (392,'28 DE JULIO Nº 702','PJE.SAN JUAN N° 383','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (393,'RES. GERIATRICO"LA FAMILIA"','PJE.SAN LUIS NORTE Nº 704 CASA 267','GERIATRICOS Y ASILOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (394,'MOYA CARLOS','PJE.SANTA CRUZ Nº 420','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (395,'ARANO PATRICIA GRACIELA','RAMON Y CAJAL Nº 795','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (396,'MENDEZ MANUEL MARCELO','RAWSON Nº 437 1º "B"','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (397,'ABDALA ALBERTO','RAWSON Nº 580','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (398,'MUNICIPALIDAD DE TRELEW','RIVADAVIA N°  390','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (399,'CAPACCIONI SUSANA','RIVADAVIA N°  668 1º PISO','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (400,'SCHEMBARI JORGE','RIVADAVIA N° 1005 ESQUINA RONDEAU','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (401,'FARMACIA PLAZA','RIVADAVIA N° 348','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (402,'CLINICA VETERINARIA DR.GARZON MARIO','RIVADAVIA N° 553','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (403,'VILA NATHALIA','RIVADAVIA N° 866','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (404,'BASE AERONAVAL ALMIRANTE ZAR','Ruta 3 S/N','ENFERMERÍAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (405,'PERIF. TIRO FEDERAL','SAAVEDRA Y LEZANA NORTE','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (406,'CENTRO MÉDICO GAIMAN S.R.L','SAN MARTÍN N° 1251','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (407,'MOLINA MARIANO','SAN MARTIN N° 1579','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (408,'YUNES JOSE FRANCISCO','SAN MARTIN N° 306- 1 PISO OF 4','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (409,'CARBONE ANA LUCIA','SAN MARTIN N° 541','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (410,'GANDOLFO GUSTAVO','SAN MARTIN N° 549','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (411,'ERASO EDGARDO','SAN MARTÍN N° 549','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (412,'SANATORIO SAN MARTIN','SAN MARTÍN N° 696','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (413,'MATERNO INFANTIL','SAN MARTÍN N° 696','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (414,'DE MARZO SANDRA NOEMI','SAN MARTÍN N° 697','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (415,'ENFERMERIA INTEGRAL','SAN MARTIN N° 815','ENFERMERÍAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (416,'DOLHEGUY BRAVO FLORENCIA','SAN MARTIN N° 875','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (417,'CLINICA SAN MIGUEL (MERKER SERGIO)','SAN MARTÍN N° 898','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (418,'SOFIMED S.R.L','SAN MARTÍN N° 898','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (419,'TERAPIA INTENSIVA NATIVUS S.R.L','SAN MARTÍN N° 899 1° PISO','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (420,'DROGUERIA MEDICAL TOOLS S.R.L','SAN MARTIN Nº 1182','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (421,'CAORSI LUIS FRANCISCO','SAN MARTIN Nº 624','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (422,'ROSTAGNO JIUDICI LUCIANO MARIO','SAN MARTIN Nº 624','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (423,'DI.B.A.C   S. R. L','SAN MARTIN Nº 856','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (424,'CARRIZO LIDIA','SAN MARTIN Nº 898','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (425,'MEDIVEN S.A','SAN MARTIN Nº 971','LABORATORIO','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (426,'SOSA CABALLERO','SAN MARTIN Y PECORARO','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (427,'FARMACIA DASU','SARMIENTO N° 325','FARMACIAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (428,'D.A.S.U.(CONSULT.ODONTOLÓGICO)','SARMIENTO N° 340','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (429,'MARIGUAL JORGE','SARMIENTO N° 595','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (430,'MOHR EDGARDO','SARMIENTO Nº 268','PODOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (431,'WHITE TRASH TATOO','SARMIENTO Nº 523','TATUAJES','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (432,'RITUAL TATOO & PIERCING','SARMIENTO Nº 584','TATUAJES','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (433,'WILLIAMS DIANA KARINA','SARMIENTO Nº 594 (ENTRE PERÚ Y HONDURAS)','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (434,'MARIGUAL CARLOS','SARMIENTO Nº 595','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (435,'HOGAR LOS NONOS','SCALABRINI ORTIZ Y MAIPÚ','GERIATRICOS Y ASILOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (436,'ALCAIDIA POLICIAL-CENTRO DE DETENCIÓN','SOB. NAC. Y CUBA-LOBATO Y PATRICIAS ARG.','ENFERMERÍAS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (437,'VETERINARIA LOS CENCERROS','SOB.NACIONAL Y PELLEGRINI','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (438,'HOG.DE ANCIANOS"PEDRO DETTORI"','SOBERANÍA NACIONAL 2000','GERIATRICOS Y ASILOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (439,'CAMPOS ANTONIO','SOBERANÍA NACIONAL N° 410(CONS. DR CAMPOS)','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (440,'BUGALLO SEBASTIAN PABLO','SOBERANÍA NACIONAL N° 801(ESQ.MARCONI)','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (441,'GONZALEZ PUNTER ANDREA','SOBERANÍA NACIONAL N° 96','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (442,'POLANCO HÉCTOR','SOBERANÍA NACIONAL N° 99','ODONTÓLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (443,'CENTRO ESPECIALIDADES OFTALMOLÓGICAS (CEO)','SOBERANÍA NACIONAL Nº 284','OTALMOLOGOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (444,'HOGAR DE ADULTOS MAYORES" LA CASA DE LILI"','SOBERANÍA NACIONAL Nº 3440','GERIATRICOS Y ASILOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (445,'VETERINARIA DIOGENES','SOBERANÍA NACIONAL Y BELGRANO','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (446,'VETERINARIA SURVET','URQUIZA Nº 1041','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (447,'OBRA SOCIAL DE COND. CAMIONEROS','URQUIZA Nº 255','VARIOS','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (448,'PERIF. SARMIENTO','VEGWYN ENTRE BS.AS Y URUGUAY','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (449,'NICADPI','VELERO MIMOSA Y ALEM','CENTROS DE SALUD','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (450,'VETERINARIA BRYN GWYN','YRIGOYEN N° 1580','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (451,'VETERINARIA ANIMAL','YRIGOYEN N° 2013','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (452,'ATHENEA S.A.','YRIGOYEN N° 2315','CLINICAS Y SANAT.','1,2,3,4,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (453,'CLINICA VETERINARIA INTEGRAL','YRIGOYEN Nº 846','VETERINARIA','1,3,5','','','',NULL,1,'');
INSERT INTO `modulo_I_establecimientogenerador` (id,razon_social,direccion,tipo_actividad,recoleccion,telefono,responsable_ambiental,cuit,sector,localidad_id,email) VALUES (455,'PRUEBA RAZON SOCIAL','Una direccion MAS','Kinesiología,Otros','6',NULL,NULL,NULL,NULL,1,NULL);
CREATE TABLE IF NOT EXISTS `modulo_I_baldeutilizado` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nro_precinto`	bigint NOT NULL UNIQUE,
	`tipo`	varchar ( 15 ) NOT NULL,
	`balde_id`	bigint NOT NULL,
	`establecimiento_generador_id`	integer NOT NULL,
	`hoja_ruta_id`	integer NOT NULL,
	FOREIGN KEY(`establecimiento_generador_id`) REFERENCES `modulo_I_establecimientogenerador`(`id`),
	FOREIGN KEY(`hoja_ruta_id`) REFERENCES `modulo_I_hojaruta`(`id`),
	FOREIGN KEY(`balde_id`) REFERENCES `modulo_I_balde`(`nro_balde`)
);
CREATE TABLE IF NOT EXISTS `modulo_I_balde` (
	`nro_balde`	bigint NOT NULL,
	`capacidad`	varchar ( 5 ) NOT NULL,
	`estado`	varchar ( 15 ) NOT NULL,
	`establecimiento_generador_id`	integer,
	FOREIGN KEY(`establecimiento_generador_id`) REFERENCES `modulo_I_establecimientogenerador`(`id`),
	PRIMARY KEY(`nro_balde`)
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
INSERT INTO `django_session` (session_key,session_data,expire_date) VALUES ('gqos2rxfv8dfs37gzfe9xi31ojl8ma03','Zjc5YzM1M2M4YTI5OTVhZTI0OThiNjA5NGI4NGQ0NzY5ZTBkYjdhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNDUwMzAxMzJkZWY1NThkOTNmNTY0NWViNjJjNWJhM2MxMWFiMjk0In0=','2018-02-26 22:57:49.747490');
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`app`	varchar ( 255 ) NOT NULL,
	`name`	varchar ( 255 ) NOT NULL,
	`applied`	datetime NOT NULL
);
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (1,'modulo_I','0001_initial','2018-02-12 22:38:05.572128');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (2,'contenttypes','0001_initial','2018-02-12 22:38:11.448090');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (3,'auth','0001_initial','2018-02-12 22:38:11.648070');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (4,'admin','0001_initial','2018-02-12 22:38:11.823320');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (5,'admin','0002_logentry_remove_auto_add','2018-02-12 22:38:12.006839');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (6,'contenttypes','0002_remove_content_type_name','2018-02-12 22:38:12.215809');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (7,'auth','0002_alter_permission_name_max_length','2018-02-12 22:38:12.414378');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (8,'auth','0003_alter_user_email_max_length','2018-02-12 22:38:12.619861');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (9,'auth','0004_alter_user_username_opts','2018-02-12 22:38:12.838142');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (10,'auth','0005_alter_user_last_login_null','2018-02-12 22:38:13.037327');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (11,'auth','0006_require_contenttypes_0002','2018-02-12 22:38:13.132187');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (12,'auth','0007_alter_validators_add_error_messages','2018-02-12 22:38:13.337235');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (13,'auth','0008_alter_user_username_max_length','2018-02-12 22:38:13.537910');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (14,'sessions','0001_initial','2018-02-12 22:38:13.718433');
INSERT INTO `django_migrations` (id,app,name,applied) VALUES (15,'modulo_I','0002_auto_20180212_2126','2018-02-13 00:26:25.598301');
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
INSERT INTO `django_content_type` (id,app_label,model) VALUES (8,'modulo_I','baldeutilizado');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (9,'modulo_I','establecimientogenerador');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (10,'modulo_I','hojaruta');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (11,'modulo_I','localidad');
INSERT INTO `django_content_type` (id,app_label,model) VALUES (12,'modulo_I','provincia');
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
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (1,'1','CHUBUT',1,'[{"added": {}}]',12,1,'2018-02-12 22:44:29.070983');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (2,'1','TRELEW - CHUBUT - 9100',1,'[{"added": {}}]',11,1,'2018-02-12 22:44:32.104519');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (3,'2','MADRYN - CHUBUT - 9120',1,'[{"added": {}}]',11,1,'2018-02-12 22:44:38.373422');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (4,'1','ALMA TATTOO',2,'[{"changed": {"fields": ["recoleccion"]}}]',9,1,'2018-02-13 00:26:58.066271');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (5,'1','ALMA TATTOO',2,'[{"changed": {"fields": ["recoleccion"]}}]',9,1,'2018-02-13 00:29:41.769663');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (6,'1','ALMA TATTOO',2,'[{"changed": {"fields": ["recoleccion"]}}]',9,1,'2018-02-13 00:30:12.951584');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (7,'1','ALMA TATTOO',2,'[{"changed": {"fields": ["recoleccion"]}}]',9,1,'2018-02-13 00:30:32.752654');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (8,'1','ALMA TATTOO',2,'[{"changed": {"fields": ["recoleccion"]}}]',9,1,'2018-02-13 00:31:42.304692');
INSERT INTO `django_admin_log` (id,object_id,object_repr,action_flag,change_message,content_type_id,user_id,action_time) VALUES (9,'455','PRUEBA RAZON SOCIAL',2,'[{"changed": {"fields": ["recoleccion"]}}]',9,1,'2018-02-13 00:58:18.282673');
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
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`),
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`)
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
INSERT INTO `auth_user` (id,password,last_login,is_superuser,first_name,last_name,email,is_staff,is_active,date_joined,username) VALUES (1,'pbkdf2_sha256$36000$zFCdrjnPAT0g$PZ0RcGnMKvDFpuJjMrmhwns+GSUPmsmppXf106Db9k0=','2018-02-12 22:57:49.616688',1,'','','',1,1,'2018-02-12 22:44:00.880515','fedde');
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
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (22,8,'add_baldeutilizado','Can add balde utilizado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (23,8,'change_baldeutilizado','Can change balde utilizado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (24,8,'delete_baldeutilizado','Can delete balde utilizado');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (25,9,'add_establecimientogenerador','Can add establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (26,9,'change_establecimientogenerador','Can change establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (27,9,'delete_establecimientogenerador','Can delete establecimiento generador');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (28,10,'add_hojaruta','Can add hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (29,10,'change_hojaruta','Can change hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (30,10,'delete_hojaruta','Can delete hoja ruta');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (31,11,'add_localidad','Can add localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (32,11,'change_localidad','Can change localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (33,11,'delete_localidad','Can delete localidad');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (34,12,'add_provincia','Can add provincia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (35,12,'change_provincia','Can change provincia');
INSERT INTO `auth_permission` (id,content_type_id,codename,name) VALUES (36,12,'delete_provincia','Can delete provincia');
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
CREATE INDEX IF NOT EXISTS `modulo_I_localidad_provincia_id_f1042493` ON `modulo_I_localidad` (
	`provincia_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_establecimientogenerador_localidad_id_568a56ed` ON `modulo_I_establecimientogenerador` (
	`localidad_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_baldeutilizado_hoja_ruta_id_f2eaaaf3` ON `modulo_I_baldeutilizado` (
	`hoja_ruta_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_baldeutilizado_establecimiento_generador_id_6a20c57f` ON `modulo_I_baldeutilizado` (
	`establecimiento_generador_id`
);
CREATE INDEX IF NOT EXISTS `modulo_I_baldeutilizado_balde_id_72c3fcd8` ON `modulo_I_baldeutilizado` (
	`balde_id`
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
