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

<b>E.</b> Qu’est ce qu’une base de données relationnelle ? Qu’est ce qu’une base de
données non relationnelle ? Donnez la différence entre les deux avec des
exemples d’applications































