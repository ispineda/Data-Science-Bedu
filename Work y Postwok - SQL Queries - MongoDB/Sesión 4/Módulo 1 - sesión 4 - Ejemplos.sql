-- Ejemplo 1
create database if not exists jesusismael;
use jesusismael;

-- Ejemplo 2
-- Descargar datos del enlace userss, ratings y movies
create table users (
	id_users INT PRIMARY KEY,
    gender VARCHAR(1),
    age INT,
    occup INT, 
    zip_code VARCHAR(20)
);


