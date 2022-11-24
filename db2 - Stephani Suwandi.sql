-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 07:26 AM
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
-- Database: `db2`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `proposed_day` varchar(100) NOT NULL,
  `proposed_time` time(6) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `phone` int(200) NOT NULL,
  `notes` text NOT NULL,
  `booking_at` text NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `first_name`, `last_name`, `proposed_day`, `proposed_time`, `starting_date`, `email`, `phone`, `notes`, `booking_at`) VALUES
(6, 'Stephani', 'Suwandi', 'Friday', '16:00:00.000000', '2022-11-20', 'stsuw@outlook.com', 890273738, 'Testing1', '2022-11-15 20:14:40'),
(8, 'Queenie', 'Zhu', 'Friday', '18:00:00.000000', '2022-11-30', 'queeniez@outlook.com', 2147483647, '', '2022-11-16 12:56:55'),
(9, 'Adriana', 'White', 'Monday', '00:00:00.000000', '2022-12-25', 'adriana.white@outlook.com', 12345671, 'Data1', '2022-11-16 13:01:53'),
(10, 'Stephani', 'Suwandi', 'Monday', '17:00:00.000000', '2023-01-01', 'stsuw@outlook.com', 890273738, 'Data2', '2022-11-17 18:31:19'),
(11, 'Stephani', 'Suwandi', 'Wednesday', '16:00:00.000000', '2023-01-15', 'stsuw@outlook.com', 2108127836, 'To change the slot next year - 2023', '2022-11-17 18:39:45'),
(12, 'Stephani', 'Suwandi', 'Tuesday', '16:00:00.000000', '2022-11-30', 'stsuw@outlook.com', 2108127836, 'Test1', '2022-11-17 18:41:29'),
(13, 'Stephani', 'Suwandi', 'Wednesday', '17:00:00.000000', '2022-11-17', 'stsuw@outlook.com', 890273738, 'Test1', '2022-11-17 18:50:33'),
(14, 'Esther', 'Low', 'Wednesday', '17:00:00.000000', '2022-11-20', 'esther.low@outlook.com', 890273738, 'Test3', '2022-11-17 19:15:08'),
(15, 'Adriana', 'White', 'Friday', '16:00:00.000000', '2023-03-18', 'adriana.white@outlook.com', 1234556, 'To move the class starting from March next year', '2022-11-17 19:57:29'),
(16, 'Amanda', 'White', 'Friday', '16:00:00.000000', '2022-12-24', 'aw@outlook.com', 12345, 'To change the lesson before Christmas', '2022-11-17 20:02:59'),
(17, 'Queenie', 'Zhu', 'Thursday', '18:00:00.000000', '2023-01-15', 'queeniez@outlook.com', 890273738, 'Test5', '2022-11-19 16:06:53'),
(18, 'Stephani', 'Suwandi', 'Wednesday', '17:00:00.000000', '2022-11-20', 'stsuw@outlook.com', 890273738, 'Test6', '2022-11-19 16:09:20'),
(19, 'Stephani', 'Suwandi', 'Thursday', '16:00:00.000000', '2022-11-26', 'stsuw@outlook.com', 890273738, 'Test7', '2022-11-19 16:11:14'),
(20, 'Stephani', 'Suwandi', 'Wednesday', '16:00:00.000000', '2022-11-23', 'stsuw@outlook.com', 89021, 'Test8', '2022-11-19 16:14:34'),
(21, 'Stephani', 'Suwandi', 'Friday', '16:00:00.000000', '2022-12-25', 'stsuw@outlook.com', 89021, 'Test9', '2022-11-19 16:30:37'),
(22, 'Stephani', 'Suwandi', 'Thursday', '16:00:00.000000', '2022-11-24', 'stsuw@outlook.com', 21081, 'Test10', '2022-11-19 16:33:18'),
(23, 'Stephani', 'Suwandi', 'Thursday', '16:00:00.000000', '2023-05-05', 'stsuw@outlook.com', 2147483647, 'Test10', '2022-11-19 16:44:10'),
(24, 'Stephani', 'Suwandi', 'Thursday', '17:00:00.000000', '2023-04-04', 'stsuw@outlook.com', 829019827, 'Changes for next year', '2022-11-19 16:45:36'),
(25, 'Stephani', 'Suwandi', 'Tuesday', '16:00:00.000000', '2023-03-03', 'stsuw@outlook.com', 890273738, 'Next March changes', '2022-11-19 16:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(100) NOT NULL,
  `lessons_enrolled` varchar(100) NOT NULL,
  `lesson_type` varchar(100) NOT NULL,
  `feedback` text NOT NULL,
  `consent` varchar(400) NOT NULL,
  `feedback_on` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `name`, `email`, `phone`, `lessons_enrolled`, `lesson_type`, `feedback`, `consent`, `feedback_on`) VALUES
(10, 'Queenie', 'test1@outlook.com', 0, 'Guitar Lesson', 'Group - Student Location', 'Test-Saturday', '', '2022-10-22 08:06:25.000000'),
(11, 'Doddy', 'stsuw@outlook.com', 0, 'Piano Lesson,Guitar Lesson', 'Group - Student Location', 'Test1', '', '2022-10-25 18:27:31.000000'),
(12, 'Queenie', 'stsuw@outlook.com', 0, 'Guitar Lesson,Music Theory Lesson,Audio Production Lesson', 'Group - Teacher Location', 'I\'m testing again today to see the format.\r\n123456789123456789', '', '2022-10-25 18:28:38.000000'),
(13, 'Stranger1', 'stranger@outlook.com', 12345657, 'n/a', 'n/a', 'Testing stranger\'s feedback with n/a option', '', '2022-11-17 19:49:01.000000'),
(14, 'Malikah', 'Dean', 27399333, 'Guitar Lesson', 'One on One Lesson - Student Location', 'Amazing experience so far. I\'ve made some obvious progress since couple of months ago of joining. Well done and thanks for your patience=)', '', '2022-11-19 17:03:30.000000'),
(15, 'Chika', 'Tash', 897755452, 'Guitar Lesson', 'One on One Lesson - Student Location', 'Binghu is really good at developing the customised lesson plan so far.\r\nBeen following the plan, I\'ve seen tremendous improvement in playing guitar', 'Yes, I do', '2022-11-21 21:03:13.000000');

-- --------------------------------------------------------

--
-- Table structure for table `getintouch`
--

CREATE TABLE `getintouch` (
  `message_id` int(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(100) NOT NULL,
  `interest` varchar(100) NOT NULL,
  `lesson_type` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `message_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `getintouch`
--

INSERT INTO `getintouch` (`message_id`, `first_name`, `last_name`, `email`, `phone`, `interest`, `lesson_type`, `message`, `message_at`) VALUES
(3, 'Stephani', 'Suwandi', 'stsuw@outlook.com', 2108127836, 'undefined', 'undefined', 'Test3', '2022-10-15 15:57:43'),
(4, 'Test4', 'Test4', 'test22@outlook.com', 0, 'undefined', 'undefined', 'Test4', '2022-10-15 16:00:13'),
(5, 'Test2', 'Test2', 'stsuw@outlook.com', 2108127836, 'undefined', 'undefined', 'Test2', '2022-10-19 20:02:52'),
(6, 'Stephani Test 5', 'Suwandi', 'stsuw@outlook.com', 2108127836, 'undefined', 'undefined', 'Stephani Test 5', '2022-10-19 20:42:05'),
(7, 'Stephani', 'Suwandi', 'test1@outlook.com', 2108127836, 'Guitar Lesson', 'Group - Student Location', 'Test25.10.2022', '2022-10-25 18:25:06'),
(10, 'Dina', 'Taylor', 'dina_taylor@opencountry.co.nz', 289031233, 'Piano Lesson', 'One on One Lesson - Student Location', 'Hi, I need more information and weekend availability for Piano lesson please.\r\nStudent is 25 years old. Based in Flagstaff Hamilton', '2022-11-19 17:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(255) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `lessons_enrolled` text NOT NULL,
  `lesson_type` text NOT NULL,
  `notes` text NOT NULL,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `dob`, `phone`, `lessons_enrolled`, `lesson_type`, `notes`, `generated_at`) VALUES
(3, 'Queenie', 'Zhu', 'queeniez@outlook.com', 'qz2015', '11-11-2015', 2108127836, 'Piano Lesson', 'One on One Lesson - Student Location', 'Advance', '2022-10-27 06:05:17'),
(4, 'Esther', 'Low', 'esther.low@outlook.com', 'el2015', '11-11-2015', 21267856, 'Piano Lesson', 'One on One Lesson - Teacher Location', 'beginner', '2022-10-27 06:07:11'),
(5, 'Adriana', 'White', 'adriana.white@outlook.com', 'aw2013', '05-10-2013', 22678906, 'Guitar Lesson', 'One on One Lesson - Student Location', 'beginner', '2022-10-27 06:10:11'),
(6, 'Stephani', 'Suwandi', 'stsuw@outlook.com', 'ss1988', '10-11-1988', 21489567, 'Music Theory Lesson', 'One on One Lesson - Teacher Location', 'Beginner', '2022-10-27 06:12:40'),
(7, 'Amanda', 'White', 'aw@outlook.com', 'aw2005', '11-11-2011', 210891287, 'Guitar Lesson', 'One on One Lesson - Teacher Location', 'New student - beginner', '2022-11-10 07:18:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `getintouch`
--
ALTER TABLE `getintouch`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `getintouch`
--
ALTER TABLE `getintouch`
  MODIFY `message_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
