-- 2) Requêtes à réaliser :


-- a. Listez les articles dans l’ordre alphabétique des désignations
SELECT * FROM ARTICLE ORDER BY DESIGNATION;


-- b. Listez les articles dans l’ordre des prix du plus élevé au moins élevé
SELECT * FROM ARTICLE ORDER BY PRIX DESC;


-- c. Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant
SELECT * FROM ARTICLE WHERE DESIGNATION LIKE 'Boulon%' ORDER BY PRIX;


-- d. Listez tous les articles dont la désignation contient le mot « sachet ».
SELECT * FROM ARTICLE WHERE DESIGNATION LIKE '%sachet%';


-- e. Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !
SELECT * FROM ARTICLE WHERE LOWER(DESIGNATION) LIKE '%sachet%';


-- f. Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triées dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.
SELECT * FROM ARTICLE, FOURNISSEUR ORDER BY FOURNISSEUR.NOM, ARTICLE.PRIX DESC;


-- g. Listez les articles de la société « Dubois & Fils »


-- h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »


-- i. Calculez la moyenne des prix des articles de chaque fournisseur


-- j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.


-- k. Sélectionnez les divers bons de commande qui contiennent des boulons


-- l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.


-- m. Calculez le prix total de chaque bon de commande


-- n. Comptez le nombre d’articles de chaque bon de commande


-- o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d’articles de chacun de ces bons de commande


-- p. Calculez le coût total des commandes effectuées sur le mois d’avril


-- 3) Requêtes plus difficiles :

-- a. Sélectionnez les articles qui ont une désignation identique mais des fournisseurs différents (indice : réaliser une auto-jointure i.e. de la table avec elle-même)


-- b. Calculez les dépenses en commandes mois par mois (indice : utilisation des fonctions MONTH et YEAR)


-- c. Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS)


-- d. Calculez le prix moyen des bons de commande par fournisseur.

