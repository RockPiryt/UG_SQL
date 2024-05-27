SELECT 
	UPPER(title) AS film_title
	,description
	,category
	,length
	, REPEAT('*', length/10) AS duration
	, CONCAT (TRIM(title), ' (', category, ')')AS title_with_description
FROM film_list