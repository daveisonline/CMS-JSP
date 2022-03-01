-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 22. Nov 2021 um 22:40
-- Server-Version: 10.3.31-MariaDB-0ubuntu0.20.04.1
-- PHP-Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `webdata`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menuData`
--

CREATE TABLE `menuData` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `stelle` smallint(6) NOT NULL,
  `link` varchar(200) NOT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path2` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bgc` varchar(16) NOT NULL,
  `isPublished` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `menuData`
--

INSERT INTO `menuData` (`id`, `stelle`, `link`, `path`, `path2`, `bgc`, `isPublished`) VALUES
(615, 3, 'res/pages/Dokumentation/Dokumentation.pdf', 'Dokumentation', 'res/pages/Dokumentation', '#87aab8', 0),
(620, 2, 'res/pages/PageHtml/testSeite.html', 'Startseite', 'res/pages/PageHtml', '#7ef3b8', 1),
(622, 1, 'res/pages/Bearbeitung/Bearbeitung.html', 'Bearbetung', 'res/pages/Bearbeitung', '#87aab8', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `menuData`
--
ALTER TABLE `menuData`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `menuData`
--
ALTER TABLE `menuData`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=623;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
