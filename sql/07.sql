/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

-- helpful: https://stackoverflow.com/questions/30520964/sql-return-all-rows-where-at-least-one-has-value-y
-- https://stackoverflow.com/questions/2686254/how-to-select-all-records-from-one-table-that-do-not-exist-in-another-table

SELECT DISTINCT all_inventory.title
FROM
	-- all films rented by someone from US
	( 
	SELECT DISTINCT film.title
	FROM film 
	INNER JOIN inventory
	ON inventory.film_id = film.film_id 
	INNER JOIN rental 
	ON rental.inventory_id = inventory.inventory_id
	INNER JOIN customer 
	ON customer.customer_id = rental.customer_id
	INNER JOIN address
	ON address.address_id = customer.address_id
	INNER JOIN city
	ON city.city_id = address.city_id 
	INNER JOIN country
	ON country.country_id = city.country_id
	AND country.country = 'United States' 
	ORDER BY film.title ASC
	) as all_us

RIGHT JOIN
	-- all films in inventory
	(
	SELECT film.title 
	FROM FILM 
	INNER JOIN INVENTORY
	ON inventory.film_id = film.film_id
	) as all_inventory 

ON all_inventory.title = all_us.title
WHERE all_us.title is NULL 
ORDER BY all_inventory.title ASC
