/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT film.title 
FROM film 
INNER JOIN inventory
ON inventory.film_id = film.film_id
INNER JOIN rental 
ON rental.inventory_id = inventory.inventory_id
INNER JOIN customer
ON customer.customer_id = rental.customer_id
WHERE customer.customer_id = 1 
GROUP BY film.title
HAVING COUNT(film.title) > 1 
