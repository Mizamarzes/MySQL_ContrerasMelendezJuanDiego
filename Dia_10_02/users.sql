-- ###################################
-- ######### DAY 10  ###################
-- ###################################
-- Creacion de usuarios y permisos
-- Seguridad

SHOW DATABASES;
CREATE DATABASE dia10;
USE dia10;

-- Comando para crear un usuario en cualquier parte
CREATE USER 'pedro'@'%' identified by 'pedro123';

-- Comando para crear un usuario en localHOST
CREATE USER 'pedroLocal'@'localhost' identified by 'pedro123';

-- Revisar permisos
SHOW GRANTS FOR 'pedro'@'%';


FLUSH PRIVILEGES;

-- Ejemplo tabla
CREATE TABLE person(
	id INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255)
);

-- Inserciones para la tabla
INSERT INTO person (id, nombre, apellido) VALUES (1, 'Juan', 'Pérez');
INSERT INTO person (id, nombre, apellido) VALUES (2, 'María', 'González');
INSERT INTO person (id, nombre, apellido) VALUES (3, 'Carlos', 'Rodríguez');
INSERT INTO person (id, nombre, apellido) VALUES (4, 'Ana', 'Martínez');
INSERT INTO person (id, nombre, apellido) VALUES (5, 'Luis', 'Hernández');
INSERT INTO person (id, nombre, apellido) VALUES (6, 'Marta', 'López');
INSERT INTO person (id, nombre, apellido) VALUES (7, 'Pedro', 'García');
INSERT INTO person (id, nombre, apellido) VALUES (8, 'Laura', 'Fernández');
INSERT INTO person (id, nombre, apellido) VALUES (9, 'José', 'Sánchez');
INSERT INTO person (id, nombre, apellido) VALUES (10, 'Elena', 'Ramírez');

-- Mirar tabla
SELECT * FROM person;

-- Asignar permisos
GRANT SELECT ON dia10.* to 'pedro'@'%';

-- Asignar permisos mas especificos
GRANT SELECT, INSERT, UPDATE, DELETE ON *.*

-- Revocar permisos
REVOKE INSERT ON dia10.* FROM 'pedro'@'%';

-- Revocar todos los permisos
REVOKE ALL PRIVILEGES ON *.* FROM 'pedro'@'172.16.101.132';

-- Revisar procesos 
SHOW PROCESSLIST;

-- Quitar proceso
kill 158;


