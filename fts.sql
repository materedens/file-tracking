-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2023 at 08:47 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fts`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `deptid` int(15) NOT NULL,
  `deptName` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`deptid`, `deptName`, `creationDate`) VALUES
(4, 'FINANCE', '2023-03-10 10:37:26'),
(11, 'ICT', '2023-03-13 09:23:27'),
(12, 'REGISTRY', '2023-03-13 09:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fileNo` int(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `fileUrl` varchar(255) NOT NULL,
  `insertedBy` varchar(255) NOT NULL,
  `timeInserted` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `fileNo`, `description`, `department`, `fileUrl`, `insertedBy`, `timeInserted`) VALUES
(5, 'Test002', 384337515, 'Test002', 'ICT', '../uploadReport belinda.docx', '', '2023-03-14 10:11:52'),
(7, 'DOC', 292338317, 'files', 'Finance', 'upload/TEMPLATE.docx', '', '2023-03-14 10:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullName`, `userEmail`, `password`, `gender`, `department`, `regDate`, `updationDate`, `role`, `user_status`) VALUES
(4, 'Test', 'test@gmail.com', '0192023a7bbd73250516f069df18b500', '', '', '2023-03-09 11:56:44', NULL, 'super admin', 1),
(8, 'Test Account', 'account@gmail.com', 'c93ccd78b2076528346216b3b2f701e6', '', '', '2023-03-10 10:07:28', NULL, 'admin', 1),
(9, 'User Account', 'user@gmail.com', '0192023a7bbd73250516f069df18b500', '', '', '2023-03-10 10:07:58', NULL, 'user', 1),
(11, 'Registry', 'reg@gmail.com', '0192023a7bbd73250516f069df18b500', 'Female', 'registry', '2023-03-20 15:39:57', NULL, 'user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `logindate` varchar(100) DEFAULT NULL,
  `logintime` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ip` varbinary(16) DEFAULT NULL,
  `mac` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `logindate`, `logintime`, `user_id`, `username`, `email`, `ip`, `mac`) VALUES
(24, '2023/03/14', '10:35:47am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(25, '2023/03/14', '10:37:24am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(26, '2023/03/14', '10:38:56am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(27, '2023/03/14', '10:41:45am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(28, '2023/03/14', '10:45:08am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(29, '2023/03/14', '10:47:00am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(30, '2023/03/14', '10:53:28am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(31, '2023/03/14', '10:53:49am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(32, '2023/03/14', '10:57:23am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(33, '2023/03/14', '10:58:47am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(34, '2023/03/14', '11:07:19am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(35, '2023/03/14', '11:07:45am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(36, '2023/03/14', '01:25:08pm', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(37, '2023/03/14', '01:44:54pm', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(38, '2023/03/14', '01:48:39pm', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(39, '2023/03/14', '01:53:44pm', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(40, '2023/03/18', '01:52:49pm', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(41, '2023/03/20', '05:38:55pm', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(42, '2023/03/21', '09:49:58am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(43, '2023/03/21', '10:30:40am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35),
(44, '2023/03/21', '10:44:47am', 0, '', '', 0x3a3a31, 0x33362d36462d32342d31422d43372d35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`deptid`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `deptid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
