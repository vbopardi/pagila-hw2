/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT concat(first_name, ' ',  last_name) 
AS  "Actor Name"
FROM actor
INNER JOIN film_actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN 
	(
        SELECT unnest(special_features) as sp, film_id
        FROM film
        ) as spf
on spf.film_id = film_actor.film_id
WHERE spf.sp = 'Behind the Scenes'
ORDER BY "Actor Name" ASC;
