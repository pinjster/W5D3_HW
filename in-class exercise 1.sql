-- find first & last name of all actors in film alice fantasia
select first_name, last_name
from actor
join film_actor
on actor.actor_id = film_actor.actor_id
join film
on film_actor.film_id = film.film_id
where film.title = 'Alice Fantasia';

-- find the name of all the films in the category: animation
select title
from film 
join film_category
on film_category.film_id = film.film_id
join category
on film_category.category_id = category.category_id
where category.name = 'Animation';

-- find all customers who live in Clarksville
select first_name, last_name, city
from customer 
join address
on customer.address_id = address.address_id 
join city 
on address.city_id = city.city_id
where city.city = 'Clarksville';

-- how many movies has Tamara Nguyen rented
select concat(first_name,' ', last_name) as full_name, count(rental_id) as rentals
from customer 
join rental
on rental.customer_id = customer.customer_id
where first_name = 'Tamara' and last_name = 'Nguyen'
group by full_name;

-- how many movies did Nick Wahlberg star in
select count(film_id) as total_movies
from actor
join film_actor 
on actor.actor_id = film_actor.actor_id
where first_name = 'Nick' and last_name = 'Wahlberg';

-- what languages are movies Judy Gray are renting
select concat(first_name, ' ', last_name) as full_name, "language".name, rental.inventory_id
from customer
join rental
on customer.customer_id = rental.customer_id
join inventory
on inventory.inventory_id = rental.inventory_id
join film 
on inventory.film_id = film.film_id
join "language" 
on film.language_id = "language".language_id
where first_name = 'Judy' and last_name = 'Gray';

--which staff members live in Canada
select first_name, last_name, address, city, country
from country
join city
on city.country_id = country.country_id
join address 
on address.city_id = city.city_id
join staff 
on staff.address_id = address.address_id
where country.country = 'Canada';