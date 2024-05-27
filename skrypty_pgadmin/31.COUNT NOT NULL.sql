SELECT 
  COUNT(return_date)
FROM rental
WHERE return_date IS NOT NULL
--ORDER BY rental_date DESC

