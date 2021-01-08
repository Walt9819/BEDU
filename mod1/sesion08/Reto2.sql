CREATE DATABASE IF NOT EXISTS pandemia;

USE pandemia;

DROP TABLE IF EXISTS ah1n1;

-- date as string
CREATE TABLE IF NOT EXISTS ah1n1 (
	country VARCHAR(40),
    cases INT,
    deaths INT,
    the_date VARCHAR(20)
);

DESCRIBE ah1n1;

--  Mayor número de muertes
SELECT country, SUM(deaths) as tot_deaths
FROM ah1n1 WHERE country <> "Grand Total"
GROUP BY country
ORDER BY tot_deaths DESC;

--  Menor número de muertes
SELECT country, SUM(deaths) as tot_deaths
FROM ah1n1 WHERE country <> "Grand Total"
GROUP BY country
ORDER BY tot_deaths;

--  Mayor número de casos
SELECT country, SUM(cases) as tot_cases
FROM ah1n1 WHERE country <> "Grand Total"
GROUP BY country
ORDER BY tot_cases DESC;

--  Menro número de casos
SELECT country, SUM(cases) as tot_cases
FROM ah1n1 WHERE country <> "Grand Total"
GROUP BY country
ORDER BY tot_cases;

-- Número de muertes promedio
SELECT AVG(deaths)
FROM ah1n1 WHERE country <> "Grand Total";

-- Número de casos promedio
SELECT AVG(cases)
FROM ah1n1 WHERE country <> "Grand Total";

SELECT country, COUNT(*) AS num_dates
FROM ah1n1
GROUP BY country
ORDER BY num_dates;

SELECT country, tot_deaths / tot_cases AS crude_death_rate
FROM (SELECT country, SUM(cases) AS tot_cases, SUM(deaths) AS tot_deaths FROM ah1n1 WHERE country <> "Grand Total" GROUP BY country) AS by_country
ORDER BY crude_death_rate DESC;

