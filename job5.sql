-- 1. Créez une requête permettant d’afficher les pays dont la population est supérieure à celle de "Russia".
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name = "Russia") ;

-- 2. Créez une requête permettant d’afficher les pays d'Europe dont le PIB par habitant est supérieur à celui d’ "Italy".
SELECT name FROM world WHERE region LIKE '%EUROPE%' AND gdp_per_capita > (SELECT gdp_per_capita FROM world WHERE name = 'Italy');

-- 3. Créez une requête permettant d’afficher les pays dont la population est supérieure à celle du Royaume-Uni mais inférieure à celle de l'Allemagne.
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') AND population < (SELECT population FROM world WHERE name = 'Germany');

-- 4. Créez une requête permettant d’afficher le nom et la population de chaque pays d'Europe, en pourcentage de la population de l'Allemagne.
SELECT name, (population / (SELECT population FROM world WHERE name = 'Germany')) * 100 AS percentage_of_germany_population FROM world WHERE region LIKE '%EUROPE%';

-- 5. Créez une requête permettant de trouver le plus grand pays de chaque continent, en indiquant son continent, son nom et sa superficie.
SELECT region, name, area FROM world WHERE area IN (SELECT MAX(area) FROM world GROUP BY region);

-- 6. Créez une requête permettant de trouver les continents où tous les pays ont une population inférieure ou égale à 25 000 000.
SELECT region FROM world GROUP BY region HAVING MAX(population) <= 25000000;
