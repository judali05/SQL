create database sofacto;
use sofacto;

CREATE TABLE Cargo (
  IdCargo VARCHAR(20) NOT NULL,
  Nombre_cargo varchar(25) NOT NULL,
  primary key(IdCargo)
);


CREATE TABLE Categoria (
  Id_categoria INT AUTO_INCREMENT NOT NULL,
  Nombre_categoria varchar(20) NOT NULL,
  primary key (Id_categoria)
); 


CREATE TABLE Cliente (
  IdCliente varchar(15),
  Nombre_cliente varchar(30),
  Apellido_cliente varchar(30),
  IdTipo_identificacionFK VARCHAR(10),
  primary key(IdCliente)
);


CREATE TABLE Factura (
  IdFactura INT AUTO_INCREMENT NOT NULL,
  IdProducto_FK  varchar(15) NOT NULL,
  Cantidad_productos INT NOT NULL,
  Precio_producto float NOT NULL,
  Total_pagar float NOT NULL,
  Fecha_venta date NOT NULL,
  IdMetodo_pagoFK varchar(10) NOT NULL,
  IdCliente_FK varchar(15) NOT NULL,
  primary key(IdFactura)
); 


CREATE TABLE Inventario (
  Entrada_prod  varchar(12) NOT NULL,
  Cantidad_prod INT NOT  NULL,
  IdProductos_FK varchar(12) NOT NULL
); 


CREATE TABLE Metodo_pago (
  IdMetodo_pago INT AUTO_INCREMENT NOT NULL,
  Metodo_pago varchar(30) NOT NULL,
  primary key(IdMetodo_pago)
); 


CREATE TABLE Productos (
  IdProducto INT AUTO_INCREMENT NOT NULL,
  Nombre varchar(30) NOT NULL,
  Nombre_categoria_FK varchar(40) NOT NULL,
  Proveedor varchar(30) NOT NULL,
  Descripcion varchar(50) NOT NULL,
  Fecha     date NOT NULL,
  Estado  varchar(50) NOT NULL,
  Precio float NOT NULL,
  primary key(IdProducto)
);



CREATE TABLE Proveedor (
  IdProveedor INT AUTO_INCREMENT NOT NULL,
  Empresa varchar(25) NOT  NULL,
  Contacto varchar(13) NOT NULL,
  primary key(IdProveedor)
); 


CREATE TABLE Reporte_ventas (
  IdReporte_ventas INT AUTO_INCREMENT NOT NULL,
  IdFactura_FK INT NOT NULL,
  IdCliente_FK varchar(15) NOT NULL,
  primary key(IdReporte_ventas)
); 


CREATE TABLE Usuario (
  IdUsuario varchar(15) NOT NULL,
  Correo varchar(35) NOT NULL,
  Contrasena varchar(20) NOT  NULL,
  IdCargo_FK VARCHAR(20) NOT NULL,
  IdTipo_identificacionFK VARCHAR(10) NOT NULL,
  primary key(IdUsuario)
); 

CREATE TABLE Tipo_identificacion(
  IdTipo_identificacion INT AUTO_INCREMENT NOT NULL,
  Tipo_identificacion VARCHAR(40) NOT NULL,
  Numero_id INT NOT NULL,
  primary key(IdTipo_identificacion)
);



ALTER TABLE Inventario ADD FOREIGN KEY (IdProductos_FK) REFERENCES Productos(IdProducto);

ALTER TABLE Factura ADD FOREIGN KEY (IdMetodo_pagoFK) REFERENCES Metodo_pago(IdMetodo_pago);
ALTER TABLE Factura ADD FOREIGN KEY (IdCliente_FK) REFERENCES Cliente(IdCliente);

ALTER TABLE Reporte_ventas ADD FOREIGN KEY (IdFactura_FK) REFERENCES Factura(IdFactura);
ALTER TABLE Reporte_ventas ADD FOREIGN KEY (IdCliente_FK) REFERENCES Cliente(IdCliente);

ALTER TABLE Cliente ADD FOREIGN KEY (IdTipo_identificacionFK) REFERENCES Tipo_identificacion(IdTipo_identificacion);

ALTER TABLE Usuario ADD FOREIGN KEY (IdCargo_FK) REFERENCES Cargo(IdCargo);

ALTER TABLE Usuario ADD FOREIGN KEY (IdTipo_identificacionFK) REFERENCES Tipo_identificacion(IdTipo_identificacion);



insert into Cargo(IdCargo, Nombre_cargo) 
values  ("C1",'Administrador'),
        ("C2",'Usuario');

insert into Categoria(Nombre_categoria) 
values  ('Quesos'),
        ('Panes'),
        ('Salsas'),
        ('Yogurth'),
        ('Embutidos');

insert into Tipo_identificacion(Tipo_identificacion, Numero_id ) 
values  ('Cedula de ciudadania', 1005851861),
        ('Cedula de extranjeria', 57896314);

insert into Metodo_pago(Metodo_pago) 
values  ('Efectivo'),
        ('Tarjeta debito o credito'),
        ('Nequi'),
        ('Daviplata');

insert into Productos( Nombre,  Nombre_categoria_FK, Proveedor, Descripcion,  Fecha, Estado, Precio ) 
values  ('Queso doble crema','lacteos', 'proveedor','Bloque de 2.5 kilos', '2024-01-1', 'activo',5500),
        ('Queso campesino', 'lacteos', 'proveedor','200 gramos', '2024-01-1','activo',6000),
        ('Yogurth de mora','lacteos', 'proveedor','4 litros', '2024-01-1','activo',10000),
        ('Chorizo', 'lacteos', 'proveedor', 'Cantidad x6', '2024-01-1', 'activo',4500),
        ('Pan hamburguesa', 'lacteos', 'proveedor', 'x8', '2024-01-1', 'activo',4000),
        ('Salsa de tomate','lacteos', 'proveedor', 'Cantidad 1 litro', '2024-01-1', 'activo',4500);
        
 

insert into Inventario(Entrada_prod, Cantidad_prod, IdProductos_FK) 
values  ('2023-01-1',7,'PR1'),
        ('2023-01-2',10,'PR2'),
        ('2023-01-3',12,'PR3'),
        ('2023-01-4',17,'PR4'),
        ('2023-01-5',9,'PR5'),
        ('2023-01-6',8,'PR6');

insert into Cliente(IdCliente, Nombre_cliente,Apellido_cliente,IdTipo_identificacionFK) 
values  ('1012323864','Juan','Gonzalez','CC'),
        ('1027582949','Kevin','Wilches','CC'),
        ('1005851861','Darwin','Carvajal','CC'),
        ('6666666666','Jhoan','Casimilas','CE');

insert into Usuario(IdUsuario, Correo, Contrasena, IdCargo_FK, IdTipo_identificacionFK) 
values  ('1012323869','Ediver@gmail.com', lower('ingreso321'),'C1','CC'),
        ('1012323868','Steve@gmail.com',lower('hola12'),'C1','CE');

UPDATE Usuario
    SET Contrasena =
    REPLACE (REPLACE(REPLACE(REPLACE(REPLACE(Contrasena, 'e', '&'), 'a','@'), 'o','0'), 'i','/'), 'u', '#')
    WHERE IdUsuario='1012323869' and IdTipo_identificacionFK = 'CC';

UPDATE Usuario
    SET Contrasena =
    REPLACE (REPLACE(REPLACE(REPLACE(REPLACE(Contrasena, 'e', '&'), 'a','@'), 'o','0'), 'i','/'), 'u', '#')
    WHERE IdUsuario='1012323868 ' and IdTipo_identificacionFK = 'CE';



SELECT Contrasena,
    REPLACE (REPLACE(REPLACE(REPLACE(REPLACE(Contrasena, '&', 'e'), '@','a'), '0','o'), '/','i'), '#', 'u')
FROM usuario;


insert into Proveedor(Empresa, Contacto) 
values  ('Colanta','321777'),
        ('Alpina','322666'),
        ('Bimbo','320111'),
        ('Zenu','323789'),
        ('Alqueria','319456'),
        ('San jorge','318123');



insert into Factura( IdFactura,  IdProducto_FK, Cantidad_productos, Precio_producto, Total_pagar,  Fecha_venta, IdMetodo_pagoFK, IdCliente_FK) 
values  ( 1, '5', 8, 1500, 3000, '2023-08-7', 'MP1', '1012323864'),
        ( 2, '5', 8, 1500, 3000, '2023-09-1', 'MP1', '1027582949'),
        ( 3, '5', 8, 1500, 3000, '2023-10-2', 'MP1', '1005851861'),
        ( 4, '5', 8, 1500, 3000, '2023-11-9', 'MP1', '6666666666');



insert into Reporte_ventas(IdFactura_FK, IdCliente_FK )
values  (1,'1012323864'),
        (2,'1027582949'),
        (3,'1005851861'),
        (4,'6666666666');


/*Joins*/

SELECT Usuario.IdUsuario, Usuario.Correo, Usuario.Contrasena, Usuario.IdEstado_FK, Cargo.Nombre_cargo
FROM Usuario
LEFT JOIN Cargo ON Usuario.IdCargo_FK = Cargo.IdCargo;

SELECT *
FROM Cliente
RIGHT JOIN Factura ON Cliente.IdCliente = Factura.IdCliente_FK;

SELECT *
FROM Productos
INNER JOIN Categoria ON Productos.IdCategoria_FK = Categoria.IdCategoria;

SELECT Cliente.*, Factura.*, Metodo_pago.Metodo_pago AS Nombre_Metodo_Pago
FROM Cliente
RIGHT JOIN Factura ON Cliente.IdCliente = Factura.IdCliente_FK
INNER JOIN Metodo_pago ON Factura.IdMetodo_pagoFK = Metodo_pago.IdMetodo_pago;

/*Encontrar el inventario actual de productos, incluyendo su nombre y cantidad disponible*/
SELECT Productos.Nombre, Inventario.Cantidad_prod
FROM Inventario
INNER JOIN Productos ON Inventario.IdProductos_FK = Productos.IdProducto;

SELECT
    C.IdCliente,
    C.Nombre_cliente,
    F.IdFactura,
    F.Fecha_venta,
    MP.Metodo_pago,
    DF.Cantidad_productos,
    DF.Precio_producto,
    DF.Total_pagar
FROM Cliente C
LEFT JOIN Factura F ON C.IdCliente = F.IdCliente_FK
LEFT JOIN Metodo_pago MP ON F.IdMetodo_pagoFK = MP.IdMetodo_pago
LEFT JOIN Detalle_factura DF ON F.IdFactura = DF.IdFactura_FK;

/* Encuentra todos los clientes que han realizado compras.*/
SELECT IdCliente, Nombre_cliente
FROM Cliente
WHERE IdCliente IN (SELECT DISTINCT IdCliente_FK FROM Factura);

/*Actualizar*/
UPDATE Cliente
SET Nombre_cliente = 'Juan jose'
WHERE IdCliente = '1012323864';

/*Asendiente*/
SELECT P.*, C.Nombre_categoria
FROM Productos AS P
JOIN Categoria AS C ON P.IdCategoria_FK = C.IdCategoria
ORDER BY P.Precio DESC;
/*Asendiente*/
SELECT P.*, C.Nombre_categoria
FROM Productos AS P
JOIN Categoria AS C ON P.IdCategoria_FK = C.IdCategoria
ORDER BY P.Precio ASC;
/*Mayor o igual*/

SELECT P.*, C.Nombre_categoria
FROM Productos AS P
JOIN Categoria AS C ON P.IdCategoria_FK = C.IdCategoria
WHERE P.Precio >= 11000
ORDER BY P.Precio ASC;


-- Eliminar registros de la tabla Productos_proveedor
DELETE FROM Productos_proveedor;

/*Borrar base de datos*/
drop database sofacto;

select * from Proveedor;

