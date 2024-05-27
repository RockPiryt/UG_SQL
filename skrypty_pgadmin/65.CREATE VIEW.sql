
CREATE VIEW customer_address
 AS
 SELECT 
	c.first_name,c.last_name,
    a.address,
    a.district,
	a.postal_code,
    ci.city,
    co.country
   FROM customer c
     JOIN address a ON a.address_id = c.address_id
     JOIN city ci ON ci.city_id = a.city_id
     JOIN country co ON co.country_id = ci.country_id;
