create database school;
use school;

-- Define the Person table to store information about individuals
CREATE TABLE Person (
    personID INT PRIMARY KEY AUTO_INCREMENT,
    nif VARCHAR(9),
    name VARCHAR(25) NOT NULL,
    lastName1 VARCHAR(50) NOT NULL,
    lastName2 VARCHAR(50),
    city VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(9), 
    date_of_birth DATETIME NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    type_gender ENUM('Male', 'Female', 'Other') NOT NULL  -- Adjust enum values as needed
);

-- Define the Student_enrolls_in_a_subject table to manage student enrollment in subjects
CREATE TABLE Student_enrolls_in_a_subject (
    id_student INT,
    FOREIGN KEY (id_student) REFERENCES Person(personID),
    id_subject INT,
    FOREIGN KEY (id_subject) REFERENCES Subject(subjectID),
    id_course INT,
    FOREIGN KEY (id_course) REFERENCES Course(courseID)
);

-- Define the Subject table to store information about subjects
CREATE TABLE Subject (
    subjectID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    credits FLOAT NOT NULL,
    type_ ENUM('Type1', 'Type2', 'Type3') NOT NULL, -- Adjust enum values as needed
    course SMALLINT NOT NULL,
    quarterTerm SMALLINT NOT NULL,
    id_teacher INT,
    FOREIGN KEY (id_teacher) REFERENCES Teacher(teacherID),
    id_grade INT,
    FOREIGN KEY (id_grade) REFERENCES Grade(gradeID) 
);

-- Define the Course table to store information about courses
CREATE TABLE Course (
    courseID INT PRIMARY KEY AUTO_INCREMENT,
    year_start YEAR(4) NOT NULL,
    year_end YEAR(4) NOT NULL
);

-- Define the Department table to store information about departments
CREATE TABLE Department (
    departmentID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Define the Teacher table to store information about teachers
CREATE TABLE Teacher (
    teacherID INT PRIMARY KEY AUTO_INCREMENT,
    id_department INT NOT NULL,
    FOREIGN KEY (id_department) REFERENCES Department(departmentID)
);

-- Define the Grade table to store information about grades
CREATE TABLE Grade (
    gradeID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);