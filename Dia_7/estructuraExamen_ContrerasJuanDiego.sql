-- ###############################
-- ###### EXAMEN1_MYSQL ########
-- ###############################
-- Creacion de estructura de database, tablas y demas basado en Diagrama E-R

-- Creacion de database y uso de ella
CREATE DATABASE universidad;
USE universidad;

-- Creacion de la tabla departamento
CREATE TABLE departamento (
	id INT(10) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL
);

-- Creacion de la tabla profesor
CREATE TABLE profesor (
	id INT(10) PRIMARY KEY,
	nif VARCHAR(9) NULL,
	nombre VARCHAR(25) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50) NULL,
	ciudad VARCHAR(25) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	telefono VARCHAR(9) NULL,
	fecha_nacimiento DATE NOT NULL,
	sexo ENUM('H', 'M') NOT NULL,
	id_departamento INT(10),
	FOREIGN KEY(id_departamento) REFERENCES departamento(id)
);

-- Creacion de la tabla grado
CREATE TABLE grado (
	id INT(10) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
);

-- Creacion de la tabla asignatura
CREATE TABLE asignatura (
	id INT(10) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	creditos FLOAT NOT NULL,
	tipo ENUM('básica','optativa','obligatoria') NOT NULL,
	curso TINYINT(3) NOT NULL,
	cuatrimestre TINYINT(3) NOT NULL,
	id_profesor INT(10),
	id_grado INT(10),
	FOREIGN KEY(id_profesor) REFERENCES profesor(id),
	FOREIGN KEY(id_grado) REFERENCES grado(id)
);

-- Creacion de la tabla alumno
CREATE TABLE alumno (
	id INT(10) PRIMARY KEY,
	nif VARCHAR(9) NULL,
	nombre VARCHAR(25) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50) NULL,
	ciudad VARCHAR(25) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	telefono VARCHAR(9) NULL,
	fecha_nacimiento DATE,
	sexo ENUM('H', 'M')
);

-- Creacion de la tabla curso_escolar
CREATE TABLE curso_escolar (
	id INT(10) PRIMARY KEY,
	anyo_inicio YEAR(4),
	anyo_fin YEAR(4)
);

-- Creacion de la tabla alumno_se_matricula_asignatura
CREATE TABLE alumno_se_matricula_asignatura(
	id_alumno INT(10),
	id_asignatura INT(10),
	id_curso_escolar INT(10),
	FOREIGN KEY(id_alumno) REFERENCES alumno(id),
	FOREIGN KEY(id_asignatura) REFERENCES asignatura(id),
	FOREIGN KEY(id_curso_escolar) REFERENCES curso_escolar(id)
);


-- Se realizaron las inserciones en un ScriptSQL aparte
-- inserciones basadas en el archivo insercionesUB.sql


-- Devolop for Juan Contreras - C.C:1.***.***.782




