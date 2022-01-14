create database if not exists competition;
use competition;

create table if not exists h1n1 (
	country varchar(50),
    cases int,
    deaths int, 
    update_time datetime
);

drop table h1n1;

select *
from h1n1;