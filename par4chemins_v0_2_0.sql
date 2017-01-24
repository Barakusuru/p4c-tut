-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 24 Janvier 2017 à 20:37
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `par4chemins_v0.2.0`
--

-- --------------------------------------------------------

--
-- Structure de la table `choix`
--

CREATE TABLE `choix` (
  `id` int(11) NOT NULL,
  `contenu` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `choix`
--

INSERT INTO `choix` (`id`, `contenu`) VALUES
(1, 'Ouvrir la porte'),
(2, 'Tester la serrure'),
(3, 'S\'ecarter de la porte'),
(4, 'Forcer la serrure'),
(5, 'd20'),
(6, 'd6'),
(7, 'Revenir au début');

-- --------------------------------------------------------

--
-- Structure de la table `histoire`
--

CREATE TABLE `histoire` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) COLLATE utf8_bin NOT NULL,
  `texte` longtext COLLATE utf8_bin NOT NULL,
  `acte` int(11) NOT NULL,
  `chapitre` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_image` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `histoire`
--

INSERT INTO `histoire` (`id`, `titre`, `texte`, `acte`, `chapitre`, `type`, `id_image`) VALUES
(1, 'La porte', 'Une magnifique porte en bois, presque saturee de reliures, vous fait face.', 1, 1, 'story', 0),
(2, 'Un piÃ¨ge ?', 'Des le moment ou vous mettez la main sur la serrure, vous entendez un cliquetis.', 1, 1, 'trap', 0),
(3, 'Tiens, tiens...', 'Un mecanisme etrange semble etre lie a la serrure...', 1, 1, 'trap', 0),
(4, 'Une fleche empoisonnee...', '...vous passe juste devant les yeux !\r\nC\'etait juste.\r\nMais a present, bonne nouvelle : la porte s\'est ouverte.\r\n\r\nVous entrez donc dans un large couloir, eclaire a la lumiere des torches ;\r\nvous n\'en voyez pas encore le bout.\r\n\r\nSoudain, et sans meme vous demander votre avis, la porte se referme derriere vous.\r\n\r\nQue faire ?\r\n\r\n', 1, 1, 'story', 0),
(5, 'Vous etes mort(e) !', 'Desole, vous etes mort(e)...\r\n\r\nMais je vous laisse une deuxieme chance !', 1, 1, 'death', 0);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `lien` mediumtext COLLATE utf8_bin NOT NULL,
  `titre` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'alt'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_histoire` int(11) NOT NULL,
  `backup_histoire` longtext COLLATE utf8_bin NOT NULL,
  `backup_choix` longtext COLLATE utf8_bin NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `log`
--

INSERT INTO `log` (`id`, `id_utilisateur`, `id_histoire`, `backup_histoire`, `backup_choix`, `datetime`) VALUES
(36, 1, 1, '', '', '2017-01-24 20:34:18');

-- --------------------------------------------------------

--
-- Structure de la table `rel_histoire_choix`
--

CREATE TABLE `rel_histoire_choix` (
  `id` int(11) NOT NULL,
  `id_histoire` int(11) NOT NULL,
  `id_choix` int(11) NOT NULL,
  `id_suite` int(11) NOT NULL,
  `ordre` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `rel_histoire_choix`
--

INSERT INTO `rel_histoire_choix` (`id`, `id_histoire`, `id_choix`, `id_suite`, `ordre`) VALUES
(1, 1, 1, 2, 1),
(2, 1, 2, 3, 2),
(3, 2, 3, 4, 1),
(4, 2, 4, 5, 2),
(5, 3, 5, 5, 1),
(6, 3, 6, 4, 2),
(7, 5, 7, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `pseudo` varchar(50) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(50) COLLATE utf8_bin NOT NULL,
  `droits` tinyint(1) NOT NULL COMMENT '1 = admin ; 0 = player',
  `valide` tinyint(1) NOT NULL COMMENT '1 = oui ; 0 = non'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `pseudo`, `mdp`, `droits`, `valide`) VALUES
(1, '', 'florent', 'e5c2cae71380bddb70202343c24eeeaa', 0, 0),
(2, '', 'j', '363b122c528f54df4a0446b6bab05515', 0, 0),
(3, '', 'desis', '0cc175b9c0f1b6a831c399e269772661', 0, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `choix`
--
ALTER TABLE `choix`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `histoire`
--
ALTER TABLE `histoire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rel_histoire_choix`
--
ALTER TABLE `rel_histoire_choix`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `choix`
--
ALTER TABLE `choix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `histoire`
--
ALTER TABLE `histoire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT pour la table `rel_histoire_choix`
--
ALTER TABLE `rel_histoire_choix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
