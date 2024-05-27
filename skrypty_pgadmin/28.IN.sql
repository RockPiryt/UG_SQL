SELECT  
	*
FROM public.film_list
-- WHERE rating='G' OR rating='PG' OR rating='PG-13'
WHERE rating IN ('G','PG', 'PG-13')

/*
"R"
"NC-17"
*/


