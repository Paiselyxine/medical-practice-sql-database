-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2024 at 06:48 AM
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
-- Database: `MedicalPractice`
--

-- --------------------------------------------------------

--
-- Table structure for table `Appointment`
--

CREATE TABLE `Appointment` (
  `Practitioner_Ref` int(11) DEFAULT NULL,
  `ApptDate` date NOT NULL,
  `ApptStartTime` time NOT NULL,
  `Patient_Ref` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Appointment`
--

INSERT INTO `Appointment` (`Practitioner_Ref`, `ApptDate`, `ApptStartTime`, `Patient_Ref`) VALUES
(10005, '2019-09-17', '08:15:00', 10000),
(10006, '2019-09-18', '10:00:00', 10000),
(10006, '2019-09-18', '10:15:00', 10000),
(10006, '2019-09-18', '10:30:00', 10000),
(10006, '2019-09-18', '10:45:00', 10000),
(10006, '2019-09-18', '11:00:00', 10000),
(10005, '2019-09-17', '09:00:00', 10002),
(10000, '2019-09-18', '08:00:00', 10003),
(10005, '2019-09-17', '08:30:00', 10005),
(10000, '2019-09-18', '08:30:00', 10005),
(10005, '2019-09-17', '14:15:00', 10006),
(10008, '2019-09-18', '08:30:00', 10006),
(10005, '2019-09-17', '08:00:00', 10008),
(10002, '2019-09-17', '08:30:00', 10008),
(10005, '2019-09-18', '08:00:00', 10008),
(10005, '2019-09-17', '10:00:00', 10009),
(10001, '2019-09-17', '08:00:00', 10010),
(10005, '2019-09-17', '10:15:00', 10010),
(10008, '2019-09-18', '08:00:00', 10010),
(10006, '2019-09-18', '09:30:00', 10010);

-- --------------------------------------------------------

--
-- Table structure for table `Availability`
--

CREATE TABLE `Availability` (
  `Practitioner_Ref` int(11) DEFAULT NULL,
  `WeekDayName_Ref` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Availability`
--

INSERT INTO `Availability` (`Practitioner_Ref`, `WeekDayName_Ref`) VALUES
(10000, 'Friday'),
(10000, 'Monday'),
(10000, 'Wednesday'),
(10001, 'Thursday'),
(10001, 'Tuesday'),
(10002, 'Thursday'),
(10002, 'Tuesday'),
(10003, 'Friday'),
(10003, 'Monday'),
(10003, 'Wednesday'),
(10004, 'Friday'),
(10004, 'Monday'),
(10005, 'Thursday'),
(10005, 'Tuesday'),
(10006, 'Wednesday'),
(10007, 'Thursday'),
(10007, 'Tuesday'),
(10008, 'Friday'),
(10008, 'Monday'),
(10008, 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `Patient_ID` int(11) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleInitial` char(1) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `HouseUnitLotNum` varchar(5) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `Suburb` varchar(50) NOT NULL,
  `State` varchar(3) NOT NULL,
  `Postcode` char(4) NOT NULL,
  `HomePhone` char(10) NOT NULL,
  `MobilePhone` char(10) NOT NULL,
  `MedicareNumber` char(16) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` (`Patient_ID`, `Title`, `FirstName`, `MiddleInitial`, `LastName`, `HouseUnitLotNum`, `Street`, `Suburb`, `State`, `Postcode`, `HomePhone`, `MobilePhone`, `MedicareNumber`, `DateOfBirth`, `Gender`) VALUES
(10000, 'Mr', 'Mackenzie', 'J', 'Fleetwood', '233', 'Dreaming Street', 'Roseville', 'NSW', '2069', '0298654743', '0465375486', '7253418356478253', '2000-03-12', 'male'),
(10001, 'Ms', 'Jane', 'P', 'Killingsworth', '34', 'Southern Road', 'Yarramundi', 'NSW', '2753', '0234654345', '0342134679', '9365243640183640', '1943-04-08', 'female'),
(10002, 'Mr', 'Peter', 'D', 'Leons', '21', 'Constitution Drive', 'West Hoxton', 'NSW', '2171', '0276539183', '0125364927', '1873652945578932', '1962-07-08', 'male'),
(10003, 'Mr', 'Phill', 'B', 'Greggan', '42', 'Donn Lane', 'Killara', 'NSW', '2071', '0276548709', '1234326789', '6473645782345678', '1971-08-31', 'male'),
(10004, 'Dr', 'John', 'W', 'Ward', '332', 'Tomorrow Road', 'Chatswood', 'NSW', '2488', '4847383848', '4838382728', '4738294848484838', '1978-02-12', 'male'),
(10005, 'Mrs', 'Mary', 'D', 'Brown', 'Lot23', 'Johnston Road', 'Warwick Farm', 'NSW', '2170', '0297465243', '0417335224', '9356273321176546', '1972-03-05', 'female'),
(10006, 'Mr', 'Terrence', 'D', 'Hill', '43', 'Somerland Road', 'La Perouse', 'NSW', '2987', '0266645432', '0365243561', '6363525353535356', '2005-10-04', 'male'),
(10007, 'Master', 'Adrian', 'B', 'Tamerkand', '44', 'The Hill Road', 'Macquarie Fields', 'NSW', '2756', '0276546783', '4848473738', '9863652527637332', '2008-12-12', 'male'),
(10008, 'Ms', 'Joan', 'D', 'Wothers', '32', 'Slapping Street', 'Mount Lewis', 'NSW', '2343', '1294848777', '8484737384', '9484746125364765', '1997-06-12', 'female'),
(10009, 'Mrs', 'Caroline', 'J', 'Barrette', '44', 'Biggramham Road', 'St Kilda', 'VIC', '4332', '0384736278', '9383827373', '1234565725463728', '1965-04-04', 'female'),
(10010, 'Mrs', 'Wendy', 'J', 'Pilington', '182', 'Parramatta Road', 'Lidcombe', 'NSW', '2345', '4837383848', '8473838383', '8483727616273838', '1985-09-17', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `Practitioner`
--

CREATE TABLE `Practitioner` (
  `Practitioner_ID` int(11) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleInitial` char(1) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `HouseUnitLotNum` varchar(5) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `Suburb` varchar(50) NOT NULL,
  `State` varchar(3) NOT NULL,
  `Postcode` char(4) NOT NULL,
  `HomePhone` char(10) DEFAULT NULL,
  `MobilePhone` char(10) DEFAULT NULL,
  `MedicareNumber` char(16) NOT NULL,
  `MedicalRegistrationNumber` char(11) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `PractitionerType_Ref` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Practitioner`
--

INSERT INTO `Practitioner` (`Practitioner_ID`, `Title`, `FirstName`, `MiddleInitial`, `LastName`, `HouseUnitLotNum`, `Street`, `Suburb`, `State`, `Postcode`, `HomePhone`, `MobilePhone`, `MedicareNumber`, `MedicalRegistrationNumber`, `DateOfBirth`, `Gender`, `PractitionerType_Ref`) VALUES
(10000, 'Dr', 'Mark', 'P', 'Huston', '21', 'Fuller Street', 'Sunshine', 'NSW', '2343', '0287657483', '0476352638', '9878986473892753', '63738276173', '1975-07-07', 'male', 'Medical Practitioner (Doctor or GP)'),
(10001, 'Mrs', 'Hilda', 'D', 'Brown', '32', 'Argyle Street', 'Bonnels Bay', 'NSW', '2264', '0249756544', '0318466453', '4635278435099921', '37876273849', '1993-12-03', 'female', 'Registered nurse'),
(10002, 'Mrs', 'Jennifer', 'J', 'Dunsworth', '45', 'Dora Street', 'Morriset', 'NSW', '2264', '0249767574', '0228484373', '7666777833449876', '48372678939', '1991-06-04', 'female', 'Registered nurse'),
(10003, 'Mr', 'Jason', 'D', 'Lithdon', '43', 'Fowler Street', 'Camperdown', 'NSW', '2050', '0298785645', '0317896453', '0487736265377777', '12345678901', '1989-08-09', 'male', 'nurse'),
(10004, 'Ms', 'Paula', 'D', 'Yates', '89', 'Tableton Road', 'Newtown', 'NSW', '2051', '0289876432', '0938473625', '6637474433222881', '84763892834', '1982-09-07', 'female', 'Midwife'),
(10005, 'Dr', 'Ludo', 'V', 'Vergenargen', '27', 'Pembleton Place', 'Redfern', 'NSW', '2049', '9383737627', '8372727283', '8484737626278884', '84737626673', '1986-05-15', 'male', 'Medical Practitioner (Doctor or GP)'),
(10006, 'Dr', 'Anne', 'D', 'Funsworth', '4/89', 'Pacific Highway', 'St Leonards', 'NSW', '2984', '8847362839', '8372688949', '8477666525173738', '36271663788', '1991-12-11', 'female', 'Psychologist'),
(10007, 'Mrs', 'Leslie', 'V', 'Gray', '98', 'Dandaraga Road', 'Mirrabooka', 'NSW', '2264', '4736728288', '4837726789', '4847473737277276', '05958474636', '1989-03-11', 'female', 'Podiatrist'),
(10008, 'Dr', 'Adam', 'J', 'Moody', '35', 'Mullabinga Way', 'Brightwaters', 'NSW', '2264', '8476635678', '2736352536', '7473636527771183', '63635245256', '1990-09-23', 'male', 'Medical practitioner (Doctor or GP)'),
(10009, 'Mr', 'Leslie', 'Y', 'Gray', '3', 'Dorwington Place', 'Enmore', 'NSW', '2048', '8473763678', '4484837289', '3827284716390987', '38277121234', '1991-04-11', 'male', 'nurse');

-- --------------------------------------------------------

--
-- Table structure for table `PractitionerType`
--

CREATE TABLE `PractitionerType` (
  `PractitionerType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PractitionerType`
--

INSERT INTO `PractitionerType` (`PractitionerType`) VALUES
('Diagnostic radiographer'),
('Enrolled nurse'),
('Medical Practitioner (Doctor or GP)'),
('Medical radiation practitioner'),
('Midwife'),
('Nurse'),
('Occupational therapist'),
('Optometrist'),
('Osteopath'),
('Physical therapist'),
('Physiotherapist'),
('Podiatrist'),
('Psychologist'),
('Radiation therapist'),
('Registered nurse');

-- --------------------------------------------------------

--
-- Table structure for table `WeekDays`
--

CREATE TABLE `WeekDays` (
  `WeekDayName` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `WeekDays`
--

INSERT INTO `WeekDays` (`WeekDayName`) VALUES
('Friday'),
('Monday'),
('Thursday'),
('Tuesday'),
('Wednesday');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Appointment`
--
ALTER TABLE `Appointment`
  ADD KEY `fk_practitioner` (`Practitioner_Ref`),
  ADD KEY `fk_patient` (`Patient_Ref`);

--
-- Indexes for table `Availability`
--
ALTER TABLE `Availability`
  ADD KEY `WeekDayName_Ref` (`WeekDayName_Ref`),
  ADD KEY `Practitioner_Ref` (`Practitioner_Ref`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD UNIQUE KEY `unique_patient_id` (`Patient_ID`);

--
-- Indexes for table `Practitioner`
--
ALTER TABLE `Practitioner`
  ADD PRIMARY KEY (`Practitioner_ID`),
  ADD UNIQUE KEY `unique_practitioner_id` (`Practitioner_ID`),
  ADD UNIQUE KEY `unique_MedicalRegistrationNumber` (`MedicalRegistrationNumber`),
  ADD KEY `PractitionerType_Ref` (`PractitionerType_Ref`);

--
-- Indexes for table `PractitionerType`
--
ALTER TABLE `PractitionerType`
  ADD PRIMARY KEY (`PractitionerType`);

--
-- Indexes for table `WeekDays`
--
ALTER TABLE `WeekDays`
  ADD PRIMARY KEY (`WeekDayName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Appointment`
--
ALTER TABLE `Appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Practitioner_Ref`) REFERENCES `Practitioner` (`Practitioner_ID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Patient_Ref`) REFERENCES `Patient` (`Patient_ID`),
  ADD CONSTRAINT `fk_patient` FOREIGN KEY (`Patient_Ref`) REFERENCES `Patient` (`Patient_ID`),
  ADD CONSTRAINT `fk_practitioner` FOREIGN KEY (`Practitioner_Ref`) REFERENCES `Practitioner` (`Practitioner_ID`);

--
-- Constraints for table `Availability`
--
ALTER TABLE `Availability`
  ADD CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`WeekDayName_Ref`) REFERENCES `WeekDays` (`WeekDayName`),
  ADD CONSTRAINT `availability_ibfk_2` FOREIGN KEY (`Practitioner_Ref`) REFERENCES `Practitioner` (`Practitioner_ID`);

--
-- Constraints for table `Practitioner`
--
ALTER TABLE `Practitioner`
  ADD CONSTRAINT `practitioner_ibfk_1` FOREIGN KEY (`PractitionerType_Ref`) REFERENCES `PractitionerType` (`PractitionerType`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
