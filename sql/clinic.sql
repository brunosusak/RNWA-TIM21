-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2021 at 07:17 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `patient_doctor_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_type` smallint(6) NOT NULL DEFAULT 1 COMMENT 'for future use, 1 is default',
  `create_date` int(11) NOT NULL,
  `last_edit_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerNumber` int(11) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `contactFirstName` varchar(25) NOT NULL,
  `contactLastName` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL,
  `drug_name_en` varchar(50) DEFAULT NULL,
  `drug_name_fa` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `drug_patient`
--

CREATE TABLE `drug_patient` (
  `drug_patient_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id_assign` int(11) NOT NULL,
  `assign_date` int(11) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT 1,
  `total_cost` decimal(10,0) NOT NULL,
  `user_id_discharge` int(11) DEFAULT NULL,
  `discharge_date` int(11) DEFAULT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jobTitle` varchar(255) NOT NULL,
  `officeCode` int(15) NOT NULL,
  `extension` int(10) NOT NULL,
  `reportsTo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employeeNumber`, `firstName`, `lastName`, `email`, `jobTitle`, `officeCode`, `extension`, `reportsTo`) VALUES
(4, 'Lebron', 'James', 'lebron@gmail.com', 'NBA', 1, 0, ''),
(5, 'Aydan', 'Johnny', '', 'Doctor', 2, 0, ''),
(6, 'Nikola', 'Jokić', 'nikola@gmail.com', 'Centar', 1, 1, 'Adam Silver'),
(7, 'Brandon', 'Ingram', 'brandon@gmail.com', 'PF', 1, 502, 'Adam Silver');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(48) NOT NULL,
  `description` text NOT NULL,
  `roles` bigint(20) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `description`, `roles`) VALUES
(1, 'Administrator', '', 1),
(2, 'Guest', '', 2),
(3, 'Doctor', '', 4),
(4, 'X-Ray Agent', '', 8),
(5, 'Laboratory Agent', '', 16),
(6, 'Pharmacy Agent', '', 32),
(7, 'Receptionist', '', 64),
(8, 'Patient', '', 128);

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `test_id` int(11) NOT NULL,
  `test_name_en` varchar(50) DEFAULT NULL,
  `test_name_fa` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lab_files`
--

CREATE TABLE `lab_files` (
  `lab_file_id` int(11) NOT NULL,
  `lab_patient_id` int(11) NOT NULL,
  `upload_date` int(11) NOT NULL,
  `path` text NOT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lab_patient`
--

CREATE TABLE `lab_patient` (
  `lab_patient_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id_assign` int(11) NOT NULL,
  `assign_date` int(11) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT 1,
  `total_cost` decimal(10,0) NOT NULL,
  `user_id_discharge` int(11) DEFAULT NULL,
  `discharge_date` int(11) DEFAULT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `login_id` int(10) UNSIGNED NOT NULL,
  `ip_address` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `success` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `officeCode` int(11) NOT NULL,
  `office_name` varchar(255) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `state` varchar(50) NOT NULL,
  `territory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`officeCode`, `office_name`, `addressLine1`, `addressLine2`, `city`, `country`, `phone`, `postalCode`, `state`, `territory`) VALUES
(1, 'NBA', '', '', '', '', '', '', '', ''),
(2, 'Surgery', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL,
  `customerNumber` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `orderDate` int(11) NOT NULL,
  `requiredDate` int(11) NOT NULL,
  `shippedDate` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `social_id` varchar(12) DEFAULT NULL,
  `id_type` enum('','Tazkara','Passport','Driver License','Bank ID Card') DEFAULT NULL,
  `birth_date` int(11) DEFAULT NULL,
  `create_date` int(11) NOT NULL,
  `picture` text DEFAULT NULL,
  `memo` text DEFAULT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `fname`, `gender`, `email`, `phone`, `address`, `social_id`, `id_type`, `birth_date`, `create_date`, `picture`, `memo`, `department_id`) VALUES
(1, 'Ana', 'Anic', 'Ana', 1, 'ana@gmail.com', '123123', '123', '2', 'Passport', 1, 0, NULL, NULL, 0),
(2, 'Nikola', 'Jokić', 'Nikola', 1, 'nikola@gmail.com', '123123', 'Apatin', '12', 'Passport', 1, 1, '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_doctor`
--

CREATE TABLE `patient_doctor` (
  `patient_doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `visit_date` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentNumber` int(11) NOT NULL,
  `customerNumber` int(15) NOT NULL,
  `amount` int(50) NOT NULL,
  `paymentDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `checkNumber` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productCode` int(11) NOT NULL,
  `buyPrice` int(20) NOT NULL,
  `MSRP` varchar(50) NOT NULL,
  `productDescription` varchar(50) NOT NULL,
  `productLine` varchar(70) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` int(50) NOT NULL,
  `quantityInStock` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_drugs`
--

CREATE TABLE `purchased_drugs` (
  `purchased_drug_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_date` int(11) NOT NULL,
  `purchase_price` decimal(10,0) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT 1,
  `total_cost` decimal(10,0) NOT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `returned_drugs`
--

CREATE TABLE `returned_drugs` (
  `returned_drug_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `return_date` int(11) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT 1,
  `total_cost` decimal(10,0) NOT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `userdata_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `position` varchar(40) NOT NULL,
  `social_id` varchar(12) NOT NULL,
  `id_type` enum('','Tazkara','Passport','Driver License','Bank ID Card') DEFAULT 'Tazkara',
  `birth_date` int(11) DEFAULT NULL,
  `create_date` int(11) NOT NULL,
  `picture` text DEFAULT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(60) NOT NULL,
  `password_last_set` datetime NOT NULL,
  `password_never_expires` tinyint(1) NOT NULL DEFAULT 0,
  `remember_me` varchar(40) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `forgot_code` varchar(40) DEFAULT NULL,
  `forgot_generated` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `last_login_ip` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `assoc_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xrays`
--

CREATE TABLE `xrays` (
  `xray_id` int(11) NOT NULL,
  `xray_name_en` varchar(50) DEFAULT NULL,
  `xray_name_fa` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xray_files`
--

CREATE TABLE `xray_files` (
  `xray_file_id` int(11) NOT NULL,
  `xray_patient_id` int(11) NOT NULL,
  `upload_date` int(11) NOT NULL,
  `path` text NOT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xray_patient`
--

CREATE TABLE `xray_patient` (
  `xray_patient_id` int(11) NOT NULL,
  `xray_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id_assign` int(11) NOT NULL,
  `assign_date` int(11) NOT NULL,
  `no_of_item` int(11) NOT NULL DEFAULT 1,
  `total_cost` decimal(10,0) NOT NULL,
  `user_id_discharge` int(11) DEFAULT NULL,
  `discharge_date` int(11) DEFAULT NULL,
  `memo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `patient_doctor_id` (`patient_doctor_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerNumber`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `drug_patient`
--
ALTER TABLE `drug_patient`
  ADD PRIMARY KEY (`drug_patient_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id_assign` (`user_id_assign`),
  ADD KEY `user_id_discharge` (`user_id_discharge`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeNumber`),
  ADD KEY `officeCode` (`officeCode`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `lab_files`
--
ALTER TABLE `lab_files`
  ADD PRIMARY KEY (`lab_file_id`),
  ADD KEY `lab_patient_id` (`lab_patient_id`);

--
-- Indexes for table `lab_patient`
--
ALTER TABLE `lab_patient`
  ADD PRIMARY KEY (`lab_patient_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id_assign` (`user_id_assign`),
  ADD KEY `user_id_discharge` (`user_id_discharge`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`officeCode`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `customerNumber` (`customerNumber`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patient_doctor`
--
ALTER TABLE `patient_doctor`
  ADD PRIMARY KEY (`patient_doctor_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentNumber`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productCode`);

--
-- Indexes for table `purchased_drugs`
--
ALTER TABLE `purchased_drugs`
  ADD PRIMARY KEY (`purchased_drug_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `returned_drugs`
--
ALTER TABLE `returned_drugs`
  ADD PRIMARY KEY (`returned_drug_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`userdata_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`assoc_id`),
  ADD KEY `user_id` (`user_id`,`group_id`);

--
-- Indexes for table `xrays`
--
ALTER TABLE `xrays`
  ADD PRIMARY KEY (`xray_id`);

--
-- Indexes for table `xray_files`
--
ALTER TABLE `xray_files`
  ADD PRIMARY KEY (`xray_file_id`),
  ADD KEY `xray_patient_id` (`xray_patient_id`);

--
-- Indexes for table `xray_patient`
--
ALTER TABLE `xray_patient`
  ADD PRIMARY KEY (`xray_patient_id`),
  ADD KEY `xray_id` (`xray_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id_assign` (`user_id_assign`),
  ADD KEY `user_id_discharge` (`user_id_discharge`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drug_patient`
--
ALTER TABLE `drug_patient`
  MODIFY `drug_patient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employeeNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_files`
--
ALTER TABLE `lab_files`
  MODIFY `lab_file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_patient`
--
ALTER TABLE `lab_patient`
  MODIFY `lab_patient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `login_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `officeCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_doctor`
--
ALTER TABLE `patient_doctor`
  MODIFY `patient_doctor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productCode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchased_drugs`
--
ALTER TABLE `purchased_drugs`
  MODIFY `purchased_drug_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returned_drugs`
--
ALTER TABLE `returned_drugs`
  MODIFY `returned_drug_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `userdata_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `assoc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xrays`
--
ALTER TABLE `xrays`
  MODIFY `xray_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xray_files`
--
ALTER TABLE `xray_files`
  MODIFY `xray_file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xray_patient`
--
ALTER TABLE `xray_patient`
  MODIFY `xray_patient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `officeCode` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`),
  ADD CONSTRAINT `office_id` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `customerNumber` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
