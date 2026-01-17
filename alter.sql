

CREATE TABLE access_to_services(
Region VARCHAR(32),
sub_region VARCHAR(25),
Country_name VARCHAR(25) NOT NULL,
Time_period INTEGER NOT NULL,
Pct_managed_water_service NUMERIC(5,2),
Pct_managed_sanitation_service NUMERIC(5,2),
Est_population_in_millions NUMERIC(11,6),
Est_gdp_in_billions NUMERIC(8,2),
Land_area NUMERIC(10,2),
Pct_unemployment NUMERIC(5,2)
);

SELECT * FROM united_nations.access_to_services;
ALTER TABLE access_to_services
MODIFY COLUMN Country_name VARCHAR(25);

ALTER TABLE access_to_services
ADD COLUMN gini_index FLOAT;

ALTER TABLE access_to_services
DROP COLUMN gini_index;