SELECT * from actor WHERE actor_id IN
	(SELECT a.actor_id
	FROM actor AS a
	LEFT JOIN film_actor AS fa ON fa.actor_id=a.actor_id
	WHERE fa.film_id=805)--tu może być IS NULL zamiast rekordu
/*
SELECT a.actor_id,fa.film_id
FROM actor AS a
LEFT JOIN film_actor AS fa ON fa.actor_id=a.actor_id
WHERE fa.film_id=80*/