-- user id=1 ma przypisany address_id=5
--SELECT * FROM customer

--wybranie całgo adresu gdzie id =5
--SELECT * from address WHERE address_id=5

--sprawdzenie miasta gdzie city_id =463
--SELECT * from city WHERE city_id=463

--sprawdzenie kraju gdzie country_id =50	
--SELECT * from country WHERE country_id=50


SELECT 
	c.first_name, c.last_name,
	a.address, a.district,
	ci.city,
	co.country
FROM customer as c
    INNER JOIN address AS a ON a.address_id=c.address_id
	INNER JOIN city AS ci ON ci.city_id=a.city_id
	INNER JOIN country AS co ON co.country_id =ci.country_id
--WHERE c.first_name = 'Mary' and c.last_name = 'Smith'
