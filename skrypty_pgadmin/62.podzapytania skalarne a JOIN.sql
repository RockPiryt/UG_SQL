-- I sposób używająć JOIN
/*SELECT 
	a.first_name, a.last_name
	, fa.*
	, f.title
FROM actor AS a
	JOIN film_actor AS fa ON fa.actor_id=a.actor_id 
	--dołączam informacje z tabeli film_actor gdy id się zgadzają w obu tabelach (filma_ctor, actor)
	JOIN film AS f ON f.film_id=fa.film_id 
	--dołączam informacje z tabeli film gdy id się zgadzają w obu tabelach(film, film_actor)
WHERE a.first_name='Bette' AND a.last_name='Nicholson'*/

-- II sposób za pomocą podzapytań
SELECT f.title
FROM film AS f
WHERE f.film_id IN
		(SELECT 
			fa.film_id
		FROM actor AS a
			JOIN film_actor AS fa ON fa.actor_id=a.actor_id 
			--dołączam informacje z tabeli film_actor gdy id się zgadzają w obu tabelach (filma_ctor, actor)
		WHERE a.first_name='Bette' AND a.last_name='Nicholson')