-- 1. Observez le schéma relationnel de la base de données UEFA EURO 2012. Analysez les cardinalités.

-- Selon le modèle relationnel de la base de données UEFA EURO 2012. On trouve des cardinalités de type un-à-un (1:1) :càd que chaque ligne dans la première table est liée à une seule ligne dans la deuxième table et que chaque ligne dans la deuxième table est liée à une seule ligne dans la première table.
-- On trouve également des cardinalités de type 0:N souvent appelée "zéro à plusieurs" et elles relèvent de la catégorie d'une relation un-à-plusieurs (1:N)  : càd que chaque ligne dans la première table peut être liée à plusieurs lignes dans la deuxième table et que chaque ligne dans la deuxième table est liée à une seule (1:N) ou à aucune (0:N) ligne dans la première table.

-- Dans cet exemple:

-- Une équipe peut marquer 0 ou plusieurs buts, et un but est marqué par une seule équipe.
-- Relation : Un-à-Plusieurs (1:N)
-- Explication : Chaque équipe peut marquer plusieurs buts, mais chaque but est attribué à une seule équipe.

-- Une équipe peut jouer 0 ou plusieurs matchs, et un match est joué par une seule équipe.
-- Relation : Un-à-Plusieurs (1:N)
-- Explication : Chaque équipe peut jouer à plusieurs matchs, mais chaque match est associé à une seule équipe.

-- Un but est marqué dans un seul match, et un match peut avoir 0 ou plusieurs buts.
-- Relation : Un-à-Plusieurs (1:N)
-- Explication : Chaque but est lié à un match spécifique, mais un match peut avoir plusieurs buts marqués.



-- 2. La requête qui permet d’afficher le but marqué par un joueur dont le nom de famille est "Bender". L'astérisque (*) indique qu'il faut énumérer toutes les colonnes du tableau - une façon d’appeler toutes les colonnes de la table goal (matchid, teamid, player, gtime). Modifiez cette requête afin d’afficher le numéro de match et le nom du joueur pour tous les buts marqués par l'Allemagne. Afin d’identifier les joueurs allemands, vérifiez que : teamid = 'GER'
SELECT matchid, player FROM goal WHERE teamid = 'GER';

-- 3. Créez une requête permettant d’afficher les colonnes id, stadium, team1, team2 pour le match dont l’id est 1012.
SELECT id, stadium, team1, team2 FROM game WHERE id = 1012;

-- 4. La requête suivante permet de joindre la table game et la table goal sur la colonne id-matchid. Modifiez cette requête afin d’afficher player, teamid, stadium et mdate de chaque but allemand.
SELECT player, teamid, stadium, mdate FROM game JOIN goal ON id = matchid WHERE teamid = 'GER';

-- 5. Créez une requête permettant d’afficher team1, team2 et player pour chaque but marqué par un joueur appelé Mario.
SELECT team1, team2, player FROM game JOIN goal ON id = matchid WHERE player LIKE '%Mario%';

-- 6. Créez une requête permettant de joindre la table goal et la table eteam sur les clés id - teamid.
SELECT teamname, player, gtime FROM eteam JOIN goal ON id = teamid;

-- 7. Créez une requête permettant d’afficher player, teamid, coach, gtime pour tous les buts marqués dans les 10 premières minutes des matchs.
SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON teamid = id WHERE gtime <= 10;

-- 8. La requête suivante permet de joindre la table game et la table eteam sur les clés team1 - eteam.id. Créez une requête permettant d’afficher les dates des matches ainsi que le nom de l'équipe dont "Fernando Santos" était le coach de l’équipe team1.
SELECT mdate, teamname FROM game JOIN eteam ON team1 = id WHERE coach = 'Fernando Santos';

-- 9. Créez une requête permettant d’afficher la liste des joueurs pour chaque but marqué lors d'un match dont le stade était le “National Stadium, Warsaw”.
SELECT player FROM game JOIN goal ON id = matchid WHERE stadium = 'National Stadium, Warsaw';

-- 10. Créez une requête permettant d’afficher le nombre total de buts marqués pour chaque équipe de la table goal.
SELECT teamid, COUNT(*) FROM goal GROUP BY teamid;

-- 11. Créez une requête permettant d’afficher les stades et le nombre de buts marqués dans chacun des stades de la jointure de game-goal.
SELECT stadium, COUNT(*) FROM game JOIN goal ON id = matchid GROUP BY stadium;

-- 12. Pour chaque match où l’équipe de France a marqué, créez une requête permettant d’afficher l'id du match, la date du match et le nombre de buts marqués par "FRA".
SELECT matchid, mdate, COUNT(*) FROM game JOIN goal ON id = matchid WHERE teamid = 'FRA' GROUP BY matchid;

