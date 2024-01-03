-- Étudiez au moins 6 autres variables de world afin d’obtenir des insights pertinents (Literacy, Net migration, Birthrate, Deathrate, Infant mortality, Arable, Crops, …)


-- Literacy Rate Insights:

SELECT AVG(Literacy_Rate) AS average_literacy_rate,
       MAX(Literacy_Rate) AS max_literacy_rate,
       MIN(Literacy_Rate) AS min_literacy_rate
FROM world;


-- Net Migration Insights:


SELECT AVG(Net_Migration) AS average_net_migration,
       SUM(Net_Migration) AS total_net_migration
FROM world;




-- Birthrate and Deathrate Insights:


SELECT AVG(Birthrate) AS average_birthrate,
       AVG(Deathrate) AS average_deathrate
FROM world;




-- Infant Mortality Insights:

SELECT MAX(Infant_Mortality) AS max_infant_mortality_country,
       MIN(Infant_Mortality) AS min_infant_mortality_country
FROM world;



-- Arable and Crops Insights:

SELECT AVG(Arable_Percent) AS average_arable_percent, AVG(Crops_Percent) AS average_crops_percent FROM world;



-- Average and Total Crops Percentage:

SELECT AVG(Crops_Percent) AS average_crops_percent,
       SUM(Crops_Percent) AS total_crops_percent
FROM world;

