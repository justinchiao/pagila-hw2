/*
 * Compute the total revenue for each film.
 */

select title, sum(coalesce(amount,0.00)) revenue 
from rental join inventory using(inventory_id) join payment using(rental_id) right join film using(film_id)
group by title
order by revenue desc;
