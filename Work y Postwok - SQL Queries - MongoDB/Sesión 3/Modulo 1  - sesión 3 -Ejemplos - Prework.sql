-- Prework -Exmaples
use tienda;

-- JOIN CLASSIFICATION


-- 1
show keys from empleado;
show keys from puesto;
select *
from empleado as e
join puesto as p
	on e.id_puesto = p.id_puesto;
-- 2
select *
from puesto as p
left join empleado as e
	on e.id_puesto = p.id_puesto;
-- 3
select *
from empleado as e
right join puesto as p
	on p.id_puesto = e.id_puesto;

-- DEFINITION OF VIEWS
-- 1
select v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
from venta v
join empleado e
  on v.id_empleado = e.id_empleado
join articulo a
  on v.id_articulo = a.id_articulo;

-- 2
create view tickets as
select v.clave, v.fecha, a.nombre as producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) as empleado 
from venta v
join empleado e
  on v.id_empleado = e.id_empleado
join articulo a
  on v.id_articulo = a.id_articulo;
  
select *
from tickets;

-- 3
select clave, sum(precio) as 'total'
from tickets
group by clave;	

