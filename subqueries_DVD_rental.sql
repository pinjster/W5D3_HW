-- subqueries


--outer query
--where primary in (
--	subquery
--)

-- find all payments larger than average payment

select avg(amount)
from payment;

select  * 
from payment 
where amount > 4.20;

select count(payment_id)
from payment
where amount>(
	select avg(amount)
	from payment
);

-- find all films in english
select "name"
from "language"
where name = 'English';

select title, language_id 
from film 
where language_id = 1;

select title
from film 
where language_id in (
select language_id
from "language"
where name = 'English'
);
 
-- find all films with an actor with last name 'Allen'
select title
from film
where film_id in (
select actor_id
from film_actor
where actor_id in (
select actor_id
from actor
where last_name = 'Allen'
)
);

-- Find all the payments above staff member 1's avg payment amount
select payment_id
from payment
where amount > (
select avg(amount)
from payment
where staff_id = 2
);

select avg(amount)
from payment
where staff_id = 1;

select avg(amount)
from payment
where staff_id = 2;