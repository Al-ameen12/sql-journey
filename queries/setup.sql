-- =============================================
-- setup.sql
-- Run this ONCE to create the practice database
-- Theme: Nigerian tech company - TechBridge Ltd
-- =============================================

-- Drop existing tables from the db to start fresh 
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS clients;

CREATE TABLE IF NOT EXISTS employees (
    id          INTEGER PRIMARY KEY,
    name        TEXT,
    department  TEXT,
    salary      REAL,
    hire_date   TEXT,
    is_active   INTEGER  -- 1 = active, 0 = inactive (SQLite has no BOOLEAN)
);

CREATE TABLE IF NOT EXISTS projects (
    id          INTEGER PRIMARY KEY,
    title       TEXT,
    department  TEXT,
    budget      REAL,
    start_date  TEXT,
    status      TEXT
);

CREATE TABLE IF NOT EXISTS clients (
    id          INTEGER PRIMARY KEY,
    company     TEXT,
    city        TEXT,
    industry    TEXT
);

INSERT OR IGNORE INTO employees VALUES
(1,  'Tunde Adeyemi',   'Engineering',  320000, '2021-03-15', 1),
(2,  'Amina Bello',     'Marketing',    210000, '2022-07-01', 1),
(3,  'Chidi Okafor',    'Engineering',  295000, '2020-11-20', 1),
(4,  'Ngozi Eze',       'HR',           185000, '2023-01-10', 1),
(5,  'Emeka Nwosu',     'Engineering',  340000, '2019-06-05', 1),
(6,  'Fatima Usman',    'Marketing',    225000, '2022-03-28', 0),
(7,  'Seun Akinwale',   'Finance',      260000, '2021-09-14', 1),
(8,  'Kemi Adebayo',    'HR',           190000, '2023-05-22', 0),
(9,  'Uche Okonkwo',    'Engineering',  310000, '2020-08-30', 1),
(10, 'Zainab Musa',     'Finance',      275000, '2022-11-03', 1);

INSERT OR IGNORE INTO projects VALUES
(1, 'Lagos PropTech Portal',     'Engineering',  5000000, '2024-01-10', 'active'),
(2, 'Brand Awareness Q1',        'Marketing',    1200000, '2024-02-01', 'completed'),
(3, 'Staff Onboarding System',   'HR',           800000,  '2024-03-15', 'active'),
(4, 'Payroll Automation',        'Finance',      2500000, '2024-01-20', 'active'),
(5, 'Mobile App MVP',            'Engineering',  7500000, '2023-11-01', 'completed'),
(6, 'Social Media Campaign',     'Marketing',    950000,  '2024-04-01', 'active'),
(7, 'API Infrastructure Upgrade','Engineering',  4200000, '2024-02-14', 'active'),
(8, 'Budget Forecasting Tool',   'Finance',      1800000, '2023-12-01', 'completed');

INSERT OR IGNORE INTO clients VALUES
(1,  'Dangote Industries',   'Lagos',   'Manufacturing'),
(2,  'GTBank',               'Lagos',   'Banking'),
(3,  'Konga',                'Lagos',   'E-commerce'),
(4,  'NNPC',                 'Abuja',   'Energy'),
(5,  'Jumia Nigeria',        'Lagos',   'E-commerce'),
(6,  'MTN Nigeria',          'Lagos',   'Telecom'),
(7,  'Access Bank',          'Lagos',   'Banking'),
(8,  'BUA Group',            'Abuja',   'Manufacturing'),
(9,  'Andela Nigeria',       'Lagos',   'Technology'),
(10, 'INEC',                 'Abuja',   'Government');