CREATE DATABASE dia4;

USE dia4;

CREATE TABLE pais (
    paisID INT PRIMARY KEY,
    nombre VARCHAR(20),
    continente VARCHAR(50),
    poblacion INT
);

CREATE TABLE ciudad(
    ciudadID INT PRIMARY KEY,
    nombre VARCHAR(20),
    paisID INT,
    FOREIGN KEY (paisID)REFERENCES pais(paisID)
);

CREATE TABLE idioma (
    idiomaID INT PRIMARY KEY,
    idioma VARCHAR(50)
);

CREATE TABLE idiomaPais(
esoficialID TINYINT(1),
idiomaID INT,
paisID INT,
FOREIGN KEY (paisID)REFERENCES pais (paisID),
FOREIGN KEY (idiomaID) REFERENCES idioma (idiomaID)
);

INSERT INTO pais (paisID, nombre, continente, poblacion) VALUES
(1, 'Estados Unidos', 'America del Norte', 331000000),
(2, 'Canada', 'America del Norte', 377000000),
(3, 'Brasil', 'America del sur', 377000000),
(4, 'Reino Unido', 'Europa', 377000000),
(5, 'Alemania', 'Europa', 377000000),
(6, 'China', 'Asia', 377000000),
(7, 'India', 'Asia', 377000000),
(8, 'Australia', 'Oceania', 377000000),
(9, 'Sudafrica', 'Africa', 377000000),
(10, 'Mexico', 'America del Norte', 377000000);

INSERT INTO ciudad (ciudadID, nombre, paisID) VALUES
(1, 'Nueva York', 1),   -- Estados Unidos
(2, 'Los Ángeles', 1),  -- Estados Unidos
(3, 'Toronto', 2),      -- Canadá
(4, 'São Paulo', 3),    -- Brasil
(5, 'Londres', 4),      -- Reino Unido
(6, 'Berlín', 5),       -- Alemania
(7, 'Beijing', 6),      -- China
(8, 'Mumbai', 7),       -- India
(9, 'Sídney', 8),       -- Australia
(10, 'Ciudad de México', 10); -- México


INSERT INTO idioma (idiomaID, idioma) VALUES
(1, 'Inglés'),
(2, 'Español'),
(3, 'Francés'),
(4, 'Alemán'),
(5, 'Mandarín'),
(6, 'Ruso'),
(7, 'Portugués'),
(8, 'Japonés'),
(9, 'Árabe'),
(10, 'Italiano');


INSERT INTO idiomaPais (esoficialID, idiomaID, paisID) VALUES
(1, 1, 1),  -- Inglés es oficial en Estados Unidos
(1, 2, 10), -- Español es oficial en México
(1, 3, 4),  -- Francés es oficial en Reino Unido (reconocido en algunas regiones)
(1, 4, 5),  -- Alemán es oficial en Alemania
(1, 5, 6),  -- Mandarín es oficial en China
(1, 7, 3),  -- Portugués es oficial en Brasil
(0, 1, 3),  -- Inglés no es oficial en Brasil, pero se habla
(1, 8, 7),  -- Japonés es oficial en Japón
(1, 9, 9),  -- Árabe es oficial en Sudáfrica (en algunas regiones)
(1, 6, 7);  -- Ruso es oficial en algunas partes de India (en algunos contextos)

show tables;

-- Consulta general a ciudad
select * from ciudad;

-- Consulta general a paises
select * from pais;

-- Consulta de tipo INNER JOIN para obtener las ciudades
-- que están específicamente asignadas a un país
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais inner join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.paisID = ciudad.paisID; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse

-- Consulta de tipo LEFT JOIN para obtener todas las ciudades
-- junto con su país, incluso si alguna ciudad no está asignada a esta misma
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais left join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.paisID = ciudad.paisID; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse
... (20 líneas restantes)