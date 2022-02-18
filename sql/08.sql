/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.

STEPS:
select all g rated films
join on 



 */



SELECT title FROM
	(
	SELECT title, rating,  unnest(special_features) as uspf
	FROM film
	) as sq
WHERE rating = 'G'
AND uspf = 'Trailers'
ORDER BY title ASC
