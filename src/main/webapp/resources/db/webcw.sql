-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2019 at 05:01 PM
-- Server version: 5.7.21-log
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webcw`
--

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `completed` int(11) DEFAULT NULL,
  `projects_id` int(11) NOT NULL,
  `completionDate` datetime NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `name`, `completed`, `projects_id`, `completionDate`, `status_id`) VALUES
(7, 'Data base', 1, 15, '2019-12-11 00:00:00', 1),
(10, 'another milestone', 1, 17, '2019-12-21 00:00:00', 1),
(11, 'ghislain\'s milestone', 1, 17, '2019-12-22 00:00:00', 1),
(12, 'eli\'s milestone', 2, 17, '2019-12-15 00:00:00', 1),
(13, 'gjhjgyu', 0, 19, '2019-12-07 00:00:00', 1),
(16, 'Adding milestone', 1, 23, '2019-12-21 00:00:00', 1),
(17, 'finishing web dev group report', 1, 24, '2019-12-15 00:00:00', 1),
(18, 'Finish the individual report for web dev II', 0, 24, '2019-12-16 00:00:00', 1),
(19, 'Write AADP Exam paper', 0, 24, '2019-12-17 00:00:00', 1),
(20, 'Write Big Data Exam paper', 0, 24, '2019-12-19 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(145) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `status_id`, `description`, `user_id`) VALUES
(1, 'ticio victoriano', 1, 'ticio victorianoticio victorianoticio victorianoticio victorianoticio victoriano', 1),
(4, 'Eli', 1, 'EliEliEliEliEliEliEli', 1),
(10, 'web dev', 1, 'web dev', 7),
(11, 'WebDev2', 1, 'Coursework', 9),
(12, 'Big Data', 1, 'Stores large data', 10),
(13, 'big data', 1, 'big data module', 7),
(14, 'Programming one', 1, 'This is about programming using java', 12),
(16, 'Another module ', 1, 'Another module ', 12),
(17, 'System Programming', 1, 'This module investigates the knowledge and skills necessary to program multi-module application and systems programs using operating system and API libraries. ', 7);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `intendedDate` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `completed` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `modules_id` int(11) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `completionDate`, `intendedDate`, `user_id`, `completed`, `status_id`, `modules_id`, `description`) VALUES
(15, 'Scheduling Application 1', '2019-12-12 00:00:00', '2019-12-10 00:00:00', 9, 0, 1, 11, 'Our project work'),
(16, 'Education App', '2019-12-15 00:00:00', '2019-12-21 00:00:00', 9, 0, 1, 11, 'This is a new app'),
(17, 'adding a new project', '2019-12-20 00:00:00', '2019-12-15 00:00:00', 7, 0, 1, 10, 'There are some many other things to do'),
(19, 'vibe', '2019-12-22 00:00:00', '2019-12-07 00:00:00', 10, 1, 1, 12, 'tasty cyr'),
(21, 'bank ml model', '2019-12-20 00:00:00', '2019-12-18 00:00:00', 10, 0, 1, 12, 'bank ml model'),
(23, 'second another project', '2019-12-15 00:00:00', '2019-12-15 00:00:00', 7, 1, 1, 10, 'adfasdfs'),
(24, 'ghislain\'s project', '2019-12-29 00:00:00', '2019-12-22 00:00:00', 7, 0, 1, 13, 'This is the project for ghislain'),
(25, 'Web development II', '2019-12-20 00:00:00', '2019-12-17 00:00:00', 12, 0, 1, 14, 'Development a web app using java servlets'),
(26, 'another project', '2019-12-19 00:00:00', '2019-12-18 00:00:00', 12, 0, 1, 16, 'another project');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'deleted');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `remember` int(11) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `remember`, `email`) VALUES
(1, 'eli', 'eli', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'eli@gmail.com'),
(6, 'Victoriano', 'Victoriano', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'victoriano@gmail.com'),
(7, 'a', 'a', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'a@gmail.com'),
(8, 'b', 'b', '912ec803b2ce49e4a541068d495ab570', 1, 'b@gmail.com'),
(9, 'Ellen', 'Ellen', '81dc9bdb52d04dc20036dbd8313ed055', 1, 'esavude@gmail.com'),
(10, 'cyrose', 'cyrose', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'cyrosekyalo@gmail.com'),
(11, 'cyrose', 'cyrose', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'cyrosekyalo@gmail.com'),
(12, 'Allan', 'Allan', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'allan@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_milestones_projects1_idx` (`projects_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_modules_status1_idx` (`status_id`),
  ADD KEY `fk_modules_users1_idx` (`user_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_projects_users_idx` (`user_id`),
  ADD KEY `fk_projects_status1_idx` (`status_id`),
  ADD KEY `fk_projects_modules1_idx` (`modules_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
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
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `milestones`
--
ALTER TABLE `milestones`
  ADD CONSTRAINT `fk_milestones_projects1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `fk_modules_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_modules_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_projects_modules1` FOREIGN KEY (`modules_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_projects_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_projects_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
