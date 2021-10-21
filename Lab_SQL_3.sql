### Instructions
use sakila;

-- 1. How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor; -- 121

-- 2. In how many different languages where the films originally produced? 
-- (Use the column `language_id` from the `film` table)
select * from film;
select count(distinct(language_id)) as dif_languages from film; -- 1 language

-- 3. How many movies were released with `"PG-13"` rating?
select count(film_id) as PG_13 from film
where rating = 'PG-13'; -- 223 movies

-- 4. Get 10 the longest movies from 2006.
select title, length from film
where release_year = 2006
order by length DESC
limit 10;

-- 5. How many days has been the company operating (check `DATEDIFF()` function)?
select * from payment;
select * from rental
order by rental_date ASC;
select DATEDIFF(max(rental_date), min(rental_date)) as operating_days from rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.
select rental_date from rental;
select * ,monthname(rental_date) as month, DAYNAME(rental_date) as weekday from rental
limit 20;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' 
-- depending on the rental day of the week.
select rental_date from rental;
select * ,monthname(rental_date) as month, DAYNAME(rental_date) as weekday,
case
when DAYNAME(rental_date) in ('Saturday', 'Sunday') then 'Weekend'
else 'Weekday'
end as 'day_type' 
from rental
limit 20;

-- 8. How many rentals were in the last month of activity?
select rental_date from rental;
select concat(monthname(rental_date), year(rental_date)) as month_year, count(rental_id) as rentals
from rental
where concat(monthname(rental_date), year(rental_date)) like 'Feb%'
group by concat(monthname(rental_date), year(rental_date));
