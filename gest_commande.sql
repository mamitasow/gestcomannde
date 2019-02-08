-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 08 Février 2019 à 14:05
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gest_commande`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `Montant` double DEFAULT NULL,
  `datecommande` datetime DEFAULT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `livraison_ID` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id`, `Montant`, `datecommande`, `etat`, `libelle`, `livraison_ID`, `user_id`) VALUES
(24, 45000, '2019-02-07 23:17:03', 'annuler', 'commande1', NULL, 1),
(25, 100, '2019-02-07 23:17:34', 'livrer', 'commande2', NULL, 1),
(31, 4000, '2019-02-08 00:16:55', 'livrer', 'hhc', NULL, 1),
(33, NULL, NULL, 'livrer', NULL, 29, 1),
(34, NULL, NULL, 'livrer', NULL, 30, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livraison`
--

INSERT INTO `livraison` (`id`, `date`, `user_id`) VALUES
(20, '2019-02-16', NULL),
(21, '2019-02-16', 1),
(22, '2019-02-08', 1),
(23, '2019-02-16', 1),
(24, '2019-02-09', NULL),
(25, '2019-02-15', 1),
(26, '2019-02-06', NULL),
(27, '2019-02-14', NULL),
(28, '2019-02-22', 1),
(29, '2019-02-08', 1),
(30, '2019-02-22', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `login` varchar(200) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `Nom`, `Prenom`, `login`, `password`) VALUES
(1, 'Sow', 'mamita', 'gayeyaye@gmail.com', 'passer');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5iotg8vm3ep6onh2a6uax0t3k` (`livraison_ID`),
  ADD KEY `FKqpl4bbvvi7bd14i34d9dimads` (`user_id`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlb0amajiy32r63rfr9b32eltm` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_587tdsv8u5cvheyo9i261xhry` (`login`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK5iotg8vm3ep6onh2a6uax0t3k` FOREIGN KEY (`livraison_ID`) REFERENCES `livraison` (`id`),
  ADD CONSTRAINT `FKqpl4bbvvi7bd14i34d9dimads` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `FKlb0amajiy32r63rfr9b32eltm` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
