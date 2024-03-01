/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 07b you will use the LEFT JOIN clause.
 *
 * NOTE:
 * This is the last problem that will require you to use a particular method to solve the query.
 * In future problems, you may choose whether to use the LEFT JOIN or NOT IN clause if they are more applicable.
 */

select distinct(f.title) from ((rental r join inventory i on r.inventory_id=i.inventory_id)n1 join film f on  n1.film_id=f.film_id) 
where n1.film_id not in(select film_id from (rental join inventory using(inventory_id))where customer_id in(select customer_id from customer join address using(address_id) join city using(city_id) join country using(country_id) where country='United States'))
order by f.title;
