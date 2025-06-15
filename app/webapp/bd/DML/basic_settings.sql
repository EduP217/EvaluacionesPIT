/*
 * Reset Configurations to basic
 * */

DELETE FROM `pit-evaluations`.usuario;
DELETE FROM `pit-evaluations`.perfil_enlaces;
DELETE FROM `pit-evaluations`.enlace;
DELETE FROM `pit-evaluations`.evaluacion_respuestas;
DELETE FROM `pit-evaluations`.evaluacion;
DELETE FROM `pit-evaluations`.examen_preguntas;
DELETE FROM `pit-evaluations`.examen;
DELETE FROM `pit-evaluations`.pregunta_opcion;
DELETE FROM `pit-evaluations`.pregunta;
DELETE FROM `pit-evaluations`.detalle_matricula;
DELETE FROM `pit-evaluations`.matricula;
DELETE FROM `pit-evaluations`.programacion_cursos;
DELETE FROM `pit-evaluations`.curso;
DELETE FROM `pit-evaluations`.persona_perfil;
DELETE FROM `pit-evaluations`.perfil;
DELETE FROM `pit-evaluations`.persona;
DELETE FROM `pit-evaluations`.carrera;
DELETE FROM `pit-evaluations`.estado;


ALTER TABLE `pit-evaluations`.usuario AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.enlace AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.evaluacion AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.examen AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.pregunta_opcion AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.pregunta AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.detalle_matricula AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.matricula AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.programacion_cursos AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.curso AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.perfil AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.persona AUTO_INCREMENT = 1;
ALTER TABLE `pit-evaluations`.carrera AUTO_INCREMENT = 1;

/*
 * Basic Settings for Database `pit-evaluations`
 * */

-- Estados
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1001, 'usuario', 'Activo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1002, 'usuario', 'Inactivo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1003, 'usuario', 'Reset Password');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1101, 'matricula', 'Creado');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1102, 'matricula', 'Activo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1103, 'matricula', 'Inactivo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1104, 'matricula', 'Suspendido');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1105, 'matricula', 'Pendiente');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1201, 'examen', 'Creado');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1202, 'examen', 'Activo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1203, 'examen', 'Inactivo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1204, 'examen', 'Suspendido');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1205, 'examen', 'Pendiente');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1301, 'pregunta', 'Creado');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1302, 'pregunta', 'Activo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1303, 'pregunta', 'Inactivo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1304, 'pregunta', 'Suspendido');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1305, 'pregunta', 'Pendiente');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1401, 'evaluacion', 'Creado');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1402, 'evaluacion', 'Activo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1403, 'evaluacion', 'Inactivo');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1404, 'evaluacion', 'Suspendido');
INSERT INTO `pit-evaluations`.estado (estado_id, categoria, estado) VALUES (1405, 'evaluacion', 'Pendiente');

-- Carreras
INSERT INTO `pit-evaluations`.carrera (carrera) VALUES ('Computación e Informática');
INSERT INTO `pit-evaluations`.carrera (carrera) VALUES ('Administración de Empresas');
INSERT INTO `pit-evaluations`.carrera (carrera) VALUES ('Redes y Ciberseguridad');

-- Personas
INSERT INTO `pit-evaluations`.persona (identificador, nombres, apellidos, fecha_nacimiento, telefono) VALUES ('72187701','Eduardo','Prieto',STR_TO_DATE('1994-03-19', '%Y-%m-%d'),'999888777');
INSERT INTO `pit-evaluations`.persona (identificador, nombres, apellidos, fecha_nacimiento, telefono) VALUES ('E0000001','Jorge','Benavides',STR_TO_DATE('2006-01-01', '%Y-%m-%d'),'97645181');
INSERT INTO `pit-evaluations`.persona (identificador, nombres, apellidos, fecha_nacimiento, telefono) VALUES ('D0000002','Maria','Clifforden',STR_TO_DATE('2000-01-01', '%Y-%m-%d'),'97645181');
INSERT INTO `pit-evaluations`.persona (identificador, nombres, apellidos, fecha_nacimiento, telefono) VALUES ('C0000003','Juan Bryan','Martinez Lopez',STR_TO_DATE('1993-01-01', '%Y-%m-%d'),'97645181');

-- Perfil
INSERT INTO `pit-evaluations`.perfil (perfil) VALUES ('Administrador');
INSERT INTO `pit-evaluations`.perfil (perfil) VALUES ('Estudiante');
INSERT INTO `pit-evaluations`.perfil (perfil) VALUES ('Docente');
INSERT INTO `pit-evaluations`.perfil (perfil) VALUES ('Coordinador');

-- Persona Perfil
INSERT INTO `pit-evaluations`.persona_perfil (persona_id, perfil_id) VALUES (1, 1);
INSERT INTO `pit-evaluations`.persona_perfil (persona_id, perfil_id) VALUES (2, 2);
INSERT INTO `pit-evaluations`.persona_perfil (persona_id, perfil_id) VALUES (3, 3);
INSERT INTO `pit-evaluations`.persona_perfil (persona_id, perfil_id) VALUES (4, 4);

-- Curso
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('ARQ001', 'Arquitectura de Computación');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('PHP002', 'PHP');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('CSS003', 'CSS3');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('ALG004', 'Algoritmos y Estructura I');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('BAS005', 'Base de Datos');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('SUB006', 'Sublime');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('ADS007', 'ADS I');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('ALG008', 'Algoritmos y Estructura II');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('LEN009', 'Lenguaje de Programación I');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('ADS010', 'ADS II');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('PRO011', 'Programación Orientada a Objetos');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('DES012', 'Desarrollo Entorno Web');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('DES013', 'Desarrollo Entorno Web II');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('PRO014', 'Proyecto de Investigación');
INSERT INTO `pit-evaluations`.curso (codigo, nombre) VALUES ('BUS015', 'Bussiness Intelligence');

-- Enlace
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Configuracion', 'configuracion');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Mantenimiento de Coordinadores', 'mantenimiento/coordinadores');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Mantenimiento de Docentes', 'mantenimiento/docentes');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Mantenimiento de Alumnos', 'mantenimiento/alumnos');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Mantenimiento de Cursos', 'mantenimiento/cursos');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Programacion de Cursos', 'programacion/cursos');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Banco de Preguntas', 'preguntas');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Examenes', 'examen');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Matricula', 'matricula');
INSERT INTO `pit-evaluations`.enlace (enlace, ruta_url) VALUES ('Evaluaciones', 'evaluacion');

-- Perfil Enlaces
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 1);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 2);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 3);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 4);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 5);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 6);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 7);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 8);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 9);
INSERT INTO `pit-evaluations`.perfil_enlaces (perfil_id, enlace_id) VALUES (1, 10);

-- Usuarios
INSERT INTO `pit-evaluations`.usuario (persona_id, estado_id, usuario, clave, imagen_url) VALUES (1, 1003, 'admin@site.com', '123456789', 'avatar-default.png');








