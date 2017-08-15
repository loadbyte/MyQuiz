-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 15, 2017 at 08:51 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myquiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `ans_id` bigint(20) UNSIGNED NOT NULL,
  `ques_id` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`ans_id`, `ques_id`, `option_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 10),
(4, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `exam_name` varchar(500) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `exam_points` int(11) NOT NULL DEFAULT '1',
  `min_marks` double NOT NULL DEFAULT '1',
  `group_id` bigint(20) NOT NULL,
  `exam_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `exam_name`, `description`, `exam_points`, `min_marks`, `group_id`, `exam_ts`) VALUES
(1, 'test exam1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 1, 1, 1, '2017-08-15 18:46:00'),
(2, 'test exam2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 1, 1, 2, '2017-08-15 18:46:05'),
(3, 'test exam3', ' aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 1, 1, 1, '2017-08-15 18:46:10'),
(4, 'test exam4', 'consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis a', 1, 1, 1, '2017-08-15 18:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `exam_qa`
--

CREATE TABLE `exam_qa` (
  `ex_qa_id` bigint(20) UNSIGNED NOT NULL,
  `ex_tk_id` bigint(20) NOT NULL,
  `ques_id` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `score` double NOT NULL DEFAULT '0',
  `ex_qa_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_qa`
--

INSERT INTO `exam_qa` (`ex_qa_id`, `ex_tk_id`, `ques_id`, `option_id`, `score`, `ex_qa_ts`) VALUES
(1, 1, 1, 1, 1, '2015-08-13 05:46:57'),
(2, 1, 2, 2, 2, '2015-08-13 06:05:36'),
(3, 1, 4, 15, 1, '2015-08-13 10:00:25'),
(4, 2, 3, 11, 0, '2015-08-13 11:46:51'),
(5, 3, 4, 13, 0, '2015-08-14 02:05:46'),
(6, 3, 2, 2, 2, '2015-08-14 02:05:49'),
(7, 3, 1, 1, 1, '2015-08-14 02:05:52'),
(8, 4, 3, 9, 0, '2015-08-14 02:30:26'),
(9, 5, 4, 13, 0, '2015-08-14 02:31:26'),
(10, 5, 2, 6, 0, '2015-08-14 02:31:30'),
(11, 5, 1, 1, 1, '2015-08-14 02:31:33'),
(12, 7, 4, 13, 0, '2015-08-14 02:51:17'),
(13, 7, 2, 2, 2, '2015-08-14 02:51:19'),
(14, 16, 4, 13, 0, '2015-08-14 04:00:36'),
(15, 16, 2, 2, 2, '2015-08-14 04:00:39'),
(16, 16, 1, 1, 1, '2015-08-14 04:00:42'),
(17, 18, 4, 13, 0, '2015-08-14 04:26:29'),
(18, 18, 2, 2, 2, '2015-08-14 04:26:31'),
(19, 18, 1, 1, 1, '2015-08-14 04:26:34'),
(20, 37, 3, 9, 0, '2015-08-14 05:42:14'),
(21, 39, 4, 14, 0, '2015-08-14 08:31:04'),
(22, 39, 2, 7, 0, '2015-08-14 08:31:07'),
(23, 39, 1, 1, 1, '2015-08-14 08:31:10'),
(24, 50, 4, 13, 0, '2015-08-14 09:10:10'),
(25, 50, 2, 2, 2, '2015-08-14 09:10:12'),
(26, 50, 1, 1, 1, '2015-08-14 09:10:15'),
(27, 55, 3, 9, 0, '2015-08-14 12:46:16'),
(28, 58, 3, 9, 0, '2015-08-14 12:59:52'),
(29, 59, 2, 6, 0, '2015-08-14 13:16:51'),
(30, 59, 4, 13, 0, '2015-08-14 13:16:54'),
(31, 59, 1, 1, 1, '2015-08-14 13:16:56'),
(32, 60, 3, 11, 0, '2015-08-14 13:19:20'),
(33, 61, 3, 12, 0, '2015-08-14 13:19:52'),
(34, 63, 3, 11, 0, '2015-08-14 13:21:39'),
(35, 65, 3, 10, 1, '2015-08-14 13:30:29'),
(36, 66, 4, 13, 0, '2015-08-14 14:01:24'),
(37, 66, 2, 2, 2, '2015-08-14 14:01:32'),
(38, 66, 1, 1, 1, '2015-08-14 14:01:35'),
(39, 67, 2, 2, 2, '2015-08-14 16:47:06'),
(40, 67, 4, 14, 0, '2015-08-14 16:47:09'),
(41, 67, 1, 4, 0, '2015-08-14 16:47:12'),
(42, 73, 4, 15, 1, '2015-08-15 02:00:56'),
(43, 73, 2, 7, 0, '2015-08-15 02:00:59'),
(44, 73, 1, 4, 0, '2015-08-15 02:01:04'),
(45, 74, 2, 2, 2, '2015-08-15 02:11:58'),
(46, 74, 1, 4, 0, '2015-08-15 02:12:01'),
(47, 80, 3, 12, 0, '2017-08-15 18:29:46'),
(48, 82, 3, 10, 1, '2017-08-15 18:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `exam_taken`
--

CREATE TABLE `exam_taken` (
  `ex_tk_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `score` double NOT NULL DEFAULT '0',
  `completed` int(11) NOT NULL DEFAULT '0',
  `token` bigint(20) NOT NULL DEFAULT '0',
  `ex_tk_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_taken`
--

INSERT INTO `exam_taken` (`ex_tk_id`, `exam_id`, `user_id`, `score`, `completed`, `token`, `ex_tk_ts`) VALUES
(1, 1, 15, 4, 1, 0, '2015-08-13 04:21:44'),
(2, 2, 15, 0, 1, 0, '2015-08-13 10:00:55'),
(3, 1, 15, 3, 1, 0, '2015-08-14 02:05:42'),
(4, 2, 15, 0, 1, 0, '2015-08-14 02:30:23'),
(5, 1, 15, 1, 1, 0, '2015-08-14 02:31:21'),
(6, 2, 15, 0, 0, 0, '2015-08-14 02:51:12'),
(7, 1, 15, 0, 0, 0, '2015-08-14 02:51:14'),
(8, 1, 15, 0, 0, 0, '2015-08-14 03:08:16'),
(9, 3, 15, 0, 0, 0, '2015-08-14 03:49:21'),
(10, 2, 15, 0, 0, 0, '2015-08-14 03:49:24'),
(11, 1, 15, 0, 0, 0, '2015-08-14 03:49:26'),
(12, 1, 15, 0, 0, 0, '2015-08-14 03:49:38'),
(13, 2, 15, 0, 0, 0, '2015-08-14 03:51:02'),
(14, 1, 15, 0, 0, 0, '2015-08-14 03:58:58'),
(15, 1, 15, 0, 0, 0, '2015-08-14 03:59:37'),
(16, 1, 15, 0, 0, 0, '2015-08-14 04:00:09'),
(17, 1, 15, 0, 0, 0, '2015-08-14 04:00:28'),
(18, 1, 15, 3, 1, 0, '2015-08-14 04:26:25'),
(19, 1, 15, 0, 1, 0, '2015-08-14 04:31:25'),
(20, 1, 15, 0, 1, 0, '2015-08-14 04:32:08'),
(21, 1, 15, 0, 1, 0, '2015-08-14 04:35:58'),
(22, 1, 15, 0, 1, 0, '2015-08-14 04:41:28'),
(23, 1, 15, 0, 1, 0, '2015-08-14 04:47:01'),
(24, 1, 15, 0, 1, 0, '2015-08-14 04:47:35'),
(25, 1, 15, 0, 1, 0, '2015-08-14 04:48:06'),
(26, 1, 15, 0, 1, 0, '2015-08-14 04:49:46'),
(27, 1, 15, 0, 1, 0, '2015-08-14 04:50:03'),
(28, 1, 15, 0, 1, 0, '2015-08-14 04:50:17'),
(29, 1, 15, 0, 1, 0, '2015-08-14 05:07:57'),
(30, 1, 15, 0, 1, 0, '2015-08-14 05:09:24'),
(31, 1, 15, 0, 1, 0, '2015-08-14 05:10:27'),
(32, 2, 15, 0, 1, 0, '2015-08-14 05:19:45'),
(33, 1, 15, 0, 1, 0, '2015-08-14 05:20:02'),
(34, 1, 15, 0, 1, 0, '2015-08-14 05:20:43'),
(35, 1, 15, 0, 1, 0, '2015-08-14 05:22:53'),
(36, 1, 15, 0, 1, 0, '2015-08-14 05:24:00'),
(37, 2, 15, 0, 1, 0, '2015-08-14 05:42:10'),
(38, 1, 15, 0, 0, 0, '2015-08-14 06:37:32'),
(39, 1, 15, 1, 1, 0, '2015-08-14 08:31:00'),
(40, 3, 15, 0, 0, 0, '2015-08-14 08:45:23'),
(41, 1, 15, 0, 0, 0, '2015-08-14 09:04:29'),
(42, 1, 15, 0, 0, 0, '2015-08-14 09:04:43'),
(43, 1, 15, 0, 1, 0, '2015-08-14 09:06:11'),
(44, 2, 15, 0, 0, 0, '2015-08-14 09:06:24'),
(45, 3, 15, 0, 0, 0, '2015-08-14 09:07:19'),
(46, 4, 15, 0, 0, 0, '2015-08-14 09:08:26'),
(47, 1, 15, 0, 1, 0, '2015-08-14 09:08:49'),
(48, 1, 15, 0, 0, 0, '2015-08-14 09:09:12'),
(49, 2, 15, 0, 0, 0, '2015-08-14 09:09:36'),
(50, 1, 15, 3, 1, 0, '2015-08-14 09:10:03'),
(51, 2, 15, 0, 0, 0, '2015-08-14 09:12:18'),
(52, 2, 15, 0, 0, 0, '2015-08-14 12:44:42'),
(53, 2, 15, 0, 0, 0, '2015-08-14 12:44:49'),
(54, 2, 15, 0, 0, 0, '2015-08-14 12:45:23'),
(55, 2, 15, 0, 0, 0, '2015-08-14 12:46:11'),
(56, 1, 15, 0, 0, 0, '2015-08-14 12:56:13'),
(57, 1, 15, 0, 0, 0, '2015-08-14 12:57:44'),
(58, 2, 15, 0, 1, 0, '2015-08-14 12:59:49'),
(59, 1, 15, 1, 1, 0, '2015-08-14 13:16:48'),
(60, 2, 15, 0, 1, 0, '2015-08-14 13:19:16'),
(61, 2, 15, 0, 1, 0, '2015-08-14 13:19:44'),
(62, 2, 15, 0, 0, 0, '2015-08-14 13:21:03'),
(63, 2, 15, 0, 1, 0, '2015-08-14 13:21:28'),
(64, 1, 15, 0, 0, 0, '2015-08-14 13:23:33'),
(65, 2, 15, 1, 1, 0, '2015-08-14 13:30:26'),
(66, 1, 106, 3, 1, 0, '2015-08-14 14:01:21'),
(67, 1, 106, 2, 1, 0, '2015-08-14 16:46:58'),
(68, 2, 106, 0, 1, 0, '2015-08-14 16:56:52'),
(69, 1, 106, 0, 0, 0, '2015-08-14 16:57:33'),
(70, 2, 106, 0, 0, 0, '2015-08-15 01:59:44'),
(71, 3, 106, 0, 0, 0, '2015-08-15 01:59:52'),
(72, 2, 106, 0, 1, 0, '2015-08-15 02:00:10'),
(73, 1, 106, 1, 1, 0, '2015-08-15 02:00:52'),
(74, 1, 106, 2, 1, 0, '2015-08-15 02:11:54'),
(75, 2, 106, 0, 0, 0, '2015-08-15 02:34:26'),
(76, 2, 106, 0, 0, 0, '2015-08-15 02:45:34'),
(77, 1, 106, 0, 0, 0, '2015-08-15 03:31:26'),
(78, 4, 1, 0, 0, 0, '2017-08-15 18:28:56'),
(79, 2, 1, 0, 0, 0, '2017-08-15 18:29:01'),
(80, 2, 1, 0, 1, 0, '2017-08-15 18:29:41'),
(81, 3, 1, 0, 0, 0, '2017-08-15 18:33:04'),
(82, 2, 1, 1, 1, 0, '2017-08-15 18:33:11');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(500) NOT NULL,
  `group_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`, `group_ts`) VALUES
(1, 'Test group', '2015-08-12 12:59:28'),
(2, 'agile process', '2015-08-12 12:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_content` varchar(5000) NOT NULL,
  `ques_id` bigint(20) NOT NULL,
  `option_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_content`, `ques_id`, `option_ts`) VALUES
(1, 'jdeveloper', 1, '2015-08-12 13:04:46'),
(2, 'middle ware', 2, '2015-08-12 13:04:46'),
(3, 'php', 1, '2015-08-12 13:06:42'),
(4, 'inventory management application', 1, '2015-08-12 13:06:42'),
(5, 'test product', 1, '2015-08-12 13:06:42'),
(6, 'database', 2, '2015-08-12 13:06:42'),
(7, 'inventory', 2, '2015-08-12 13:07:11'),
(8, 'form-element', 2, '2015-08-12 13:07:11'),
(9, 'sdfssdfdsfds', 3, '2015-08-13 09:59:19'),
(10, 'sdfdsf', 3, '2015-08-13 09:59:19'),
(11, 'gdfgdfgd', 3, '2015-08-13 09:59:41'),
(12, 'sdfdsfdsf', 3, '2015-08-13 09:59:19'),
(13, 'fgfdgfdgd', 4, '2015-08-13 09:59:19'),
(14, 'sdfdsfdsf', 4, '2015-08-13 09:59:33'),
(15, 'tytutyutyuy', 4, '2015-08-13 09:59:33'),
(16, 'fdgdgdfg', 4, '2015-08-13 09:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `ques_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `difficulty` int(11) NOT NULL DEFAULT '1',
  `exam_id` bigint(20) NOT NULL,
  `weight` double NOT NULL DEFAULT '1',
  `question_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`ques_id`, `question`, `difficulty`, `exam_id`, `weight`, `question_ts`) VALUES
(1, 'what tool is used for wcp', 1, 1, 1, '2015-08-12 17:23:00'),
(2, ' in ..../product-manager/api/v1/config.php add to the DB_HOST value the TCP port the mysql server is set on (it may vary), e.g.: localhost:3306; if you use MAMP it might be localhost:8889, for instance. \nIf you use Linux - I do - check if all default values for the fields of table "products" are all set to "NULL"; I don''t know why but on phpmyadmin they were set to ''None'', on the other hand, from the terminal they were ok. I had some issues trying to add a new product. Eventually by re-setting the default values I made it. Cheers.', 1, 1, 2, '2015-08-13 05:57:27'),
(3, 'dfsdfdsfsdfssdf', 1, 2, 1, '2015-08-13 09:58:23'),
(4, 'sdfdsfsfsfdsf', 1, 1, 1, '2015-08-13 09:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `th_users`
--

CREATE TABLE `th_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `th_users`
--

INSERT INTO `th_users` (`user_id`, `gname`, `email`, `password`, `role`) VALUES
(1, 'testuser', 'user@mytest.com', 'dd14b9cc821618050366fb5ee5a55e82', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`ans_id`),
  ADD UNIQUE KEY `ans_id` (`ans_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`),
  ADD UNIQUE KEY `test_id` (`exam_id`);

--
-- Indexes for table `exam_qa`
--
ALTER TABLE `exam_qa`
  ADD PRIMARY KEY (`ex_qa_id`),
  ADD UNIQUE KEY `ex_qa_id` (`ex_qa_id`);

--
-- Indexes for table `exam_taken`
--
ALTER TABLE `exam_taken`
  ADD PRIMARY KEY (`ex_tk_id`),
  ADD UNIQUE KEY `ex_tk_id` (`ex_tk_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `group_id` (`group_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_id` (`option_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`ques_id`),
  ADD UNIQUE KEY `id` (`ques_id`);

--
-- Indexes for table `th_users`
--
ALTER TABLE `th_users`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `ans_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exam_qa`
--
ALTER TABLE `exam_qa`
  MODIFY `ex_qa_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `exam_taken`
--
ALTER TABLE `exam_taken`
  MODIFY `ex_tk_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `ques_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `th_users`
--
ALTER TABLE `th_users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
