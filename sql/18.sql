/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */

select *, to_char((100*"total revenue"/(select sum(amount) from payment)), 'FM900.00') "percent revenue" from
		(select rank_number rank, title, revenue, sum(revenue) over(order by revenue desc) "total revenue" from
			(select title, sum(coalesce(amount,0.00)) revenue,  rank() over(order by sum(coalesce(amount,0)) desc) rank_number 
				from rental join inventory using(inventory_id) join payment using(rental_id) right join film using(film_id)
group by title
order by revenue desc, title)n1
order by revenue desc)n2
order by revenue desc;

