-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 13. Nov 2021 um 13:20
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
-- Tabellenstruktur für Tabelle `webAttributs`
--

CREATE TABLE `webAttributs` (
  `id` smallint(20) UNSIGNED NOT NULL,
  `attribut` varchar(16) NOT NULL,
  `value` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `webAttributs`
--

INSERT INTO `webAttributs` (`id`, `attribut`, `value`) VALUES
(1, 'bgcolor', '#204a87'),
(2, 'menuBgColor', '#5c3566'),
(3, 'fontSizeMenu', '19px'),
(4, 'fontColor', '#76e8ab'),
(5, 'fontFamily', 'Brush Script MT, cursive'),
(6, 'fontSizeHeader', '55px'),
(7, 'menuWidth', '256px'),
(8, 'headerHight', '155px'),
(9, 'logoPath', 'res/logo.svg'),
(10, 'logoWidth', '299px'),
(11, 'logoHeight', '120px');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `webAttributs`
--
ALTER TABLE `webAttributs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `webAttributs`
--
ALTER TABLE `webAttributs`
  MODIFY `id` smallint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
