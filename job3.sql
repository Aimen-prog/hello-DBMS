-- 1. Créez une requête permettant d’afficher toutes les colonnes de la table students.
SELECT * FROM students ;
-- 2. Créez une requête permettant de filtrer la table et d’afficher les élèves âgés de strictement plus de 20 ans.
SELECT * FROM students WHERE age > 20;
-- 3. Créez une requête permettant de faire un classement des élèves selon leur note dans un ordre croissant, puis dans un ordre décroissant.
SELECT * FROM students ORDER BY grade ASC;
SELECT * FROM students ORDER BY grade DESC;
