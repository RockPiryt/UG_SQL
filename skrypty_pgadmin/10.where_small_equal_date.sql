SELECT  
	cus.first_name
	, last_name AS "LAST NAME"
	, email
	, create_date
FROM customer AS cus
WHERE create_date >= '2006-02-14'

