-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 05, 2021 at 02:39 AM
-- Server version: 10.5.10-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orders`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `123`
-- (See below for the actual view)
--
CREATE TABLE `123` (
`order_id` int(11)
,`order_name` text
,`order_cost` int(11)
,`order_date` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_cost` int(11) NOT NULL,
  `order_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_name`, `order_cost`, `order_date`) VALUES
(1, 'Пуфик', 1100, '2021-07-01 22:06:52'),
(2, 'Пульт', 5000, '2021-06-11 22:06:52'),
(3, 'Телефон', 8900, '2021-06-30 22:07:28'),
(4, 'Кресло', 9000, '2021-05-01 22:07:28'),
(5, 'Кресло-качалка', 999999, '2021-07-15 22:07:28'),
(6, 'Кресло-качалка', 5000, '2021-05-02 07:00:00');

-- --------------------------------------------------------

--
-- Structure for view `123`
--
DROP TABLE IF EXISTS `123`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `123`  AS SELECT `order_id` AS `order_id`, `order_name` AS `order_name`, `order_cost` AS `order_cost`, `order_date` AS `order_date` FROM `orders` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
