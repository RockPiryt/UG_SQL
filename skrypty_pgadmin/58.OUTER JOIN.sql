SELECT 
	f.title,f.release_year
	, i.store_id
FROM film as f
	JOIN inventory AS i ON i.film_id=f.film_id
WHERE f.title LIKE 'A%'