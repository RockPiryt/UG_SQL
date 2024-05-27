-- SELECT NOW()::TIME, CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP
/*
SELECT
	r.rental_date::DATE
	,return_date
FROM rental r
*/

SELECT
	DATE_PART('day', r.rental_date)
	,r.rental_date
	,r.return_date
	,(r.rental_date + INTERVAL ' 3 days')::DATE AS expected_date_return 
FROM rental r