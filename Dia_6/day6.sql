-- ######################################
-- ######## EJERCICIO DIA 6 #############
-- ######################################

-- TITULO: NORMALIZACION DE BASE DE DATOS
-- ¿Que es normalizar?: Reducir las posibles redundancias de datos y
-- con ello mejorar la integridad de los datos.

-- Pasos principales para la normalizacion
-- Primera Forma Normal (1NF)
-- Segunda Forma Normal (2NF)
-- Tercera Forma Normal (3NF)

-- ########### Primera Forma Normal(1NF) ################
-- En la 1NF se busca eliminar las repeticiones de datos y asegurar con ello que cada columna
-- contenga un solo valor atomico (Dato que no se puede dividir, sea por coveniencia o por 
-- especificacion del lenguaje)

-- Ej: nombreCOmpleto= PEDRO FELIPE GOMEZ BONILLA --> ¿Es atomico?
-- RTA: No, por que se puede dividir en nombres y apellidos

-- Ej2: nombre=Pedro Felipe, apellido=Gomez Bonilla --> ¿Es atomico?
-- RTA Depende del idseñador de base de datos, pus es un criterio muy subjetivo

-- EX1: ¿El siguiente query esta normalizado de acuerdo al 1NF?

CREATE DATABASE dia6;
USE dia6;

CREATE TABLE Estudiante(
	ID INT,
	Nombre VARCHAR(100),
	Telefono VARCHAR(15)
);

-- RTA: No, por que el usuario esta ingresando el nombre completo. Aún asi
-- ,si el diseñador lo ve pertinente por los requisitos empresariales,
-- lo puede dejar asi.


-- ¿Como podemos normalizarla, ya habiendo creado la tabla anteriormente?
ALTER TABLE Estudiante ADD Apellido VARCHAR(100);

-- Prueba de agregacion de datos
SHOW TABLES;
SELECT * FROM Estudiante;

-- Revisar columnas creadas con su tipologia de dato
SHOW COLUMNS FROM Estudiante;

-- Manera #2 de mostrar informacion de la tabla
DESCRIBE Estudiante; 
INSERT INTO Estudiante(ID, Nombre, Apellido, Telefono) 
VALUES (1,'Juanito','Melendez','3234324324');

-- Alterar la tabla existente
ALTER TABLE Estudiante ADD Edad INT NOT NULL DEFAULT 5;
DROP TABLE Estudiante;

-- Creacion de la tabla de estudiante

CREATE TABLE curso(
	ID_Curso INT,
	Nombre_Curso VARCHAR(50),
	Estudiantes_Inscritos VARCHAR(50)
);

-- Eliminar la tabla
DROP TABLE curso;

INSERT INTO curso VALUES 
	(101, 'Matematicas', 'Ana, Juan, Maria'),
	(102, 'Historia', 'Pedro, Luis, Ana, Carmen'),
	(103, 'Fisica', 'Juan, Carmen, Beatriz');

SELECT * FROM curso;

-- Eliminar datos de la tabla 
TRUNCATE curso;

-- Cambiar nombre de una columna en una tabla
ALTER TABLE curso
RENAME COLUMN Estudiantes_Inscritos to Estudiante;


-- Primera forma normal(1NF)
INSERT INTO curso VALUES
	(101, 'Matematicas', 'Ana'),
	(101, 'Matematicas', 'Juan'),
	(101, 'Matematicas', 'Maria'),
	(102, 'Historia', 'Pedro'),
	(102, 'Historia', 'Carmen'),
	(102, 'Historia', 'Ana'),
	(103, 'Fisica', 'Juan'),
	(103, 'Fisica', 'Carmen'),
	(103, 'Fisica', 'Beatriz');

-- ################# Segunda Forma Normal (2NF) ######################
-- Es cuando una tabla esta en la forma 1NF, donde cada atributo
-- que no forma parte de la clave primaria es COMPLETAMENTE DEPENDIENTE
-- de la clave primaria.


-- Dicha 2NF se aplica a la tablas que tienen claves primarias compuestas de 
-- dos o mas atributos, donde si una tabla esta en 1FN y su cavle primaria es simple
-- (Tiene un solo atributo), entonces tambien esta en su 2NF

-- Lo que busca hacer la 2NF es que cada atributo no clave en una tabla deba depender 
-- completamente de la clave primaria de esa tabla, mas no ser una parte de ella.

-- Requisito: Estar en la 1NF donde todos los atributos no claves deban depender totalmente
-- de la clave primaria, EN otras palabras, el nombre del curso dependiente del id de este
-- mismo, pero estan juntan. Dicho esto, debemos buscar una manera de
-- IDEPENDIZAR dichos datos

-- Tabla curso
CREATE TABLE curso(
	ID_Curso VARCHAR(100),
	Nombre_Curso VARCHAR(100),
	Nombre_Profesor VARCHAR(100)
);

-- Tabla de conexion entre estudiante y curso
CREATE TABLE estudiante_has_curso(
	ID_Estudiante VARCHAR(100),
	ID_Curso VARCHAR(100)
);

-- Tabla de estudiante
CREATE TABLE estudiante(
	ID_Estudiante VARCHAR(100),
	Nombre_Estudiante VARCHAR(50)
);

INSERT INTO curso(ID_Curso, Nombre_Curso, Nombre_Profesor) VALUES
	('C101', 'Matematicas', 'Carlos'),
	('C102', 'Fisica', 'Pedro'),
	('C103', 'Biologia', 'Olga');

INSERT INTO estudiante(ID_Estudiante, Nombre_Estudiante) VALUES
	('E01', 'Ana'),
	('E02', 'Carlos'),
	('E03', 'Pedro');

INSERT INTO estudiante_has_curso(ID_Estudiante, ID_Curso) VALUES
	('E01', 'C101'),
	('E02', 'C102'),
	('E03', 'C103');
	
SELECT * FROM curso c 



-- Devolop for Juan Contreras - C.C:1.***.***.782




