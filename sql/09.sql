/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

select  n1.special_features, count(*) from(
	(select unnest(special_features) special_features, film_id from film)n1 join
	film using(film_id))
group by n1.special_features
order by n1.special_features;
