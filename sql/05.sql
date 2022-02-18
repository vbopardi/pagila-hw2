/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the actor and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * HINT:
 * This can be solved using either a LEFT JOIN or the NOT IN operator.
 */

-- Get all actors 
-- Left Join on first_name last_name in  actor

SELECT actor.last_name, actor.first_name
FROM actor
LEFT OUTER JOIN customer
ON customer.first_name = actor.first_name
AND customer.last_name = actor.last_name
WHERE customer.last_name IS NULL
AND customer.first_name IS NULL 
ORDER BY actor.last_name ASC, actor.first_name ASC
