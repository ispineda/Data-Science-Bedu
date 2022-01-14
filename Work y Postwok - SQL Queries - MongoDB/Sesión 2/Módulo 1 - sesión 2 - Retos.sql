-- Work - módulo 1 - sesión 2
use tienda;

-- reto 1
-- 1.1 - ¿Qué artículos incluyen la palabra Pasta en su nombre?
select nombre 
from articulo 
where nombre like '%pasta%';

-- 1.2 - ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select nombre Nombre_articulo
from articulo 
where nombre like '%Cannelloni%';

-- 1.3 - ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select nombre 
from articulo 
where nombre like '% - %';
describe puesto;
-- reto 2
-- 2.1 - ¿Cuál es el promedio de salario de los puestos?
select avg(salario) 'promedio de salario'
from puesto;

-- 2.2 - ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
select count(nombre) as "'Pasta' en su nombre"
from articulo 
where nombre like '%Pasta%';

-- 2.3 - ¿Cuál es el salario mínimo y máximo?
select min(salario) as "Salario mínimo", max(salario) as "Salario máximo"  
from puesto;

-- 2.4 - ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
select sum(salario)
from puesto
where id_puesto >
	(select max(id_puesto)-5
	from puesto);

select sum(salarios)
from (select id_puesto, salario as 'salarios'
	from puesto
	order by id_puesto desc
	limit 5) as nueva;

describe puesto;
-- reto 3 
-- 3.1 - ¿Cuántos registros hay por cada uno de los puestos?
select nombre, count(*) 
from puesto 
group by nombre;


-- 3.2 - ¿Cuánto dinero se paga en total por puesto?
select nombre, sum(salario) as 'Total por puesto'
from puesto 
group by nombre;

-- 3.3 - ¿Cuál es el número total de ventas por vendedor?
select id_empleado, count(clave) as 'ventas por vendedor' 
from venta 
group by id_empleado;

-- 3.4 - ¿Cuál es el número total de ventas por artículo?
select id_articulo, count(*) as 'Ventas'
from venta 
group by id_articulo;

describe empleado;
describe puesto;
-- reto 4
-- 4.1 - ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
select nombre
from empleado
where id_puesto in 
	(select id_puesto
	from puesto
	where salario > 10000);

-- 4.2 - ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
select id_empleado, min(total_ventas), max(total_ventas)
from
	(select clave, id_empleado, count(*) as 'total_ventas'
	from venta
	group by clave, id_empleado) as tab
group by id_empleado;


select clave, id_empleado, count(*) as 'total_ventas'
from venta
group by clave, id_empleado;

-- 4.3 - ¿Cuál es el nombre del puesto de cada empleado?
select nombre, (select nombre from puesto where id_puesto = e.id_puesto) as 'Puesto'
from empleado as e;

