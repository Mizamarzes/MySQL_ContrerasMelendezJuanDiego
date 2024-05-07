USE jardineria;

-- Devuelve un listado con el código de oficina y 
-- la ciudad donde hay oficinas.

SELECT codigo_oficina, ciudad FROM oficina o;

-- Devuelve un listado con la ciudad y el teléfono 
-- de las oficinas de España.

SELECT ciudad, telefono FROM oficina WHERE oficina.pais='España';

-- Devuelve un listado con el nombre, apellidos y email de 
-- los empleados cuyo jefe tiene un código de jefe igual a 7.

SELECT nombre, apellido1, apellido2, email FROM empleado WHERE empleado.codigo_jefe=7; 

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT puesto, nombre, apellido1, apellido2, email FROM empleado WHERE empleado.codigo_jefe is NULL;

-- Devuelve un listado con el nombre, apellidos y puesto de aquellos 
-- empleados que no sean representantes de ventas.

SELECT nombre, apellido1, apellido2, puesto FROM empleado WHERE empleado.puesto!='Representante Ventas';

-- Devuelve un listado con el nombre de los todos los clientes españoles.

SELECT nombre_cliente FROM cliente WHERE cliente.pais='Spain';

-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.

SELECT DISTINCT estado FROM pedido 


