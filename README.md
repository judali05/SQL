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
* abrir las tablas registradas
~~~
show tables;
~~~
* crear tablas en una base de datos
~~~
create table (nombre de la tabla)(atributo que la persona colocapor ejemplo:)

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
*eliminar tabla

    

