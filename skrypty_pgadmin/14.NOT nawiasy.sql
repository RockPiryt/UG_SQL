SELECT  
	*
FROM customer AS cus
WHERE cus.store_id=1 AND (cus.first_name LIKE 'J%' OR cus.last_name LIKE 'R%')

