USE jardineria;


-- Devuelve un listado con el código de oficina y 
-- la ciudad donde hay oficinas.

SELECT codigo_oficina, ciudad FROM oficina o;

-- Devuelve un listado con la ciudad y el teléfono 
-- de las oficinas de España.

IF oficina.pais = España(
	SELECT ciudad, telefono FROM oficina 
);





-- Devuelve un listado con el nombre, apellidos y email de 
-- los empleados cuyo jefe tiene un código de jefe igual a 7.



-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.


-- Devuelve un listado con el nombre, apellidos y puesto de aquellos 
-- empleados que no sean representantes de ventas.


-- Devuelve un listado con el nombre de los todos los clientes españoles.



-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.