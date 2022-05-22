-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 14 Décembre 2021 à 13:23
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `outlast_rdv`
--

-- --------------------------------------------------------

--
-- Structure de la table `assistant`
--

CREATE TABLE `assistant` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `assistant`
--

INSERT INTO `assistant` (`id`, `nom`, `prenom`) VALUES
(1, 'Cris', 'Linder'),
(2, 'Debbi', 'Fuidge'),
(3, 'Franciskus', 'Englishby'),
(4, 'Horten', 'Jeromson'),
(5, 'Deanne', 'Gheraldi'),
(6, 'Clementina', 'Copo'),
(7, 'Sonny', 'Jupp'),
(8, 'Clem', 'Cammoile'),
(9, 'Sheffie', 'Widdop'),
(10, 'Elden', 'Paschke'),
(11, 'Berna', 'Feldhorn'),
(12, 'Dacia', 'Jendrassik'),
(13, 'Pansie', 'Fletcher'),
(14, 'Ardisj', 'Winsper'),
(15, 'Bank', 'Lintin'),
(16, 'Titus', 'Bydaway'),
(17, 'Gabie', 'Rakes'),
(18, 'Danny', 'Combes'),
(19, 'Bernette', 'Dorber'),
(20, 'Hussein', 'Kybird');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211124145255', '2021-11-24 14:53:03', 1455);

-- --------------------------------------------------------

--
-- Structure de la table `indisponibilite`
--

CREATE TABLE `indisponibilite` (
  `id` int(11) NOT NULL,
  `un_motif_id` int(11) DEFAULT NULL,
  `un_medecin_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `heure_deb` time NOT NULL,
  `heure_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `medecin`
--

INSERT INTO `medecin` (`id`, `nom`, `prenom`) VALUES
(1, 'Caroll', 'Banky'),
(2, 'Goggen', 'Zulema'),
(3, 'Darrigone', 'Sybilla'),
(4, 'Bowlas', 'Mick'),
(5, 'Chark', 'Hamid'),
(6, 'Waind', 'Ardisj'),
(7, 'Stoffersen', 'Melonie'),
(8, 'Merton', 'Farrell'),
(9, 'Dunphy', 'Marcille'),
(10, 'Paddison', 'Perl'),
(11, 'Ashfull', 'Antin'),
(12, 'Middleton', 'Cross'),
(13, 'Ashfield', 'Erika'),
(14, 'Capron', 'Billy'),
(15, 'Calken', 'Nobie'),
(16, 'Hickin', 'Kirbie'),
(17, 'Kynforth', 'Jaymee'),
(18, 'Bellie', 'Pearle'),
(19, 'Swinnerton', 'Isidore'),
(20, 'Birkmyr', 'Fletch');

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE `motif` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `motif`
--

INSERT INTO `motif` (`id`, `libelle`) VALUES
(1, 'Maladie avec arrêt de travail'),
(2, 'évènement d\'ordre familial'),
(3, 'Problème liée aux transports '),
(4, 'Maladie sans arrêt de travail'),
(5, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_secu` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `patient`
--

INSERT INTO `patient` (`id`, `nom`, `prenom`, `tel`, `num_secu`) VALUES
(1, 'Lafayette', 'Harwell', '5218410299', '9616939399125'),
(2, 'Leathart', 'Delilah', '3024262235', '3174584472833'),
(3, 'Grindlay', 'Padraig', '1706640632', '1146329342210'),
(4, 'de Najera', 'Ermanno', '7093995105', '7175697445754'),
(5, 'McCandie', 'Lionel', '2701752436', '8468803988792'),
(6, 'Gaffey', 'Chloe', '1735366612', '2544749725780'),
(7, 'Cotterell', 'Arvie', '2403718818', '6062559320260'),
(8, 'Bendik', 'Austine', '7658286336', '2298144848037'),
(9, 'Dinning', 'Shane', '3651357474', '9895290347030'),
(10, 'Sitford', 'Yehudi', '8139327273', '8939364542066'),
(11, 'Fergyson', 'Mufi', '8607658520', '2954765803210'),
(12, 'Jacquemot', 'Othella', '2513552105', '7111165904768'),
(13, 'Huggen', 'Mab', '8228910816', '3609343874054'),
(14, 'Vedenichev', 'Clerc', '5003003976', '9435960117027'),
(15, 'Bagby', 'Charley', '5761786194', '6986547586706'),
(16, 'Di Biasi', 'Marilyn', '9484868375', '6610012351079'),
(17, 'Cabrera', 'Merridie', '1936629510', '4921251306243'),
(18, 'Turtle', 'Binni', '8209475030', '8632329706933'),
(19, 'Escolme', 'Carlyn', '6676171925', '5122795540362'),
(20, 'Batcheldor', 'Ermina', '7697161155', '8993216656707');

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE `rdv` (
  `id` int(11) NOT NULL,
  `un_medecin_id` int(11) DEFAULT NULL,
  `un_assistant_id` int(11) DEFAULT NULL,
  `un_patient_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `heure_deb` time NOT NULL,
  `heure_fin` time DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `rdv`
--

INSERT INTO `rdv` (`id`, `un_medecin_id`, `un_assistant_id`, `un_patient_id`, `date`, `heure_deb`, `heure_fin`, `libelle`, `validation`) VALUES
(1, 1, 2, 3, '2021-12-01', '00:00:00', '00:00:15', 'Ulcération', 1),
(2, 4, 5, 6, '2021-12-02', '00:00:15', '00:00:30', 'Dysphonie', 0),
(3, 7, 8, 9, '2021-12-03', '00:00:30', '00:00:45', 'Surdité', 1),
(4, 10, 11, 12, '2021-12-04', '00:00:45', '01:00:00', 'Purpura', 0),
(5, 13, 14, 15, '2021-12-05', '01:00:00', '01:00:15', 'Adénopathie', 1),
(6, 16, 17, 18, '2021-12-06', '01:00:15', '01:00:30', 'Gynécomastie', 0),
(7, 19, 20, 1, '2021-12-07', '01:00:30', '01:00:45', 'Aménorrhée', 1),
(8, 2, 3, 4, '2021-12-08', '01:00:45', '02:00:00', 'Exophtalmie', 0),
(9, 5, 6, 7, '2021-12-09', '02:00:00', '02:00:15', 'Goitre', 1),
(10, 8, 9, 10, '2021-12-10', '02:00:15', '02:00:30', 'Boiterie', 0),
(11, 11, 12, 13, '2021-12-11', '02:00:30', '02:00:45', 'Cervicalgie', 1),
(12, 14, 15, 16, '2021-12-12', '02:00:45', '03:00:00', 'Douleur articulaire', 0),
(13, 17, 18, 18, '2021-12-13', '03:00:00', '03:00:15', 'Hallucinations', 1),
(14, 20, 1, 2, '2021-12-14', '03:00:15', '03:00:30', 'Myoclonie', 0),
(15, 3, 4, 5, '2021-12-15', '03:00:30', '03:00:45', 'Asomatognosie', 1),
(16, 6, 7, 8, '2021-12-16', '03:00:45', '04:00:00', 'Amnésie', 0),
(17, 9, 10, 11, '2021-12-17', '04:00:00', '04:00:15', 'Céphalées', 1),
(18, 12, 13, 14, '2021-12-18', '04:00:15', '04:00:30', 'Insomnie', 0),
(19, 15, 16, 17, '2021-12-19', '04:00:30', '04:00:45', 'Négativisme', 1),
(20, 18, 19, 20, '2021-12-20', '04:00:45', '05:00:00', 'Stéréotypies', 0),
(21, 1, 2, 3, '2021-12-21', '05:00:00', '05:00:15', 'Idée suicidaire', 1),
(22, 4, 5, 6, '2021-12-22', '05:00:15', '05:00:30', 'Anxiété', 0),
(23, 7, 8, 9, '2021-12-23', '05:00:30', '05:00:45', 'Polyurie', 1),
(24, 10, 11, 12, '2021-12-24', '05:00:45', '06:00:00', 'Hématurie', 0),
(25, 13, 14, 15, '2021-12-25', '06:00:00', '06:00:15', 'Toux', 1),
(26, 16, 17, 18, '2021-12-26', '06:00:30', '06:00:45', 'Douleur thoracique', 0),
(27, 19, 20, 1, '2021-12-27', '06:00:45', '07:00:00', 'Apnée', 1),
(28, 2, 3, 4, '2021-12-28', '07:00:00', '07:00:15', 'Vomissements', 0),
(29, 5, 6, 7, '2021-12-29', '07:00:15', '07:00:30', 'Nausées', 1),
(30, 8, 9, 10, '2021-12-30', '07:00:30', '07:00:45', 'Douleur abdominale', 0),
(31, 11, 12, 13, '2021-12-31', '07:00:45', '08:00:00', 'Érythrose palmaire', 1),
(32, 14, 15, 16, '2022-01-01', '08:00:00', '08:00:15', 'Diarrhée', 0),
(33, 17, 18, 19, '2022-01-02', '08:00:15', '08:00:30', 'Tachycardie', 1),
(34, 20, 1, 2, '2022-01-03', '08:00:30', '08:00:45', 'Œdème', 0),
(35, 3, 4, 5, '2022-01-04', '08:00:45', '09:00:00', 'Bradycardie', 1),
(36, 6, 7, 8, '2022-01-05', '09:00:00', '09:00:15', 'Sueurs nocturnes', 0),
(37, 9, 10, 11, '2022-01-06', '09:00:15', '09:00:30', 'Fièvre', 1),
(38, 12, 13, 14, '2022-01-07', '09:00:30', '09:00:45', 'Asthénie', 0),
(39, 15, 16, 17, '2022-01-08', '09:00:45', '10:00:00', 'Anorexie', 1),
(40, 18, 19, 20, '2022-01-09', '10:00:00', '10:00:15', 'Amaigrissement', 0),
(41, 1, 2, 3, '2021-12-01', '00:00:15', '00:00:30', 'Dysphonie', 0),
(42, 4, 5, 6, '2021-12-02', '00:00:30', '00:00:45', 'Ulcération', 1),
(43, 7, 8, 9, '2021-12-03', '00:00:45', '01:00:00', 'Purpura', 0),
(44, 10, 11, 12, '2021-12-04', '01:00:00', '01:00:15', 'Surdité', 1),
(45, 13, 14, 15, '2021-12-05', '01:00:15', '01:00:30', 'Gynécomastie', 0),
(46, 16, 17, 18, '2021-12-06', '01:00:30', '01:00:45', 'Adénopathie', 1),
(47, 19, 20, 1, '2021-12-07', '01:00:45', '02:00:00', 'Exophtalmie', 0),
(48, 2, 3, 4, '2021-12-08', '02:00:00', '02:00:15', 'Aménorrhée', 1),
(49, 5, 6, 7, '2021-12-09', '02:00:15', '02:00:30', 'Boiterie', 0),
(50, 8, 9, 10, '2021-12-10', '02:00:30', '02:00:45', 'Goitre', 1),
(51, 11, 12, 13, '2021-12-11', '02:00:45', '03:00:00', 'Douleur articulaire', 0),
(52, 14, 15, 16, '2021-12-12', '03:00:00', '03:00:15', 'Cervicalgie', 1),
(53, 17, 18, 18, '2021-12-13', '03:00:15', '03:00:30', 'Myoclonie', 0),
(54, 20, 1, 2, '2021-12-14', '03:00:30', '03:00:45', 'Hallucinations', 1),
(55, 3, 4, 5, '2021-12-15', '03:00:45', '04:00:00', 'Amnésie', 0),
(56, 6, 7, 8, '2021-12-16', '04:00:00', '04:00:15', 'Asomatognosie', 1),
(57, 9, 10, 11, '2021-12-17', '04:00:15', '04:00:30', 'Insomnie', 0),
(58, 12, 13, 14, '2021-12-18', '04:00:30', '04:00:45', 'Céphalées', 1),
(59, 15, 16, 17, '2021-12-19', '04:00:45', '05:00:00', 'Stéréotypies', 0),
(60, 18, 19, 20, '2021-12-20', '05:00:00', '05:00:15', 'Négativisme', 1),
(61, 1, 2, 3, '2021-12-21', '05:00:15', '05:00:30', 'Anxiété', 0),
(62, 4, 5, 6, '2021-12-22', '05:00:30', '05:00:45', 'Idée suicidaire', 1),
(63, 7, 8, 9, '2021-12-23', '05:00:45', '06:00:00', 'Hématurie', 0),
(64, 10, 11, 12, '2021-12-24', '06:00:00', '06:00:15', 'Polyurie', 1),
(65, 13, 14, 15, '2021-12-25', '06:00:15', '06:00:30', 'Douleur thoracique', 0),
(66, 16, 17, 18, '2021-12-26', '06:00:30', '06:00:45', 'Toux', 1),
(67, 19, 20, 1, '2021-12-27', '06:00:45', '07:00:00', 'Vomissements', 0),
(68, 2, 3, 4, '2021-12-28', '07:00:00', '07:00:15', 'Apnée', 1),
(69, 5, 6, 7, '2021-12-29', '07:00:15', '07:00:30', 'Douleur abdominale', 0),
(70, 8, 9, 10, '2021-12-30', '07:00:30', '07:00:45', 'Nausées', 1),
(71, 11, 12, 13, '2021-12-31', '07:00:45', '08:00:00', 'Diarrhée', 0),
(72, 14, 15, 16, '2022-01-01', '08:00:00', '08:00:15', 'Érythrose palmaire', 1),
(73, 17, 18, 19, '2022-01-02', '08:00:15', '08:00:30', 'Œdème', 0),
(74, 20, 1, 2, '2022-01-03', '08:00:30', '08:00:45', 'Tachycardie', 1),
(75, 3, 4, 5, '2022-01-04', '08:00:45', '09:00:00', 'Sueurs nocturnes', 0),
(76, 6, 7, 8, '2022-01-05', '09:00:00', '09:00:15', 'Bradycardie', 1),
(77, 9, 10, 11, '2022-01-06', '09:00:15', '09:00:30', 'Asthénie', 0),
(78, 12, 13, 14, '2022-01-07', '09:00:30', '09:00:45', 'Fièvre', 1),
(79, 15, 16, 17, '2022-01-08', '09:00:45', '10:00:00', 'Amaigrissement', 0),
(80, 18, 19, 20, '2022-01-09', '10:00:00', '10:00:15', 'Anorexie', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `un_medecin_id` int(11) DEFAULT NULL,
  `un_assistant_id` int(11) DEFAULT NULL,
  `un_patient_id` int(11) DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `un_medecin_id`, `un_assistant_id`, `un_patient_id`, `email`, `roles`, `password`) VALUES
(1, NULL, NULL, NULL, 'compte1@gmal.com', '["ROLE_ADMIN"]', '$2y$13$HFfPhogCdCtrRR4GtNlch.ka8psca.mWuH56.S0Ka37lJuDoZBhPC'),
(2, NULL, NULL, 1, 'compte2@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(3, NULL, NULL, 2, 'compte3@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(4, NULL, NULL, 3, 'compte4@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(5, NULL, NULL, 4, 'compte5@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(6, NULL, NULL, 5, 'compte6@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(7, NULL, NULL, 6, 'compte7@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(8, NULL, NULL, 7, 'compte8@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(9, NULL, NULL, 8, 'compte9@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(10, NULL, NULL, 9, 'compte10@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(11, NULL, NULL, 10, 'compte11@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(12, NULL, NULL, 11, 'compte12@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(13, NULL, NULL, 12, 'compte13@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(14, NULL, NULL, 13, 'compte14@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(15, NULL, NULL, 14, 'compte15@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(16, NULL, NULL, 15, 'compte16@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(17, NULL, NULL, 16, 'compte17@gmail.com', '[]', '$2y$13$7uq3XxWas0o9UqT2AqtlaeX4uLntI3dY1ClVKljajVSLLG0YVFOCS'),
(18, NULL, NULL, 17, 'compte18@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(19, NULL, NULL, 18, 'compte19@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(20, NULL, NULL, 19, 'compte20@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(21, NULL, NULL, 20, 'compte21@gmail.com', '[]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(22, 1, NULL, NULL, 'compte22@gmal.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(23, 2, NULL, NULL, 'compte23@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(24, 3, NULL, NULL, 'compte24@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(25, 4, NULL, NULL, 'compte25@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(26, 5, NULL, NULL, 'compte26@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(27, 6, NULL, NULL, 'compte27@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(28, 7, NULL, NULL, 'compte28@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(29, 8, NULL, NULL, 'compte29@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(30, 9, NULL, NULL, 'compte30@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(31, 10, NULL, NULL, 'compte31@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(32, 11, NULL, NULL, 'compte32@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(33, 12, NULL, NULL, 'compte33@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(34, 13, NULL, NULL, 'compte34@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(35, 14, NULL, NULL, 'compte35@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(36, 15, NULL, NULL, 'compte36@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(37, 16, NULL, NULL, 'compte37@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(38, 17, NULL, NULL, 'compte38@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(39, 18, NULL, NULL, 'compte39@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(40, 19, NULL, NULL, 'compte40@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(41, 20, NULL, NULL, 'compte41@gmail.com', '["ROLE_MEDECIN"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(42, NULL, 1, NULL, 'compte42@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(43, NULL, 2, NULL, 'compte43@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(44, NULL, 3, NULL, 'compte44@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(45, NULL, 4, NULL, 'compte45@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(46, NULL, 5, NULL, 'compte46@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(47, NULL, 6, NULL, 'compte47@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(48, NULL, 7, NULL, 'compte48@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(49, NULL, 8, NULL, 'compte49@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(50, NULL, 9, NULL, 'compte50@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(51, NULL, 10, NULL, 'compte51@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(52, NULL, 11, NULL, 'compte52@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(53, NULL, 12, NULL, 'compte53@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(54, NULL, 13, NULL, 'compte54@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(55, NULL, 14, NULL, 'compte55@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(56, NULL, 15, NULL, 'compte56@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(57, NULL, 16, NULL, 'compte57@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(58, NULL, 17, NULL, 'compte58@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(59, NULL, 18, NULL, 'compte59@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(60, NULL, 19, NULL, 'compte60@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO'),
(61, NULL, 20, NULL, 'compte61@gmail.com', '["ROLE_ASSITANT"]', '$2y$13$yK0N1VTDMQS61xVReUmZHuQlpJjyueMq1VggYiZYqZiXBfZl0hnKO');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `assistant`
--
ALTER TABLE `assistant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `indisponibilite`
--
ALTER TABLE `indisponibilite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8717036F33FB9249` (`un_motif_id`),
  ADD KEY `IDX_8717036F65F36D13` (`un_medecin_id`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_10C31F8665F36D13` (`un_medecin_id`),
  ADD KEY `IDX_10C31F8610321EAD` (`un_assistant_id`),
  ADD KEY `IDX_10C31F86A89E5EE` (`un_patient_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_1D1C63B365F36D13` (`un_medecin_id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B310321EAD` (`un_assistant_id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3A89E5EE` (`un_patient_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `assistant`
--
ALTER TABLE `assistant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `indisponibilite`
--
ALTER TABLE `indisponibilite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `rdv`
--
ALTER TABLE `rdv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `indisponibilite`
--
ALTER TABLE `indisponibilite`
  ADD CONSTRAINT `FK_8717036F33FB9249` FOREIGN KEY (`un_motif_id`) REFERENCES `motif` (`id`),
  ADD CONSTRAINT `FK_8717036F65F36D13` FOREIGN KEY (`un_medecin_id`) REFERENCES `medecin` (`id`);

--
-- Contraintes pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `FK_10C31F8610321EAD` FOREIGN KEY (`un_assistant_id`) REFERENCES `assistant` (`id`),
  ADD CONSTRAINT `FK_10C31F8665F36D13` FOREIGN KEY (`un_medecin_id`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `FK_10C31F86A89E5EE` FOREIGN KEY (`un_patient_id`) REFERENCES `patient` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_1D1C63B310321EAD` FOREIGN KEY (`un_assistant_id`) REFERENCES `assistant` (`id`),
  ADD CONSTRAINT `FK_1D1C63B365F36D13` FOREIGN KEY (`un_medecin_id`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `FK_1D1C63B3A89E5EE` FOREIGN KEY (`un_patient_id`) REFERENCES `patient` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
