-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 01, 2026 at 07:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ethereal_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `Department_Table`
--

CREATE TABLE `Department_Table` (
  `id` bigint(20) NOT NULL,
  `instituition_id` bigint(20) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `faculty_name` varchar(255) NOT NULL,
  `Hod_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Department_Table`
--

INSERT INTO `Department_Table` (`id`, `instituition_id`, `department_name`, `faculty_name`, `Hod_name`) VALUES
(1, 1, 'nnnnnnnn', 'Science', 'kjjjjjjjjjjj'),
(2, 1, 'nnnnnn', 'Science', 'nnnnnnnnn'),
(3, 1, 'omoh', 'Social Sciences', 'gg'),
(4, 1, 'nice', 'Social Sciences', 'yeah'),
(5, 1, 'dd', 'Engineering', 'ee'),
(6, 4, 'my bby dept', 'Science', 'My bby ');

-- --------------------------------------------------------

--
-- Table structure for table `Instituition_Table`
--

CREATE TABLE `Instituition_Table` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `CAC_Image` varchar(255) DEFAULT NULL,
  `Certificte` enum('HND','BSC','OND','ND','NID','BTECH') NOT NULL DEFAULT 'BSC',
  `Departments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Contact_Adress` varchar(255) NOT NULL,
  `isVerified` tinyint(1) DEFAULT 0,
  `Profile_Img` varchar(255) DEFAULT NULL,
  `Images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Images`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Instituition_Table`
--

INSERT INTO `Instituition_Table` (`id`, `Name`, `Mail`, `password`, `Location`, `CAC_Image`, `Certificte`, `Departments`, `Contact_Adress`, `isVerified`, `Profile_Img`, `Images`) VALUES
(1, 'sqi college of ICT', 'sqi@edu.ng', 'Omoh', 'ogbomosho', 'Tilux', 'OND', NULL, '07030916180', 0, NULL, NULL),
(3, 'fff', 'rrr@gmail.com', 'omoh', 'n ', 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1782331943/uqcdigcwyxzm7nwdwk57.jpg', 'BSC', NULL, '07030916180', 0, 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1782331941/raoiy3dxjsyitj8hlnxj.jpg', NULL),
(4, 'victorcolege', 'taiwoaroma2234@gmail.com', 'Victor', 'ogbo lag', 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785258452/caphzwczaqsphkbjedga.svg', 'HND', NULL, '0703971734646', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Leave_Requests_Table`
--

CREATE TABLE `Leave_Requests_Table` (
  `id` int(11) NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `org_supervisor_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Leave_Requests_Table`
--

INSERT INTO `Leave_Requests_Table` (`id`, `student_id`, `org_supervisor_id`, `start_date`, `end_date`, `reason`, `status`, `created_at`) VALUES
(1, 2, 3, '2026-07-29', '2026-07-22', 'holiday', 'approved', '2026-07-27 22:55:32'),
(2, 6, 5, '2026-07-31', '2026-07-31', 'HOLIDAY', 'approved', '2026-07-28 17:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `Logbook_Table`
--

CREATE TABLE `Logbook_Table` (
  `id` int(11) NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `week_number` int(11) NOT NULL,
  `activity_description` text NOT NULL,
  `image_attachment` varchar(255) DEFAULT NULL,
  `org_supervisor_signed` tinyint(1) DEFAULT 0,
  `org_supervisor_comment` text DEFAULT NULL,
  `org_supervisor_rating` int(11) DEFAULT NULL,
  `school_supervisor_grade` varchar(5) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Logbook_Table`
--

INSERT INTO `Logbook_Table` (`id`, `student_id`, `date`, `week_number`, `activity_description`, `image_attachment`, `org_supervisor_signed`, `org_supervisor_comment`, `org_supervisor_rating`, `school_supervisor_grade`, `created_at`) VALUES
(1, 2, '2026-07-26', 1, 'kkkkkkkkkkkkkkk', 'llllllll', 1, 'lllllllllllllllllllllllllllllll', NULL, NULL, '2026-07-26 04:51:28'),
(2, 2, '2026-07-26', 1, 'fffffffffff', NULL, 1, 'Not bad', 4, NULL, '2026-07-26 05:01:36'),
(3, 2, '2026-07-28', 1, 'bbbbbbbbbbbbbbb', NULL, 0, NULL, NULL, NULL, '2026-07-28 02:54:59'),
(4, 6, '2026-07-28', 1, 'NJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ', 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785260712/kvesuycczrmiz7oiryam.png', 1, 'beautiful', 4, NULL, '2026-07-28 17:45:13'),
(5, 6, '2026-07-30', 1, 'LEAVE: HOLIDAY', NULL, 1, 'Approved Leave', 5, NULL, '2026-07-28 17:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `Organization_Supervisor`
--

CREATE TABLE `Organization_Supervisor` (
  `id` bigint(11) NOT NULL,
  `Organization_Id` bigint(20) NOT NULL,
  `Organization_Mail` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `Contact_Adress` varchar(255) DEFAULT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `Email_Address` varchar(255) NOT NULL,
  `Profile_Img` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT 5,
  `focus_areas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Organization_Supervisor`
--

INSERT INTO `Organization_Supervisor` (`id`, `Organization_Id`, `Organization_Mail`, `department`, `Contact_Adress`, `Full_Name`, `Email_Address`, `Profile_Img`, `password`, `capacity`, `focus_areas`) VALUES
(1, 1, 'omoh@edu.ng', NULL, NULL, 'gbajabi amila', 'amila@gmail.com', NULL, NULL, 5, NULL),
(2, 2, 'tilux001@gmail.com', NULL, 'dddddddddddd', 'Adekola Israel', 'israel@gmail.com', 'kkk', 'Adekola', 5, NULL),
(3, 2, 'tilux001@gmail.com', NULL, 'ede', 'Mrs Esther', 'chizaramesther298@gmail.com', 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785190426/aujdiwbwp9az7chrbhhb.png', 'Irene@19', 5, NULL),
(4, 3, 'israeladekola8@gmail.com', NULL, 'eeee', 'Mr Tilux', 'tilux001@gmail.com', 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785195113/uh3izuejqmlbe6tbpi9q.svg', 'Adekola', 5, NULL),
(5, 5, 'obiasoguvictor687@gmail.com', 'Engineering', 'YYYYYYYYYY', 'Eng Tilux', 'obiasoguchidera10@gmail.com', NULL, 'CHIDERA', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Organization_Table`
--

CREATE TABLE `Organization_Table` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `CAC_Image` varchar(255) NOT NULL,
  `Email_Address` varchar(255) NOT NULL,
  `Contact_Address` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `isVerified` tinyint(1) DEFAULT 0,
  `profileImg` varchar(255) DEFAULT NULL,
  `Images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Images`)),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Organization_Table`
--

INSERT INTO `Organization_Table` (`id`, `Name`, `CAC_Image`, `Email_Address`, `Contact_Address`, `Location`, `isVerified`, `profileImg`, `Images`, `password`) VALUES
(1, 'MainStreet', 'yoo', 'mainstreet@gmail.com', '09044477755', 'lagos', 0, NULL, NULL, 'mainstreetpassword'),
(2, 'Tilux', 'dddddddddddddd', 'tilux001@gmail.com', 'no 36, abraham adesanya estate, ajah, lekki, lagos', 'Lagos', 0, NULL, NULL, 'jfjfjf'),
(3, 'Ethereal Company', 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785191341/lm4xvlxcpavugv82akrp.jpg', 'israeladekola8@gmail.com', 'ddd', 'ede', 0, NULL, NULL, 'Adekola'),
(5, 'My love company', 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785260168/aprq50druxek1bzfm3s7.jpg', 'obiasoguvictor687@gmail.com', 'lagos vi', 'lagos', 0, NULL, NULL, 'MR Victor');

-- --------------------------------------------------------

--
-- Table structure for table `OTP_Verification_Table`
--

CREATE TABLE `OTP_Verification_Table` (
  `id` int(11) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `otp_code` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NOT NULL DEFAULT (current_timestamp() + interval 15 minute)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Placement_Request_Table`
--

CREATE TABLE `Placement_Request_Table` (
  `id` int(11) NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `itf_form_url` varchar(255) DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `response_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Placement_Request_Table`
--

INSERT INTO `Placement_Request_Table` (`id`, `student_id`, `organization_id`, `status`, `itf_form_url`, `request_date`, `response_date`) VALUES
(3, 2, 2, 'approved', NULL, '2026-07-27 22:24:04', '2026-07-27 22:24:27'),
(4, 3, 3, 'approved', NULL, '2026-07-27 23:29:08', '2026-07-27 23:29:30'),
(5, 6, 5, 'approved', NULL, '2026-07-28 17:36:56', '2026-07-28 17:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `School_Supervisor`
--

CREATE TABLE `School_Supervisor` (
  `id` bigint(11) NOT NULL,
  `Instituition_Id` bigint(20) NOT NULL,
  `Contact_Adress` varchar(255) DEFAULT NULL,
  `department` varchar(255) NOT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `Email_Address` varchar(255) NOT NULL,
  `Profile_Img` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT 12,
  `focus_areas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `School_Supervisor`
--

INSERT INTO `School_Supervisor` (`id`, `Instituition_Id`, `Contact_Adress`, `department`, `Full_Name`, `Email_Address`, `Profile_Img`, `password`, `capacity`, `focus_areas`) VALUES
(1, 1, 'eeeeeeeee', '', 'Alagbe Femi', 'femi@gmail.com', '', 'Adekola', 12, NULL),
(2, 1, NULL, 'omoh', 'mr amos', 'israeladekola8@gmail.com', NULL, NULL, 12, NULL),
(3, 4, 'dddddddddddd', 'my bby dept', 'mary', 'oyegbamimary5@gmail.com', 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785259540/ys7cehvl0vsbjv7ksywv.png', 'Adekola', 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Student_Evaluation_Table`
--

CREATE TABLE `Student_Evaluation_Table` (
  `id` int(11) NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `org_supervisor_id` bigint(20) NOT NULL,
  `attendance_score` varchar(5) NOT NULL,
  `attitude_score` varchar(5) NOT NULL,
  `work_quality_score` varchar(5) NOT NULL,
  `independence_score` varchar(5) NOT NULL,
  `professionalism_score` varchar(5) NOT NULL,
  `communication_score` varchar(5) NOT NULL,
  `leadership_score` varchar(5) NOT NULL,
  `total_score` int(11) NOT NULL,
  `final_remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Student_Evaluation_Table`
--

INSERT INTO `Student_Evaluation_Table` (`id`, `student_id`, `org_supervisor_id`, `attendance_score`, `attitude_score`, `work_quality_score`, `independence_score`, `professionalism_score`, `communication_score`, `leadership_score`, `total_score`, `final_remarks`, `created_at`) VALUES
(1, 6, 5, 'A', 'A', 'A', 'A', 'A', 'A', 'A', 35, 'GGGGGGGGGGGGGG', '2026-07-28 17:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `Student_Table`
--

CREATE TABLE `Student_Table` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `Instituition_Id` bigint(20) NOT NULL,
  `School_Supervisor_Id` bigint(20) NOT NULL,
  `Organization_Supervisor_Id` bigint(20) DEFAULT NULL,
  `Organization_Id` bigint(20) DEFAULT NULL,
  `email_address` varchar(255) NOT NULL,
  `Matriculation_No` varchar(255) NOT NULL,
  `cgpa` decimal(3,2) DEFAULT NULL,
  `focus_preferences` varchar(255) DEFAULT NULL,
  `location_preference` varchar(255) DEFAULT NULL,
  `Profile_Img` varchar(255) DEFAULT NULL,
  `department` varchar(255) NOT NULL,
  `Instituition_Mail` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Start_Date` varchar(50) NOT NULL,
  `End_Date` varchar(50) NOT NULL,
  `Contact_Adress` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `acceptance_letter_url` varchar(255) DEFAULT NULL,
  `itf_form8_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Student_Table`
--

INSERT INTO `Student_Table` (`id`, `Full_Name`, `Instituition_Id`, `School_Supervisor_Id`, `Organization_Supervisor_Id`, `Organization_Id`, `email_address`, `Matriculation_No`, `cgpa`, `focus_preferences`, `location_preference`, `Profile_Img`, `department`, `Instituition_Mail`, `password`, `Start_Date`, `End_Date`, `Contact_Adress`, `bank_name`, `account_number`, `account_name`, `acceptance_letter_url`, `itf_form8_url`) VALUES
(2, 'TiluxEpoxy', 1, 1, 3, 2, 'tilux001@gmail.com', 'jjjj', NULL, NULL, NULL, NULL, 'nnnnnnnn', 'sqi@edu.ng', 'Adekola', '2026-07-23', '2026-07-30', 'ddd', NULL, NULL, NULL, NULL, 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785193426/leoymccbrszh9drkde8j.pdf'),
(3, 'Obiasogu Esther', 1, 2, 4, 3, 'adekolaisrael03@gmail.com', '241299', NULL, NULL, NULL, NULL, 'omoh', 'sqi@edu.ng', 'Adekola', '2026-07-06', '2026-07-27', 'ede', NULL, NULL, NULL, NULL, NULL),
(5, 'bnnnnn', 1, 1, NULL, NULL, 'chizaramesther298@gmail.com', 'nnnnnnnnn', NULL, NULL, NULL, NULL, 'nnnnnnnn', 'sqi@edu.ng', 'Adekola', '2026-07-16', '2026-07-31', 'ede', NULL, NULL, NULL, NULL, NULL),
(6, 'My love', 4, 3, 5, 5, 'obiasogue25@gmail.com', '241299', NULL, NULL, NULL, NULL, 'my bby dept', 'taiwoaroma2234@gmail.com', 'Adekola', '2026-07-28', '2026-09-30', 'ede', 'Opay', '704030033', 'Adekola Israel', NULL, 'https://res.cloudinary.com/dyyv2kv1x/image/upload/v1785259908/fbsfhytzhqnphnhqh25x.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `SuperAdmin_Table`
--

CREATE TABLE `SuperAdmin_Table` (
  `id` int(11) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SuperAdmin_Table`
--

INSERT INTO `SuperAdmin_Table` (`id`, `email_address`, `password`, `created_at`) VALUES
(1, 'israeladekola8@gmail.com', 'Adekola@Israel2020', '2026-07-27 23:45:22'),
(2, 'chizaramesther298@gmail.com', 'Irene@19', '2026-07-27 23:45:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Department_Table`
--
ALTER TABLE `Department_Table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department to instituition` (`instituition_id`);

--
-- Indexes for table `Instituition_Table`
--
ALTER TABLE `Instituition_Table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `instituition_table_mail_unique` (`Mail`);

--
-- Indexes for table `Leave_Requests_Table`
--
ALTER TABLE `Leave_Requests_Table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `Logbook_Table`
--
ALTER TABLE `Logbook_Table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `Organization_Supervisor`
--
ALTER TABLE `Organization_Supervisor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Organization_Supervisor_email_address_unique` (`Email_Address`),
  ADD KEY `organization id to supervisor` (`Organization_Id`);

--
-- Indexes for table `Organization_Table`
--
ALTER TABLE `Organization_Table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_table_email_address_unique` (`Email_Address`);

--
-- Indexes for table `OTP_Verification_Table`
--
ALTER TABLE `OTP_Verification_Table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_address` (`email_address`);

--
-- Indexes for table `Placement_Request_Table`
--
ALTER TABLE `Placement_Request_Table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `School_Supervisor`
--
ALTER TABLE `School_Supervisor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_supervisor_email_address_unique` (`Email_Address`),
  ADD KEY `supervisor_to_school` (`Instituition_Id`);

--
-- Indexes for table `Student_Evaluation_Table`
--
ALTER TABLE `Student_Evaluation_Table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `Student_Table`
--
ALTER TABLE `Student_Table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_table_email_address_unique` (`email_address`),
  ADD KEY `student_to_school` (`Instituition_Id`),
  ADD KEY `student_to_school_supervisor` (`School_Supervisor_Id`),
  ADD KEY `student_to_organization` (`Organization_Id`),
  ADD KEY `student_to_organization_supervisor` (`Organization_Supervisor_Id`);

--
-- Indexes for table `SuperAdmin_Table`
--
ALTER TABLE `SuperAdmin_Table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_address` (`email_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Department_Table`
--
ALTER TABLE `Department_Table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Instituition_Table`
--
ALTER TABLE `Instituition_Table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Leave_Requests_Table`
--
ALTER TABLE `Leave_Requests_Table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Logbook_Table`
--
ALTER TABLE `Logbook_Table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Organization_Supervisor`
--
ALTER TABLE `Organization_Supervisor`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Organization_Table`
--
ALTER TABLE `Organization_Table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `OTP_Verification_Table`
--
ALTER TABLE `OTP_Verification_Table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `Placement_Request_Table`
--
ALTER TABLE `Placement_Request_Table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `School_Supervisor`
--
ALTER TABLE `School_Supervisor`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Student_Evaluation_Table`
--
ALTER TABLE `Student_Evaluation_Table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Student_Table`
--
ALTER TABLE `Student_Table`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `SuperAdmin_Table`
--
ALTER TABLE `SuperAdmin_Table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Department_Table`
--
ALTER TABLE `Department_Table`
  ADD CONSTRAINT `department to instituition` FOREIGN KEY (`instituition_id`) REFERENCES `Instituition_Table` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Leave_Requests_Table`
--
ALTER TABLE `Leave_Requests_Table`
  ADD CONSTRAINT `Leave_Requests_Table_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Student_Table` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Logbook_Table`
--
ALTER TABLE `Logbook_Table`
  ADD CONSTRAINT `Logbook_Table_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Student_Table` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Organization_Supervisor`
--
ALTER TABLE `Organization_Supervisor`
  ADD CONSTRAINT `organization id to supervisor` FOREIGN KEY (`Organization_Id`) REFERENCES `Organization_Table` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Placement_Request_Table`
--
ALTER TABLE `Placement_Request_Table`
  ADD CONSTRAINT `Placement_Request_Table_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Student_Table` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Placement_Request_Table_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `Organization_Table` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `School_Supervisor`
--
ALTER TABLE `School_Supervisor`
  ADD CONSTRAINT `supervisor_to_school` FOREIGN KEY (`Instituition_Id`) REFERENCES `Instituition_Table` (`id`);

--
-- Constraints for table `Student_Evaluation_Table`
--
ALTER TABLE `Student_Evaluation_Table`
  ADD CONSTRAINT `Student_Evaluation_Table_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Student_Table` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Student_Table`
--
ALTER TABLE `Student_Table`
  ADD CONSTRAINT `student_to_organization` FOREIGN KEY (`Organization_Id`) REFERENCES `Organization_Table` (`id`),
  ADD CONSTRAINT `student_to_organization_supervisor` FOREIGN KEY (`Organization_Supervisor_Id`) REFERENCES `Organization_Supervisor` (`id`),
  ADD CONSTRAINT `student_to_school` FOREIGN KEY (`Instituition_Id`) REFERENCES `Instituition_Table` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_to_school_supervisor` FOREIGN KEY (`School_Supervisor_Id`) REFERENCES `School_Supervisor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
