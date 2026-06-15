-- =============================================
-- select_basics.sql
-- Concepts: SELECT, FROM, DISTINCT, LIMIT,
--           AS (aliasing), data types, schema
-- Company: TechBridge Ltd
-- =============================================


-- ---- SELECT & FROM -------------------------

-- Get everything from employees
SELECT * FROM employees;

-- Get only names and departments
SELECT name, department FROM employees;

-- Get only company names and cities from clients
SELECT company, city FROM clients;


-- ---- DISTINCT ------------------------------

-- All unique departments (no repeats)
SELECT DISTINCT department FROM employees;

-- All unique cities clients come from
SELECT DISTINCT city FROM clients;

-- All unique industries
SELECT DISTINCT industry FROM clients;


-- ---- LIMIT ---------------------------------

-- First 3 employees only
SELECT * FROM employees LIMIT 3;

-- First 5 projects only
SELECT * FROM projects LIMIT 5;

-- Just the first client record
SELECT * FROM clients LIMIT 1;


-- ---- ALIASING (AS) -------------------------

-- Rename columns in output for readability
SELECT name AS employee_name, salary AS monthly_salary
FROM employees;

-- Alias on clients
SELECT company AS client_name, industry AS sector
FROM clients;


-- ---- COMBINING CONCEPTS --------------------

-- Unique departments, aliased, limited to 3
SELECT DISTINCT department AS team
FROM employees
LIMIT 3;

-- First 5 projects showing title and status only
SELECT title AS project_name, status AS project_status
FROM projects
LIMIT 5;