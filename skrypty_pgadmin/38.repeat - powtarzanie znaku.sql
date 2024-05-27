SELECT 
	UPPER(title) AS film_title
	,description
	,category
	,length
	, REPEAT('*', length/10) AS duration
FROM film_list