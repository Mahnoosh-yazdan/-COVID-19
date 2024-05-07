SELECT * 
FROM covid.`coviddeaths 1` dea
join covid.`covid vaccination` cov
on dea.location=cov.location
and dea.date=cov.date ;


-------how many people vaccinated compare to population-----
select 
dea.location,
    dea.date,
    dea.population,
    SUM(CAST(cov.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY dea.location) 
    AS cumulative_vaccinations,cov.total_vaccinations
FROM 
    `coviddeaths 1` dea
JOIN 
    `covid vaccination` cov
ON 
    dea.location = cov.location
    AND dea.date = cov.date
ORDER BY 
   cumulative_vaccinations DESC;
   --------------------------------------
WITH t1 AS (
    SELECT 
        dea.location,
        SUM(CAST(cov.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY dea.location order by dea.location , dea.date) AS cumulative_vaccinations,
        cov.total_vaccinations
    FROM 
        `coviddeaths 1` dea
    JOIN 
        `covid vaccination` cov
    ON 
        dea.location = cov.location
        AND dea.date = cov.date
)
SELECT 
    dea.location,
    dea.date,
    dea.population,
    cov.new_vaccinations,
    t1.cumulative_vaccinations,
    (t1.cumulative_vaccinations / dea.population) * 100 AS vaccination_percentage
FROM  
    `coviddeaths 1` dea
JOIN 
    t1
ON
    dea.location = t1.location;
    ---------------------------------------------------------
  ------  my date s not working correctly why?------
    
    
    WITH t1 AS (
    SELECT 
         dea.location,   
        dea.date,
		dea.population, 
        cov.new_vaccinations,
        SUM(CAST(cov.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY dea.location order by dea.location , dea.date) AS cumulative_vaccinations

    FROM 
        `coviddeaths 1` dea
    JOIN 
        `covid vaccination` cov
    ON 
        dea.location = cov.location
        AND dea.date = cov.date
)
SELECT *,(cumulative_vaccinations/population)*100
from t1