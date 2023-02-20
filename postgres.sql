SELECT name FROM language;


SELECT film.title, film.description, language.name
FROM film
LEFT JOIN language ON film.language_id = language.language_id;


SELECT film.title, film.description, language.name
FROM film
RIGHT JOIN language ON film.language_id = language.language_id;
 
 CREATE TABLE new_film (
  id INT NOT NULL   PRIMARY KEY,
  name VARCHAR(255) NOT NULL,

);


CREATE TABLE customer_review (
    review_id SERIAL,
    film_id INT,
    language_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    score INT NOT NULL,
    review_text TEXT NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(film_id),
	CONSTRAINT fk_film
		FOREIGN KEY(film_id)
		REFERENCES new_film(id) ON DELETE CASCADE,
	UNIQUE (language_id),
	CONSTRAINT fk_language
    FOREIGN KEY (language_id) REFERENCES language(language_id)
);



INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES (1, 1, 'Great Film!', 9, 'I loved this movie. The acting was amazing and the storyline was gripping.');

INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES (2, 2, 'Terrible Movie', 3, 'I did not like this movie at all. The plot was confusing and the acting was terrible.');

