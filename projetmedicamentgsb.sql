-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 28 mars 2022 à 22:17
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetmedicamentgsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `dosage`
--

DROP TABLE IF EXISTS `dosage`;
CREATE TABLE IF NOT EXISTS `dosage` (
  `DOS_Code` int(10) NOT NULL,
  `DOS_Quantite` varchar(10) NOT NULL,
  `DOS_Unite` varchar(10) NOT NULL,
  PRIMARY KEY (`DOS_Code`),
  KEY `DOS_Code` (`DOS_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dosage`
--

INSERT INTO `dosage` (`DOS_Code`, `DOS_Quantite`, `DOS_Unite`) VALUES
(1, '200mg', '1'),
(2, '150mg', '3');

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

DROP TABLE IF EXISTS `famille`;
CREATE TABLE IF NOT EXISTS `famille` (
  `FAM_Code` int(5) NOT NULL,
  `FAM_Libelle` varchar(70) NOT NULL,
  PRIMARY KEY (`FAM_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`FAM_Code`, `FAM_Libelle`) VALUES
(1, 'Antalgique'),
(2, 'Antidouleur'),
(3, 'Antidiarrhétique'),
(4, 'Anti-inflammatoire'),
(5, 'Anxiolytique'),
(6, 'Antihistaminiques ');

-- --------------------------------------------------------

--
-- Structure de la table `interagir`
--

DROP TABLE IF EXISTS `interagir`;
CREATE TABLE IF NOT EXISTS `interagir` (
  `MED_Perturbateur` int(10) NOT NULL,
  `MED_MED_Perturbe` int(10) NOT NULL,
  PRIMARY KEY (`MED_Perturbateur`,`MED_MED_Perturbe`),
  KEY `MED_MED_Perturbe` (`MED_MED_Perturbe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `interagir`
--

INSERT INTO `interagir` (`MED_Perturbateur`, `MED_MED_Perturbe`) VALUES
(5, 1),
(1, 2),
(9, 2),
(2, 3),
(10, 3),
(18, 3),
(2, 4),
(3, 4),
(3, 5),
(7, 5),
(12, 5),
(2, 6),
(4, 6),
(5, 6),
(3, 7),
(7, 7),
(5, 8),
(11, 9),
(6, 10),
(7, 11),
(8, 12),
(6, 18);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `MED_DepotLegal` int(5) NOT NULL,
  `MED_NomCommercial` varchar(255) NOT NULL,
  `FAM_Code` int(5) NOT NULL,
  `MED_Composition` varchar(255) NOT NULL,
  `MED_Effets` varchar(255) NOT NULL,
  `MED_Contreindic` varchar(255) NOT NULL,
  `MED_PrixChantillon` double NOT NULL,
  PRIMARY KEY (`MED_DepotLegal`),
  KEY `MED_PrixChantillon` (`MED_PrixChantillon`),
  KEY `FAM_Code` (`FAM_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`MED_DepotLegal`, `MED_NomCommercial`, `FAM_Code`, `MED_Composition`, `MED_Effets`, `MED_Contreindic`, `MED_PrixChantillon`) VALUES
(1, 'Imodium', 3, 'Lopéramide chlorydrate', 'Traitement symptomatiquedes diarrhées aiguës et chroniques.', 'Dysenterie aiguë avec présence de sang dans les selles et fièvre\r\nPoussée aiguë de rectocolite hémorragique\r\nColite pseudomembraneuse associée aux antibiotiques\r\nEnfant de moins de 8 ans\r\nIntolérance au lactose', 2.25),
(2, 'Spasfon', 2, 'Phloroglucinol', '·Traitement symptomatique des douleurs liées aux troubles fonctionnels du tube digestif et des voies biliaires.', 'Hypersensibilité phloroglucinol\r\nAllergie amidon de blé\r\nIntolérance au galactose\r\nSyndrome de malabsorption du glucose\r\nSyndrome de malabsorption du galactose\r\nDéficit en lactase\r\nIntolérance au fructose', 2.14),
(3, 'Voltarene', 1, 'Diclofenac Sodique', 'Elles procèdent de l\'activité anti-inflammatoire du diclofénac, de l\'importance des manifestations d\'intolérance auxquelles le médicament donne lieu et de sa place dans l\'éventail des produits anti-inflammatoires actuellement disponibles.\r\n', 'Hypersensibilité diclofénac\r\nHypersensibilité AINS\r\nHypersensibilité aspirine\r\nAntécédent d\'asthme déclenché par la prise de diclofénac\r\nAntécédent d\'asthme déclenché par la prise d\'AINS\r\nAntécédent d\'asthme déclenché par la prise d\'aspirine', 2.36),
(4, 'Lamaline', 1, 'Paracétamol, Opium', 'Traitement symptomatique des douleurs d\'intensité modérée à intense et/ou ne répondant pas à l\'utilisation d\'antalgiques périphériques utilisés seuls.', 'Enfant de moins de 15 ans\r\nInsuffisance hépatocellulaire sévère\r\nAsthme\r\nInsuffisance respiratoire\r\nAllaitement', 2.27),
(5, 'Daflon', 2, 'Diosmine', 'Traitement des symptômes en rapport avec l\'insuffisance veinolymphatique (jambes lourdes, douleurs, impatiences du primo-décubitus).', 'Enfant de moins de 6 ans\r\nAllaitement\r\nHypersensibilité à la substance active ou à l\'un des excipients mentionnés à la rubrique Composition.', 4.56),
(6, 'Tranxene', 2, 'Clorazépate\r\n', 'Crise d\'angoisse paroxystique\r\nCrise d\'agitation', 'Hypersensibilité clorazépate\r\nInsuffisance respiratoire sévère\r\nSyndrome d\'apnée du sommeil\r\nInsuffisance hépatique sévère\r\nMyasthénie\r\nAllaitement\r\nConsommation d\'alcool', 16.4),
(7, 'Binocrit', 1, 'Epoétine alfa', 'Binocrit est indiqué dans le traitement de l\'anémie symptomatique associée à l\'insuffisance rénale chronique (IRC)\r\nchez les adultes et les enfants âgés de 1 à 18 ans hémodialysés et les patients adultes en dialyse péritonéale', 'Hypertension non contrôlée\r\nPathologie artérielle sévère en cas de chirurgie orthopédique majeure\r\nAntécédent récent d\'infarctus du myocarde en cas de chirurgie orthopédique majeure\r\n', 212.97),
(8, 'Efferalgan', 4, 'Paracétamol', 'Traitement des symptômes d\'intensité faible à modérée', 'Hypersensibilité au paracétamol Insuffisance hépato-cellulaire sévère', 5.56),
(9, 'Advil', 1, 'Ibuprofène', 'Réduit la fièvre', 'Antécédant d\'asthme', 3.78),
(10, 'Xanax', 5, 'Alprazolam', 'Manifestation anxieuse sévère et/ou invalidante', 'Insuffisance respiratoire sévère', 9.62),
(11, 'Aerius', 6, 'Desloratadine', 'Traitre la rhinite allergique et l\'urticaire', 'Enfants de moins de 6 ans, Femmes enceintes', 4.99),
(12, 'Eudril', 1, 'Chlorhexidine digluconate	', 'Réduit le mal de gorge', 'Enfant de moins de 12 ans', 2),
(18, 'Smecta', 3, 'Poudre', 'Contre l adiaré', 'null', 2);

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
CREATE TABLE IF NOT EXISTS `prescrire` (
  `MED_DepotLegal` int(11) NOT NULL,
  `TIN_Code` int(11) NOT NULL,
  `DOS_Code` int(10) NOT NULL,
  `PRE_Posologie` varchar(40) NOT NULL,
  `PRE_IdPrescription` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PRE_IdPrescription`),
  KEY `TIN_Code` (`TIN_Code`),
  KEY `DOS_Code` (`DOS_Code`),
  KEY `MED_DepotLegal` (`MED_DepotLegal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prescrire`
--

INSERT INTO `prescrire` (`MED_DepotLegal`, `TIN_Code`, `DOS_Code`, `PRE_Posologie`, `PRE_IdPrescription`) VALUES
(7, 1, 2, 'A partir de 12 ans', 1),
(5, 2, 1, 'A partir de 15 ans', 2),
(8, 2, 2, 'A partir de 17 ans', 3);

-- --------------------------------------------------------

--
-- Structure de la table `type_individu`
--

DROP TABLE IF EXISTS `type_individu`;
CREATE TABLE IF NOT EXISTS `type_individu` (
  `TIN_Code` int(11) NOT NULL,
  `TIN_Libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`TIN_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_individu`
--

INSERT INTO `type_individu` (`TIN_Code`, `TIN_Libelle`) VALUES
(1, 'Enfant'),
(2, 'Adulte'),
(3, 'Femmes Enceintes'),
(4, 'Personnes Agées'),
(5, 'Imunodéficients'),
(6, 'Handicapé');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `interagir`
--
ALTER TABLE `interagir`
  ADD CONSTRAINT `interagir_ibfk_1` FOREIGN KEY (`MED_Perturbateur`) REFERENCES `medicament` (`MED_DepotLegal`),
  ADD CONSTRAINT `interagir_ibfk_2` FOREIGN KEY (`MED_MED_Perturbe`) REFERENCES `medicament` (`MED_DepotLegal`);

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `medicament_ibfk_1` FOREIGN KEY (`FAM_Code`) REFERENCES `famille` (`FAM_Code`);

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `prescrire_ibfk_2` FOREIGN KEY (`MED_DepotLegal`) REFERENCES `medicament` (`MED_DepotLegal`),
  ADD CONSTRAINT `prescrire_ibfk_3` FOREIGN KEY (`DOS_Code`) REFERENCES `dosage` (`DOS_Code`),
  ADD CONSTRAINT `prescrire_ibfk_4` FOREIGN KEY (`TIN_Code`) REFERENCES `type_individu` (`TIN_Code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
