/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

select title from(
	(select unnest(special_features) sp, film_id from film)n1 join
	film using(film_id))
where rating='G'
and n1.sp='Trailers'
order by title;
