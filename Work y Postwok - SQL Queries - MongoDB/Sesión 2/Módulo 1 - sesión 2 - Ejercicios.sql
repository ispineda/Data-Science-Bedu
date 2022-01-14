-- Modulo 1 - Sesión 2 - Ejercicios
use classicmodels;

-- 1  - Dentro de la tabla employees, obten el número de empleado, 
--      apellido y nombre de todos los empleados cuyo nombre empiece con A.
select employeeNumber, lastName, firstName 
from employees 
where firstName like 'a%';

-- 2 - Dentro de la tabla employees, obten el número de empleado, 
--     apellido y nombre de todos los empleados cuyo apellido termina con on.
select employeeNumber, lastName, firstName 
from employees 
where lastName like '%on';

-- 3 - Dentro de la tabla employees, obten el número de empleado, apellido y 
--     nombre de todos los empleados cuyo nombre incluye la cadena on.
select employeeNumber, lastName, firstName 
from employees 
where firstName like '%on%';

-- 4 - Dentro de la tabla employees, obten el número de empleado, apellido y 
--     nombre de todos los empleados cuyos nombres tienen seis letras e inician con G.
select employeeNumber, lastName, firstName 
from employees 
where firstName like 'G_____';
					  
-- 5 - Dentro de la tabla employees, obten el número de empleado, apellido y 
--     nombre de todos los empleados cuyo nombre no inicia con B.
select employeeNumber, lastName, firstName 
from employees 
where firstName not like 'B%';

-- 6 - Dentro de la tabla products, obten el código de producto y nombre de los 
--     productos cuyo código incluye la cadena _20.
select productCode, productName 
from products 
where productCode like '%\_20%'; 


-- 7 - Dentro de la tabla orderdetails, obten el total de cada orden.
describe orderdetails;

select orderNumber, count(*) as "Total de ordenes", sum(priceEach) as 'Total de cada orden'
from orderdetails 
group by orderNumber;

-- 8 - Dentro de la tabla orders obten el número de órdenes por año.
describe orders;
select orderDate from orders;

select year(orderDate), count(*) as 'Ordenes por año'  
from orders 
group by year(orderDate);

-- 9 - Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
select * from offices;

select lastName, firstName
from employees
where officeCode in 
	(select officeCode 
    from offices 
    where country = 'USA');

SELECT e.lastName, e.firstName, c.country
from employees e, offices c
where e.officeCode = c.officeCode and c.country = 'USA';

-- 10 - Obten el número de cliente, número de cheque y cantidad 
--      del cliente que ha realizado el pago más alto.
select customerNumber, checkNumber, amount
from payments
where amount =
	(select max(amount)
	from payments);
    
-- 11 - Obten el número de cliente, número de cheque y cantidad 
--      de aquellos clientes cuyo pago es más alto que el promedio.
select customerNumber, checkNumber, amount
from payments
where amount >
	(select avg(amount)
	from payments);
    
-- 12 - Obten el nombre de aquellos clientes que no han hecho ninguna orden.
select customerName as 'Clientes sin órdenes'
from customers
where customerNumber not in 
	(select customerNumber
    from orders);

-- 13 - Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
select max(quantityOrdered), min(quantityOrdered), avg(quantityOrdered)
from orderdetails;

-- 14 - Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
select status, count(*) as 'ordenes por status'
from orders
group by status;

select state, count(*) as 'Órdenes por estado state'
from customers
where customerNumber in
	(select customerNumber
	from orders)
group by state;

