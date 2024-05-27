--SELECT * FROM film

-- SELECT MAX(rental_rate) FROM film --zwraca skalar - najwyższą cene

--SELECT * FROM film WHERE rental_rate = 4.99 --ręczne wpisanie ceny którą zapamietałam z poprzedniego wyrażenia

--SELECT * FROM film WHERE rental_rate = (SELECT MAX(rental_rate) FROM film) 

--SELECT * FROM film WHERE rental_rate = (SELECT MIN(rental_rate) FROM film) 

--SELECT * FROM film WHERE rental_rate > (SELECT AVG(rental_rate) FROM film) 

SELECT 
	f.title
	, f.rental_rate
	, (SELECT AVG(rental_rate) FROM film) AS avg_price
	, f.rental_rate - (SELECT AVG(rental_rate) FROM film) AS difference
FROM film AS f
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film) 
