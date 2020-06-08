-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 17, 2020 at 02:01 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `agentie`
--
CREATE DATABASE IF NOT EXISTS `agentie` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `agentie`;

-- --------------------------------------------------------

--
-- Table structure for table `anunturi`
--

CREATE TABLE IF NOT EXISTS `anunturi` (
  `anunt` int(10) NOT NULL AUTO_INCREMENT,
  `cod_operatie` int(10) unsigned NOT NULL,
  `proprietate` int(10) unsigned NOT NULL,
  `nume_proprietar` varchar(50) NOT NULL,
  `contact_proprietar` varchar(50) NOT NULL,
  `restrictii_contact` varchar(30) NOT NULL,
  PRIMARY KEY (`anunt`),
  KEY `proprietate` (`proprietate`),
  KEY `cod_operatie` (`cod_operatie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `anunturi`
--

INSERT INTO `anunturi` (`anunt`, `cod_operatie`, `proprietate`, `nume_proprietar`, `contact_proprietar`, `restrictii_contact`) VALUES
(1, 1, 2, 'Stefania Ionescu', 'stefaniaonescu@gmail.com', 'Luni-Vineri 10-18'),
(2, 2, 1, 'Mihai Costache', '0728163910', 'Luni, Marti, Sambata 10-21'),
(4, 1, 3, 'Maria Ichim', 'mariaichim@gmail.com', 'Luni-Vineri 16-20'),
(7, 2, 4, 'Cristian Popescu', '0717151937', 'Weekend 10-21'),
(8, 3, 8, 'Ion Popescu', 'ionpopescu@gmail.com', 'Marti-Sambata 10-20'),
(9, 1, 9, 'Vlad Serban', 'vladserban@gmail.com', 'Luni-Vineri 18-20'),
(13, 3, 13, 'Ion Ionescu', 'ion@gmail.com', 'Luni-Vineri 10-14');

-- --------------------------------------------------------

--
-- Table structure for table `membri`
--

CREATE TABLE IF NOT EXISTS `membri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `membri`
--

INSERT INTO `membri` (`id`, `first_name`, `last_name`, `email`, `username`, `password`, `role`) VALUES
(1, 'Ana', 'Popescu', 'anapopescu@gmail.com', 'AnaP', 'AnaP', 'admin'),
(2, 'Vlad', 'Marinescu', 'mvlad@gmail.com', 'VladM', 'VladM', 'user'),
(3, 'Andrei', 'Ionescu', 'aionescu@gmail.com', 'AndreiI', 'AndreiI', 'admin'),
(4, 'Bogdan', 'Petrescu', 'bogdanp@gmail.com', 'BogdanP', 'BogdanP', 'user'),
(5, 'Mihai', 'Popescu', 'mpopescu@gmail.com', 'MihaiP', 'MihaiP', 'user'),
(6, 'Marian', 'Avram', 'marianavram@gmail.com', 'MarianA', 'MarianA', 'user inregistrat'),
(7, 'Petru', 'Costache', 'petru98@gmail.com', 'PetruC', 'PetruC', 'user inregistrat'),
(8, 'Traian', 'Pop', 'traianpop@gmail.com', 'TraianP', 'TraianP', 'user'),
(9, 'Cristi', 'Petrescu', 'cristipetrescu@gmail.com', 'CristiP', 'CristiP', 'user inregistrat'),
(10, 'Alina', 'Pop', 'alinapop@gmail.com', 'AlinaP', 'AlinaP', 'user inregistrat'),
(11, 'Mihaela', 'Vlad', 'mihaelavlad@gmail.com', 'MihaelaV', 'MihaelaV', 'user inregistrat'),
(12, 'Laura', 'Marinescu', 'laura200@gmail.com', 'LauraM', 'Laura<', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `operatii`
--

CREATE TABLE IF NOT EXISTS `operatii` (
  `cod_operatie` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `denumire_operatie` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_operatie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `operatii`
--

INSERT INTO `operatii` (`cod_operatie`, `denumire_operatie`) VALUES
(1, 'inchiriere'),
(2, 'vanzare'),
(3, 'arenda');

-- --------------------------------------------------------

--
-- Table structure for table `proprietati`
--

CREATE TABLE IF NOT EXISTS `proprietati` (
  `proprietate` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tip_proprietate` varchar(30) NOT NULL,
  `localizare` varchar(45) NOT NULL,
  `suprafata` int(10) NOT NULL,
  PRIMARY KEY (`proprietate`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `proprietati`
--

INSERT INTO `proprietati` (`proprietate`, `tip_proprietate`, `localizare`, `suprafata`) VALUES
(1, 'apartament', 'Iasi', 89),
(2, 'casa', 'Cluj', 200),
(3, 'apartament', 'Iasi', 60),
(4, 'casa', 'Bucuresti', 301),
(8, 'teren', 'Iasi', 300),
(9, 'apartament', 'Bucuresti', 30),
(10, 'teren', 'Bucuresti', 490),
(11, 'casa', 'Cluj', 110),
(13, 'teren', 'Iasi', 250);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anunturi`
--
ALTER TABLE `anunturi`
  ADD CONSTRAINT `anunturi_ibfk_1` FOREIGN KEY (`proprietate`) REFERENCES `proprietati` (`proprietate`) ON DELETE CASCADE,
  ADD CONSTRAINT `anunturi_ibfk_2` FOREIGN KEY (`cod_operatie`) REFERENCES `operatii` (`cod_operatie`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
