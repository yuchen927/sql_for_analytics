-- 1. UNION ALL
-- Using UNION ALL to combine two queries: October average Covid-19 confirmed cases and November average Covid-19 confirmed cases
-- If you know the data are not duplicated, you can use UNION ALL
-- You can also combine three, four, five queries by using UNION ALL
-- Usually use it because you have queries come from  different data source.


SELECT 'SEP' AS month, covid.state,
AVG(conf_cases) AS avg_conf_cases,
unemployment_rate
FROM united_states_covid19_cases_and_deaths covid LEFT JOIN unemployment_rate_12mo_by_state unemp
ON covid.state = unemp.state
WHERE submission_date BETWEEN '2020/09/01' AND '2020/09/30'
GROUP BY covid.state

UNION ALL

SELECT 'OCT' AS month, covid.state,
AVG(conf_cases) AS avg_conf_cases,
unemployment_rate
FROM united_states_covid19_cases_and_deaths covid LEFT JOIN unemployment_rate_12mo_by_state unemp
ON covid.state = unemp.state
WHERE submission_date BETWEEN '2020/10/01' AND '2020/10/31'
GROUP BY covid.state

UNION ALL

SELECT 'NOV' AS month, covid.state,
AVG(conf_cases) AS avg_conf_cases,
unemployment_rate
FROM united_states_covid19_cases_and_deaths covid LEFT JOIN unemployment_rate_12mo_by_state unemp
ON covid.state = unemp.state
WHERE submission_date BETWEEN '2020/11/01' AND '2020/11/30'
GROUP BY covid.state




-- 2. CASE Expression



SELECT
CASE
  WHEN submission_date BETWEEN '2020/09/01' AND '2020/09/30' THEN 'SEP'
  WHEN submission_date BETWEEN '2020/10/01' AND '2020/10/31' THEN 'OCT'
  WHEN submission_date BETWEEN '2020/11/01' AND '2020/11/30' THEN 'NOV'
END AS  month,
covid.state,
AVG(conf_cases) AS avg_conf_cases,
unemployment_rate

FROM united_states_covid19_cases_and_deaths covid LEFT JOIN unemployment_rate_12mo_by_state unemp
ON covid.state = unemp.state
WHERE submission_date BETWEEN '2020/09/01' AND '2020/11/30'
GROUP BY month , covid.state
