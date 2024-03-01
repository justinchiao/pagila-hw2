/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

select title from (
	(rental join inventory on rental.inventory_id=inventory.inventory_id)n1 join
	film on n1.film_id=film.film_id) 
where customer_id=1 group by title having count(*)>1;
