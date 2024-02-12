use sakila;

SELECT film.first_name, actor.last_name FROM film, actor Join film_actor on film_actor.actor_id = actor.actor_id Where film.film_id = film_actor.film_id and film.title = "ACADEMY DINOSAUR";

SELECT category.name, Count(film_category.category_id) as Count FROM film_category, category WHERE category.category_id = film_category.category_id GROUP BY film_category.category_id;

SELECT Sum(film.rental_duration) / COUNT(rental_duration) as Average, rating from film group by rating;

SELECT customer.first_name, customer.last_name, COUNT(r.rental_id) AS total_rentals FROM customer JOIN rental r ON customer.customer_id = r.customer_id GROUP BY customer.customer_id;

SELECT store_id as Store_ID, COUNT(inventory_id) AS total_rentals FROM inventory GROUP BY store_id ORDER BY total_rentals DESC LIMIT 1;

SELECT c.name, COUNT(rental.rental_id) AS total_rentals FROM rental JOIN inventory i ON rental.inventory_id = i.inventory_id JOIN film f ON i.film_id =f.film_id JOIN film_category as fc ON f.film_id = fc.film_id JOIN category  as c ON fc.category_id = c.category_id GROUP BY c.category_id, c.name ORDERBY total_rentals DESC LIMIT 1;

SELECT fc.category_id, AVG(f.rental_rate) AS average_rental_rate FROM film as f JOIN inventory i ON f.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id JOIN film_category fc ON f.film_id = fc.film_id GROUP BY fc.category_id;

SELECT f.title, rental.rental_date from film as f, rental join inventory on inventory.inventory_id = rental.inventory_id join film on film.film_id = inventory.film_id where rental.rental_date > DATE_SUB(NOW(), INTERVAL 1 Month);

SELECT c.first_name, c.last_name , Sum(p.amount) FROM customer as c, payment as p WHERE p.customer_id = c.customer_id group by c.customer_id;

Select l.name, Sum(length) / Count(f.language_id) from language as l, film as f Where f.language_id = l.language_id Group By f.language_id;