-- =============================================
-- techbridge_quarterly_review.sql
-- Quarterly business questions for TechBridge Ltd
-- =============================================


-- EVERY EMPLOYEES THAT EARNS MORE THAN ₦280,000.
SELECT *
FROM EMPLOYEES
WHERE salary > 280000;


-- -- EMPLOYEES THAT ARE CURRENTLY INACTIVE
SELECT *
FROM employees
WHERE is_active = 0;


-- CLIENTS BASED IN LAGOS
SELECT *
FROM clients
WHERE city = 'Lagos';


-- PROJECTS WITH A BUDGET BETWEEN 1000000 AND 5000000
SELECT *
FROM projects
WHERE budget BETWEEN 1000000 AND 5000000;


-- NAMES THAT STARTS WITH O
SELECT *
FROM employees
WHERE name LIKE "O%";


-- EMPLOYEES NOT IN ENGINEERING
SELECT *
FROM employees
WHERE department NOT IN ('Engineering');


-- EMPLOYEES THAT HAVE MISSING SALARY
SELECT *
FROM employees
WHERE salary IS NULL;

