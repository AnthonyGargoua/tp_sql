-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 08 juil. 2026 à 16:03
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `compta`
--

-- --------------------------------------------------------

--
-- Structure de la table `ARTICLE`
--

CREATE TABLE `ARTICLE` (
  `ID` int(10) NOT NULL COMMENT 'Identifiant entier clé primaire',
  `REF` varchar(50) NOT NULL COMMENT 'Référence de l’article. C’est un code interne utilisé par le magasin',
  `DESIGNATION` varchar(255) NOT NULL COMMENT 'Libellé de l’article',
  `PRIX` decimal(12,5) NOT NULL COMMENT 'Prix de l’article',
  `ID_FOU` int(10) NOT NULL COMMENT 'Indique l’identifiant du fournisseur qui fournit cet article'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ARTICLE`
--

INSERT INTO `ARTICLE` (`ID`, `REF`, `DESIGNATION`, `PRIX`, `ID_FOU`) VALUES
(1, 'A01', 'Perceuse P1', 74.99000, 1),
(2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25000, 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45000, 2),
(4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40000, 3),
(5, 'A02', 'Meuleuse 125mm', 37.85000, 1),
(6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80000, 3),
(7, 'A03', 'Perceuse à colonne', 185.25000, 1),
(8, 'D04', 'Coffret mêches à bois', 12.25000, 3),
(9, 'F03', 'Coffret mêches plates', 6.25000, 2),
(10, 'F04', 'Fraises d’encastrement', 8.14000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `BON`
--

CREATE TABLE `BON` (
  `ID` int(10) NOT NULL COMMENT 'Identifiant entier clé primaire',
  `NUMERO` varchar(50) NOT NULL COMMENT 'Référence comptable du bon de commande',
  `DATE_CMDE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date de passage de la commande',
  `DELAI` int(10) NOT NULL COMMENT 'Délai de livraison constaté',
  `ID_FOU` int(10) NOT NULL COMMENT 'Indique l’identifiant du fournisseur à qui s’adresse le bon de commande'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `BON`
--

INSERT INTO `BON` (`ID`, `NUMERO`, `DATE_CMDE`, `DELAI`, `ID_FOU`) VALUES
(1, '777', '2026-07-08 13:59:02', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `COMPO`
--

CREATE TABLE `COMPO` (
  `ID` int(10) NOT NULL COMMENT 'Identifiant clé primaire auto-incrémenté',
  `QTE` int(10) NOT NULL COMMENT 'Quantité d’articles',
  `ID_ART` int(10) NOT NULL COMMENT 'Identifiant de l’article',
  `ID_BON` int(10) NOT NULL COMMENT 'Identifiant du bon de commande'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `COMPO`
--

INSERT INTO `COMPO` (`ID`, `QTE`, `ID_ART`, `ID_BON`) VALUES
(1, 3, 1, 1),
(2, 4, 5, 1),
(3, 1, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `FOURNISSEUR`
--

CREATE TABLE `FOURNISSEUR` (
  `ID` int(10) NOT NULL COMMENT 'Identifiant clé primaire',
  `NOM` varchar(255) NOT NULL COMMENT 'Nom du fournisseur'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `FOURNISSEUR`
--

INSERT INTO `FOURNISSEUR` (`ID`, `NOM`) VALUES
(1, 'Française d’Imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_FOU` (`ID_FOU`);

--
-- Index pour la table `BON`
--
ALTER TABLE `BON`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_FOU` (`ID_FOU`);

--
-- Index pour la table `COMPO`
--
ALTER TABLE `COMPO`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_BON` (`ID_BON`),
  ADD KEY `ID_ART` (`ID_ART`);

--
-- Index pour la table `FOURNISSEUR`
--
ALTER TABLE `FOURNISSEUR`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant entier clé primaire', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `BON`
--
ALTER TABLE `BON`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant entier clé primaire', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `COMPO`
--
ALTER TABLE `COMPO`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant clé primaire auto-incrémenté', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `FOURNISSEUR`
--
ALTER TABLE `FOURNISSEUR`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant clé primaire', AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`ID_FOU`) REFERENCES `FOURNISSEUR` (`ID`);

--
-- Contraintes pour la table `BON`
--
ALTER TABLE `BON`
  ADD CONSTRAINT `bon_ibfk_1` FOREIGN KEY (`ID_FOU`) REFERENCES `FOURNISSEUR` (`ID`);

--
-- Contraintes pour la table `COMPO`
--
ALTER TABLE `COMPO`
  ADD CONSTRAINT `compo_ibfk_1` FOREIGN KEY (`ID_BON`) REFERENCES `BON` (`ID`),
  ADD CONSTRAINT `compo_ibfk_2` FOREIGN KEY (`ID_ART`) REFERENCES `ARTICLE` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
