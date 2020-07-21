-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2018 at 04:03 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `Bus_ID` int(11) NOT NULL,
  `Type` char(10) DEFAULT NULL,
  `Total_Seats` int(11) DEFAULT NULL,
  `Employee_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`Bus_ID`, `Type`, `Total_Seats`, `Employee_ID`) VALUES
(1234, 'AC', 40, 10000),
(2234, 'Non-AC', 40, 10001),
(2734, 'Non-AC', 40, 10007),
(3734, 'Non-AC', 40, 10010),
(4734, 'AC', 40, 10003),
(7734, 'AC', 40, 12100),
(8734, 'AC', 40, 16700),
(5704, 'AC', 40, 14501);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `Counter_ID` int(11) NOT NULL,
  `Location` char(25) DEFAULT NULL,
  `Phone` char(25) DEFAULT NULL,
  `Employee_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`Counter_ID`, `Location`, `Phone`, `Employee_ID`) VALUES
(4123, 'Dhaka', '236745', 20007),
(4124, 'Dinajpur', '236745', 20018),
(4100, 'Dinajpur', '236745', 20018),
(4100, 'Dinajpur', '236745', 20019);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `Name` char(25) DEFAULT NULL,
  `Phone` char(25) DEFAULT NULL,
  `Address` char(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `Name`, `Phone`, `Address`) VALUES
(10000, 'Rahim', '123456', 'Dhaka'),
(10001, 'Rifat', '223456', 'Dhaka'),
(10003, 'Sabbir', '323456', 'Chittagong'),
(10010, 'Anik', '433456', 'Khulna'),
(10007, 'Hridoy', '443456', 'Khulna'),
(20007, 'Abir', '543456', 'Barisal'),
(20018, 'Abir', '743456', 'Barisal'),
(21019, 'Mahir', '943456', 'Dinajpur'),
(20045, 'Hasan', '743256', 'Faridpur'),
(12100, 'Nazir', '678123', 'Rajshahi'),
(16700, 'Zakir', '278123', 'Rangpur'),
(14501, 'Iqbal', '478103', 'Syllhet');

-- --------------------------------------------------------

--
-- Table structure for table `employee_category`
--

CREATE TABLE `employee_category` (
  `Employee_ID` int(11) NOT NULL,
  `Employee_Type` char(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_category`
--

INSERT INTO `employee_category` (`Employee_ID`, `Employee_Type`) VALUES
(10000, 'Driver'),
(10001, 'Driver'),
(10003, 'Driver'),
(10010, 'Driver'),
(10007, 'Driver'),
(20007, 'Manager'),
(20018, 'Manager'),
(21019, 'Manager'),
(20045, 'Manager'),
(12100, 'Driver'),
(16700, 'Driver'),
(14501, 'Driver');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `Passenger_ID` int(11) NOT NULL,
  `Name` char(25) DEFAULT NULL,
  `Phone` char(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`Passenger_ID`, `Name`, `Phone`) VALUES
(612345, 'Rakib', '154321'),
(612245, 'Azhar', '150321'),
(612205, 'Rakin', '190321'),
(612210, 'Tonmoy', '120321');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Counter_ID` int(11) NOT NULL,
  `Ticket_ID` int(11) NOT NULL,
  `Passenger_ID` int(11) NOT NULL,
  `No_of_Tickets` int(11) NOT NULL,
  `Total_Cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Counter_ID`, `Ticket_ID`, `Passenger_ID`, `No_of_Tickets`, `Total_Cost`) VALUES
(4123, 51234, 612345, 2, 1400),
(4124, 51224, 612245, 1, 1200),
(4100, 51224, 612205, 1, 650),
(4100, 51024, 612210, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `Bus_ID` int(11) NOT NULL,
  `Starting_Point` char(25) NOT NULL,
  `Destination` char(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`Bus_ID`, `Starting_Point`, `Destination`) VALUES
(1234, 'Dhaka', 'Dinajpur'),
(2234, 'Dhaka', 'Dinajpur'),
(2734, 'Dinajpur', 'Dhaka'),
(3734, 'Faridpur', 'Dhaka'),
(4734, 'Dhaka', 'Chittagong'),
(7734, 'Dhaka', 'Rajshahi'),
(8734, 'Dhaka', 'Rangpur'),
(5704, 'Rangpur', 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_ID` int(11) NOT NULL,
  `Bus_ID` int(11) NOT NULL,
  `Seat_No` int(11) NOT NULL,
  `Counter_ID` int(11) NOT NULL,
  `Passenger_ID` int(11) NOT NULL,
  `Fare` int(11) NOT NULL,
  `Bus_Type` char(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`Ticket_ID`, `Bus_ID`, `Seat_No`, `Counter_ID`, `Passenger_ID`, `Fare`, `Bus_Type`) VALUES
(51234, 5704, 1, 4123, 612345, 700, 'AC'),
(51224, 1234, 6, 4123, 612245, 1200, 'AC'),
(51224, 2234, 13, 4100, 612205, 650, 'Non-AC'),
(51024, 3734, 20, 4100, 612205, 500, 'Non-AC');

-- --------------------------------------------------------

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `Bus_ID` int(11) NOT NULL,
  `Journey_Date` date NOT NULL,
  `Departure_Time` time NOT NULL,
  `Arrival_Time` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_slot`
--

INSERT INTO `time_slot` (`Bus_ID`, `Journey_Date`, `Departure_Time`, `Arrival_Time`) VALUES
(1234, '2017-08-01', '08:30:00', '17:00:00'),
(2234, '2017-08-01', '08:30:00', '17:00:00'),
(2734, '2017-07-02', '08:30:00', '17:00:00'),
(3734, '2017-07-02', '09:00:00', '14:00:00'),
(4734, '2017-07-05', '10:00:00', '13:00:00'),
(7734, '2016-09-19', '10:00:00', '17:00:00'),
(8734, '2016-10-19', '09:30:00', '18:00:00'),
(5704, '2015-02-13', '14:30:00', '22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'shk', 'aaa@yahoo.com', 'aaa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`Bus_ID`,`Employee_ID`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`Counter_ID`,`Employee_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `employee_category`
--
ALTER TABLE `employee_category`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Counter_ID`,`Ticket_ID`),
  ADD KEY `fk_paymentpassenger` (`Passenger_ID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`Bus_ID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_ID`,`Bus_ID`,`Seat_No`),
  ADD KEY `fk_ticketpassenger` (`Passenger_ID`);

--
-- Indexes for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`Bus_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
