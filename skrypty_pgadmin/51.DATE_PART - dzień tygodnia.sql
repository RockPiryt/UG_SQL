-- SELECT NOW()::TIME, CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP
/*
SELECT
	r.rental_date::DATE
	,return_date
FROM rental r
*/

SELECT
	DATE_TRUNC('day', r.rental_date)
	,DATE_PART('day', r.rental_date)
	,DATE_PART('dow', r.rental_date)
	,return_date
FROM rental r