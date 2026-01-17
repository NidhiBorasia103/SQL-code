
/* using SQL string function to clean the data */
SELECT
DISTINCT Country_name,
LENGTH(Country_name) AS string_length,
 POSITION('(' IN Country_name) AS position_opening_braket,
RTRIM(LEFT(Country_name, POSITION('(' IN Country_name)-1)) AS new_country_name,
LENGTH(RTRIM(LEFT(Country_name, POSITION('(' IN Country_name)-1))) AS new_country_string_length
FROM
united_nations.access_to_basic_services
WHERE
Country_name LIKE '%(%)%';

-- Concatinating columns in SQL

SELECT Country_name,
Time_period,
IFNULL(Est_population_in_millions, 'UNKNOWN') AS Est_population_in_millions,
CONCAT(
SUBSTRING(UPPER(IFNULL( Country_name, 'UNKNOWN')),1,4),
SUBSTRING(IFNULL( Time_period, 'UNKNOWN'),1,4),
SUBSTRING(IFNULL(Est_population_in_millions ,'UNKNOWN'),-7)
) AS Country_id

FROM united_nations.access_to_basic_services;


