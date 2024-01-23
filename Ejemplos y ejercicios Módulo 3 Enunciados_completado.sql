

/*
SQL Nivel Inicial | NivelUp Chile
Módulo 3
Nombre:
*/

-- Ejemplos

-- ¿Cuáles son todas posibles tarifas de renta rental_rate?


	
-- Ejercicio 1: ¿Cuáles son los calificación de las películas
--    			según su contenido (rating)?

select distinct(rating) from film ;


-- Ejemplos

-- Obten el título (title), tarifa (rental_rate), y tarifa (rental_rate) con un alias

select 
	title, 
	rental_rate, 
	rental_rate as tarifa_renta
from
	film;
	
-- ¿Cuál sería el rating_rate si subieras los precios en un 15% ?

select 
	title, 
	rental_rate * 1.15, 
	rental_rate * 1.15 as tarifa_renta
from
	film;

-- Ejercicio 2: Escoge un alias apropiado para las siguientes
-- columnas (title,length, rating,rental_rate)

select 
	title as titulo, 
	length as largo, 
	rating as clasificacion, 
	rental_rate as tarifa
from
	film;





-- Ejemplos Funciones de agregación

-- ¿Cuántas películas hay en total?

select count(*) as total_peliculas from film;


-- Ejercicio 3: ¿Cuál el el valor de todos los pagos
-- 				que hay registrados?

select SUM(AMOUNT) AS TOTAL_VALOR from payment;

	
-- Ejemplos
-- ¿Cuál es el valor mínimo y máximo de replacement_cost?

select 
	MAX(replacement_cost) AS max_valor_rc,
	MIN(replacement_cost) AS max_valor_rc 
from FILM;
	
-- ¿Cuál es la duración promedio de una película?

SELECT 
	AVG(length) as duracion_promedio
FROM film;

-- Manejo de decimales
-- ¿Cuál es la duración promedio de una película?


SELECT 
	round(AVG(length),1) as duracion_promedio
FROM film;

SELECT 
	AVG(length) as duracion_promedio,
	round(AVG(length),1) as round_duracion_promedio,
	trunc(AVG(length),1) as trunc_duracion_promedio
FROM film;


-- Ejemplos GROUP BY

select rating, count(*) as total_peliculas
from film
group by rating;
-- ¿Cuántos dinero gasta cada cliente?

select customer_id, sum(amount) 
from payment
group by customer_id
order by sum(amount);


-- ¿Cuántos pagos ha realizado cada clientes?
-- Ordena los resultados para ver los clientes
-- con mas pagos primero

select customer_id, count(amount) 
from payment
group by customer_id
order by count(amount) desc;




-- Usar mas de una fun. agg. 	

--  ¿Cuántos pagos ha realizado cada clientes
--y cuánto ha gastado en total?

select customer_id, sum(amount), count(amount) 
from payment
group by customer_id
order by count(amount) DESC;





-- Uso de alias para el query anterior
	select customer_id, sum(amount) AS Total_monto, count(amount) as Total_pagos
from payment
group by customer_id
order by count(amount) DESC;

	
-- Agregar más de una categoría
-- ¿Cuánto gasta cada cliente con cada miembro del staff?

select 
	customer_id, 
	staff_id, 
	sum(amount) as total
from payment
group by
	customer_id, 
	staff_id
order by customer_id;
	

-- Ordena según más de una columna

select 
	customer_id, 
	staff_id, 
	sum(amount) as total
from payment
group by
	customer_id, 
	staff_id
order by 
	customer_id,
	staff_id;
	
	
-- Ejercicios!
/*
Ejercicio 4: Hay 2 miembros del staff. La empresa quiere darle
			un bono al que haya realizado mas pagos 
			(en cantidad no en dinero total)

			¿Qué miermbro gana el bono?
*/	
select 
	
	staff_id, 
	count(amount) as total
from payment
group by
	
	staff_id
order by 
	
	staff_id,
	total desc;


/*
Ejercicio 5: El equipo de finanzas quiede determinar el
			valor de inventario promedio para cada clasificación
			(rating) de películas

		¿Qué rating tiene el mayor valor de inventario promedio?

*/

select
	rating, 
	round(avg(replacement_cost),1) as promedio
from 
	film
group by 
	rating
order by promedio desc;


/*
Ejercicio 6: Queremos premiar a  nuestros mejores 5 clientes 
			con un cupon de descuentos¿Cuáles son los top 5 clientes que han
			gastado más dinero en renta de dvd?
*/

select 
	customer_id, 
	sum(amount) as total_gastado

from payment 
group by
	customer_id	
order by 
	total_gastado desc
limit 5;


-- Ejemplo ¿Qué clientes han gastado más de 100 dólares?

select 
	customer_id, 
	sum(amount) as total_gastado

from payment 

group by
	customer_id	
	
having 
	sum(amount) >100
order by 
	total_gastado desc;

-- ¿Cuál tienda tiene más de 300 clientes?

select 
	store_id
from customer
group by store_id
having count(*) >300;


/* Ejercicios

Ejercicios 7: Daremos la clasificación de Premium a los
clientes tengas al menos de 40 transacciones de compra.
Obten los customer_id para estos clientes.

*/
select 
	customer_id, 
	count(*) as total_transacciones

from payment 

group by
	customer_id	
	
having 
	count(*) >=40;


/*

Ejercicios 8: ¿Qué clientes (customer_id) han gastado
			a lo menos 100 dolares en transaciones 
			con el miembro del staff de id número 2?
*/

select 
	customer_id, 
	sum(amount) as total_gastado

from payment 
where 
	staff_id = 2

group by
	customer_id	
	
having 
	sum(amount) >=100;