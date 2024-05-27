
SELECT 
	f.title
	, f.rental_rate
	, f.length
FROM film AS f
WHERE f.length > (SELECT AVG(fsub.length) FROM film AS fsub WHERE fsub.rental_rate =f.rental_rate)
	--w WHERE jest warunek że cena z zappytania wewnętznego(fsub) ma być równa cenie z zapytania zewnętrznego (f)
	-- gdy warunek spełniony wtedy zostanie zwrócona wartość średniej długości filmu dla wybranej kategorii cenowej
ORDER BY f.rental_rate, f.length
