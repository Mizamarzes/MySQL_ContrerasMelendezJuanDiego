-- ###################################
-- ######### EXERCISE#1 DAY 4 #########
-- ###################################

-- created the database
CREATE DATABASE day4;
-- used database
USE day4;


-- created the table of country
CREATE TABLE Country(
	id_country INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20),
	continent VARCHAR(50),
	population INT
)


-- created the table of city
CREATE TABLE City(
	id_city INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20),
	id_country INT,
	FOREIGN KEY(id_country) REFERENCES Country(id_country)
)



-- created the table of language
CREATE TABLE Language(
	id_language INT PRIMARY KEY AUTO_INCREMENT,
	language VARCHAR(50)
)


-- created the table of language_country
CREATE TABLE Language_country(
	id_languageCountry INT,
	id_country INT,
	is_oficial TINYINT(1),
	FOREIGN KEY(id_languageCountry) REFERENCES Language(id_language),
	FOREIGN KEY(id_country) REFERENCES Country(id_country)
)

-- 10 INSERTIONS PER TABLE

-- INSERTIONS OF COUNTRY
INSERT INTO Country (name, continent, population)
VALUES ( 'Germany', 'Europe', 42189489),
		( 'Colombia', 'SouthAmerica', 1241414),
		( 'Argentina', 'SouthAmerica', 124351),
		( 'Chile', 'SouthAmerica', 52562632),
		( 'Bolivia', 'SouthAmerica', 39592),
		( 'Spain', 'Europe', 5436246),
		( 'Italy', 'Europe', 3153154),
		( 'Canada', 'NorthAmerica', 14124566),
		( 'Mexico', 'America', 1543265364),
		( 'Peru', 'SouthAmerica', 31515153);
	

-- INSERTIONS OF CITY
INSERT INTO City (name, id_country)
VALUES ( 'Cucuta', 2),
		( 'Bogota', 7),
		( 'Medellin', 3),
		( 'Boston', 2),
		( 'Berlin', 2),
		( 'Seattle', 2),
		( 'Venecia', 1),
		( 'Paris', 2),
		( 'Madrid', 3),
		( 'Valencia', 5);

	
-- INSERTIONS OF LANGUAGE
INSERT INTO Language (language)
VALUES ( 'French'),
		( 'Spanish'),
		( 'Italian'),
		( 'Indu'),
		( 'Portugues'),
		( 'Holandes'),
		( 'Afgano'),
		( 'Serbio'),
		( 'Austriaco'),
		( 'Tailandes');
	
	
-- INSERTIONS OF LANGUAGE_COUNTRY
INSERT INTO Language_country (id_languageCountry, id_country, is_oficial)
VALUES (1,5,1),
		(6,4,0),
		(1,6,1),
		(1,7,1),
		(5,6,1),
		(5,1,0),
		(6,7,0),
		(10,10,0),
		(10,10,0),
		(2,6,0);
	
-- Devolop for Juan Contreras - C.C:1.***.***.782


