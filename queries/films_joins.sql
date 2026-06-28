-- =============================================
-- films_joins_practice.sql
-- Scenario: NaijaScreen licensing analysis
-- Source data: DataCamp films/people/reviews/roles
-- =============================================

--1. Pull a list of films with their review scores — title and IMDb score side by side.
SELECT films.title AS title, reviews.imdb_score AS review_score
FROM films
INNER JOIN reviews 
ON films.id = reviews.film_id


-- Same thing, but use table aliases this time — f for films, r for reviews — to keep the query shorter.
SELECT f.title AS title, r.imdb_score AS review_score
FROM films as f
INNER JOIN reviews AS r
ON f.id = r.film_id


-- For every film, show me who directed it — film title next to the director's name.
SELECT f.title AS title, p.name AS director_name
FROM films as f
INNER JOIN roles AS r
ON f.id = r.film_id
INNER JOIN people AS p
ON r.person_id = p.id
WHERE r.role = 'director'


-- List every film along with its country and budget, but only for films released after the year 2000.
SELECT f.title, f.country, f.budget
FROM films AS f
WHERE f.release_year > 2000
