use sakila;
-- task 1
select actor_id,first_name,last_name,last_update from actor;

-- task 2
-- 2.1
select concat(first_name,' ',last_name) as 'full name'  from actor;
-- 2.2
select first_name,count( first_name) as 'repeated first name' from actor group by first_name;
-- 2.3
select last_name,count(last_name) as 'repeated last name' from actor group by last_name;

-- task 3
select count(film_id) as 'count of movies' ,rating from film group by rating;

-- task 4
select rating , avg(rental_rate) as 'average rental rate' from film group by rating;

-- task 5
select title  from film  where  replacement_cost <9;
-- task 5.2
select title  from film  where  replacement_cost between 15 and 20 ;
-- task 5.3
select title ,max(replacement_cost) from film group by title ;
select title,min(rental_rate) as 'lowest rental rate' from film group by film_id ;

select title, max(replacement_cost) as 'highest replacement cost',min(rental_rate) as 'lowest rental rate' from film group by film_id ;
 
--  task 6
select film.title ,count(actor_id) as 'number of actors'
 from film join film_actor
 on film.film_id =film_actor.film_id group by film.film_id ;
 

--  task 7
select title from film where title like'K%' or title like'Q%' ; 


-- task 8
select  actor.first_name,actor.last_name 
from film join actor join film_actor
on film.film_id =film_actor.film_id and film_actor.actor_id=actor.actor_id
where title='Agent Truman';

-- task 9
select film.title as 'family movies',category.name as 'family category' from film join film_category join category
on film.film_id=film_category.film_id and category.category_id=film_category.category_id
where category.name in ('children' , 'Family' ) ; 

-- task 10

select film.title,count(rental.rental_id) from film join inventory join rental
on  film.film_id =inventory.film_id and inventory.inventory_id=rental.inventory_id
group by film.film_id order by count(rental.rental_id)   desc ;


-- task 11
select count(category.name), ( avg(replacement_cost) - avg(rental_rate) ) as 'avg difference' ,category.name from film join category join film_category
on film.film_id=film_category.film_id and category.category_id=film_category.category_id
group by (category.name) having (select ( avg(replacement_cost) - avg(rental_rate) ) as 'avg difference' from film)>15;

-- task 12
select category.name ,count(film.title) as 'Number_of_movies'
from film join category join film_category
on film.film_id=film_category.film_id and category.category_id=film_category.category_id
group by category.name having  count(title) between 60 and 70 order by count(film.title)  desc;
