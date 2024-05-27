SELECT  
	cus.first_name
	, last_name AS "LAST NAME"
	, email
FROM customer AS cus
WHERE store_id!=1

