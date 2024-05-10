-- ###############################
-- ###### EXAMEN1_MYSQL ########
-- ###############################
-- Consultas a la base de datos

-- Usar la base de datos
USE universidad;

-- 1. Devuelve un listado con los nombres de todos los profesores y los departamentos 
-- que tienen vinculados. El listado también debe mostrar aquellos profesores que 
-- no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, 
-- nombre del departamento, primer apellido, segundo apellido y nombre del profesor. 
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del 
-- departamento, apellidos y el nombre.

SELECT departamento.nombre as NombreDepartamento, profesor.apellido1 as PrimerApellido,
		profesor.apellido2 as SegundoApellido, profesor.nombre as NombreProfesor
FROM profesor LEFT JOIN departamento 
ON profesor.id = departamento.id
ORDER BY departamento.nombre ASC;

-- Solucion ChatGpt para analizar
SELECT 
    COALESCE(d.nombre, 'Sin departamento') AS nombre_departamento,
    p.apellido1,
    p.apellido2,
    p.nombre
FROM 
    profesor p
LEFT JOIN 
    departamento d ON p.id_departamento = d.id
ORDER BY 
    nombre_departamento ASC,
    p.apellido1 ASC,
    p.apellido2 ASC,
    p.nombre ASC;

-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.

-- Cada profesor esta asignado a un departamento
SELECT id, nif, nombre, apellido1, apellido2  FROM profesor WHERE id_departamento IS NULL;


-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.

-- Todos los departamentos tienen profesores asociados
SELECT id_departamento FROM profesor WHERE id_departamento IS NULL; 

-- 4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

-- todos los profesores imparten una asignatura
SELECT id_profesor FROM asignatura WHERE id_profesor IS NULL;

-- 5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT id, nombre, id_profesor FROM asignatura WHERE id_profesor IS NULL;

-- 6. Devuelve un listado con todos los departamentos que tienen alguna asignatura 
-- que no se haya impartido en ningún curso escolar. El resultado debe mostrar 
-- el nombre del departamento y el nombre de la asignatura 
-- que no se haya impartido nunca.

-- Solucion chatgpt para analizar
SELECT d.nombre AS nombre_departamento, a.nombre AS nombre_asignatura
FROM profesor p
JOIN asignatura a ON p.id = a.id_profesor
JOIN departamento d ON p.id_departamento = d.id
WHERE NOT EXISTS (
    SELECT 1
    FROM curso_escolar ce
    JOIN alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar
    WHERE ama.id_asignatura = a.id
)
ORDER BY d.nombre, a.nombre;


-- 7. Devuelve el número total de alumnas que hay.

SELECT COUNT(id) FROM alumno WHERE sexo='M' 

-- 8. Calcula cuántos alumnos nacieron en 1999.

SELECT COUNT(id)  FROM alumno WHERE YEAR(fecha_nacimiento)=1999;


-- 9. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe 
-- mostrar dos columnas, una con el nombre del departamento y otra con el número de 
-- profesores que hay en ese departamento. El resultado sólo debe incluir los 
-- departamentos que tienen profesores asociados y deberá estar ordenado de mayor 
-- a menor por el número de profesores.

-- Resuelto con chatGpt para analizar
SELECT 
    d.nombre AS nombre_departamento,
    COUNT(p.id) AS cantidad_profesores
FROM 
    departamento d
JOIN 
    profesor p ON d.id = p.id_departamento
GROUP BY 
    d.nombre
HAVING 
    COUNT(p.id) > 0
ORDER BY 
    cantidad_profesores DESC;


-- 10. Devuelve un listado con todos los departamentos y el número de profesores 
-- que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos 
-- que no tienen profesores asociados. Estos departamentos también tienen que aparecer 
-- en el listado.

SELECT 
    d.nombre AS nombre_departamento,
    COUNT(p.id) AS cantidad_profesores
FROM 
    departamento d
LEFT JOIN 
    profesor p ON d.id = p.id_departamento
GROUP BY 
    d.nombre
ORDER BY 
    nombre_departamento;
   
-- 11. Devuelve un listado con el nombre de todos los grados existentes en la base de 
-- datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden 
-- existir grados que no tienen asignaturas asociadas. Estos grados también tienen 
-- que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor 
-- por el número de asignaturas.
   
SELECT 
    g.nombre AS nombre_grado,
    COUNT(a.id) AS cantidad_asignaturas
FROM 
    grado g
LEFT JOIN 
    asignatura a ON g.id = a.id_grado
GROUP BY 
    g.nombre
ORDER BY 
    cantidad_asignaturas DESC;


-- 12. Devuelve un listado con el nombre de todos los grados existentes en la base de 
-- datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 
-- 40 asignaturas asociadas.

SELECT 
    g.nombre AS nombre_grado,
    COUNT(a.id) AS cantidad_asignaturas
FROM 
    grado g
LEFT JOIN 
    asignatura a ON g.id = a.id_grado
GROUP BY 
    g.nombre
HAVING 
    COUNT(a.id) > 40
ORDER BY 
    cantidad_asignaturas DESC;


-- 13. Devuelve un listado que muestre el nombre de los grados y la suma del número 
-- total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres
-- columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las 
-- asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número 
-- total de crédidos.

SELECT 
    g.nombre AS nombre_grado,
    a.tipo AS tipo_asignatura,
    SUM(a.creditos) AS suma_creditos
FROM 
    grado g
JOIN 
    asignatura a ON g.id = a.id_grado
GROUP BY 
    g.nombre,
    a.tipo
ORDER BY 
    suma_creditos DESC;


-- 14. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna 
-- asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos 
-- columnas, una columna con el año de inicio del curso escolar y otra con el número 
-- de alumnos matriculados.

SELECT 
    ce.anyo_inicio AS año_inicio_curso,
    COUNT(DISTINCT ama.id_alumno) AS numero_alumnos_matriculados
FROM 
    curso_escolar ce
LEFT JOIN 
    alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar
GROUP BY 
    ce.anyo_inicio
ORDER BY 
    ce.anyo_inicio;


-- 15. Devuelve un listado con el número de asignaturas que imparte cada profesor. 
-- El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. 
-- El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y 
-- número de asignaturas. El resultado estará ordenado de mayor a menor por el número 
-- de asignaturas.

SELECT 
    p.id,
    p.nombre,
    p.apellido1,
    p.apellido2,
    COUNT(DISTINCT a.id) AS numero_asignaturas
FROM 
    profesor p
LEFT JOIN 
    asignatura a ON p.id = a.id_profesor
GROUP BY 
    p.id,
    p.nombre,
    p.apellido1,
    p.apellido2
ORDER BY 
    numero_asignaturas DESC;

-- 16. Devuelve todos los datos del alumno más joven.

SELECT *
FROM alumno
WHERE fecha_nacimiento = (
    SELECT MIN(fecha_nacimiento)
    FROM alumno
);

-- 17. Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT 
    p.*
FROM 
    profesor p
LEFT JOIN 
    departamento d ON p.id_departamento = d.id
WHERE 
    d.id IS NULL;
 
-- 18. Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT 
    d.*
FROM 
    departamento d
LEFT JOIN 
    profesor p ON d.id = p.id_departamento
WHERE 
    p.id IS NULL;

-- 19. Devuelve un listado con los profesores que tienen un departamento asociado y 
-- que no imparten ninguna asignatura.

SELECT 
    p.*
FROM 
    profesor p
INNER JOIN 
    departamento d ON p.id_departamento = d.id
WHERE 
    p.id NOT IN (
        SELECT 
            id_profesor
        FROM 
            asignatura
    );

-- 20. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT 
    a.*
FROM 
    asignatura a
LEFT JOIN 
    profesor p ON a.id_profesor = p.id
WHERE 
    p.id IS NULL;

-- Devolop for Juan Contreras - C.C:1.***.***.782