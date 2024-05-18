-- ###################################
-- ######### DAY 10 TALLER ###################
-- ###################################
-- estructura de las tablas
-- basado en tallerConsultas.pdf

-- Creacion de la base de datos
CREATE DATABASE taller_dia10;
-- Uso de la base de datos
USE taller_dia10;

-- Crear tabla departamento
CREATE TABLE departamento (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	presupuesto DOUBLE UNSIGNED NOT NULL,
	gastos DOUBLE UNSIGNED NOT NULL
); 

-- Crear tabla empleado
CREATE TABLE empleado (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nif VARCHAR(9) NOT NULL UNIQUE,
	nombre VARCHAR(100) NOT NULL,
	apellido1 VARCHAR(100) NOT NULL,
	apellido2 VARCHAR(100),
	id_departamento INT UNSIGNED,
	FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- Eliminar tablas
DROP TABLE departamento;

-- Consultar informacion de la tabla departamento
SELECT * FROM departamento;

-- Consultar informacion de la tabla empleado
SELECT * FROM empleado;

-- Devolop for Juan Contreras - C.C:1.***.***.782