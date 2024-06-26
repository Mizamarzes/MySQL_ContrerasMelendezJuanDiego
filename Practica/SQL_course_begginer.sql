-- ##################################################################
-- ###### SQL Tutorial - Full Database Course for Beginners ########
-- ###################################################################
-- Information from https://www.youtube.com/watch?v=HXV3zeQKqGY&t=13608s

CREATE DATABASE sql_workbench;
USE sql_workbench;

CREATE TABLE student(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name_student VARCHAR(20),
    major VARCHAR(20)
);

INSERT INTO student VALUES
	(2, 'Marcos', 'Tech'),
    (4, 'Jhoan', 'Maths'),
    (5, 'Will', 'Phisycs');

INSERT INTO student(student_id, name_student) VALUES (4,'PussyDestroyer');

SELECT * FROM student;

UPDATE student
SET major= 'mondacon', name_student='Juanito'
WHERE student_id = 6;

DELETE FROM student
WHERE student_id=2;

SELECT * FROM student
ORDER BY student_id ASC
LIMIT 2;

INSERT INTO student VALUES(7,'bart','Sports');

SELECT * FROM student
WHERE name_student IN ('Juanito', 'Marcos', 'Will') AND student_id =2;

-- Second version of the video, MYSQL course of begginer

CREATE TABLE branch (
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
	client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY(emp_id, client_id),
FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
	branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- Corporate

INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);


-- Scranton

INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

-- ############################### CONSULTS ############################################################################

-- fin all employees
SELECT * FROM employee;

-- find all employees ordered by salary
SELECT * FROM employee
ORDER BY salary;

-- find all employees ordered by sex then name
SELECT * FROM employee
ORDER BY sex, first_name, last_name;

-- find the first 5 employees in the table
SELECT * FROM employee
LIMIT 5;

-- find the frist and last names of all employees
SELECT first_name, last_name FROM employee;

-- find the forename and surnames names of all employees
SELECT first_name AS forename, last_name AS surname FROM employee;

-- find out all the different genders
SELECT DISTINCT sex FROM employee;



-- ---------------------- FUNCTIONS ------------------------------------------

-- Find the number of employees
SELECT COUNT(emp_id) FROM employee;

 
-- Find the number of female employees born after 1970
SELECT COUNT(emp_id) FROM employee
WHERE sex= 'F' AND birth_day > '1971-01-01';  

-- Find the average of all employee's salaries
SELECT AVG(salary) FROM employee;

-- Find the sum of all employee's salaries
SELECT SUM(salary) FROM employee;

-- Find out how many males and females there are
SELECT COUNT(sex), sex FROM employee
GROUP BY sex;

-- Find the total sales of each salesman
SELECT emp_id, SUM(total_sales) FROM Works_With
GROUP BY emp_id;

-- ---------------------------- WildCards -------------------------------------------------

-- % = any # characters, _ = one character

-- Find any client's who are an LLC
SELECT * FROM client
WHERE client_name LIKE '%llc';

-- Find any branch suppliers who are in the label business
SELECT * FROM branch_supplier
WHERE supplier_name LIKE '%label%';

-- Find any employee born in October
SELECT * FROM employee
WHERE birth_day LIKE '____-10-__';

-- Find any clients who are schools
SELECT * FROM Client
WHERE client_name LIKE '%school';


-- ------------------------------------------ UNION ----------------------------------------------------------

-- Find a list of employee and branch names

SELECT first_name as a FROM employee
UNION
SELECT branch_name as e FROM branch
UNION
SELECT client_name as t FROM client;

-- Find a list of all clients & branch supllliers'names
SELECT client_name, branch_id FROM client
UNION
SELECT supplier_name, branch_id FROM branch_supplier;

-- Find a list of all money spent or earned by the company

SELECT SUM(total_sales) FROM works_with
UNION
Select SUM(salary) FROM employee;



-- ------------------------------------- JOINS ----------------------------------------------

INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);

-- Find all branches and the names of their managers
SELECT e.emp_id, e.first_name, b.branch_name FROM employee e 
LEFT JOIN branch b ON e.emp_id = b.mgr_id
ORDER BY branch_name IS NULL ASC;

-- -------------------------- NESTED QUERIES -----------------------------------------------------

-- Find names of all employees who have sold over 30,000 to a single client
-- this is a way with joins
SELECT e.emp_id, e.first_name, w.client_id, w.total_sales FROM employee e
JOIN works_with w ON e.emp_id = w.emp_id
WHERE total_sales>30000
ORDER BY first_name;
-- this is a way with Nested queries
SELECT employee.first_name, employee.last_name FROM employee 
WHERE employee.emp_id IN (
	SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);

-- Find all clients who are handled by the branch 
-- that Michael Scot manages
-- Assume you know Michael's ID

SELECT client.client_name FROM client
WHERE client.branch_id IN (
	SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id=102
);

-- ------------------------------------ ON DELETE --------------------------------------------------------

-- On delete set null
CREATE TABLE branch (
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

DELETE FROM employee
WHERE emp_id = 102;

SELECT * FROM branch;
SELECT * FROM EMPLOYEE;
-- If you delete with ON DELETE SET NULL, only delete the id not all of atribute


-- On delete Cascade
CREATE TABLE branch_supplier (
	branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

DELETE FROM branch
WHERE branch_id = 2;
-- If you delete with ON DELETE CASCADE, delete all of atribute also the conections with it

SELECT * FROM branch_supplier;


-- --------------------------- Trigger ---------------------------------------------------------------------

CREATE TABLE trigger_test(
	message VARCHAR(100)
);



-- Devolop for Juan Contreras - C.C:1.***.***.782


