-- wyświetlam, imię, nazwisko i pełny adres dla customerów
SELECT 
	c.first_name, c.last_name,
	a.address, a.address2,
	ci.city,
	co.country
FROM customer as c
    INNER JOIN address AS a ON a.address_id=c.address_id
	INNER JOIN city AS ci ON ci.city_id=a.city_id
	INNER JOIN country AS co ON co.country_id =ci.country_id
UNION
-- wyświetlam, imię, nazwisko i pełny adres dla pracowników (staff)
SELECT 
	s.first_name, s.last_name,
	a.address, a.address2,
	ci.city,
	co.country
FROM staff as s
    INNER JOIN address AS a ON a.address_id=s.address_id
	INNER JOIN city AS ci ON ci.city_id=a.city_id
	INNER JOIN country AS co ON co.country_id =ci.country_id

UNION
-- wyświetlam id_store i pełny adres store	
SELECT 
	CAST(st.store_id AS VARCHAR(10)), NULL,
	a.address, a.address2,
	ci.city,
	co.country
FROM store as st
    INNER JOIN address AS a ON a.address_id=st.address_id
	INNER JOIN city AS ci ON ci.city_id=a.city_id
	INNER JOIN country AS co ON co.country_id =ci.country_id



