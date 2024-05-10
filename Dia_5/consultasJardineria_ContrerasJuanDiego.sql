-- ###############################
-- ###### EJERCICIO DIA 5 ########
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

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega  FROM pedido WHERE ADDDATE(fecha_esperada , INTERVAL -2 DAY)>= fecha_entrega;   

-- Utilizando la función DATEDIFF de MySQL.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega  FROM pedido WHERE DATEDIFF(fecha_esperada, fecha_entrega)>=2;

-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?


-- Devuelve un listado de todos los pedidos que fueron en 2009.

-- Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.

-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. 
-- Ordene el resultado de mayor a menor.

-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. 
-- Tenga en cuenta que no deben aparecer formas de pago repetidas.

-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales 
-- y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de 
-- venta, mostrando en primer lugar los de mayor precio.

-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.


-- ######################### CONSULTAS MULTITABLA(Composicióon interna) ##############################
-- Resuelva todas las consultas mediante INNER JOIN y NATURAL JOIN.

-- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

-- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

-- Muestra el nombre de los clientes que  hayan realizado pagos junto con el nombre de sus representantes de ventas.

-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

-- Devuelve el nombre de los clientes que  hayan hecho pagos y el nombre de sus representantes 
-- junto con la ciudad de la oficina a la que pertenece 
-- el representante.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

-- Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina 
-- a la que pertenece el representante.

-- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

-- Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y 
-- el nombre del jefe de sus jefe.

-- Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

-- Devolop for Juan Contreras - C.C:1.***.***.782





