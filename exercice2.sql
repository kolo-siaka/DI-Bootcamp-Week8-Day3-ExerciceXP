
UPDATE films
SET language_id = 5
WHERE film_id = 1;


DROP TABLE customer_review;


SELECT COUNT(*) AS num_outstanding_rentals
FROM rental
WHERE return_date IS NULL;



SELECT film.title, rental.rental_date, rental.return_date, film.rental_rate
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE rental.return_date IS NULL
ORDER BY film.rental_rate DESC
LIMIT 30;



SELECT title
FROM film
WHERE description LIKE '%sumo wrestler%'
AND (actor_id IN (SELECT actor_id FROM actor WHERE first_name = 'Penelope' AND last_name = 'Monroe')
     OR film_id IN (SELECT film_id FROM film_actor WHERE actor_id IN (SELECT actor_id FROM actor WHERE first_name = 'Penelope' AND last_name = 'Monroe')));

SELECT title
FROM film
WHERE length < 60
AND rating = 'R';

SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.first_name = 'Matthew' AND c.last_name = 'Mahan'
AND r.rental_rate > 4.00
AND r.return_date BETWEEN '2005-07-28'


SELECT f.title, f.rental_rate, COUNT(*) AS num_rentals
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN customer AS c ON r.customer_id = c.customer_id
WHERE c.first_name = 'Matthew' AND c.last_name = 'Mahan'
AND (f.title LIKE '%boat%' OR f.description LIKE '%boat%')
AND r.rental_date >= '2005-07-28' AND r.rental_date <= '2005-08-01'
AND r.return_date IS NULL
GROUP BY f.title, f.rental_rate
ORDER BY f.rental_rate DESC
LIMIT 1;

