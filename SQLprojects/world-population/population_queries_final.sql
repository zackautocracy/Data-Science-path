-- This is the first query:

SELECT DISTINCT year FROM population_years;

-- Populations of Gabon:

SELECT * FROM population_years
WHERE country = 'Gabon';

-- Smallest 2005 countries by population:

SELECT country FROM population_years
WHERE year = 2005
ORDER BY population ASC
LIMIT 10;

-- Countries with >100M population in 2010

SELECT DISTINCT country FROM population_years
WHERE year = 2010
AND population > 100;

-- Countries containing "islands"

SELECT DISTINCT country FROM population_years
WHERE country like "%islands%";

-- Difference in population in Indonesia:

SELECT year, population FROM population_years
WHERE country = 'Indonesia'
AND year = 2000
OR country = 'Indonesia'
AND year = 2010;