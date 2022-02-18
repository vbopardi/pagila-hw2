/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT customer.customer_id
FROM customer
INNER JOIN rental 
ON rental.customer_id = customer.customer_id
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
INNER JOIN film
ON film.film_id = inventory.film_id

WHERE film.title IN
	
	(
	SELECT title 
	FROM
		(
		SELECT title, SUM(amount) as profit 
		FROM film
		INNER JOIN inventory
		ON inventory.film_id = film.film_id
		INNER JOIN rental 
		ON rental.inventory_id = inventory.inventory_id
		INNER JOIN payment 
		ON payment.rental_id = rental.rental_id
		GROUP BY title
		ORDER BY profit DESC
		LIMIT 5
		) as topfive
	)
ORDER BY customer.customer_id ASC
