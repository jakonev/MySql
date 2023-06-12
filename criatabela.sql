select * FROM sakila.city;

select
case 
when country_id = 87 then 'oito e sete'
when country_id > 90 then 'maior que sete'
else 'result' END as TIPO
FROM sakila.city;

use sakila;
show tables;
/* original com select */
SELECT *
from sakila.actor 			AS A
LEFT JOIN SAKILA.ADDRESS	AS B ON B.ADDRESS_ID=A.ACTOR_ID
inner JOIN FILM 				AS P ON P.film_id=P.FILM_ID
LEFT JOIN film_actor 		AS O ON O.film_id=A.ACTOR_ID
LEFT JOIN sakila.category	AS C ON C.category_id=P.FILM_ID
group by first_name;
select 
concat((substring(last_update, 9,2)),'/',(substring(last_update, 6,2)),'/',(substring(last_update, 1,4))) as NOVADATA
from actor;

SELECT
a.actor_id,
p.film_id,
concat((substring(a.last_update, 9,2)),'/',(substring(a.last_update, 6,2)),'/',(substring(a.last_update, 1,4))) as NOVADATA,
concat(first_name, ' ',last_name) as CompNome,
concat('Rua', ' ', address) as RUA,
district,
city_id,
postal_code,
phone as Telefone,
title as Filme,
description,
release_year As Ano,
rental_rate,
length,
p.replacement_cost,
rating,
special_features,
name as nomeFilme
from sakila.actor 			AS A
LEFT JOIN SAKILA.ADDRESS	AS B ON B.ADDRESS_ID=A.ACTOR_ID
inner JOIN FILM 				AS P ON P.film_id=P.FILM_ID
LEFT JOIN film_actor 		AS O ON O.film_id=A.ACTOR_ID
LEFT JOIN sakila.category	AS C ON C.category_id=P.FILM_ID
group by first_name
order by first_name;
drop table sakila.jorgefilme;

create table jorgeFilme as select
a.actor_id,
p.film_id,
concat((substring(a.last_update, 9,2)),'/',(substring(a.last_update, 6,2)),'/',(substring(a.last_update, 1,4))) as NOVADATA,
concat(first_name, ' ',last_name) as CompNome,
concat('Rua', ' ', address) as RUA,
district,
city_id,
postal_code,
phone as Telefone,
title as Filme,
description,
release_year As Ano,
rental_rate,
length,
p.replacement_cost,
rating,
special_features,
name as nomeFilme
from sakila.actor 			AS A
LEFT JOIN SAKILA.ADDRESS	AS B ON B.ADDRESS_ID=A.ACTOR_ID
inner JOIN FILM 			AS P ON P.film_id=P.FILM_ID
LEFT JOIN film_actor 		AS O ON O.actor_id=A.ACTOR_ID
LEFT JOIN sakila.category	AS C ON C.category_id=P.FILM_ID
group by first_name
order by first_name;