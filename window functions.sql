USE united_nations;

-- Exploratory Analysis using aggregated function walkthrough

SELECT 
COUNT(*) AS number_of_entry,
MIN(Time_period) AS min_time_period,
MAX(Time_period) AS max_time_period,
AVG(Pct_managed_drinking_water_services) AS pct_access_water_services,
COUNT(DISTINCT Country_name) AS country_name,
MAX(Land_area) AS land_area

FROM access_to_basic_services;

-- USE OF ROUND() AND LOG()

SELECT
Country_name,
Time_period,
ROUND(Est_gdp_in_billions) AS rounded_gdp_billions,
Log(Est_gdp_in_billions) AS log_gdp_billions
FROM
access_to_basic_services;

#A summary static report in SQL workthrough

SELECT
Region,Sub_region,
MIN(Pct_managed_drinking_water_services) AS min_pct_managed_drinking_water_services,
MAX(Pct_managed_drinking_water_services) AS max_pct_managed_drinking_water_services,
AVG(Pct_managed_drinking_water_services) AS avg_pct_managed_drinking_water_services,
COUNT(DISTINCT Country_name) AS number_of_countries,
SUM(Est_gdp_in_billions) AS gdp_in_billions
FROM
access_to_basic_services
WHERE
Time_period = 2020
AND Pct_managed_drinking_water_services < 60
GROUP BY
Region,Sub_region 
HAVING
 COUNT(DISTINCT Country_name)<4
ORDER BY
gdp_in_billions ASC;

-- Aggregation using window functions

USE united_nations;
SELECT 
Sub_region,
Country_name,
Land_area,
ROUND(Land_area / SUM(Land_area) OVER(
PARTITION BY Sub_region
 ) * 100)  AS Pct_sub_managed_region_land_area
FROM
 united_nations.access_to_basic_services
WHERE
Time_period = 2020
AND Land_area IS NOT NULL;


USE united_nations;
SELECT 
Sub_region,
Country_name,
Time_period,
Est_population_in_millions,
ROUND(AVG(Est_population_in_millions) OVER (
PARTITION BY Sub_region ORDER BY Time_period) , 4) AS Running_avg_population
FROM
 united_nations.access_to_basic_services
 WHERE
Est_population_in_millions IS NOT NULL;

-- Ranking window function

SELECT
Country_name,
Time_period,
Pct_managed_drinking_water_services,
Rank() OVER( PARTITION BY Time_period
ORDER BY Pct_managed_drinking_water_services ASC ) AS Rank_of_water_service
FROM 
 united_nations.access_to_basic_services;

-- use of Lag function

SELECT
Country_name,
Time_period,
Pct_managed_drinking_water_services,
LAG	(Pct_managed_drinking_water_services) OVER ( PARTITION BY Country_name ORDER BY Time_period ASC)
 AS Prev_year_Pct_managed_drinking_water_services,
 Pct_managed_drinking_water_services LAG (Pct_managed_drinking_water_services) OVER
 ( PARTITION BY Country_name ORDER BY Time_period ASC) AS Growth_rate
 FROM
 united_nations.access_to_basic_services 








