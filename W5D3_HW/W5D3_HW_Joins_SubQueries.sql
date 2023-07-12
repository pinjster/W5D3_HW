--Question 1. List all customers who live in Texas (use JOINs)
select *
from customer
join address
on address.address_id = customer.address_id
where address.district = 'Texas';
-- (5) Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

--Question 2. Get all payments above $6.99 with the Customer's Full Name
select amount, concat(first_name,' ',last_name) as full_name
from payment
join customer
on customer.customer_id = payment.customer_id
where amount > 6.99;
-- Total: (1406) Peter Menard, Peter Menard, Peter Menard, Douglas Graf, Ryan Salisbury, etc.

--Question 3. Show all customers names who have made payments over $175(use subqueries)
select concat(first_name,' ',last_name) as full_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id  
	having sum(amount) > 175
);
-- Answer(Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Tommy Collazo, Karl Seal)
--OR
select concat(first_name,' ',last_name) as full_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 175
);
-- Answer (0 or None)

--Question 4. List all customers that live in Nepal (use the city table)
select *
from customer
where address_id in (
	select address_id 
	from address
	where city_id in (
		select city_id
		from city
		where city = 'Nepal'
	)
);
-- Answer (0 or None)

--Question 5. Which staff member had the most transactions?
select concat(first_name,' ',last_name) as full_name
from staff
where staff_id in (
	select max(staff_id)
	from payment
);
-- (staff_id = 2) John Stevens

--Question 6. How many movies of each rating are there?
select rating , count(rating)
from film
group by rating;
-- PG: 194, R: 195, NC-17: 210, PG-13: 223, G: 178

--Question 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select concat(first_name,' ',last_name) as full_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id, amount
	having amount > 6.99 and count(customer_id) = 1
);
-- (Total: 451) Jared Ely, Mary Smith, Patricia Johnson, Linda Williams

--Question 8. How many free rentals did our stores give away?
select count(amount)
from payment
where amount = 0;
-- (24)
