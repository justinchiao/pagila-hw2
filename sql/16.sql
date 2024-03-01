/*
 * Compute the total revenue for each film.
 * The output should include a new column "rank" that shows the numerical rank
 *
 * HINT:
 * You should use the `rank` window function to complete this task.
 * Window functions are conceptually simple,
 * but have an unfortunately clunky syntax.
 * You can find examples of how to use the `rank` function at
 * <https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/>.
 */

select rank_number rank, title, revenue from( select title, sum(coalesce(amount,0.00)) revenue,  rank() over(order by sum(coalesce(amount,0)) desc) rank_number 
from rental join inventory using(inventory_id) join payment using(rental_id) right join film using(film_id)
group by title
order by revenue desc)n1
;
