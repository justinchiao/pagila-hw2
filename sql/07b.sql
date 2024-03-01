/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select distinct(f.title) from ((rental r join inventory i on r.inventory_id=i.inventory_id)n1 join film f on  n1.film_id=f.film_id) 
where n1.film_id not in(select film_id from (rental join inventory using(inventory_id))where customer_id in(select customer_id from customer join address using(address_id) join city using(city_id) join country using(country_id) where country='United States'))
order by f.title;
