/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select distinct(first_name || ' ' || last_name) as "Actor Name"  from (
	(select unnest(special_features), film_id from film)sp join 
	film using(film_id))n1 join
	(film_actor join actor using(actor_id))n2 using(film_id)
where unnest='Behind the Scenes'
order by "Actor Name";
