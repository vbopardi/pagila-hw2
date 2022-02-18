/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

SELECT unnest as special_feature, SUM(amount) as profit 
FROM
         (
         SELECT unnest(special_features), film_id
         FROM film
         ) as spf

INNER JOIN inventory 
ON inventory.film_id = spf.film_id
INNER JOIN rental 
ON rental.inventory_id = inventory.inventory_id
INNER JOIN payment 
ON payment.rental_id = rental.rental_id

GROUP BY special_feature
ORDER BY special_feature ASC
