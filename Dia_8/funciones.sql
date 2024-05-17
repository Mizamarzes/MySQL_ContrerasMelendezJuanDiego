-- ###################################
-- ######### DAY 8 ###################
-- ###################################

SHOW databases;
CREATE DATABASE dia8;
USE dia8;

CREATE TABLE productos(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    PRIMARY KEY(id)
);

insert into productos values
    (1,"Pepito",23.2),
    (2,"MousePad",100000.21),
    (3,"Espionap",2500.25),
    (4,"BOB-ESPONJA",1500.25),
    (5,"Cary",23540000.23),
    (6,"OvulAPP",198700.23),
    (7,"PapayAPP",2000.00),
    (8,"Menosprecio",3800.00),
    (9,"CariciasOlfer",2300.00),
    (10,"Perfume La Cumbre", 35000.25),
    (11,"Nevera M800",3000.12),
    (12,"Crema Suave", 2845.00),
    (13,"juego de mesa La Cabellera",9800.00);
    
-- Para crear una funcion la cual me retorne el nombre
-- del producto con el precio mas iva (19%)
delimiter //
CREATE FUNCTION TotalConIVA(precio decimal(10,2), iva decimal(5,2))
returns VARCHAR(255) deterministic
begin
	if precio <1000 then
		return CONCAT("TU PRECIO CON DESCUENTO POR -1000 ES:", precio+((precio*iva-2)/100));
	else
		return CONCAT("TU PRECIO COMPLETO ES: ",precio+((precio*iva)/100));
	end if;
end//
delimiter ;

-- Eliminar funcion
DROP FUNCTION TotalConIVA;

-- Llamar a la funcion y mostrar los datos por medio de una consulta
SELECT nombre, TotalConIva(Precio, 19) as Precio_con_Iva FROM productos;

-- --------------------------------------------
CREATE FUNCTION buscarProducto(nombre_producto VARCHAR(100)) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE producto_precio decimal(10,2);
    DECLARE producto_nombre VARCHAR(100);
    DECLARE producto_id int;
    SELECT nombre,id,precio INTO producto_nombre, producto_id,producto_precio
   		   FROM productos WHERE nombre = nombre_producto LIMIT 1;
    RETURN CONCAT('id: ',producto_id,' nombre: ', producto_nombre, ' precio: ', producto_precio);
END;
DROP FUNCTION buscarProducto;
SELECT buscarProducto("Cary") AS datos_producto;


-- Devolop for Juan Contreras - C.C:1.***.***.782