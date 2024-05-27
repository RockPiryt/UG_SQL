SELECT 
	f.rental_rate
	, AVG(f.length)
FROM film AS f
GROUP BY f.rental_rate