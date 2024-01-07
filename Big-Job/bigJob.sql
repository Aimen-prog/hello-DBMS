-- 2. Créez la base de données CarbonFootprint, puis les tables Country et World

CREATE DATABASE CarbonFootprint;
USE CarbonFootprint;

DROP TABLE Country;
DROP TABLE World;
CREATE TABLE IF NOT EXISTS Country (
    country VARCHAR(255) PRIMARY KEY,
    coal FLOAT,
    gas FLOAT,
    oil FLOAT,
    hydro FLOAT,
    renewable FLOAT,
    nuclear FLOAT
);



CREATE TABLE IF NOT EXISTS World (
    region VARCHAR(255) PRIMARY KEY,
    coal FLOAT,
    gas FLOAT,
    oil FLOAT,
    hydro FLOAT,
    renewable FLOAT,
    nuclear FLOAT
);




LOAD DATA INFILE '/var/lib/mysql-files/country.csv'
INTO TABLE Country
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@country, @coal, @gas, @oil, @hydro, @renewable, @nuclear)
SET
    country = TRIM(@country),
    coal = IF(@coal = '', 0.0, REPLACE(@coal, ',', '.')),
    gas = IF(@gas = '', 0.0, REPLACE(@gas, ',', '.')),
    oil = IF(@oil = '', 0.0, REPLACE(@oil, ',', '.')),
    hydro = IF(@hydro = '', 0.0, REPLACE(@hydro, ',', '.')),
    renewable = IF(@renewable = '', 0.0, REPLACE(@renewable, ',', '.')),
    nuclear = IF(@nuclear = '', 0.0, REPLACE(@nuclear, ',', '.'));




LOAD DATA INFILE '/var/lib/mysql-files/world.csv'
INTO TABLE World
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@region, @coal, @gas, @oil, @hydro, @renewable, @nuclear)
SET
    region = TRIM(@region),
    coal = IF(@coal = '', 0.0, REPLACE(@coal, ',', '.')),
    gas = IF(@gas = '', 0.0, REPLACE(@gas, ',', '.')),
    oil = IF(@oil = '', 0.0, REPLACE(@oil, ',', '.')),
    hydro = IF(@hydro = '', 0.0, REPLACE(@hydro, ',', '.')),
    renewable = IF(@renewable = '', 0.0, REPLACE(@renewable, ',', '.')),
    nuclear = IF(@nuclear = '', 0.0, REPLACE(@nuclear, ',', '.'));





-- 3. Utilisez des requêtes SQL afin d’analyser les données recueillies et tirez un maximum d’informations sur les émissions en carbone. Qu’est ce que vous observez ? Notez ces observations pour la suite.


-- Les 5 pays les plus consommateurs de charbon
SELECT country, coal FROM Country ORDER BY coal DESC LIMIT 5;

-- Les 5 continents (regions) les plus consommateurs de charbon
SELECT region, coal FROM World WHERE region != 'World' ORDER BY coal DESC LIMIT 5;

-- Les 5 pays les plus consommateurs de gaz
SELECT country, gas FROM Country ORDER BY gas DESC LIMIT 5;

-- Les 5 continents (regions) les plus consommateurs de gaz
SELECT region, gas FROM World WHERE region != 'World' ORDER BY gas DESC LIMIT 5;

-- Les 5 pays les plus consommateurs de pétrole
SELECT country, oil FROM Country ORDER BY oil DESC LIMIT 5;

-- Les 5 continents (regions) les plus consommateurs de pétrole
SELECT region, oil FROM World WHERE region != 'World' ORDER BY oil DESC LIMIT 5;

-- Les 5 pays les plus consommateurs d'hydroélectricité
SELECT country, hydro FROM Country ORDER BY hydro DESC LIMIT 5;

-- Les 5 continents (regions) les plus consommateurs d'hydroélectricité
SELECT region, hydro FROM World WHERE region != 'World' ORDER BY hydro DESC LIMIT 5;


-- Les 5 pays les plus consommateurs d'énergie nucléaire
SELECT country, nuclear FROM Country ORDER BY nuclear DESC LIMIT 5;

-- Les 5 continents (regions) les plus consommateurs d'énergie nucléaire
SELECT region, nuclear FROM World WHERE region != 'World' ORDER BY nuclear DESC LIMIT 5;


-- Les 5 pays les plus dépendants des énergies renouvelables (les + eco-friendly)
SELECT country, renewable + hydro AS 'r' FROM Country ORDER BY r DESC LIMIT 5;

-- Les 5 continents (regions) les plus dépendants des énergies renouvelables (les + eco-friendly)
SELECT region, renewable + hydro AS 'r' FROM World WHERE region != 'World' ORDER BY r DESC LIMIT 5;


-- Les 5 pays les moins pollueurs 
SELECT country, Coal + Gas + Oil AS 'sum' FROM Country ORDER BY sum ASC LIMIT 5;

-- Les 5 continents (regions) les moins pollueurs 
SELECT region, Coal + Gas + Oil AS 'sum' FROM World WHERE region != 'World' ORDER BY sum ASC LIMIT 5;


-- observations:

-- Les pays les plus consommateurs de charbon sont : Kosovo, Botswana, South Africa, Mongolia et Estonia
-- Les regions les plus consommatrices de charbon sont : South Asia, East Asia & Pacific, SubSaharan Africa, North America et Europe & Central    

-- Les pays les plus consommateurs de gaz sont : Qatar, Turkmenistan, Bahrain, Trinidad and Tobago et Brunei Darussalam
-- Les regions les plus consommatrices de gaz sont : Middle East & North Africa, Latin America & Caribbean, North America, Europe & Central et East Asia & Pacific

-- Les pays les plus consommateurs de pétrole sont : South Sudan, Eritrea, Benin, Lebanon et Malta
-- Les regions les plus consommatrices de pétrole sont : Middle East & North Africa, Latin America & Caribbean, South Asia, SubSaharan Africa et East Asia & Pacific

-- Les pays les plus consommateurs d'hydroélectricité sont : Albania, Paraguay, Congo DR, Nepal et Namibia
-- Les régions les plus consommatrices d'hydroélectricité sont : Latin America & Caribbean, SubSaharan Africa, Europe & Central, East Asia & Pacific et North America

-- Les pays les plus consommateurs d'énergie nucléaire sont : France, Slovak Republic, Hungary, Ukraine et Belgium 
-- Les régions les plus consommatrices d'énergie nucléaire sont : Europe & Central, North America, East Asia & Pacific, SubSaharan Africa et South Asia   

-- Les pays les plus dépendants des énergies renouvelables (les + eco-friendly) sont : Nepal, Albania, Paraguay  Congo, Dem. Rep. et Iceland
-- Les régions les plus dépendantes des énergies renouvelables (les + eco-friendly) sont : Latin America & Caribbean, Europe & Central, SubSaharan Africa, North America et East Asia & Pacific   

-- Les pays les moins pollueurs sont : Albania, Iceland, Nepal, Paraguay et Congo DR
-- Les continents (regions) les moins pollueurs sont :  Latin America & Caribbean, Europe & Central, North America, SubSaharan Africa et East Asia & Pacific  



