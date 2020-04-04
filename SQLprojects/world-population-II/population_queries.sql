-- How many entries in the database are from Africa?
SELECT count(continent) AS 'Afican countries' 
FROM countries 
WHERE continent = 'Africa';


-- What was the total population of Oceania in 2005?

SELECT  SUM(population) AS 'Total Oceania Population 2005'
   --    countries.continent AS 'Continent' ,
   --    population_years.population AS 'Population' , 
   --    population_years.year   'year'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.continent = 'Oceania'
  AND population_years.year = 2005;


-- What is the average population of countries in South America in 2003?

SELECT  round(AVG(population),2) AS 'Average SouthAmerica Population 2003'
   --    countries.continent AS 'Continent' ,
   --    population_years.population AS 'Population' , 
   --    population_years.year   'year'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.continent = 'South America'
  AND population_years.year = 2003;


-- What country had the smallest population in 2007?

SELECT MIN(population), name FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE year = 2007;

-- SELECT countries.name AS 'Smallest population in 2007'
-- FROM countries
-- JOIN population_years
--   ON countries.id = population_years.country_id
-- WHERE population_years.population = ( SELECT MIN(population) FROM population_years WHERE population_years.year = 2007 )
--   AND population_years.year = 2007;



-- What is the average population of Poland during the time period covered by this dataset?

SELECT ROUND(AVG(population),2) AS 'Average Population in Poland 2000-10'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.name = 'Poland';




-- How many countries have the word "The" in their name?

SELECT COUNT(name) AS 'Countries Having "The" in Their Name'
FROM countries
WHERE name LIKE '%The%';


-- What was the total population of each continent in 2010?

SELECT countries.continent AS 'Continent',
       ROUND(SUM(population_years.population),2) AS 'Total population per Continent 2010'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE population_years.year = 2010
GROUP BY continent;
