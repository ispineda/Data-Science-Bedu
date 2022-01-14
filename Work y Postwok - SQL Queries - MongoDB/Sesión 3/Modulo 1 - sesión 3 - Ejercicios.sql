-- Work - Módulo 1 - sesión 3 - Ejercicios
use classicmodels;

-- Ejercicios 
-- inner join
-- 1 - Obtén la cantidad de productos de cada orden.
select o.orderNumber, sum(oo.quantityOrdered)
from orders as o
join orderdetails as oo
	on o.orderNumber = oo.orderNumber
group by o.orderNumber;
 
-- 2 - Obten el número de orden, estado y costo total de cada orden.
select o.orderNumber, o.status, sum(quantityOrdered * priceEach) as 'Costo total'
from orders as o
join orderdetails as oo
  on o.orderNumber = oo.orderNumber
group by o.orderNumber, o.status;

-- 3 - Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza.
select o.orderNumber, o.orderDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
from orders as o
join orderdetails as od
  on o.orderNumber = od.orderNumber
join products as p
  on od.productCode = p.productCode;

-- 4 - Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
select o.orderNumber, p.productName, p.MSRP, o.priceEach
from products as p
join orderdetails as o
 on p.productCode = o.productCode
order by o.orderNumber;

-- left join
-- 5 - Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden hecha por cada cliente. 
select c.customerNumber, customerName, orderNumber, status
from customers c
left join orders o
  on c.customerNumber = o.customerNumber;
  
--  ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN?
-- left join devuelve toda la tabla de la izquierda y asigna valores nulos a aquellos registros de la tabla derecha 
-- que no cumplen con la condición, comparado a join que devuelve únicamente los registros que se cumplen en ambas tablas por la condición, 
-- que no precisamente es toda la tabla de la izquierda o derecha.

-- 6 - Obtén los clientes que no tienen una orden asociada.
select c.customerName, c.customerNumber
from customers as c
left join orders as o
	on c.customerNumber = o.customerNumber
where o.ordernumber is NULL;


-- 7 - Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, 
--     los clientes asociados a cada empleado.
select lastName, firstName, customerName, checkNumber, amount
from employees e
left join customers c 
	on e.employeeNumber = c.salesRepEmployeeNumber
left join payments p on
    p.customerNumber = c.customerNumber
order by customerName, checkNumber;

-- right join
-- 8 - Repite los ejercicios 5 a 7 usando RIGHT JOIN. ¿Representan lo mismo? 
-- Explica las diferencias en un comentario. Para poner comentarios usa --.

-- 8.1 - Ejercicio 5 con right
-- La diferencia es que comparado con el left join, en este caso se da toda la tabla de 
-- orders y se posicionan los registros de la tabla customers que cumplen con la condición rellenando 
-- aquellos que no con NULL, para este caso particular, no se ha encontrado 
-- ningun registro Nulo en comparación a lo obtenido en el left join.
select c.customerNumber, customerName, orderNumber, status
from customers c
right join orders o
  on c.customerNumber = o.customerNumber;

-- 8.2 - Ejercicio 6 con right
-- En este caso no se devuelve ningún valor debido a que no existe ninguna orden 
-- que no cuente con un identificador de cliente
select c.customerName, c.customerNumber
from customers as c
right join orders as o
	on c.customerNumber = o.customerNumber
where o.ordernumber is NULL;

-- 8.3 - Ejercicio 7 con right
-- En este caso se relacionan los pagos y los clients a los empleados
-- La tabla se devuelve sin valores Nulos debido a que no hay un pago y un cliente que no haya sido atendido por un empleado.
--  En comparación al left join donde podía haber empleados sin clientes.
select lastName, firstName, customerName, checkNumber, amount
from employees e
right join customers c 
	on e.employeeNumber = c.salesRepEmployeeNumber
right join payments p on
    p.customerNumber = c.customerNumber
order by customerName, checkNumber;

-- 9 - Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.
-- 9.1 
create view cantidad_productos_orden_426 as
(select o.orderNumber, sum(oo.quantityOrdered)
from orders as o
join orderdetails as oo
	on o.orderNumber = oo.orderNumber
group by o.orderNumber);

select *
from cantidad_productos_orden_426;

-- 9.2
create view clientes_asociados_a_empleado_426 as
(select lastName, firstName, customerName, checkNumber, amount
from employees e
left join customers c 
	on e.employeeNumber = c.salesRepEmployeeNumber
left join payments p on
    p.customerNumber = c.customerNumber
order by customerName, checkNumber);

select firstName as Empleado , customerName as Cliente
from clientes_asociados_a_empleado_426;

-- 9.3
create view producto_precio_426 as
(select o.orderNumber, p.productName, p.MSRP, o.priceEach
from products as p
join orderdetails as o
 on p.productCode = o.productCode
order by o.orderNumber);

select priceEach, orderNumber
from producto_precio_426
where priceEach > 100;