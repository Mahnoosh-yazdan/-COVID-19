SELECT * FROM covid.`coviddeaths 1`;

SELECT continent,sum(new_cases) ,sum(new_deaths),population,location
 FROM covid.`coviddeaths 1`
 group by continent,population,location
 order by sum(new_cases);
 
 ----------continent------
 
 SELECT continent,
 sum(new_cases) total_cases,
 sum(new_deaths) total_death,
 sum(population) continent_population
 FROM covid.`coviddeaths 1`
 group by continent
 order by sum(new_deaths);
 
 

 SELECT continent,
       SUM(new_cases) AS total_cases,
       SUM(new_deaths) AS total_deaths,
       SUM(population) AS continent_population,
       ROUND((SUM(new_deaths) / SUM(new_cases)) * 100, 2) AS death_percentage
FROM covid.`coviddeaths 1`
GROUP BY continent
ORDER BY SUM(new_deaths);

-------------??????????----------why data dosent order by date ?

SELECT date,
       SUM(new_cases) AS total_cases,
       SUM(new_deaths) AS total_deaths,
       ROUND((SUM(new_deaths) / SUM(new_cases)) * 100, 2) AS death_percentage
FROM covid.`coviddeaths 1`
GROUP BY date
ORDER BY date;

------------------------------------------------------------
SELECT date,
       SUM(new_cases) AS total_cases,
       SUM(new_deaths) AS total_deaths,
       ROUND((SUM(new_deaths) / SUM(new_cases)) * 100, 2) AS death_percentage
FROM covid.`coviddeaths 1`
GROUP BY date
ORDER BY SUM(new_deaths) desc
limit 1;



SELECT 
       SUM(new_cases) AS total_cases,
       SUM(new_deaths) AS total_deaths,
       ROUND((SUM(new_deaths) / SUM(new_cases)) * 100, 2) AS death_percentage
FROM covid.`coviddeaths 1`k
ORDER BY SUM(new_deaths) desc
limit 1;


-----country-------


 SELECT location,population,
       SUM(new_cases) AS total_cases,
       SUM(new_deaths) AS total_deaths,
       ROUND((SUM(new_deaths) / SUM(new_cases)) * 100, 2) AS death_percentage
FROM covid.`coviddeaths 1`
where location='iran'
or location='united states'
GROUP BY location,population
ORDER BY   ROUND((SUM(new_deaths) / SUM(new_cases)) * 100, 2)desc;


-----------highest infection or death compare to population--------  

 SELECT location,population,
       SUM(new_cases) AS total_cases,
       SUM(new_deaths) AS total_deaths,
       ROUND((SUM(new_deaths) / SUM(new_cases)) * 100, 2) AS death_percentage,
        ROUND((SUM(new_deaths) / population) * 100, 2) AS death_percentage_country,
       ROUND((SUM(new_cases) / population) * 100, 2) AS infection_percentage_country
FROM covid.`coviddeaths 1`
GROUP BY location,population
ORDER BY  total_deaths desc;


---------------vaccination---------------









 