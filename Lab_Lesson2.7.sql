
-- ## -------- Lab_Lesson2.7 -------- ## --

/*
SQL JOINS:

- left join: all left values and matches from right
- right join: all right values and matches from left
- inner join (default): all matches between two columns
- full join: all variables from both columns

*/

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
/* 
tables: category and film_category
in common -> category_id
join: inner
*/

select * from sakila.film;
select * from sakila.film_category;

select c.name as 'Category', count(fa.film_id)
from sakila.category as c
join sakila.film_category as fa
on c.category_id = fa.category_id
group by c.name;



-- 2. Display the total amount rung up by each staff member in August of 2005.
/* 
tables: staff and rental
in common -> staff_id
join: inner
*/
select * from sakila.staff;
select * from sakila.rental;

select s.staff_id, s.first_name, s.last_name, r.rental_date as 'Rental Date', count(s.staff_id) over (order by s.staff_id) as 'Total'
from sakila.staff as s
join sakila.rental as r
on s.staff_id = r.staff_id
where r.rental_date between '2005-08-01' and '2005-08-31';
# I would add a group by staff_id but it doesn't work.



-- 3. Which actor has appeared in the most films?
/* 
tables: actor and film_actor
in common -> actor_id
join: inner
*/

select * from sakila.actor;
select * from sakila.film_actor;

select a.first_name as 'Name', a.last_name as 'Last Name', count(fa.actor_id) as Total
from sakila.film_actor as fa
join sakila.actor as a
on fa.actor_id = a.actor_id
group by a.actor_id
order by total DESC;
-- Gina Degeneres is the actress that appears in most films



-- 4. Most active customer (the customer that has rented the most number of films)
/* 
tables: customer and rental
in common -> customer_id
join: inner
*/
select * from sakila.customer;
select * from sakila.rental;

select c.customer_id, c.first_name, c.last_name, c.email, count(c.customer_id) as Total
from sakila.customer as c
join sakila.rental as r
on c.customer_id = r.customer_id
group by c.customer_id
order by Total DESC;
-- Eleanor Hunt is the most active customer with 46 films rented



-- 5. Display the first and last names, as well as the address, of each staff member.
/* 
tables: staff and address
in common -> address_id
join: inner
*/
select * from sakila.staff;
select s.first_name, s.last_name, a.address
from sakila.staff as s
join sakila.address as a
on s.address_id = a.address_id;




-- 6. List each film and the number of actors who are listed for that film.
/* 
tables: film and film_actor
in common -> film_id
join: inner
*/
select * from sakila.film;
select * from sakila.film_actor;

select fa.film_id, f.title, count(fa.actor_id) as actors 
from sakila.film as f
join sakila.film_actor as fa
on f.film_id = fa.film_id
group by fa.film_id
order by Actors DESC;




-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
/* 
tables: payment and customer
in common -> customer_id
join: inner
*/
select c.customer_id, c.last_name, sum(p.amount) as Total
from sakila.payment as p
join sakila.customer as c
on p.customer_id = c.customer_id
group by c.customer_id
order by c.last_name ASC;




-- 8. List number of films per category.
/* 
tables: film and film_category
in common -> film_id
join: inner
*/
select * from sakila.film;
select * from sakila.film_category;

select c.name as 'Category', count(fa.film_id)
from sakila.category as c
join sakila.film_category as fa
on c.category_id = fa.category_id
group by c.name;
