-- 1. Créez une requête permettant de trouver les noms de pays commençant par la lettre B.
SELECT name FROM world WHERE name LIKE "B%";
-- 2. Créez une requête permettant de trouver les noms de pays commençant par “Al”.
SELECT name FROM world WHERE name LIKE "Al%";
-- 3. Créez une requête permettant de trouver les noms de pays finissant par la lettre y.
SELECT name FROM world WHERE name LIKE "%y";
-- 4. Créez une requête permettant de trouver les noms de pays finissant par “land”.
SELECT name FROM world WHERE name LIKE "%land";
-- 5. Créez une requête permettant de trouver les noms de pays contenant la lettre w.
SELECT name FROM world WHERE name LIKE "%w%";
-- 6. Créez une requête permettant de trouver les noms de pays contenant “oo” ou “ee”.
SELECT name FROM world WHERE name LIKE "%oo%" OR name LIKE "%ee%" ;
-- 7. Créez une requête permettant de trouver les noms de pays contenant au moins trois fois la lettre a.
SELECT name FROM world WHERE name LIKE "%a%a%a%" ;
-- 8. Créez une requête permettant de trouver les noms de pays ayant la lettre r comme seconde lettre.
SELECT name FROM world WHERE name LIKE "_r%" ;
