-- Ejemplo 1
-- Crear una base de datos -> Nombre propio de preferencia
create database jesusismael;
use jesusismael;
drop table jesusismael;

-- Ejemplo 2
-- Descargar datos del enlace users, ratings y movies
-- Crear tabla users 
create database if not exists jesusismael;
drop table if exists jesusismael;

create table if not exists users (
	id_users int primary key,
    gender varchar(1),
    age int,
    occup int, 
    zip_code varchar(20)
);

-- Reto 1
-- 1.1 Definir los campos y tipos de datos para la tabla movies haciendo uso de los archivos movies.dat y README.
	-- id_movies -> int
	-- title  -> varchar(n)
	-- genres -> varchar(n)
    
-- 1.2 Crear la tabla movies (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos).
create table if not exists movies (
	id_movies int primary key,
    title varchar(80),
    genres varchar(80)
);
describe movies;

-- 1.3 Definir los campos y tipos de datos para la tabla ratings haciendo uso de los archivos ratings.dat y README.
	-- users_id -> int
	-- movies_id -> int
	-- rating -> int
	-- time_stamp -> bigint
    
-- 1.4 Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)
create table if not exists ratings (
	users_id int,
    movies_id int,
    rating int,
    time_stamp bigint
--  foreign key(users_id) references users(id_users),
--  foreign key(movies_id) references movies(id_movies)
);
describe ratings;

-- Ejemplo 3
-- Editar users.dat a users.cvs y cargar los datos a la tabla users
-- Agregar un registro a la tabla
select count(*)
from users;
insert into users (id_users,gender,age,occup,zip_code) values (8000,'F',23,20,'45150');

-- Reto 2
-- 2.1 Usando como base el archivo movies.dat, limpiarlo e importar los datos en la tabla movies creada en el Reto 1.
select count(*)
from movies;

-- 2.2 Usando como base el archivo ratings.dat, limpiarlo e importar los datos en la tabla ratings creada en el Reto 2.
-- Activar la importación de datos por comandos
select @@local_infile;
set global local_infile=1;
SHOW VARIABLES LIKE "local_infile"; -- status local_infile [on]
SHOW VARIABLES LIKE "secure_file_priv"; -- ruta de donde ser cargaran los datos 

-- Carga de la tabla ratings por comandos
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ratings.csv'
into table ratings
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines; 

-- Número de registros en la tabla ratings
select count(*)
from ratings;

describe users;
describe movies;
describe ratings;

-- 2.3 Finalmente, añade un registro en cada tabla usando INSERT INTO.
insert into movies (id_movies,title,genres) values (4000,'The hidden blade',"Assassins's Creed");
insert into ratings (users_id,movies_id,rating, time_stamp) values (8000,200,10,978303276);

select *
from users
order by id_users desc
limit 1;

select *
from movies
order by id_movies desc
limit 1;

select *
from ratings
order by users_id desc
limit 1;