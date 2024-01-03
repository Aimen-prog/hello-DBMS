-- 1. Modifiez la requête ci-dessus afin d’afficher la population de “Germany”.
SELECT population FROM world WHERE name = 'Germany';
-- 2. Modifiez la requête ci-dessus afin d’afficher le nom et la population des pays “Sweden”, “Norway” et “Denmark”.
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- 3. Créez une requête permettant d’afficher les pays dont la superficie est supérieure à 200 000 mais inférieure à 300 000.
SELECT name FROM world WHERE area > 200000 AND area < 300000;
