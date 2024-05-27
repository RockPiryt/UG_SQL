SELECT  
	category
	,COUNT(*) AS record_number
	,MIN(price) AS min_price
	,MAX(price) AS max_price
	,SUM(length) AS total_length
	,AVG(length) AS avg_length
FROM public.film_list
GROUP BY category


