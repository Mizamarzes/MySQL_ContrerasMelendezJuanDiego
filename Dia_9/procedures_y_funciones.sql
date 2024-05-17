-- ###################################
-- ######### DAY 9 #########
-- ###################################


-- Procedures

CREATE PROCEDURE buscarProductoP(
	IN nombre_producto VARCHAR(100),
	OUT producto_precio decimal(10,2),
	OUT producto_nombre VARCHAR(100),
	OUT producto_id int)
BEGIN
    SELECT nombre,id,precio INTO producto_nombre, producto_id,producto_precio
   		   FROM productos WHERE nombre = nombre_producto LIMIT 1;
END;
CALL buscarProductoP("Cary",@producto_precio,@producto_nombre,@producto_id);
SELECT @producto_precio,@producto_nombre,@producto_id;

-- Devolop for Juan Contreras - C.C:1.***.***.782