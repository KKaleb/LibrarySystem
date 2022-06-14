-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 17, 2021 at 12:54 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(30) NOT NULL,
  `title` text NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `isbn` varchar(191) NOT NULL,
  `img_path` text DEFAULT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `description`, `isbn`, `img_path`, `date_updated`) VALUES
(2, 'Clean Code', 'Robert Cecil Martin', 'Sample Only', '10384482', 'assets/img/202009081548_book.jpg', '2021-12-16 22:08:17'),
(4, 'Test Book', 'Sample Authorn', 'kaljdsjk ajsd ', '34223843', '', '2021-12-16 22:08:21'),
(5, 'Code Complete', 'Steve McConnell', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '3r442204', '', '2021-12-16 22:08:28'),
(6, 'learning system', 'Andy Hunt ', 'Lorem Ipsum is', '949302984', '', '2021-12-16 22:08:32'),
(7, 'dsd', 'dsd', 'dsd', 'dsdd', NULL, '2021-12-16 22:22:26'),
(8, 'dsdd', 'dsd', 'sdsds', '2244', NULL, '2021-12-16 22:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_books`
--

CREATE TABLE `borrowed_books` (
  `id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `borrower_id` int(30) NOT NULL,
  `date_borrowed` date NOT NULL,
  `date_return` date NOT NULL,
  `book_number` varchar(50) NOT NULL,
  `date_received` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT ' 1 = returned',
  `user_id` int(30) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowed_books`
--

INSERT INTO `borrowed_books` (`id`, `book_id`, `borrower_id`, `date_borrowed`, `date_return`, `book_number`, `date_received`, `status`, `user_id`, `date_updated`) VALUES
(1, 2, 4, '2020-09-01', '2020-09-06', '1001', '2021-12-16', 1, 2, '2021-12-16 21:57:55'),
(3, 4, 1, '2020-09-09', '2020-09-12', '1002', NULL, 0, 1, '2020-09-09 15:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(30) NOT NULL,
  `student_id_no` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(15) NOT NULL,
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `student_id_no`, `name`, `address`, `contact`, `date_updated`) VALUES
(1, '2019-0111', 'Sample Borrower', 'asdh hghgh gh', '123123123', '2020-09-09 15:00:58'),
(4, '2020-0022', 'John Smith', 'California', '178554-54754-7', '2020-09-09 15:01:06'),
(5, '2020-0050', 'Claire Blake', 'Test', '8747808787', '2020-09-09 15:02:40'),
(6, '4', 'Caleb', 'Atlanta, US', '+1345', '2021-12-16 21:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT 1 COMMENT '1 = User',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `user_type`, `date_updated`) VALUES
(2, 'User', 'user', '12345678', NULL, 1, '2021-12-17 00:52:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
