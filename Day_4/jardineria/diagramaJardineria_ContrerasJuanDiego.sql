-- ###############################
-- ###### EJERCICIO DIA 4 ########
-- ###############################
-- Basado en el archivo jardineria.png
-- Creacion y uso de la BBDD "jardineria"

CREATE DATABASE jardineria;
USE jardineria;

-- CREACION TABLA GAMA_PRODUCTO
CREATE TABLE gama_producto (
	gama VARCHAR(50) PRIMARY KEY,
	descripcion_texto TEXT,
	descripcion_html TEXT,
	imagen VARCHAR(256)
);

-- CREACION TABLA PRODUCTO
CREATE TABLE producto (
	codigo_producto VARCHAR(15) PRIMARY KEY,
	nombre VARCHAR(15) NOT NULL,
	gama VARCHAR(50),
	dimensiones VARCHAR(25),
	proveedor VARCHAR(50),
	descripcion TEXT,
	cantidad_en_stock SMALLINT(6) NOT NULL,
	precio_venta DECIMAL(15,2) NOT NULL,
	precio_proveedor DECIMAL(15,2),
	FOREIGN KEY(gama) REFERENCES gama_producto(gama)
);

-- CREACION TABLA OFICINA
CREATE TABLE oficina (
	codigo_oficina VARCHAR(10) PRIMARY KEY,
	ciudad VARCHAR(30) NOT NULL,
	pais VARCHAR(50) NOT NULL,
	region VARCHAR(50),
	codigo_postal VARCHAR(10) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	linea_direccion1 VARCHAR(50) NOT NULL,
	linea_direccion2 VARCHAR(50)
)

-- CREACION TABLA EMPLEADO
CREATE TABLE empleado (
	codigo_empleado INT(11) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50),
	extension VARCHAR(10),
	email VARCHAR(100) NOT NULL,
	codigo_oficina VARCHAR(10),
	codigo_jefe INT(11),
	puesto VARCHAR(50),
	FOREIGN KEY(codigo_oficina) REFERENCES oficina(codigo_oficina)
);

-- CREACION TABLA CLIENTE
CREATE TABLE cliente (
	codigo_cliente INT(11) PRIMARY KEY,
	nombre_cliente VARCHAR(50) NOT NULL,
	nombre_contacto VARCHAR(30),
	apellido_contacto VARCHAR(40),
	telefono VARCHAR(15) NOT NULL,
	fax VARCHAR(15) NOT NULL,
	linea_direccion1 VARCHAR(50) NOT NULL,
	linea_direccion2 VARCHAR(50),
	ciudad VARCHAR(50) NOT NULL,
	region VARCHAR(50),
	pais VARCHAR(50),
	codigo_postal VARCHAR(10),
	codigo_empleado_rep_ventas INT(11),
	limite_credito DECIMAL(15,2),
	FOREIGN KEY(codigo_empleado_rep_ventas) REFERENCES empleado(codigo_empleado) 
);

-- CREACION TABLA PEDIDO
CREATE TABLE pedido (
	codigo_pedido INT(11) PRIMARY KEY,
	fecha_pedido DATE NOT NULL,
	fecha_esperada DATE NOT NULL,
	fecha_entrega DATE,
	estado VARCHAR(15) NOT NULL,
	comentarios TEXT,
	codigo_cliente INT(11),
	FOREIGN KEY(codigo_cliente) REFERENCES cliente(codigo_cliente)
);

-- CREACION TABLA DETALLE_PEDIDO
CREATE TABLE detalle_pedido (
	codigo_pedido INT(11),
	codigo_producto VARCHAR(15),
	cantidad INT(11) NOT NULL,
	precio_unidad DECIMAL(15,2) NOT NULL,
	numero_linea SMALLINT(6),
	FOREIGN KEY(codigo_pedido) REFERENCES pedido(codigo_pedido),
	FOREIGN KEY(codigo_producto) REFERENCES producto(codigo_producto)
);

CREATE TABLE pago(
	codigo_cliente INT(11),
	forma_pago VARCHAR(40) NOT NULL,
	id_transaccion VARCHAR(50) PRIMARY KEY,
	fecha_pago DATE NOT NULL,
	total DECIMAL(15,2) NOT NULL,
	FOREIGN KEY(codigo_cliente) REFERENCES cliente(codigo_cliente)
)


-- Devolop for Juan Contreras - C.C:1.***.***.782

