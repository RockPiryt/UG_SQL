SELECT  
	*
FROM customer AS cus
WHERE cus.store_id=1 AND NOT cus.first_name LIKE 'J%' AND NOT cus.last_name LIKE 'R%'

