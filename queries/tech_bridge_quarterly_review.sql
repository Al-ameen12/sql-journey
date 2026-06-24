-- =============================================
-- techbridge_quarterly_review.sql
-- Quarterly business questions for TechBridge Ltd
-- =============================================


-- -- EVERY EMPLOYEES THAT EARNS MORE THAN ₦280,000.
-- SELECT *
-- FROM EMPLOYEES
-- WHERE salary > 280000;


-- -- -- EMPLOYEES THAT ARE CURRENTLY INACTIVE
-- SELECT *
-- FROM employees
-- WHERE is_active = 0;


-- -- CLIENTS BASED IN LAGOS
-- SELECT *
-- FROM clients
-- WHERE city = 'Lagos';


-- -- PROJECTS WITH A BUDGET BETWEEN 1000000 AND 5000000
-- SELECT *
-- FROM projects
-- WHERE budget BETWEEN 1000000 AND 5000000;


-- -- NAMES THAT STARTS WITH O
-- SELECT *
-- FROM employees
-- WHERE name LIKE "O%";


-- -- EMPLOYEES NOT IN ENGINEERING
-- SELECT *
-- FROM employees
-- WHERE department NOT IN ('Engineering');


-- -- EMPLOYEES THAT HAVE MISSING SALARY
-- SELECT *
-- FROM employees
-- WHERE salary IS NULL;


-- =============================================
-- ROUND 2: Aggregates & Grouping
-- =============================================


-- NUMBER OF EMPLOYEES 
SELECT COUNT(name) as num_employees
FROM employees;


-- TOTAL MONTHLY SALARY EXPENSES 
SELECT ROUND(SUM(salary), 2) as total_salary
FROM employees;


-- AVERAGE PROJECT BUDGET
SELECT AVG(budget) AS avg_budget
FROM projects;


-- headcount breakdown
SELECT department, COUNT(name) AS head_count
FROM employees
GROUP BY department;


-- AVERAGE SALARY PER DEPARTMENT
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department;


-- LIST OF DEPARTMENTS AND THEIR TOTAL BUDGET
SELECT department, SUM(budget) AS total_budget
FROM projects
GROUP BY department
ORDER BY SUM(budget) DESC;


-- DEPARTMENTS WITH MORE THAN 2 EMPLOYEES
SELECT department, COUNT(name) AS num_employee
FROM employees
GROUP BY department
HAVING COUNT(name) > 2;


-- DEPARTMENTS WITH SALARY ABOVE 250K
SELECT department, ROUND(AVG(salary), 2) as avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 250000
ORDER BY AVG(salary) DESC;
