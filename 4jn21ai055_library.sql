-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 26, 2023 at 05:32 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4jn21ai055_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `bookid` int NOT NULL,
  `title` text NOT NULL,
  `pub_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pub_year` int NOT NULL,
  PRIMARY KEY (`bookid`),
  KEY `pub_name` (`pub_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookid`, `title`, `pub_name`, `pub_year`) VALUES
(1, 'Web Programming', 'PHI', 2001),
(2, 'DBMS with SQL', 'PHI', 2002),
(3, 'SQL Made Easy', 'THM', 2001),
(4, 'VHDL Programming', 'PHI', 2003),
(5, 'Computer Networks and Security', 'DMH', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
CREATE TABLE IF NOT EXISTS `book_authors` (
  `bookid` int NOT NULL,
  `author_name` varchar(100) NOT NULL,
  PRIMARY KEY (`bookid`,`author_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`bookid`, `author_name`) VALUES
(1, 'Raman Lamba'),
(2, 'Elmasri'),
(2, 'Navathe'),
(3, 'Padhmashri'),
(4, 'Harris'),
(5, 'Lakhan');

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

DROP TABLE IF EXISTS `book_copies`;
CREATE TABLE IF NOT EXISTS `book_copies` (
  `bookid` int NOT NULL,
  `programme_id` int NOT NULL,
  `no_of_copies` int NOT NULL,
  PRIMARY KEY (`bookid`,`programme_id`),
  KEY `programme_id` (`programme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`bookid`, `programme_id`, `no_of_copies`) VALUES
(1, 1, 10),
(1, 2, 6),
(2, 3, 8),
(3, 1, 9),
(5, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

DROP TABLE IF EXISTS `book_lending`;
CREATE TABLE IF NOT EXISTS `book_lending` (
  `bookid` int NOT NULL,
  `programme_id` int NOT NULL,
  `card_no` int NOT NULL,
  `date_out` date NOT NULL,
  `date_due` date NOT NULL,
  PRIMARY KEY (`bookid`,`programme_id`,`card_no`,`date_out`),
  KEY `programme_id` (`programme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`bookid`, `programme_id`, `card_no`, `date_out`, `date_due`) VALUES
(1, 1, 1, '2017-05-07', '2017-05-15'),
(1, 3, 1, '2017-02-07', '2017-02-15'),
(2, 2, 1, '2017-06-07', '2017-06-15'),
(3, 1, 2, '2017-03-07', '2017-03-22'),
(3, 2, 2, '2017-07-07', '2017-07-22'),
(3, 3, 1, '2017-06-16', '2017-06-25'),
(3, 3, 2, '2017-02-16', '2017-02-25');

-- --------------------------------------------------------

--
-- Table structure for table `library_programme`
--

DROP TABLE IF EXISTS `library_programme`;
CREATE TABLE IF NOT EXISTS `library_programme` (
  `programme_id` int NOT NULL,
  `programme_name` text NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`programme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `library_programme`
--

INSERT INTO `library_programme` (`programme_id`, `programme_name`, `address`) VALUES
(1, 'CSE', 'CS BLOCK'),
(2, 'ISE', 'ISE BLOCK'),
(3, 'AIML', 'LIBRARY BLOCK'),
(4, 'ECE', 'EC BLOCK'),
(5, 'TCE', 'EC BLOCK');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`name`, `address`, `phone`) VALUES
('DMH', 'Dharwad', 9900923001),
('EEE', 'Bengaluru', 9900923002),
('PHI', 'Mysuru', 9900923003),
('Sapna', 'Bengaluru', 9900923004),
('THM', 'Bengaluru', 9900923005);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`pub_name`) REFERENCES `publisher` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `library_programme` (`programme_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `library_programme` (`programme_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
