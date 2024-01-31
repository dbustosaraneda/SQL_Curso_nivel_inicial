/*
SQL Nivel Inicial
Módulo 5
Nombre:
*/

-- INNER JOIN


-- Realiza un INNER JOIN entre las tablas payment y customer. 


select * 
from payment
inner join customer
on customer.customer_id = payment.customer_id



-- Realiza un INNER JOIN entre las tablas payment y customer. 
-- Selecciona solamente pas columnas payment_id, customer_id y first_name

select payment_id, customer_id, first_name
from payment
inner join customer
on customer.customer_id = payment.customer_id



-- #############################################
-- Uso de alias en tablas
-- #############################################

select payment_id, p.customer_id, first_name
from payment p
inner join customer c
on p.customer_id = c.customer_id




-- FULL OUTER JOIN
-- Realiza un FULL OUTER JOIN entre las tablas payment y customer

select *
from payment p
full join customer c
on p.customer_id = c.customer_id

	
-- el order de las tablas no afecta el resultado en un FULL OUTER JOIN 	

select payment_id, p.customer_id, first_name
from payment p
inner join customer c
on  c.customer_id = p.customer_id



-- LEFT JOIN

-- Explorar tabla inventory

select * from inventory
	
-- Explora la tabla film

select * from film
	
-- Realiza un LEFT JOIN entre las tablas film (LEFT) y la table inventory 
-- Consulta las columnas film.film_id, title, inventory_id y  store_id.

select * from film f left join inventory i on f.film_id = i.film_id
	
-- Usando el query anterior revisa si existen valores nulos
-- en alguna de las columnas de la tabla inventory
	
select * from film f left join inventory i on f.film_id = i.film_id where 
	i.inventory_id is null or 
	i.store_id is null or
	i.last_update is null

-- Modifica el query anterior para obtener solo las filas que tienen
-- valores nulos en alguna de las columnas de la tabla inventory.



	
-- En el query anterior añade un filtro para obtener solo la filas 
-- relativas a la película ‘Academy Dinosaur’ 

select f.film_id, title, store_id, count(*) from film f left join inventory i on f.film_id = i.film_id where 
	i.inventory_id is not null 
	and f.title = 'Academy Dinosaur'
	
group by f.film_id, title, store_id


	
-- Modifica el query anterior para contar las copias que hay en cada 
-- tienda de la película ‘Academy Dinosaur’.

select f.film_id, title, store_id, count(*) from film f left join inventory i on f.film_id = i.film_id where 
	i.inventory_id is not null 
	and f.title = 'Academy Dinosaur'
	
group by f.film_id, title, store_id





-- RIGHT JOIN 


-- Explora la table language

select * from language
select * from film

-- Explora la todos los idiomas presents en las películas de la table film

select distinct(name) from language


/*
Ejercicio
Realiza un RIGHT JOIN entre la tabla `film` y  la tabla `language` (R)
Selecciona el nombre (`name`), el título (`title`) y el identificador de idioma (`language_id`).
Ordena el resultado en por name en orden descendiente

*/

select l.name, f.title, f.language_id
from film f right join language l on f.language_id = l.language_id
order by name desc




-- Añade un filtro al query anterior para obtener las idiomas que no estan asociados a ninguna película


select l.name, f.title, f.language_id
from film f right join language l on f.language_id = l.language_id
where f.language_id is null
order by name desc

	




	
	
-- Añade un filtro al query anterior para obtener las idiomas 


-- ¿Es los mismo RIGHT JOIN y LEFT JOIN  si cambio el orden de las tablas?



-- MULTIPLES JOINS

-- Un cliente quiere saber en que películas actúa 'Nick Wahlberg'


-- PASO 1 Explora la tabla actor y consulta las columna actor_id, first_name,
-- last_name. Usa un filtro para obtener el actor de interes


select 
	actor.actor_id, 
	concat(first_name, ' ', last_name) as actor_full_name, 
	film.film_id,
	film.title
from 
	actor 
	inner join film_actor
	on 	actor.actor_id = film_actor.actor_id
	inner join film
	on film_actor.film_id = film.film_id
where first_name = 'Nick' and last_name ='Wahlberg'

-- Paso 2
-- Realiza un INNER JOIN con la table film_actor para para añadir la info de los film_id asociados a ese actor



-- Paso 3
-- Ahora solo ncestiamos el titulo de cada pelicula!

select 
	actor.actor_id, 
	concat(first_name, ' ', last_name) as actor_full_name, 
	film.film_id,
	film.title
from 
	actor 
	inner join film_actor
	on 	actor.actor_id = film_actor.actor_id
	inner join film
	on film_actor.film_id = film.film_id
where first_name = 'Nick' and last_name ='Wahlberg'	
	
	
-- 
	
-- Reescribe el query anterior usando alias para las tablas
	







-- Ejercicio
-- ¿Cómo saber si tenemos peliculas con este actor ('Nick Wahlberg') en nuestro
-- inventario?
-- Agrega otro JOIN pero ahora con la table inventory.

select 
	actor.actor_id, 
	concat(first_name, ' ', last_name) as actor_full_name, 
	film.film_id,
	film.title
from 
	actor 
	inner join film_actor
	on 	actor.actor_id = film_actor.actor_id
	inner join film
	on film_actor.film_id = film.film_id
	inner join inventory 
	on film.film_id = inventory.film_id
where first_name = 'Nick' and last_name ='Wahlberg'	

	
-- Usa alias para tus tablas







-- Uniones
-- Quieres enviar un mail de Feliz navidad tanto clientes como al staff.
-- Realiza una union para obtener los nombres y los corres deseados
-- Obtener nombres y correos electrónicos de clientes




-- #####################################################################
-- #####################################################################
-- #####################################################################
-- #####################################################################
-- #####################################################################

-- Ejercicios Opcionales
-- ¿Qué ciudades chilenas hay en la base de datos?
-- Realiza un JOIN entre las tablas country y city
-- Selecciona las columnas city y country.
-- Filtra los resultados por pais  = Chile




-- union con agregación

--¿Cuántas películas hay de cada categoría?

-- PASO 1
-- Escribe un query con las category_id y film_id. Para esto debes realizar un JOIN
-- entre film y film_category



-- PASO 2
-- Realiza una agregación para contar las peliculas en cada category_id
-- Ordena el resultado según total de peliculas en orden descendiente


-- Paso 3
-- Averigua el nombre de la categoría que corresponde cada category_id
-- Para esto debes hacer un JOIN con la tabla category








-- Obten nombre y apellido como full_name, el estado (district) y el email
-- de clientes que viven en  California 

-- ¿Qué tablas tienen la información que necesito?
-- ¿Qué atributo relaciona las tablas?
-- ¿Qué tipo de JOIN necesito obtener el resultado deseado?




-- Añade alias a las tablas del quey anterior





