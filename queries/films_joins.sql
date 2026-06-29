-- =============================================
-- films_joins_practice.sql
-- Scenario: NaijaScreen licensing analysis
-- Source data: DataCamp films/people/reviews/roles
-- =============================================

--1. Pull a list of films with their review scores — title and IMDb score side by side.
SELECT films.title AS title, reviews.imdb_score AS review_score
FROM films
INNER JOIN reviews 
ON films.id = reviews.film_id;


--2. Same thing, but use table aliases this time — f for films, r for reviews — to keep the query shorter.
SELECT f.title AS title, r.imdb_score AS review_score
FROM films as f
INNER JOIN reviews AS r
ON f.id = r.film_id;


--3. For every film, show me who directed it — film title next to the director's name.
SELECT f.title AS title, p.name AS director_name
FROM films as f
INNER JOIN roles AS r
ON f.id = r.film_id
INNER JOIN people AS p
ON r.person_id = p.id
WHERE r.role = 'director';


--4. List every film along with its country and budget, but only for films released after the year 2000.
SELECT f.title, f.country, f.budget
FROM films AS f
WHERE f.release_year > 2000;




-- =============================================
-- ROUND 2: Left Joins
-- =============================================

--1. "Show me every single film we have, along with its review score if one exists. 
-- Don't drop films that have no review — I need the full catalog."
SELECT f.title AS title, r.imdb_score AS review_score
FROM films AS f
LEFT JOIN reviews AS r
ON f.id = r.film_id


-- 2. Following on from that — how many films in our catalog have NO review at all? Give me just the count.
SELECT COUNT(*) AS numb_no_reviews
FROM films AS f
LEFT JOIN reviews AS r
ON f.id = r.film_id
WHERE r.imdb_score IS NULL


-- 3. Show me every person in our people table, along with the film title if they directed something. 
-- I want to see people who've never directed anything too, not just the ones who have.
SELECT p.name AS name, f.title AS movie_name, r.role AS role
FROM people AS p
LEFT JOIN roles AS r
ON p.id = r.person_id
LEFT JOIN films AS f
ON r.film_id = f.id
WHERE r.role = 'director' OR r.role IS NULL


-- 4. Give me a list of just the people who have never directed any film.
SELECT p.name AS name, f.title AS movie_name, r.role AS role
FROM people AS p
LEFT JOIN roles AS r
ON p.id = r.person_id
LEFT JOIN films AS f
ON r.film_id = f.id
WHERE r.role != 'director' OR r.role IS NULL;



SELECT NULL = 'director';