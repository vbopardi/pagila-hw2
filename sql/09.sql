/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT unnest as special_features, COUNT(unnest) as count
FROM
	(
	SELECT unnest(special_features)
	FROM film
	) as spf
GROUP BY special_features
ORDER BY special_features ASC
