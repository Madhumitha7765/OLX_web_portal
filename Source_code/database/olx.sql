-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2020 at 01:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olx`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_password` (IN `new_pwd` VARCHAR(50), IN `eid` VARCHAR(50))  NO SQL
begin

	UPDATE `users` 
		SET password=new_pwd where Nitc_email_id=adid;

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `advt_id` int(100) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `date_of_init` varchar(255) DEFAULT NULL,
  `date_of_exp` varchar(255) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `buyer_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`advt_id`, `item_name`, `item_type`, `date_of_init`, `date_of_exp`, `owner_id`, `buyer_id`) VALUES
(1, 'Hp Probook 4420', 'Laptop', '2018-10-07', '2018-10-17', 'kenil@gmail.com', 'madhu@gmail.com'),
(2, 'Dell Vostro', 'Laptop', '2018-10-07', '2018-10-17', 'praj12121998@gmail.com', 'kenil@gmail.com'),
(3, 'Lenovo think pad', 'Laptop', '2018-10-07', '2018-10-17', 'praj12121998@gmail.com', 'surabh@gmail.com'),
(4, 'IPHONE TEN !! 256Gb Fresh Condition So Dont Miss', 'Mobile', '2018-10-07', '2018-10-17', 'praj12121998@gmail.com', 'madhu@gmail.com'),
(5, 'J7 prime 32gb new condition,negotiable', 'Mobile', '2018-10-07', '2018-10-17', 'surabh@gmail.com', 'praj12121998@gmail.com'),
(6, ' Redmi 4 3gb ram, 32gb internal', 'Mobile', '2018-10-07', '2018-10-17', 'surabh@gmail.com', NULL),
(7, 'System Software  3rd', 'Book', '2018-10-07', '2018-10-17', 'surabh@gmail.com', 'madhu@gmail.com'),
(8, 'Computers as components ', 'Book', '2018-10-07', '2018-10-17', 'surabh@gmail.com', 'praj12121998@gmail.com'),
(9, 'Operating system concept-8th edition', 'Book', '2018-10-07', '2018-10-17', 'vinod@gmail.com', NULL),
(10, 'HP 6510 ', 'Laptop', '2018-10-07', '2018-10-17', 'vinod@gmail.com', NULL),
(11, 'Dell Inspiron', 'Laptop', '2018-10-07', '2018-10-17', 'vinod@gmail.com', NULL),
(39, 'Television', 'television', '2020-11-20', '2020-11-30', 'madhu@gmail.com', NULL),
(40, 'Car', 'Car', '2020-11-20', '2020-11-30', 'madhu@gmail.com', NULL),
(46, 'Nikon', 'camera', '2020-11-20', '2020-11-30', 'madhu@gmail.com', NULL),
(47, 'Audioc', 'Speakers', '2020-11-20', '2020-11-30', 'madhu@gmail.com', NULL),
(48, 'Ecosport', 'Car', '2020-11-20', '2020-11-30', 'madhu@gmail.com', NULL),
(49, 'R15', 'Bike', '2020-11-20', '2020-11-30', 'madhu@gmail.com', NULL),
(50, 'Dio', 'Bike', '2020-11-20', '2020-11-30', 'madhu@gmail.com', 'kenil@gmail.com'),
(51, 'Canon', 'camera', '2020-11-20', '2020-11-30', 'praj12121998@gmail.com', NULL),
(52, 'Canon', 'Speakers', '2020-11-21', '2020-12-01', 'kenil@gmail.com', 'praj12121998@gmail.com'),
(57, 'Audi A6', 'Car', '2020-11-21', '2020-12-01', 'razeen@gmail.com', 'madhu@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `product_id` int(100) NOT NULL,
  `author_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`product_id`, `author_name`) VALUES
(7, ' D Manjula'),
(7, 'Leland l beck'),
(8, 'Wayne Wolf'),
(9, 'A silberschatz'),
(9, 'Gagne'),
(9, 'P Galvin');

-- --------------------------------------------------------

--
-- Table structure for table `bikes`
--

CREATE TABLE `bikes` (
  `product_id` int(200) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `year_of_purchase` varchar(255) DEFAULT NULL,
  `kilometers_driven` bigint(200) NOT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `expected_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bikes`
--

INSERT INTO `bikes` (`product_id`, `manufacturer`, `model_name`, `year_of_purchase`, `kilometers_driven`, `ad_description`, `expected_price`) VALUES
(49, 'Yamaha', 'R15', '2002', 97800, 'Good mileage and negotiable price', '35000'),
(50, 'suzuki', 'Dio', '1998', 23000, 'compact vehicle with recently replaced new tyres', '22000');

--
-- Triggers `bikes`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_bikes` BEFORE INSERT ON `bikes` FOR EACH ROW BEGIN

if new.kilometers_driven<0 then
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check kilometere driven!!!'; end if; 
if new.expected_price<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check price!!!';
end if; 
if YEAR(CURRENT_DATE)-new.year_of_purchase<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check year!!!'; end if;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `product_id` int(100) NOT NULL,
  `name_of_book` varchar(255) DEFAULT NULL,
  `condition_book` varchar(255) DEFAULT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `expected_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`product_id`, `name_of_book`, `condition_book`, `ad_description`, `expected_price`) VALUES
(7, 'System Software  3rd', ' Very Good', 'Important book for Software development', '199'),
(8, 'Computers as components ', 'Good', '2nd Edition ', '299'),
(9, 'Operating system concept-8th edition', 'Almost New', 'Useful for Computer Science students', '299');

--
-- Triggers `book`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_books` BEFORE INSERT ON `book` FOR EACH ROW BEGIN


if new.expected_price<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check price!!!';
end if; 


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `camera`
--

CREATE TABLE `camera` (
  `product_id` int(200) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `year_of_purchase` varchar(225) DEFAULT NULL,
  `battery_status` varchar(255) DEFAULT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `expected_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera`
--

INSERT INTO `camera` (`product_id`, `manufacturer`, `model_name`, `year_of_purchase`, `battery_status`, `ad_description`, `expected_price`) VALUES
(46, 'nikes', 'STAR', '2002', '5 hours', 'Great deal in lowest price', '2300'),
(51, 'crie', 'IPV4', '2000', '6 hours ', 'Undamaged camera in unimaginable price', '1700');

--
-- Triggers `camera`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_camera` BEFORE INSERT ON `camera` FOR EACH ROW BEGIN

if new.battery_status<0 then
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check battery status!!!'; end if; 
if new.expected_price<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check price!!!';
end if; 
if YEAR(CURRENT_DATE)-new.year_of_purchase<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check year!!!'; end if;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `product_id` int(100) NOT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `year_of_purchase` varchar(255) DEFAULT NULL,
  `fueltype` varchar(225) DEFAULT NULL,
  `kilometers_driven` bigint(200) DEFAULT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `expected_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`product_id`, `model_name`, `manufacturer`, `year_of_purchase`, `fueltype`, `kilometers_driven`, `ad_description`, `expected_price`) VALUES
(40, NULL, 'samsung', '2020', 'diesel', 7855, 'qwsa', '1234'),
(48, NULL, 'Ford', '2017', 'diesel', 45000, 'Brown coloured car with average mileage of 25 kms', '400000'),
(57, NULL, 'audi', '2000', 'petrol', 23000, 'New car with good maintenance', '1100000');

--
-- Triggers `car`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_car` BEFORE INSERT ON `car` FOR EACH ROW BEGIN

if new.kilometers_driven<0 then
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check kilometere driven!!!'; end if; 
if new.expected_price<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check price!!!';
end if; 
if YEAR(CURRENT_DATE)-new.year_of_purchase<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check year!!!'; end if;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`firstname`, `lastname`, `email`, `user_message`) VALUES
('Madhu', 'SK', 'Madhu2k2.in@gmail.com', 'Test message for backend'),
('Razeen', 'Aman', 'Raz@gmail.com', 'Backend test 2');

-- --------------------------------------------------------

--
-- Table structure for table `laptop`
--

CREATE TABLE `laptop` (
  `product_id` int(100) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `year_of_purchase` varchar(255) DEFAULT NULL,
  `battery_status` varchar(255) DEFAULT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `expected_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laptop`
--

INSERT INTO `laptop` (`product_id`, `manufacturer`, `model_name`, `year_of_purchase`, `battery_status`, `ad_description`, `expected_price`) VALUES
(1, 'HP', 'HPS12/9Q2378256iA2', '2017', ' 3 hours battery', 'Hp Probook 4420 i5 / 4 GB / 320 GB / dvd writer/ WiFi /webcam /14.0/ good working condition.', '10500'),
(2, 'DELL', 'DV1290', '2015', '2 hours battery', '4 GB ram/ 500 GB hard disk/ 15.6 led screen good working condition', '9999'),
(3, 'Lenovo', 'LT7462/i2329', '2010', '2 hours battery backup', 'Lenovo think pad. i3 2nd / 4 gb / 320 gb / 14.0 screen wifi / webcam / good working condition', '9500'),
(10, 'HP', 'HP9778675', '2012', ' 3 hours battery', 'Intel CORE i5 With 1GB Graphic Card ', '11000'),
(11, 'DELL', '5559 ', '2017', '4 hours battery', 'i3 6100/4gb/1tb/2gb/black ', '31000');

--
-- Triggers `laptop`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_laptop` BEFORE INSERT ON `laptop` FOR EACH ROW BEGIN

if new.battery_status<0 then
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check battery status!!!'; end if; 
if new.expected_price<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check price!!!';
end if; 
if YEAR(CURRENT_DATE)-new.year_of_purchase<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check year!!!'; end if;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(100) NOT NULL,
  `sender_id` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `msg_date` varchar(255) DEFAULT NULL,
  `msg_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `sender_id`, `receiver_id`, `message`, `msg_date`, `msg_time`) VALUES
(1, 'kenil@gmail.com', 'praj12121998@gmail.com', 'This is Kenil Shah. I would like to buy your iPhone 10.', '2018-10-09', '03:14 AM'),
(2, 'kenil@gmail.com', 'praj12121998@gmail.com', 'But The price is too much can you reduce it to 55000', '2018-10-09', '03:15 AM'),
(3, 'praj12121998@gmail.com', 'kenil@gmail.com', 'Sorry I can\'t agree for 55000 but I can agree for 57000 ', '2018-10-09', '03:17 AM'),
(4, 'praj12121998@gmail.com', 'kenil@gmail.com', 'Please tell me quickly otherwise it will be sold to another person ', '2018-10-09', '03:19 AM'),
(5, 'praj12121998@gmail.com', 'kenil@gmail.com', 'Hi this is mwee', '2018-10-09', '03:59 AM'),
(7, 'madhu@gmail.com', 'madhu@gmail.com', 'wedfr', '2020-11-18', '12:22 PM'),
(8, 'kenil@gmail.com', 'madhu@gmail.com', 'testtest', '2020-11-18', '12:36 PM'),
(9, 'madhu@gmail.com', 'surabh@gmail.com', 'test', '2020-11-18', '03:15 PM'),
(10, 'madhu@gmail.com', 'madhu@gmail.com', 'll', '2020-11-18', '03:21 PM'),
(11, 'madhu@gmail.com', 'kenil@gmail.com', 'shopify test', '2020-11-19', '08:05 AM'),
(12, 'kenil@gmail.com', 'madhu@gmail.com', 'ewrgtrhgrbrb', '2020-11-20', '03:08 PM');

-- --------------------------------------------------------

--
-- Table structure for table `mobile`
--

CREATE TABLE `mobile` (
  `product_id` int(100) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `year_of_purchase` varchar(255) DEFAULT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `expected_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobile`
--

INSERT INTO `mobile` (`product_id`, `manufacturer`, `model_name`, `year_of_purchase`, `ad_description`, `expected_price`) VALUES
(4, 'Apple', 'IP9248', '2018 (recently)', 'Brand New ', '59999'),
(5, 'Samsung', 'SJ7070', '2018 (recently)', 'bill box accessories available', '7900'),
(6, 'MI', 'MIR3872', '2017', 'Good Condition 3gb ram, 32gb internal memory 12mp rear camera 5mp front camera 4000mAh Battery', '7000');

--
-- Triggers `mobile`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_mobile` BEFORE INSERT ON `mobile` FOR EACH ROW BEGIN


if new.expected_price<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check price!!!';
end if; 
if YEAR(CURRENT_DATE)-new.year_of_purchase<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check year!!!'; end if;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `speakers`
--

CREATE TABLE `speakers` (
  `product_id` int(100) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `year_of_purchase` varchar(255) DEFAULT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `expected_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `speakers`
--

INSERT INTO `speakers` (`product_id`, `manufacturer`, `year_of_purchase`, `ad_description`, `expected_price`) VALUES
(47, 'JBL', '2000', 'Good quality speakers', '6120'),
(52, 'nids', '2004', 'Great zooming effect ,price is negotiable', '5230');

--
-- Triggers `speakers`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_speakers` BEFORE INSERT ON `speakers` FOR EACH ROW BEGIN


if new.expected_price<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check price!!!';
end if; 
if YEAR(CURRENT_DATE)-new.year_of_purchase<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check year!!!'; end if;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `television`
--

CREATE TABLE `television` (
  `product_id` int(200) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `year_of_purchase` varchar(255) DEFAULT NULL,
  `inches` mediumint(200) NOT NULL,
  `ad_description` varchar(255) DEFAULT NULL,
  `expected_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `television`
--

INSERT INTO `television` (`product_id`, `manufacturer`, `model_name`, `year_of_purchase`, `inches`, `ad_description`, `expected_price`) VALUES
(39, 'samsung', 'wes', '2002', 785, 'qweds', '29848474');

--
-- Triggers `television`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_television` BEFORE INSERT ON `television` FOR EACH ROW BEGIN

if new.inches<0 then
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check inches!!!'; end if; 
if new.expected_price<=0 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Check price!!!';
end if; 
if YEAR(CURRENT_DATE)-new.year_of_purchase<0 THEN
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check year!!!'; end if;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Nitc_email_id` varchar(255) NOT NULL,
  `User_name` varchar(255) DEFAULT NULL,
  `Mobile_no` varchar(255) DEFAULT NULL,
  `User_type` varchar(255) DEFAULT NULL,
  `User_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Nitc_email_id`, `User_name`, `Mobile_no`, `User_type`, `User_password`) VALUES
('kenil@gmail.com', 'kenil', '24466366', 'Faculty', '1234'),
('madhu@gmail.com', 'Madhumitha', '9786131242', 'Student', '1234'),
('praj12121998@gmail.com', 'Prajwal', '9757318791', 'Student', '1234'),
('razeen@gmail.com', 'Razeen', '9786131245', 'Student', '1234'),
('surabh@gmail.com', 'Saurabh Marpallikar', '8403361093', 'Student', '1234'),
('vinod@gmail.com', 'vinod', '434356446', 'Student', '1234');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `before_insert_on_users` BEFORE INSERT ON `users` FOR EACH ROW BEGIN

if new.Mobile_no<0 then
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Check number!!!'; end if; 


END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`advt_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`product_id`,`author_name`);

--
-- Indexes for table `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `camera`
--
ALTER TABLE `camera`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `mobile`
--
ALTER TABLE `mobile`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `speakers`
--
ALTER TABLE `speakers`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `television`
--
ALTER TABLE `television`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Nitc_email_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `advt_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD CONSTRAINT `Advertisement_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`Nitc_email_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Advertisement_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`Nitc_email_id`) ON DELETE CASCADE;

--
-- Constraints for table `bikes`
--
ALTER TABLE `bikes`
  ADD CONSTRAINT `fkb` FOREIGN KEY (`product_id`) REFERENCES `advertisement` (`advt_id`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `advertisement` (`advt_id`);

--
-- Constraints for table `camera`
--
ALTER TABLE `camera`
  ADD CONSTRAINT `fkc` FOREIGN KEY (`product_id`) REFERENCES `advertisement` (`advt_id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `fkcar` FOREIGN KEY (`product_id`) REFERENCES `advertisement` (`advt_id`);

--
-- Constraints for table `laptop`
--
ALTER TABLE `laptop`
  ADD CONSTRAINT `Laptop_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `advertisement` (`advt_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`Nitc_email_id`),
  ADD CONSTRAINT `Messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`Nitc_email_id`);

--
-- Constraints for table `mobile`
--
ALTER TABLE `mobile`
  ADD CONSTRAINT `Mobile_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `advertisement` (`advt_id`);

--
-- Constraints for table `speakers`
--
ALTER TABLE `speakers`
  ADD CONSTRAINT `fks` FOREIGN KEY (`product_id`) REFERENCES `advertisement` (`advt_id`);

--
-- Constraints for table `television`
--
ALTER TABLE `television`
  ADD CONSTRAINT `fkt` FOREIGN KEY (`product_id`) REFERENCES `advertisement` (`advt_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
