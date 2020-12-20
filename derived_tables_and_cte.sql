-- List out the states' unemployment rate and average confirmed cases

-- Method 1. Using Subqueries in the Expression

SELECT state,
unemployment_rate,
(
SELECT AVG(conf_cases)
FROM united_states_covid19_cases_and_deaths covid
GROUP BY covid.state
) AS Avg_conf_cases
FROM unemployment_rate_12mo_by_state unemp



-- 2. Derived Table by Using INNER JOIN

SELECT unemp.state,
unemp.unemployment_rate,
covid.avg_conf_cases
FROM 
unemployment_rate_12mo_by_state unemp
INNER JOIN
(
SELECT state , AVG(conf_cases) AS avg_conf_cases
FROM united_states_covid19_cases_and_deaths
GROUP BY state
) covid
ON unemp.state = covid.state


-- 3. Common Table Expression, CTE

WITH covid AS (
SELECT state , AVG(conf_cases) AS avg_conf_cases
FROM united_states_covid19_cases_and_deaths
GROUP BY state
)

SELECT unemp.state,
unemployment_rate,
covid.avg_conf_cases
FROM unemployment_rate_12mo_by_state unemp INNER JOIN covid 
ON unemp.state = covid.state
