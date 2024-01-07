# hello-DBMS+

La VEILLE + INSTRUCTIONS JOB0 + BIGJOB
<br>

ENJOY ;)


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

Une base de données relationnelle et une base de données non relationnelle sont deux types différents de systèmes de gestion de bases de données (SGBD) qui stockent et organisent les données de manière distincte.

Base de données relationnelle :

Une base de données relationnelle repose sur le modèle relationnel, introduit par Edgar Codd dans les années 1970. Ce modèle organise les données sous forme de tables composées de lignes et de colonnes. Chaque table représente une entité, et chaque ligne de la table représente un enregistrement ou une occurrence de cette entité. Les relations entre les tables sont établies à l'aide de clés étrangères.

Caractéristiques :

    Structure tabulaire avec des lignes et des colonnes.
    Les relations entre les tables sont définies par des clés primaires et étrangères.
    Utilise le langage SQL (Structured Query Language) pour interagir avec la base de données.
    Assure la cohérence et l'intégrité des données.

Exemples d'applications :

    MySQL
    PostgreSQL
    Oracle Database
    Microsoft SQL Server

Base de données non relationnelle (NoSQL) :

Les bases de données non relationnelles, également appelées NoSQL, diffèrent des bases de données relationnelles en termes de modèles de données. Elles ne reposent pas sur le modèle tabulaire traditionnel, et il existe différents types de modèles de données NoSQL, tels que le modèle de document, le modèle de graphe, le modèle de colonnes, etc.

Caractéristiques :

    Peut utiliser différents modèles de données.
    Évite souvent le schéma fixe, permettant une flexibilité dans la structure des données.
    Évite généralement l'utilisation de SQL traditionnel.
    Souvent utilisé pour des applications avec des besoins de mise à l'échelle horizontale et de traitement de données massives.

Exemples d'applications :

    MongoDB (modèle de document)
    Cassandra (modèle de colonnes)
    Neo4j (modèle de graphe)
    Redis (base de données clé-valeur)

Différences principales :

Modèle de données : Relationnel pour les bases de données relationnelles, divers (document, colonnes, graphes, etc.) pour les bases de données non relationnelles.

Schéma : Fixe et prédéfini pour les bases de données relationnelles, souvent flexible pour les bases de données non relationnelles.

Langage de requête : SQL pour les bases de données relationnelles, langages spécifiques ou absence de langage standardisé pour les bases de données non relationnelles.

Applications : Les bases de données relationnelles sont souvent utilisées dans des applications où la cohérence et la structure rigide des données sont essentielles, tandis que les bases de données non relationnelles sont couramment utilisées dans des applications nécessitant une évolutivité facile et une flexibilité de schéma.

<hr>
<b>F.</b> Définissez les notions de clé étrangère et clé primaire

En SQL, une clé primaire (Primary Key) et une clé étrangère (Foreign Key) sont des concepts essentiels pour établir des relations entre les tables dans une base de données relationnelle.

Clé Primaire (Primary Key) :

Une clé primaire est une colonne (ou un ensemble de colonnes) qui identifie de manière unique chaque enregistrement dans une table.
Chaque table ne peut avoir qu'une seule clé primaire.
La clé primaire garantit l'unicité des valeurs dans la colonne désignée, ce qui facilite l'identification et la manipulation des enregistrements.
Elle est définie lors de la création de la table à l'aide de la clause PRIMARY KEY.

Clé Étrangère (Foreign Key) :

Une clé étrangère est une colonne (ou un ensemble de colonnes) qui établit une relation entre deux tables.
Elle pointe vers la clé primaire d'une autre table, établissant ainsi une liaison entre ces deux tables.
La clé étrangère est utilisée pour maintenir l'intégrité référentielle, en s'assurant que les valeurs dans la colonne de la clé étrangère existent également dans la colonne de la clé primaire de la table référencée.
Elle est définie lors de la création de la table à l'aide de la clause FOREIGN KEY.

<hr>

<b>G.</b> Quelles sont les propriétés ACID ?

Les transactions dans les bases de données relationnelles sont définies par quatre propriétés essentielles regroupées sous l'acronyme ACID : Atomicité, Cohérence, Isolation, et Durabilité. L'Atomicité garantit que chaque élément d'une transaction est traité de manière complète, la Cohérence maintient l'intégrité des données après une transaction, l'Isolation assure que les effets d'une transaction ne sont visibles pour d'autres qu'après son engagement, et la Durabilité assure que les modifications de données deviennent permanentes une fois la transaction engagée.
<hr>

<b>H.</b> Définissez les méthodes Merise et UML. Quelles sont leur utilité dans le monde
de l’informatique ?

Merise :

Définition : Méthode de conception de systèmes d'information qui utilise des modèles conceptuels, organisationnels et physiques pour décrire et structurer les données, les traitements et les flux d'informations.
Utilité : Merise est utilisée pour modéliser et concevoir des systèmes d'information, notamment pour la gestion de bases de données.

UML (Unified Modeling Language) :

Définition : Langage de modélisation graphique utilisé pour visualiser, spécifier, construire et documenter les artefacts d'un système logiciel.
Utilité : UML est utilisé pour la modélisation conceptuelle, la conception, la documentation et la communication entre les parties prenantes d'un projet logiciel.

Cas d'utilisation :

Merise : Utilisé pour concevoir une base de données relationnelle. Par exemple, un diagramme entité-association (schéma conceptuel) peut représenter les entités, les relations et les attributs dans un système d'information.

UML : Utilisé pour modéliser les classes et leurs relations dans un système orienté objet. Par exemple, un diagramme de classes UML peut représenter les classes, les attributs et les méthodes d'un système logiciel.

<hr>
<b>I.</b> Définissez le langage SQL. Donnez les commandes les plus utilisées de ce langage et les différentes jointures qu’il est possible de faire

SQL (Structured Query Language) :
Définition : Langage de programmation standardisé utilisé pour gérer et manipuler des bases de données relationnelles. Il permet de créer, mettre à jour, interroger et gérer les données dans une base de données.

Commandes SQL couramment utilisées :

SELECT : Sélectionne des données à partir d'une ou plusieurs tables.
````
SELECT colonne1, colonne2 FROM table WHERE condition;
````
INSERT : Insère de nouvelles lignes de données dans une table.
````
INSERT INTO table (colonne1, colonne2) VALUES (valeur1, valeur2);
````
UPDATE : Met à jour des données existantes dans une table.
````
UPDATE table SET colonne1 = nouvelle_valeur WHERE condition;
````
DELETE : Supprime des lignes de données d'une table.
````
DELETE FROM table WHERE condition;
````
CREATE : Crée une nouvelle table, vue, index, etc.
````
CREATE TABLE nouvelle_table (colonne1 datatype, colonne2 datatype, ...);
````
ALTER : Modifie la structure d'une table existante.
````
ALTER TABLE table ADD colonne datatype;
````
DROP : Supprime une table, une vue, un index, etc.

````
    DROP TABLE table;
````
Différentes jointures en SQL :

INNER JOIN : Retourne les lignes lorsque des correspondances sont trouvées dans les deux tables.
````
SELECT * FROM table1 INNER JOIN table2 ON table1.colonne = table2.colonne;
````
LEFT JOIN (ou LEFT OUTER JOIN) : Retourne toutes les lignes de la table de gauche et les lignes correspondantes de la table de droite.

````
SELECT * FROM table1 LEFT JOIN table2 ON table1.colonne = table2.colonne;
````

RIGHT JOIN (ou RIGHT OUTER JOIN) : Retourne toutes les lignes de la table de droite et les lignes correspondantes de la table de gauche.

````
SELECT * FROM table1 RIGHT JOIN table2 ON table1.colonne = table2.colonne;
````

FULL JOIN (ou FULL OUTER JOIN) : Retourne toutes les lignes lorsque des correspondances sont trouvées dans l'une des tables.

````
SELECT * FROM table1 FULL JOIN table2 ON table1.colonne = table2.colonne;
````
CROSS JOIN : Retourne le produit cartésien des deux tables (toutes les combinaisons possibles).

````
SELECT * FROM table1 CROSS JOIN table2;
````
Ces commandes et jointures représentent une partie essentielle de l'utilisation quotidienne du langage SQL dans la gestion des bases de données relationnelles.

<hr>

# Job0: Setup 
````
$ sudo mysql
mysql> CREATE DATABASE aimen_dbms;
mysql> SHOW DATABASES;
mysql> USE aimen_dbms;



CREATE TABLE world (
    name VARCHAR(255),
    region VARCHAR(255),
    population DOUBLE,
    area FLOAT,
    population_density FLOAT, 
    coastline_ratio FLOAT,
    net_migration FLOAT, 
    infant_mortality FLOAT, 
    gdp_per_capita INT,
    literacy_rate DOUBLE, 
    phones_per_1000 FLOAT,
    arable_percent FLOAT, 
    crops_percent FLOAT,
    other_percent FLOAT,
    climate VARCHAR(255),
    birthrate FLOAT,
    deathrate FLOAT, 
    agriculture DOUBLE,
    industry FLOAT,
    service FLOAT
);


LOAD DATA INFILE '/var/lib/mysql-files/countriesoftheworld.csv'
INTO TABLE world
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@name, @region, @population, @area, @population_density, @coastline_ratio, @net_migration, @infant_mortality, @gdp_per_capita, @literacy_rate, @phones_per_1000, @arable_percent, @crops_percent, @other_percent, @climate, @birthrate, @deathrate, @agriculture, @industry, @service)
SET
    name = TRIM(@name),
    region = TRIM(@region),
    population = IF(@population = '', 0.0, REPLACE(@population, ',', '.')),
    area = IF(@area = '', 0.0, REPLACE(@area, ',', '.')),
    population_density = IF(@population_density = '', 0.0, REPLACE(@population_density, ',', '.')),
    coastline_ratio = IF(@coastline_ratio = '', 0.0, REPLACE(@coastline_ratio, ',', '.')),
    net_migration = IF(@net_migration = '', 0.0, REPLACE(@net_migration, ',', '.')),
    infant_mortality = IF(@infant_mortality = '', 0.0, REPLACE(@infant_mortality, ',', '.')),
    gdp_per_capita = IF(@gdp_per_capita = '', 0.0, REPLACE(@gdp_per_capita, ',', '.')),
    literacy_rate = IF(@literacy_rate = '', 0.0, REPLACE(@literacy_rate, ',', '.')),
    phones_per_1000 = IF(@phones_per_1000 = '', 0.0, REPLACE(@phones_per_1000, ',', '.')),
    arable_percent = IF(@arable_percent = '', 0.0, REPLACE(@arable_percent, ',', '.')),
    crops_percent = IF(@crops_percent = '', 0.0, REPLACE(@crops_percent, ',', '.')),
    other_percent = IF(@other_percent = '', 0.0, REPLACE(@other_percent, ',', '.')),
    climate = TRIM(@climate),
    birthrate = IF(@birthrate = '', 0.0, REPLACE(@birthrate, ',', '.')),
    deathrate = IF(@deathrate = '', 0.0, REPLACE(@deathrate, ',', '.')),
    agriculture = IF(@agriculture = '', 0.0, REPLACE(@agriculture, ',', '.')),
    industry = IF(@industry = '', 0.0, REPLACE(@industry, ',', '.')),
    service = IF(@service = '', 0.0, REPLACE(@service, ',', '.'));
````



## Run

````
mysql> source Bureau/job1.sql
````


## BIG JOB: Requirements

````
conda create -n bigjob python=3.8 
conda activate bigjob
pip install -r requirements.txt
````
For connecting to MySQL in a Flask application, it's advisable to create a separate user with a password and grant appropriate permissions to that user for the specific database you are working with.
Log in to your MySQL server using the root account:

````
sudo mysql
````
Inside the >> MySQL shell, create a new user and grant privileges:

````
CREATE USER 'your_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON CarbonFootprint.* TO 'your_user'@'localhost';
FLUSH PRIVILEGES;
````

Replace 'your_user' and 'your_password' with your chosen username and password.
<br>Make sure your password is composed of uppercase, lowercase, special characters and numbers.

<br>Then, Modify your Flask App's connect function:
````
def connect_db():
    host = 'localhost'
    user = 'your_user'
    database = 'CarbonFootprint'
    password = os.environ.get('DB_PASSWORD')
    ...etc
````

As you can see, the password was purposely hidden in the app for security reasons also!
<br>You will put the password when you call the app on terminal like this:

````
conda activate bigjob
export DB_PASSWORD='your_password'
python app.py
````

# Author

Aimen CHERIF









