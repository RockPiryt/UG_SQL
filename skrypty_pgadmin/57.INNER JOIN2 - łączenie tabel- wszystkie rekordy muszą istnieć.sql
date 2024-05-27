CREATE VIEW customer_address
	AS

	SELECT 
		c.first_name, c.last_name,
		a.address, a.district,
		ci.city,
		co.country
	FROM customer as c
	    INNER JOIN address AS a ON a.address_id=c.address_id
		INNER JOIN city AS ci ON ci.city_id=a.city_id
		INNER JOIN country AS co ON co.country_id =ci.country_id

