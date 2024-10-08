USE sakila;

-- Challenge - Joining on multiple tables
-- Write SQL queries to perform the following tasks using the Sakila database:
-- 1. List the number of films per category.
SELECT name AS category_name, COUNT(*) AS total_films
FROM category
LEFT JOIN film_category
ON film_category.category_id = category.category_id
GROUP BY name
ORDER BY total_films DESC;

-- 2. Retrieve the store ID, city, and country for each store.
SELECT st.store_id, ci.city, co.country 
FROM store AS st
JOIN address AS a ON st.address_id = a.address_id
JOIN city AS ci ON ci.city_id = a.city_id
JOIN country AS co ON co.country_id = ci.country_id;

-- 3. Calculate the total revenue generated by each store in dollars.
SELECT sto.store_id, SUM(p.amount) AS revenue
FROM store AS sto
JOIN staff AS sta ON sto.store_id = sta.store_id
JOIN payment AS p ON sta.staff_id = p.staff_id
GROUP BY store_id;

-- 4. Determine the average running time of films for each category.
SELECT c.name, AVG(f.length)
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.name;

-- Bonus