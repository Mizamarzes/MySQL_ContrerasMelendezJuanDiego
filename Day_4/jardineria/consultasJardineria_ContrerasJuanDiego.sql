-- ###############################
-- ###### EJERCICIO DIA 4 ########
-- ###############################
-- Consultas a la database

USE jardineria;

-- Devuelve un listado con el código de oficina y 
-- la ciudad donde hay oficinas.

SELECT codigo_oficina, ciudad FROM oficina;

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

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
-- Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. 
-- Resuelva la consulta:

-- Utilizando la función YEAR de MySQL.

SELECT codigo_cliente FROM pago WHERE YEAR(pago.fecha_pago)=2008;

-- Utilizando la función DATE_FORMAT de MySQL.

SELECT codigo_cliente FROM pago WHERE DATE_FORMAT(fecha_pago, '%Y')=2008;  

-- Sin utilizar ninguna de las funciones anteriores.

SELECT codigo_cliente FROM pago WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31'

-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y 
-- fecha de entrega de los pedidos que no han sido entregados a tiempo.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega  FROM pedido WHERE fecha_entrega>fecha_esperada  

-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega
--  de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

-- Utilizando la función ADDDATE de MySQL.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega  FROM pedido WHERE ADDDATE(fecha_esperada, INTERVAL -2 DAY)   


-- Utilizando la función DATEDIFF de MySQL.


-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?





-- Devolop for Juan Contreras - C.C:1.***.***.782





