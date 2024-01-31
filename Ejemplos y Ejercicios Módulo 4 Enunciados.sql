/*
SQL Nivel Inicial - NivelUp Chile
Módulo 4
Nombre:
*/

-- Ejemplos

-- LOWER UPPER
-- Crea una columa con el nombre de los clientes escrito con
-- letras mayúsculas y otra con letras minúsculas






-- CONCAT ||

-- Explora las columnas first_name y last_name de la tabla customer




-- Crea una columna llamada full_name con el nombre y el apellido de los clientes



-- Mejora el query anterior para separar nombre de apellido con un espacio



-- LEFT / RIGHT
-- Obten los primeros 3 caracteres del nombre de los clientes



-- Obten los 3 últimos caracteres del nombre de los clientes




-- SUBSTRING
--Genera una nueva columna con la tercera letra del nombre de los clientes 



-- Crea una columna con los apellidos de los clientes comenzando desde el 4to caracter



-- Ejercicio:

/*
Genera nuevos correos para los miembros de tu staff siguiendo las siguientes
instrucciones: 
Las tres primeras letras del nombre, luego un guión bajo,
luego la Inicial del apellido,  luego otro guión bajo, 
el apellido desde el tercer caracter, y finalmente ‘@xmail.com’
*/







-- Modifica el query anterior para obtener los correos con letras minúsculas


-- CAST

-- Combierte a texto la columna amount de la table payment y añade 
-- un símbolo peso ($) en frente de la columna


-- LIKE
-- Consulta los clientes que su nombre comienza con la letra 'A'



-- Consulta los clientes que su nombre terminen con la letra 'a'



-- Consulta los clientes que su nombre comience con ‘A’ y  termine con la letra ‘a’



-- Consulta los clientes que su nombre comience con ‘A’ y 
-- Apellido con letra ‘T’



	
-- Consulta los nombres que contengan la secuencia 'nce'


	
-- Consulta los nombres que tengan la secuencia
-- 'ere' desde el segundo caracter en adelante


	
-- Consulta los nombres que tengan la secuencia
-- 'ere' desde el tercer carácter en adelante



-- 
-- Consulta los nombres de todos los clientes 
--que no tengan la secuencia 'ere' desde el tercer carácter en adelante




-- Ejercicios

-- Ejercicio 1 
-- ¿Cuántos actores tienen apellidos que comienzan con la letra 'M'?



-- ¿Cuántas películas contienen la palabra Truman 
-- en alguna parte de su título?


	
-- Ejemplos
-- CASE general





/*
CASE general - una condición
Estás planeando enviar un correo electrónico de agradecimiento
a tus clientes que han brindado su apoyo desde el inicio. 
Para llevar a cabo esto, es necesario clasificar a los clientes
según su orden de adquisición. Asigna la clasificación "Premium"
a los primeros 50 clientes (cuyo ID sea de 1 a 50),
la clasificación "Regular"  a todos los demás
Consulta customer_id, email y tipo_cliente
*/





/*
CASE general - multiples condiciones

Clasifica las películas por su duración según los siguientes criterios:

Si la duración es menos de 50 min, asigna la etiqueta 'Corta'
Si la duración es mayor a 50 min mas de 50 y igual o menos a 120, asigna la etiqueta'Media'
Si la duración es mayor a 120 min, asigna la etiqueta 'Larga'

*/




-- Mismo ejemplo anterior sin uso de ELSE





/*
Crea una columna con una versión más descriptiva 
para las clasificaciones (rating)


WHEN 'G' THEN 'General Audiences'
WHEN 'PG' THEN 'Parental Guidance Suggested'
WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
WHEN 'R' THEN 'Restricted'
WHEN 'NC-17' THEN 'Adults Only'
*/




/*
Ejercios

Ejercicio 3: 3. Añade las siguientes etiquetas a las tarifas:
0.99 => ‘Oferta’
2.99 => ‘Normal’
4.99 => ‘Estreno’


*/



	
-- CASE Y FUNCIONES AGREGADAS

-- PASO 1
-- Asigna el número uno a las peliculas con rental_rate 0.99.
-- Consulta las columnas rental_rate y la nueva columna.




-- PASO 2: 
-- Elimina la columna rental_rate del query anterior .
-- Aplica la función de agregación SUM() sobre la columna oferta 



-- PASO 3: Repite la misma agregación SUM() para las otras tarifas
-- para obtener cuántas películas hay de cada una de estas tarifas?



	

-- GROUP BY ¿Cuántas películas hay de cada una de estas tarifas?



/*
CASE
La rentabilidad de las películas depende de el tipo de tarifa
Oferta  15 %
Normal 20%
Estreno 40%
Calcula la ganacia (profit) si rentaras al menos una vez el total del inventario
*/



/*
Ejercicio 
Usa CASE para calcular cuántas peliculas hay de las clasificación 
(rating) 'G', 'PG' y 'R'

*/


-- CASE y GROUP BY








