CREATE DATABASE ministryEnvironment;
USE ministryEnvironment;

CREATE TABLE entity(
    entity_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (20) NOT NULL
);

-- natural parks

CREATE TABLE parks(
    park_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    declaration_date DATETIME NOT NULL,
    surface INT (20) NOT null,
    entity_id INT,
    FOREIGN KEY (entity_id) REFERENCES entity(entity_id)
); 

-- departments

CREATE TABLE deparments(
    department_id INT PRIMARY KEY auto_increment,
    name VARCHAR(20) NOT NULL,
    entity_id INT,
    FOREIGN KEY (entity_id) REFERENCES entity(entity_id)    
);

CREATE TABLE deparment_entity(
    deparment_entity_id INT PRIMARY KEY AUTO_INCREMENT,
    entity_id INT,
    FOREIGN KEY (entity_id) REFERENCES entity(entity_id),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES deparments(department_id)
); 

-- areas of natural parks and species

CREATE TABLE area(
    area_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)NOT NULL,
    surface INT (20) NOT null,
    park_id INT,
    FOREIGN KEY (park_id) REFERENCES parks(park_id)
); 

CREATE TABLE species(
    species_id INT PRIMARY KEY AUTO_INCREMENT,
    scientific_name VARCHAR (50)NOT NULL,
    common_name VARCHAR (50)NOT NULL,
    individual_inventory INT (20) NOT null,
    area_id INT,
    FOREIGN KEY (area_id) REFERENCES area(area_id)
); 

CREATE TABLE person_type(
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)NOT NULL,
    person_role VARCHAR (20) NOT null
);

CREATE TABLE staff(
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    identification_card VARCHAR (15) NOT NULL,
    name VARCHAR (50)NOT NULL,
    last_name VARCHAR (50)NOT NULL,
    contact_num VARCHAR (20) NOT NULL,
    salary INT (6) NOT NULL,
    address VARCHAR (50)NOT NULL,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES person_type(type_id)
); 

CREATE TABLE visitor(
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,
    identification_card VARCHAR (15) NOT NULL,
    name VARCHAR (50)NOT NULL,
    last_name VARCHAR (50)NOT NULL,
    address VARCHAR (50)NOT NULL,
    contact_num VARCHAR (20) NOT NULL,
    profession VARCHAR (20) NOT NULL,
    accommodation_id INT,
    FOREIGN KEY (accommodation_id) references accommodation(accommodation_id)
);

-- proyect information

CREATE TABLE species_project(
    species_project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES investigation_project(project_id),
    species_id INT,
    FOREIGN KEY (species_id) REFERENCES species(species_id)
); 

CREATE TABLE research_project(
    research_project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES investigation_project(project_id)
);

CREATE TABLE investigation_project(
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)NOT NULL,
    budget INT (20) NOT null,
    period INT (20) NOT null
);

CREATE TABLE accommodation(
    accommodation_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)NOT NULL,
    capacity INT (2)NOT NULL,
    category VARCHAR (20)NOT NULL,
    park_id INT,
    FOREIGN KEY (park_id) REFERENCES parks(park_id)
);