/*
 * A film's rating can be either G, PG, PG-13, etc.
 * First, generate a query that returns the two most popular ratings.
 * Then, use a subquery to select the film_id and title columns
 * for all films whose rating is one of the two most popular.
 * Use the film table and order by title.
 */

SELECT film_id, film.title 
FROM film 
WHERE film.rating IN 

	(
	SELECT rating 
	FROM 
		(
		SELECT film.rating, COUNT(film.rating) as ct
		FROM film
		GROUP BY film.rating
		ORDER BY ct desc
		LIMIT 2
		) as toptwo 

	) 
ORDER BY film.title ASC
