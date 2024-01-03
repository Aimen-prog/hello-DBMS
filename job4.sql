-- 1. Créez une requête permettant d’afficher les prix nobels de 1986.
SELECT * FROM nobel WHERE yr = 1986 ;
-- 2. Créez une requête permettant d’afficher les prix nobels de littérature de 1967.
SELECT * FROM nobel WHERE subject = 'Literature' AND yr = 1967 ;
-- 3. Créez une requête permettant d’afficher l’année et le sujet du prix nobel d’Albert Einstein.
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';
-- 4. Créez une requête permettant d’afficher les détails (année, sujet, lauréat) des lauréats du prix de Littérature de 1980 à 1989 inclus
SELECT yr, subject, winner FROM nobel WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989 ;
-- 5. Créez une requête permettant d’afficher les détails des lauréats du prix de Mathématiques. 
SELECT yr, subject, winner FROM nobel WHERE subject = 'Mathematics';
-- Combien y en a-t-il ? 0, il n'existe pas de prix Nobel de Mathématiques
