/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT bts1.title 
FROM 
	(
	SELECT title 
	FROM 
	(SELECT film.title, unnest(special_features) as sp FROM film) as bts
	WHERE sp = 'Behind the Scenes'
	) as bts1

INNER JOIN 
	(
	SELECT title
	FROM 
	(SELECT film.title, unnest(special_features) as sp FROM film) as bts
	WHERE sp = 'Trailers'
	) as trailer2

ON bts1.title = trailer2.title
ORDER BY bts1.title ASC
