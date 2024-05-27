SELECT 
	UPPER(title) AS film_title
	,description
	,category
	,length
	, REPEAT('*', length/10) AS duration
	, CONCAT (TRIM(title), ' (', category, ')')AS title_with_description
	, UPPER(SUBSTRING(category FROM 1 FOR 2))
	, LEFT(UPPER(category),2)
	, REVERSE(RIGHT(UPPER(category),2))
	, LENGTH (description)
FROM film_list