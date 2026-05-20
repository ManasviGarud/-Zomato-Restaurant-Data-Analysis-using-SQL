CREATE DATABASE zomato_analysis;
USE zomato_analysis;
RENAME TABLE `zomato-data-` TO zomato;
SELECT * FROM zomato LIMIT 10;
UPDATE zomato SET rate = REPLACE(rate, '/5', '');
SELECT COUNT(*) AS total_restaurants FROM zomato;
SELECT name, rate, votes, `listed_in(type)` FROM zomato LIMIT 10;
SELECT name, rate FROM zomato ORDER BY rate DESC LIMIT 10;
SELECT name, votes FROM zomato ORDER BY votes DESC LIMIT 10;
SELECT online_order, COUNT(*) AS total FROM zomato GROUP BY online_order;
SELECT book_table, COUNT(*) AS total FROM zomato GROUP BY book_table;
SELECT `listed_in(type)`, COUNT(*) AS total_restaurants FROM zomato GROUP BY `listed_in(type)` ORDER BY total_restaurants DESC;
SELECT ROUND(AVG(rate),2) AS average_rating FROM zomato;
SELECT name, rate, RANK() OVER(ORDER BY rate DESC) AS ranking FROM zomato;
CREATE TABLE restaurants AS SELECT  ROW_NUMBER() OVER() AS restaurant_id, name, online_order, book_table FROM zomato;
CREATE TABLE ratings AS SELECT ROW_NUMBER() OVER() AS restaurant_id, rate, votes FROM zomato;
CREATE TABLE restaurant_details AS SELECT ROW_NUMBER() OVER() AS restaurant_id, `approx_cost(for two people)` AS cost_for_two, `listed_in(type)` AS restaurant_type FROM zomato;
SELECT r.name, rt.rate, rt.votes FROM restaurants r JOIN ratings rt ON r.restaurant_id = rt.restaurant_id ORDER BY rt.rate DESC LIMIT 10;
SELECT r.name,
       rt.rate,
       rt.votes,
       d.cost_for_two,
       d.restaurant_type
FROM restaurants r
JOIN ratings rt
ON r.restaurant_id = rt.restaurant_id
JOIN restaurant_details d
ON r.restaurant_id = d.restaurant_id;

SELECT name,
       rate,
       RANK() OVER(ORDER BY rate DESC) AS ranking
FROM zomato;

SELECT name,
       `listed_in(type)`,
       rate,
       RANK() OVER(
           PARTITION BY `listed_in(type)`
           ORDER BY rate DESC
       ) AS type_rank
FROM zomato;

WITH top_restaurants AS (
    SELECT name,
           rate,
           votes
    FROM zomato
    WHERE rate > 4
)
SELECT *
FROM top_restaurants
ORDER BY votes DESC;