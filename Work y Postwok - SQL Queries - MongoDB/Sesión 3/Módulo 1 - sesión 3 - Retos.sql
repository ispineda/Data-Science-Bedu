-- Work - Módulo 1 - Sesión 3 - Retos
use tienda;

-- Reto 1
-- 1.1 ¿Cuál es el nombre de los empleados que realizaron cada venta?
show keys from venta;
show keys from empleado;

select clave, nombre
from venta as ve
join empleado as em
	on ve.id_empleado = em.id_empleado
order by clave;

-- 1.2 ¿Cuál es el nombre de los artículos que se han vendido?
show keys from articulo;

select clave, nombre as 'articulo'
from articulo as ar
join venta as ve
	on ar.id_articulo = ve.id_articulo
order by clave;

select distinct nombre as 'articulo'
from articulo as a
join venta as v
	on a.id_articulo = v.id_articulo;

-- 1.3 ¿Cuál es el total de cada venta?
select clave, sum(precio) as 'Total por ticket'
from venta as ve
join articulo as ar
	on ve.id_articulo = ar.id_articulo
group by clave
order by clave;

-- Reto 2
-- 2.1 Obtener el puesto de un empleado.
show tables;

create view puesto_empleado_426 as 
select e.nombre, p.nombre as Puesto
from empleado e
join puesto p
	on e.id_puesto = p.id_puesto;
    
select *
from puesto_empleado_426;

-- 2.2 Saber que articulos ha vendido cada empleado
create view articulo_empleado_426 as
select v.clave, e.nombre as empleado, a.nombre as articulo
from venta v
join empleado e
	on v.id_empleado = e.id_empleado
join articulo a
	on a.id_articulo = v.id_articulo
order by v.clave;

select *
from articulo_empleado_426;

-- 2.3 Saber que puesto a tenido más ventas
create view puesto_ventas_426 as
(select p.nombre as 'Puesto', count(v.clave) as 'Total'
from venta as v
join empleado as e
  on v.id_empleado = e.id_empleado
join puesto as p
  on e.id_puesto = p.id_puesto
group by p.nombre);

SELECT *
FROM puesto_ventas_426
ORDER BY Total DESC
LIMIT 1;
