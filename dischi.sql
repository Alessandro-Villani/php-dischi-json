-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 16, 2023 at 03:38 PM
-- Server version: 5.7.24
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dischi`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'Bon Jovi'),
(2, 'Queen'),
(3, 'Sting'),
(4, 'Steve Gadd Band'),
(5, 'Iron Maiden'),
(6, 'Eric Clapton'),
(7, 'Deep Purple'),
(8, 'Metallica'),
(9, 'Dave Weckl'),
(10, 'Michael Jackson');

-- --------------------------------------------------------

--
-- Table structure for table `disks`
--

CREATE TABLE `disks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disks`
--

INSERT INTO `disks` (`id`, `genre_id`, `author_id`, `title`, `year`, `poster`) VALUES
(1, 1, 1, 'New Jersey', 1988, 'https://images-na.ssl-images-amazon.com/images/I/51sBr4IWDwL.jpg'),
(2, 2, 2, 'Live at Wembley 86', 1992, 'https://images-na.ssl-images-amazon.com/images/I/71g40mlbinL._SX355_.jpg'),
(3, 2, 3, 'Ten\'s Summoner\'s Tales', 1993, 'https://images-na.ssl-images-amazon.com/images/I/411BQR6BHRL.jpg'),
(4, 3, 4, 'Steve Gadd band', 2018, 'https://m.media-amazon.com/images/I/81UtLzBDoEL._SS500_.jpg'),
(5, 4, 4, 'Brave new World', 2000, 'https://upload.wikimedia.org/wikipedia/en/0/03/Iron_Maiden_-_Brave_New_World.jpg'),
(6, 1, 6, 'One more car, one more rider', 2002, 'https://images-na.ssl-images-amazon.com/images/I/81MDAIdh78L._SY355_.jpg'),
(7, 1, 7, 'Made in Japan', 1972, 'https://m.media-amazon.com/images/I/71SxPkY9fKL._AC_SL1300_.jpg'),
(8, 4, 8, 'And justice for all', 1988, 'https://m.media-amazon.com/images/I/81pchxSIApL._AC_SL1200_.jpg'),
(9, 4, 9, 'Hard wired', 1994, 'https://m.media-amazon.com/images/I/611TBSi2y8L._AC_SL1200_.jpg'),
(10, 2, 10, 'Bad', 1987, 'https://m.media-amazon.com/images/I/51-c9KBefDL._AC_.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(3, 'Jazz'),
(4, 'Metal'),
(2, 'Pop'),
(1, 'Rock');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disks`
--
ALTER TABLE `disks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `disks`
--
ALTER TABLE `disks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
