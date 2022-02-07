--Week 5 - Monday Questions



--1. How many actors are there with the last name ‘Wahlberg’?
select *, count(last_name) 
from actor
where last_name 
like  '%Wahlberg'
group by actor_id 

--Answer: 2 People



--2. How many payments were made between $3.99 and $5.99?

select count(payment_id) as "# of Payments" , amount 
from payment
where amount between 3.99 and 5.99
group by amount


--Answer: 5607 payments



--3. What film does the store have the most of? (search in inventory)

select count(store_id)as "# of each Film", film_id 
from inventory
group by film_id  

--Answer: Multiple movies with 8 each



--4. How many customers have the last name ‘William’?

select count(last_name) 
from customer
where last_name 
like  '%William'

--Answer: None (one has Williamson but that doesn't count :) )




--5. What store employee (get the id) sold the most rentals?

select staff_id, count(rental_id) as "Rentals Sold"
from rental
group by staff_id  

--Answer: Staff_id #1 Sold the most



--6. How many different district names are there?

select count(distinct district) 
from address

--Answer: 378



--7. What film has the most actors in it? (use film_actor table and get film_id)

select count(film_actor.actor_id), film_id
from film_actor
group by film_id 

--Answer: Film_id 508 has the most actors



--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

select store_id = 1, last_name, customer_id 
from customer
where last_name
like '%es'

--Answer: 21 Customers



--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--   with ids between 380 and 430? (use group by and having > 250)

select count(rental.customer_id), payment.amount
from rental
join payment on rental.customer_id = payment.customer_id 
where rental.customer_id BETWEEN 380 AND 430
group by payment.amount 
having count(rental.customer_id) > 250


--Answer: 11 different payment amounts, 34,360 payments total



--10. Within the film table, how many rating categories are there? And what rating has the most movies total?


select rating as "Rating", count(film_id) as "No. of Movies Per Rating"
from film
group by rating

--Answer: 5 Categories, PG-13 is highest




