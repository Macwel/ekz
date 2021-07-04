-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 05, 2021 at 02:42 AM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_staff` int(11) NOT NULL,
  `order_cost` int(11) NOT NULL,
  `order_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_typeProd` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_name`, `order_staff`, `order_cost`, `order_status`, `order_typeProd`) VALUES
(1, 'Имяя Фамилияя', 1, 4000, 'Поступил', 'Платье'),
(2, 'Имяя Фамилияя', 1, 4000, 'Поступил', 'Платье'),
(3, 'Петрович Огурцов', 1, 9000, 'Поступил', 'Куртка'),
(4, 'Петрович Огурцов', 1, 9000, 'Поступил', 'Куртка'),
(5, 'Петрович Огурцов', 1, 9000, 'Поступил', 'Куртка'),
(6, 'Петрович Огурцов', 1, 9000, 'Поступил', 'Куртка'),
(7, 'Петрович Огурцов', 2, 9000, 'Поступил', 'Куртка'),
(8, 'Петрович Огурцов', 1, 9000, 'Поступил', 'Куртка'),
(9, 'Петрович Огурцов', 2, 9000, 'Поступил', 'Куртка'),
(10, 'Петрович Огурцов', 1, 9000, 'Поступил', 'Куртка'),
(11, 'Петрович Огурцов', 2, 9000, 'Поступил', 'Куртка'),
(12, 'рварыв рывапрвап', 1, 824800, 'Поступил', 'пывпры'),
(13, 'впыва пывапы', 2, 8200, 'Поступил', 'авп'),
(14, 'впыва пывапы', 1, 8200, 'Поступил', 'авп');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_surname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `staff_surname`, `staff_count`) VALUES
(1, 'Иван', 'Иванович', 13),
(2, 'Илья', 'Мухамедов', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_staff` (`order_staff`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_staff`) REFERENCES `staff` (`staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
