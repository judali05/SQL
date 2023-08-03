# SQL
***

* volver a carpeta anterio
~~~
cd..
~~~
* llamar carpeta
~~~
cd nombre de la carpeta
~~~
* limpiar pantalla
~~~
cls
~~~
* abri servidor
~~~
mysql -h localhost -u root -p
~~~
* mostrar bases de datos guardadas
~~~
show databases;
~~~
*cear base de datos 
~~~
create database (nombre de la base de datos);
~~~
* entrar a la base de datos
~~~
use (nombre de la tabal);
~~~
* abrir las entidades registradas
~~~
show tables;
~~~
* crear entidad en una base de datos
~~~
create table (nombre de la tabla)(atributos que la persona coloca -por ejemplo:);

create table vendedores(
    -> IDvendedor int(10) not null auto_increment,
    -> p_Apellido varchar(50) not null,
    -> S_Apellido varchar(50) null,
    -> P_Nombre varchar(50) not null,
    -> S_Nombre varchar(50) null,
    -> telefono varchar(50) not null,
    -> f_nacimiento date not null,
    -> primary key(IDvendedor)
    -> );
~~~
* eliminar tabla
~~~
drop table (nombre de la entidad);
~~~
* ver el contenido de la entidad
~~~
describe (nombre de la entidad);
~~~
*cambiar nombre del cliente
~~~
alter table (nombre de la entidad)
change (nombre viejo) (nombre nuevo) (valores);

alter table clientes
change Zona Localidad varchar(50) not null;
~~~

* gregar un atributo a una entidad
~~~
alter table (nombre de la entidad)
add (nombre del atributo) (valores del atrubuto);

alter table vehiculos
add modelo int(40) not null;
~~~

* eliminar un atributo en una entodad
~~~
alter table (nombre de la entidad)
drop (nombder del atributo);
~~~
*cerar llave 
~~~
primary key(nombre del atributo)
~~~
~~~
foreign key(nombre del atributo) REFERENCES (nombre de la entidad)(nombre del atributo de la otra entidad);

foreign key(IDvendedor) REFERENCES vendedores(IDvendedor)
~~~
* combiar nombre de la tabla
~~~
alter table (nombre de la tabla) rename (nombre de la nueva tabla);
~~~
* ingresar valores listando campos
~~~
INSERT INTO vehiculos([campo],[campo],[campo],[campo]) 
VALUES ('[valor de texto]','[valor]','[valor]',[valor numerico]);
~~~
* ver datos colocados de la tabla
~~~
SELECT * FROM (nombre de la tabla);
~~~
* ingresar nuevos valores sin listar campos
~~~
INSERT INTO (nombre de la tabla) 
VALUES ('[valor de texto]','[valor]','[valor]',[valor numerico]) ;
~~~
* ingresar varios registros
~~~
INSERT INTO (nombre de la tabla) 
VALUES ('[valor de texto]','[valor]','[valor]',[valor numerico]),('[valor de texto]','[valor]','[valor]',[valor numerico]);
~~~
*cambiar valores en el registro
~~~
UPDATE (nombre de la table)
SET  (campo)=(valor nuevo),
(campo)=(valor nuevo),
(campo)=(valor nuevo),
(campo)=(valor nuevo)
WHERE (campo)=(numero de registro);
~~~




    

