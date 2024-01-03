-- 1. Créez une requête permettant d’afficher la population totale du monde.
SELECT SUM(population) AS total_population FROM world ;

-- 2. Créez une requête permettant d’afficher la population totale de chacun des continents.
SELECT region, SUM(population) AS total_region_population from world GROUP BY region ;

-- 3. Créez une requête permettant d’afficher le PIB total du continent de chacun des continents.
SELECT region, SUM(gdp_per_capita) AS total_region_gdp from world GROUP BY region ;

-- 4. Créez une requête permettant d’afficher le PIB total du continent africain.
SELECT SUM(total_african_gdp) AS overall_gdp_for_africa FROM (SELECT region, SUM(gdp_per_capita) AS total_african_gdp FROM world GROUP BY region) AS gdp_per_capita WHERE region LIKE "%AFRICA%";

-- 5. Créez une requête permettant d’afficher le nombre de pays ayant une superficie supérieure ou égale à 1 000 000m².
SELECT COUNT(name) FROM world WHERE area >= 1000000;

-- 6. Créez une requête permettant d’afficher la population totale des pays suivants : Estonia, Latvia, Lithuania.
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 7. Créez une requête permettant d’afficher le nombre de pays de chaque continent.
SELECT region, COUNT(name) AS countries FROM world GROUP BY region;

-- 8. Créez une requête permettant d’afficher les continents ayant une population totale d’au moins 100 millions d’individus.
SELECT region FROM world GROUP BY region HAVING SUM(population) >= 100000000;
