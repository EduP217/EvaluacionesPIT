/*
 * Remove Database Tables
 * */

DROP TABLE IF EXISTS `pit-evaluations`.usuario;
DROP TABLE IF EXISTS `pit-evaluations`.perfil_enlaces;
DROP TABLE IF EXISTS `pit-evaluations`.enlace;
DROP TABLE IF EXISTS `pit-evaluations`.evaluacion_respuestas;
DROP TABLE IF EXISTS `pit-evaluations`.evaluacion;
DROP TABLE IF EXISTS `pit-evaluations`.examen_preguntas;
DROP TABLE IF EXISTS `pit-evaluations`.examen;
DROP TABLE IF EXISTS `pit-evaluations`.pregunta_opcion;
DROP TABLE IF EXISTS `pit-evaluations`.pregunta;
DROP TABLE IF EXISTS `pit-evaluations`.detalle_matricula;
DROP TABLE IF EXISTS `pit-evaluations`.matricula;
DROP TABLE IF EXISTS `pit-evaluations`.programacion_cursos;
DROP TABLE IF EXISTS `pit-evaluations`.curso;
DROP TABLE IF EXISTS `pit-evaluations`.persona_perfil;
DROP TABLE IF EXISTS `pit-evaluations`.perfil;
DROP TABLE IF EXISTS `pit-evaluations`.persona;
DROP TABLE IF EXISTS `pit-evaluations`.carrera;
DROP TABLE IF EXISTS `pit-evaluations`.estado;

/*
 * Start Creation of Original Tables Setup
 * */

CREATE TABLE `pit-evaluations`.estado (
	estado_id 		INTEGER NOT NULL,
	categoria 		VARCHAR(10) NOT NULL,
	estado 			VARCHAR(50) NOT NULL,
	CONSTRAINT pk_estado PRIMARY KEY (estado_id)
);

CREATE TABLE `pit-evaluations`.carrera (
	carrera_id 	INTEGER NOT NULL AUTO_INCREMENT,
	carrera 	VARCHAR(100) NOT NULL,
	CONSTRAINT pk_carrera PRIMARY KEY (carrera_id)
);

CREATE TABLE `pit-evaluations`.persona (
	persona_id			INTEGER NOT NULL AUTO_INCREMENT,
	identificador		VARCHAR(12) NOT NULL,
	nombres				VARCHAR(40) NOT NULL,
	apellidos			VARCHAR(40) NOT NULL,
	fecha_nacimiento 	DATE NOT NULL,
	telefono			VARCHAR(40) NOT NULL,
	CONSTRAINT pk_persona PRIMARY KEY (persona_id)
);

CREATE TABLE `pit-evaluations`.perfil (
	perfil_id 	INTEGER NOT NULL AUTO_INCREMENT,
	perfil 		VARCHAR(100) NOT NULL,
	CONSTRAINT pk_perfil PRIMARY KEY (perfil_id)
);

CREATE TABLE `pit-evaluations`.persona_perfil (
	persona_id 	INTEGER NOT NULL,
	perfil_id 	INTEGER NOT NULL,
	CONSTRAINT pk_persona_perfil PRIMARY KEY (persona_id, perfil_id),
	CONSTRAINT fk_persona_perfil_persona FOREIGN KEY (persona_id) REFERENCES persona(persona_id) ON DELETE CASCADE,
    CONSTRAINT fk_persona_perfil_perfil FOREIGN KEY (perfil_id) REFERENCES perfil(perfil_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.curso (
	curso_id 	INTEGER NOT NULL AUTO_INCREMENT,
	codigo 		VARCHAR(10) NOT NULL,
	nombre 		VARCHAR(250) NOT NULL,
	CONSTRAINT pk_curso PRIMARY KEY (curso_id)
);

CREATE TABLE `pit-evaluations`.programacion_cursos (
	programacion_id 	INTEGER NOT NULL AUTO_INCREMENT,
	docente_id		 	INTEGER NOT NULL,
	curso_id		 	INTEGER NOT NULL,
	codigo	 			VARCHAR(10) NOT NULL,
	ciclo 				VARCHAR(30) NOT NULL,
	semestre			VARCHAR(30) NOT NULL,
	turno				VARCHAR(50) NOT NULL,
	CONSTRAINT pk_programacion_cursos PRIMARY KEY (programacion_id),
	CONSTRAINT fk_programacion_cursos_docente FOREIGN KEY (docente_id) REFERENCES persona(persona_id) ON DELETE CASCADE,
    CONSTRAINT fk_programacion_cursos_curso FOREIGN KEY (curso_id) REFERENCES curso(curso_id) ON DELETE CASCADE 
);

CREATE TABLE `pit-evaluations`.matricula (
	matricula_id 		INTEGER NOT NULL AUTO_INCREMENT,
	carrera_id			INTEGER NOT NULL,
	alumno_id			INTEGER NOT NULL,
	estado_id 			INTEGER NOT NULL,
	codigo				VARCHAR(10) NOT NULL,
	ciclo 				VARCHAR(30) NOT NULL,
	semestre			VARCHAR(30) NOT NULL,
	fecha_matricula		DATETIME NOT NULL,
	fecha_pago			DATETIME NOT NULL,
	fecha_creacion		DATETIME NOT NULL,
	fecha_actualizacion DATETIME NOT NULL,
	CONSTRAINT pk_matricula PRIMARY KEY (matricula_id),
	CONSTRAINT fk_matricula_carrera FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id) ON DELETE CASCADE,
	CONSTRAINT fk_matricula_alumno FOREIGN KEY (alumno_id) REFERENCES persona(persona_id) ON DELETE CASCADE,
	CONSTRAINT fk_matricula_estado FOREIGN KEY (estado_id) REFERENCES estado(estado_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.detalle_matricula (
	detalle_matricula_id 	INTEGER NOT NULL AUTO_INCREMENT,
	matricula_id 			INTEGER NOT NULL,
	programacion_id 		INTEGER NOT NULL,
	estado_id 				INTEGER NOT NULL,
	CONSTRAINT pk_detalle_matricula PRIMARY KEY (detalle_matricula_id),
	CONSTRAINT fk_detalle_matricula_matricula FOREIGN KEY (matricula_id) REFERENCES matricula(matricula_id) ON DELETE CASCADE,
	CONSTRAINT fk_detalle_matricula_programacion FOREIGN KEY (programacion_id) REFERENCES programacion_cursos(programacion_id) ON DELETE CASCADE,
	CONSTRAINT fk_detalle_matricula_estado FOREIGN KEY (estado_id) REFERENCES estado(estado_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.pregunta (
	pregunta_id INTEGER NOT NULL AUTO_INCREMENT,
	curso_id	INTEGER NOT NULL,
	estado_id 	INTEGER NOT NULL,
	pregunta	VARCHAR(500) NOT NULL,
	tipo		VARCHAR(25) NOT NULL,
	nivel		VARCHAR(25) NOT NULL,
	puntaje		SMALLINT UNSIGNED NOT NULL,
	CONSTRAINT pk_pregunta PRIMARY KEY (pregunta_id),
	CONSTRAINT fk_pregunta_curso FOREIGN KEY (curso_id) REFERENCES curso(curso_id) ON DELETE CASCADE,
	CONSTRAINT fk_pregunta_estado FOREIGN KEY (estado_id) REFERENCES estado(estado_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.pregunta_opcion (
	opcion_id	INTEGER NOT NULL AUTO_INCREMENT,
	pregunta_id INTEGER NOT NULL,
	opcion		VARCHAR(500) NOT NULL,
	resultado	CHAR(1) NOT NULL,
	CONSTRAINT pk_opcion PRIMARY KEY (opcion_id),
	CONSTRAINT fk_opcion_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(pregunta_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.examen (
	examen_id 			INTEGER NOT NULL AUTO_INCREMENT,
	curso_id		 	INTEGER NOT NULL,
	estado_id 			INTEGER NOT NULL,
	codigo 				VARCHAR(10) NOT NULL,
	tipo	 			VARCHAR(25) NOT NULL,
	duracion 			VARCHAR(3) NOT NULL,
	minimo_puntaje		SMALLINT UNSIGNED NOT NULL,
	maximo_puntaje		SMALLINT UNSIGNED NOT NULL,
	fecha_inicio		DATETIME NOT NULL,
	fecha_final			DATETIME NOT NULL,
	fecha_creacion		DATETIME NOT NULL,
	fecha_actualizacion	DATETIME NOT NULL,
	CONSTRAINT pk_examen PRIMARY KEY (examen_id),
	CONSTRAINT fk_examen_programacion FOREIGN KEY (curso_id) REFERENCES curso(curso_id) ON DELETE CASCADE,
	CONSTRAINT fk_examen_estado FOREIGN KEY (estado_id) REFERENCES estado(estado_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.examen_preguntas (
	examen_id 	INTEGER NOT NULL,
	pregunta_id INTEGER NOT NULL,
	CONSTRAINT pk_examen_preguntas PRIMARY KEY (examen_id, pregunta_id),
	CONSTRAINT fk_examen_preguntas_examen FOREIGN KEY (examen_id) REFERENCES examen(examen_id) ON DELETE CASCADE,
	CONSTRAINT fk_examen_preguntas_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(pregunta_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.evaluacion (
	evaluacion_id 			INTEGER NOT NULL AUTO_INCREMENT,
	examen_id 				INTEGER NOT NULL,
	alumno_id				INTEGER NOT NULL,
	estado_id 				INTEGER NOT NULL,
	respuestas_correctas	SMALLINT UNSIGNED NOT NULL,
	respuestas_incorrectas 	SMALLINT UNSIGNED NOT NULL,
	calificacion			SMALLINT UNSIGNED NOT NULL,
	fecha_inicio			DATETIME NOT NULL,
	fecha_final				DATETIME NOT NULL,
	fecha_creacion			DATETIME NOT NULL,
	fecha_actualizacion		DATETIME NOT NULL,
	CONSTRAINT pk_evaluacion PRIMARY KEY (evaluacion_id),
	CONSTRAINT fk_evaluacion_examen FOREIGN KEY (examen_id) REFERENCES examen(examen_id) ON DELETE CASCADE,
	CONSTRAINT fk_evaluacion_alumno FOREIGN KEY (alumno_id) REFERENCES persona(persona_id) ON DELETE CASCADE,
	CONSTRAINT fk_evaluacion_estado FOREIGN KEY (estado_id) REFERENCES estado(estado_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.evaluacion_respuestas (
	evaluacion_id 		INTEGER NOT NULL,
	pregunta_id 		INTEGER NOT NULL,
	opcion_marcada_id	INTEGER NOT NULL,
	CONSTRAINT pk_evaluacion_respuestas PRIMARY KEY (evaluacion_id,pregunta_id),
	CONSTRAINT fk_evaluacion_respuestas_evaluacion FOREIGN KEY (evaluacion_id) REFERENCES evaluacion(evaluacion_id) ON DELETE CASCADE,
	CONSTRAINT fk_evaluacion_respuestas_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(pregunta_id) ON DELETE CASCADE,
	CONSTRAINT fk_evaluacion_respuestas_opcion FOREIGN KEY (opcion_marcada_id) REFERENCES pregunta_opcion(opcion_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.enlace (
	enlace_id 			INTEGER NOT NULL AUTO_INCREMENT,
	enlace 				VARCHAR(100) NOT NULL,
	ruta_url			VARCHAR(300) NOT NULL,
	icono				VARCHAR(100),
	enlace_parent_id	INTEGER,
	CONSTRAINT pk_enlace PRIMARY KEY (enlace_id)
);

CREATE TABLE `pit-evaluations`.perfil_enlaces (
	perfil_id 		INTEGER NOT NULL,
	enlace_id 		INTEGER NOT NULL,
	CONSTRAINT pk_perfil_enlaces PRIMARY KEY (perfil_id,enlace_id),
	CONSTRAINT fk_pk_perfil_enlaces_perfil FOREIGN KEY (perfil_id) REFERENCES perfil(perfil_id) ON DELETE CASCADE,
	CONSTRAINT fk_pk_perfil_enlaces_enlace FOREIGN KEY (enlace_id) REFERENCES enlace(enlace_id) ON DELETE CASCADE
);

CREATE TABLE `pit-evaluations`.usuario (
	usuario_id 	INTEGER NOT NULL AUTO_INCREMENT,
	persona_id	INTEGER NOT NULL UNIQUE,
	estado_id 	INTEGER NOT NULL,
	usuario		VARCHAR(50) NOT NULL,
	clave		VARCHAR(12) NOT NULL,
	imagen_url	VARCHAR(250) NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY (usuario_id),
	CONSTRAINT fk_usuario_persona FOREIGN KEY (persona_id) REFERENCES persona(persona_id) ON DELETE CASCADE,
	CONSTRAINT fk_usuario_estado FOREIGN KEY (estado_id) REFERENCES estado(estado_id) ON DELETE CASCADE
);








