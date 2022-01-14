-- Prework session 2
use tienda;
show tables;
describe empleado;

-- PATTERN SEARCH
-- Example of how to do a pattern search

select apellido_paterno 
from empleado
where apellido_paterno like 'S%'
limit 5;

select nombre, apellido_paterno
from empleado 
where apellido_paterno like '%am%';

select nombre, apellido_paterno
from empleado
where apellido_paterno like 'S_e%';

select nombre, apellido_paterno
from empleado 
where apellido_paterno not like '%a';

-- GROUPING FUNCTIONS 
-- Example of how to do grouping functions

select sum(salario) as 'Salario total'
from puesto
where salario > 5000;

select avg(salario) as 'Promedio del salario'
from puesto;

select count(nombre) as 'Total de nombres'
from puesto;

select nombre
from puesto;

select nombre
from puesto
where nombre like 'Director%';

select count(nombre) as 'Juan'
from empleado
where nombre like 'Juan%';

select max(salario) as 'Salario más alto'
from puesto;

-- whitout keyword 'as'
select avg(salario) "promedio de salarios"
from puesto
where salario > 1000;

-- GROUPINGS
-- Exmaple of how to do groupings
describe articulo;

select nombre, count(*) 'Número total de productos'
from articulo
group by nombre;



-- SUBQUERIES
Select id_puesto
from puesto
where nombre ='Junior Executive';

select *
from empleado
where id_puesto in
	(Select id_puesto
	from puesto
	where nombre ='Junior Executive');

