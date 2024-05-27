SELECT  
  title
  ,price
  ,length
	,round(cast(length AS decimal)/ 60, 2) AS time_in_hours
	,round(price / (length / 60.0), 2) AS price_per_hour
FROM film_list
WHERE round(price / (length / 60.0), 2) >= 6
ORDER BY price_per_hour DESC


