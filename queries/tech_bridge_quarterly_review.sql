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


-- -- NUMBER OF EMPLOYEES 
-- SELECT COUNT(name) as num_employees
-- FROM employees;


-- -- TOTAL MONTHLY SALARY EXPENSES 
-- SELECT ROUND(SUM(salary), 2) as total_salary
-- FROM employees;


-- -- AVERAGE PROJECT BUDGET
-- SELECT AVG(budget) AS avg_budget
-- FROM projects;


-- -- headcount breakdown
-- SELECT department, COUNT(name) AS head_count
-- FROM employees
-- GROUP BY department;


-- -- AVERAGE SALARY PER DEPARTMENT
-- SELECT department, ROUND(AVG(salary), 2) AS avg_salary
-- FROM employees
-- GROUP BY department;


-- -- LIST OF DEPARTMENTS AND THEIR TOTAL BUDGET
-- SELECT department, SUM(budget) AS total_budget
-- FROM projects
-- GROUP BY department
-- ORDER BY SUM(budget) DESC;


-- -- DEPARTMENTS WITH MORE THAN 2 EMPLOYEES
-- SELECT department, COUNT(name) AS num_employee
-- FROM employees
-- GROUP BY department
-- HAVING COUNT(name) > 2;


-- -- DEPARTMENTS WITH SALARY ABOVE 250K
-- SELECT department, ROUND(AVG(salary), 2) as avg_salary
-- FROM employees
-- GROUP BY department
-- HAVING AVG(salary) > 250000
-- ORDER BY AVG(salary) DESC;



-- =============================================
-- ROUND 3: Filtering + Grouping + Having + Sorting
-- =============================================

-- Show me total budget per department, but only for active projects. Rank them highest spending first.
SELECT department, SUM(budget) AS total_budget
FROM projects
WHERE status = 'active'
GROUP BY department
ORDER BY total_budget DESC;


-- Which departments have more than one active employee, and what's their average salary? I only want to see departments earning above ₦200,000 on average."
-- "For clients in Lagos only — count how many clients we have per industry.
SELECT department, COUNT(name) AS num_employee, AVG(salary) AS avg_salary 
FROM employees
WHERE is_active = 1
GROUP BY department
HAVING AVG(salary) > 200000 AND COUNT(name) > 1;


-- For clients in Lagos only — count how many clients we have per industry
SELECT COUNT(company) as num_client, industry
FROM clients
WHERE city = 'Lagos'
GROUP BY industry;


-- Show departments and their project count, but only include completed projects, and only show departments with more than 1 completed project. Sort by count, highest first.
SELECT department, COUNT(title) AS proj_count
FROM projects
WHERE status = 'completed'
GROUP BY department
HAVING COUNT(title) > 1
ORDER BY proj_count DESC;


-- I want a salary report: department, headcount, total salary cost, and average salary — for active employees only — sorted by total salary cost descending.
SELECT department, COUNT(name) AS num_employee, SUM(salary) AS total_salary, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE is_active = 1
GROUP BY department
ORDER BY total_salary DESC;