-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2022 at 01:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trinfosoft_entertainment`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_branch` varchar(100) NOT NULL,
  `company_url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_branch`, `company_url`) VALUES
(1, 'Josh Technology ', 'B.Tech-CS, B.tech-EC/EE/CE', 'rohitsinghal.vercel.app/');

-- --------------------------------------------------------

--
-- Table structure for table `drive`
--

CREATE TABLE `drive` (
  `drive_id` int(11) NOT NULL,
  `drive_title` varchar(200) CHARACTER SET latin1 NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_position` varchar(100) CHARACTER SET latin1 NOT NULL,
  `job_profile` text CHARACTER SET latin1 NOT NULL,
  `dod` date NOT NULL,
  `salary` int(11) NOT NULL,
  `ssc_result` float NOT NULL,
  `hsc_result` float NOT NULL,
  `graduation_result` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drive`
--

INSERT INTO `drive` (`drive_id`, `drive_title`, `company_id`, `job_position`, `job_profile`, `dod`, `salary`, `ssc_result`, `hsc_result`, `graduation_result`) VALUES
(1, 'Fresher for Software Engineer', 1, 'Software Developer and Software Engineer', 'Software Developer and Software Engineer', '2022-09-01', 5000000, 50, 50, 50);

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_students`
--

CREATE TABLE `enrolled_students` (
  `user_id` int(11) NOT NULL,
  `drive_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_students`
--

INSERT INTO `enrolled_students` (`user_id`, `drive_id`) VALUES
(20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `mobile` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `ssc_marks` float NOT NULL,
  `hsc_marks` float NOT NULL,
  `graduation_discipline` varchar(100) NOT NULL,
  `graduation` varchar(100) NOT NULL,
  `graduation_marks` float DEFAULT NULL,
  `post_graduation` varchar(100) NOT NULL,
  `post_graduation_discipline` varchar(100) NOT NULL,
  `post_graduation_marks` float DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `uid` int(11) NOT NULL,
  `resume` varchar(100) NOT NULL,
  `profile_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`mobile`, `dob`, `ssc_marks`, `hsc_marks`, `graduation_discipline`, `graduation`, `graduation_marks`, `post_graduation`, `post_graduation_discipline`, `post_graduation_marks`, `gender`, `uid`, `resume`, `profile_image`) VALUES
('8630780574', '28/09/2022', 80, 80, 'yes', '80', 79.4, '', '', 0, 'Female', 20, 'resume_20.pdf', 'img_20.jpeg'),
('8630780574', '28/09/2022', 80, 80, 'yes', '80', 79.4, '', '', 0, 'Female', 20, 'resume_20.pdf', 'img_20.jpeg'),
('', '', 0, 0, '', '', NULL, '', '', NULL, '', 22, '', ''),
('', '', 0, 0, '', '', NULL, '', '', NULL, '', 23, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `date_of_registration` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`, `date_of_registration`) VALUES
(20, 'Tanu Singh Jadaun', 'tanusingh08052002@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2022-09-28 22:09:19'),
(21, 'Rohit Singhal', 'rohitsinghal0904@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2022-09-28 22:09:57'),
(22, 'Tanu Singh Jadaun', 'tanusingh08052002@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2022-09-28 22:11:44'),
(23, 'kunal', 'kunal@1234', 'fe638c41c68dc12bed8761af573a86fa', '2022-09-29 16:04:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `drive`
--
ALTER TABLE `drive`
  ADD PRIMARY KEY (`drive_id`),
  ADD KEY `fkdrive` (`company_id`);

--
-- Indexes for table `enrolled_students`
--
ALTER TABLE `enrolled_students`
  ADD KEY `fkuser_id` (`user_id`),
  ADD KEY `fkdrive_id` (`drive_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `drive`
--
ALTER TABLE `drive`
  MODIFY `drive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drive`
--
ALTER TABLE `drive`
  ADD CONSTRAINT `fkdrive` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `enrolled_students`
--
ALTER TABLE `enrolled_students`
  ADD CONSTRAINT `fkdrive_id` FOREIGN KEY (`drive_id`) REFERENCES `drive` (`drive_id`),
  ADD CONSTRAINT `fkuser_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
