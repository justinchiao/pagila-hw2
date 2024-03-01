/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */

select rank_number rank, title, revenue, sum(revenue) over(order by revenue desc) "total revenue"  from( select title, sum(coalesce(amount,0.00)) revenue,  rank() over(order by sum(coalesce(amount,0)) desc) rank_number 
from rental join inventory using(inventory_id) join payment using(rental_id) right join film using(film_id)
group by title
order by revenue desc, title)n1
order by revenue desc
;
