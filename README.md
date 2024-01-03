# hello-DBMS+
<hr>
<b>A.</b> Qu’est ce qu’une donnée ? Sous quelle forme peut-elle se présenter ?

Une donnée est une information brute qui peut être enregistrée et traitée. Elle se présente sous différentes formes, telles que des nombres, du texte, des images, des vidéos ou d'autres types de médias. Les données peuvent être structurées, comme dans une base de données, ou non structurées, comme du contenu textuel libre. Elles sont la matière première de l'information et sont souvent utilisées pour générer des connaissances et des insights via des processus d'analyse et d'interprétation. La qualité et la pertinence des données sont cruciales pour obtenir des résultats fiables dans divers domaines, de la recherche scientifique à l'analyse commerciale.
<hr>
<b>B.</b> Donnez et expliquez les critères de mesure de qualité des données.

Les critères de mesure de qualité des données comprennent l'exactitude (la précision des informations ou la proximité des valeurs avec la réalité), la cohérence (harmonie entre les données), la complétude (présence de toutes les informations nécessaires), la fiabilité (crédibilité des sources), la pertinence (adéquation aux objectifs), la précision (marge d'erreur) et la cohésion (compatibilité des données). Ces critères assurent la fiabilité des données, influençant ainsi la prise de décision et l'efficacité des analyses.

<hr>
<b>C.</b> Définissez et comparez les notions de Data Lake, Data Warehouse et Data Lakehouse. Illustrez les différences à l’aide de schémas

Le <em><b>Data Lake</b></em> est un référentiel centralisé qui stocke des données brutes à grande échelle, sans structure prédéfinie. Il permet de stocker divers types de données, structurées et non structurées, offrant une flexibilité pour l'exploration et l'analyse ultérieures. Les schémas des données ne sont pas imposés à l'avance.

Le <em><b>Data Warehouse</b></em>, en revanche, est une base de données organisée et structurée qui stocke des données provenant de différentes sources dans un format pré-défini. Il est optimisé pour les requêtes analytiques et les rapports, offrant des performances élevées pour les analyses commerciales.

Le concept de <em><b>Lakehouse</b></em> combine des éléments du Data Lake et du Data Warehouse. Il vise à tirer parti de la flexibilité du Data Lake tout en fournissant des fonctionnalités de gestion et de traitement des données du Data Warehouse. Il cherche à réduire la complexité en intégrant des aspects structurés et non structurés.

&#x27F9; Data Lake + Data Warehouse = Data Lakehouse

![](Images/data-lakehouse.png)

Utilisation :
- Data Lake : Principalement utilisé pour l'analyse de données massives, l'apprentissage machine et l'exploration des données.
- Data Warehouse : Adapté à l'intelligence d'affaires, aux rapports et aux analyses traditionnelles.
- Data Lakehouse : Vise à englober une variété de cas d'utilisation en combinant les caractéristiques des deux approches.

Performances :
- Data Lake : Peut nécessiter des étapes de traitement supplémentaires pour atteindre des performances optimales.
- Data Warehouse : Optimisé pour des performances de requête rapides.
- Data Lakehouse : S'efforce d'atteindre un équilibre entre la flexibilité et les performances.
<hr>

<b>D.</b> Donnez une définition et des exemples de systèmes de gestion de bases de
données avec des illustrations.


Un système de gestion de base de données (SGBD) est un logiciel conçu pour stocker, 
organiser et gérer des données de manière efficace. 
Il offre une interface pour manipuler les données, exécuter des requêtes, 
gérer la sécurité et assurer la cohérence des informations stockées.

<b>MySQL :</b>
est un SGBD open source largement utilisé pour les applications web. 
Il supporte le langage SQL (Structured Query Language) pour la gestion des bases de données relationnelles.

Illustration :
````
CREATE TABLE employee (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  salary DECIMAL(10, 2)
);
````

<b>Oracle Database :</b>
est un SGBD relationnel robuste utilisé dans de nombreuses grandes entreprises. 
Il offre des fonctionnalités avancées telles que la gestion des transactions, la gestion des utilisateurs et des performances élevées.

Illustration :
````
CREATE TABLE employee (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(50),
  salary NUMBER(10, 2)
);
````

<b>MongoDB :</b>
est un SGBD NoSQL orienté document. Il stocke les données au format JSON-like appelé BSON et est adapté aux applications nécessitant une évolutivité horizontale, permettant ainsi une expansion aisée en ajoutant de nouveaux serveurs 
pour gérer une croissance importante de données ou de trafic, sans nécessiter une mise à niveau coûteuse d'un serveur unique.

Illustration :
Cette opération MongoDB insère un document représentant un client avec son nom et une liste de commandes de produits.
````
db.client.insert({ nom: 'Client A', commande: ['Product1', 'Product2'] });
````
<hr>

<b>E.</b> Qu’est ce qu’une base de données relationnelle ? Qu’est ce qu’une base de
données non relationnelle ? Donnez la différence entre les deux avec des exemples d’applications



# Job0: Setup 

$ sudo mysql<br>
mysql> CREATE DATABASE aimen_dbms;<br>
mysql> SHOW DATABASES;<br>
mysql> USE aimen_dbms;<br>



CREATE TABLE world (<br>
    name VARCHAR(255),<br>
    region VARCHAR(255),<br>
    population DOUBLE,<br>
    area FLOAT,<br>
    population_density FLOAT,<br> 
    coastline_ratio FLOAT,<br>
    net_migration FLOAT,<br> 
    infant_mortality FLOAT,<br> 
    gdp_per_capita INT,<br>
    literacy_rate DOUBLE,<br> 
    phones_per_1000 FLOAT,<br>
    arable_percent FLOAT,<br> 
    crops_percent FLOAT,<br>
    other_percent FLOAT,<br>
    climate VARCHAR(255),<br>
    birthrate FLOAT,<br>
    deathrate FLOAT,<br> 
    agriculture DOUBLE,<br>
    industry FLOAT,<br>
    service FLOAT<br>
);
    



LOAD DATA INFILE '/var/lib/mysql-files/countriesoftheworld.csv'<br>
INTO TABLE world<br>
FIELDS TERMINATED BY ',' ENCLOSED BY '"'<br>
LINES TERMINATED BY '\n'<br>
IGNORE 1 ROWS<br>
(@name, @region, @population, @area, @population_density, @coastline_ratio, @net_migration, @infant_mortality, @gdp_per_capita, @literacy_rate, @phones_per_1000, @arable_percent, @crops_percent, @other_percent, @climate, @birthrate, @deathrate, @agriculture, @industry, @service)<br>
SET<br>
    name = TRIM(@name),<br>
    region = TRIM(@region),<br>
    population = IF(@population = '', 0.0, REPLACE(@population, ',', '.')),<br>
    area = IF(@area = '', 0.0, REPLACE(@area, ',', '.')),<br>
    population_density = IF(@population_density = '', 0.0, REPLACE(@population_density, ',', '.')),<br>
    coastline_ratio = IF(@coastline_ratio = '', 0.0, REPLACE(@coastline_ratio, ',', '.')),<br>
    net_migration = IF(@net_migration = '', 0.0, REPLACE(@net_migration, ',', '.')),<br>
    infant_mortality = IF(@infant_mortality = '', 0.0, REPLACE(@infant_mortality, ',', '.')),<br>
    gdp_per_capita = IF(@gdp_per_capita = '', 0.0, REPLACE(@gdp_per_capita, ',', '.')),<br>
    literacy_rate = IF(@literacy_rate = '', 0.0, REPLACE(@literacy_rate, ',', '.')),<br>
    phones_per_1000 = IF(@phones_per_1000 = '', 0.0, REPLACE(@phones_per_1000, ',', '.')),<br>
    arable_percent = IF(@arable_percent = '', 0.0, REPLACE(@arable_percent, ',', '.')),<br>
    crops_percent = IF(@crops_percent = '', 0.0, REPLACE(@crops_percent, ',', '.')),<br>
    other_percent = IF(@other_percent = '', 0.0, REPLACE(@other_percent, ',', '.')),<br>
    climate = TRIM(@climate),<br>
    birthrate = IF(@birthrate = '', 0.0, REPLACE(@birthrate, ',', '.')),<br>
    deathrate = IF(@deathrate = '', 0.0, REPLACE(@deathrate, ',', '.')),<br>
    agriculture = IF(@agriculture = '', 0.0, REPLACE(@agriculture, ',', '.')),<br>
    industry = IF(@industry = '', 0.0, REPLACE(@industry, ',', '.')),<br>
    service = IF(@service = '', 0.0, REPLACE(@service, ',', '.'));























