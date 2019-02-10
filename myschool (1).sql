-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2019 at 09:48 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `myschool`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE IF NOT EXISTS `accountant` (
  `Sl.no` int(10) NOT NULL,
  `AccountantID` varchar(10) NOT NULL,
  `Name` varchar(35) NOT NULL,
  `Age` int(10) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `DOJ` date NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Ph.no` int(10) NOT NULL,
  `TeacherID` varchar(10) NOT NULL,
  `ParentID` varchar(10) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  PRIMARY KEY (`AccountantID`),
  KEY `TeacherID` (`TeacherID`,`ParentID`,`StudentID`),
  KEY `ParentID` (`ParentID`),
  KEY `StudentID` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `Sl.no` int(10) NOT NULL,
  `AdminID` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Age` int(10) NOT NULL,
  `Ph.no` int(10) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `DOJ` date NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Sl.no`, `AdminID`, `Name`, `Gender`, `Address`, `DOB`, `Age`, `Ph.no`, `Email`, `DOJ`) VALUES
(1, 'ad01', 'aditya', 'm', '15th cross ks layout', '1996-02-04', 23, 701932654, 'adishah1997@gmail.com', '2018-02-08');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE IF NOT EXISTS `librarian` (
  `Sl.no` int(10) NOT NULL,
  `LibrarianID` varchar(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Age` int(10) NOT NULL,
  `DOB` date NOT NULL,
  `DOJ` date NOT NULL,
  `Ph.no` int(10) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `TeacherID` varchar(10) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  PRIMARY KEY (`LibrarianID`),
  KEY `TeacherID` (`TeacherID`,`StudentID`),
  KEY `StudentID` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE IF NOT EXISTS `parents` (
  `Sl.no` int(10) NOT NULL,
  `ParentID` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `HomeAddress` varchar(50) NOT NULL,
  `WorkAddress` varchar(50) NOT NULL,
  `Ph.no` int(10) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Age` int(10) NOT NULL,
  `DOB` date NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `TeacherID` varchar(10) NOT NULL,
  PRIMARY KEY (`ParentID`),
  KEY `StudentID` (`StudentID`,`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `Sl.no` int(10) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Age` int(10) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Class/Sec` varchar(10) NOT NULL,
  `ParentID` varchar(10) NOT NULL,
  `TeacherID` varchar(10) NOT NULL,
  `DOJ` date NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `ParentID` (`ParentID`,`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `Sl.no` int(10) NOT NULL,
  `TeacherId` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Age` int(10) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(35) NOT NULL,
  `AssignedClasses` varchar(50) NOT NULL,
  `Ph.NO` int(10) NOT NULL,
  `DOJ` date NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `ParentID` varchar(10) NOT NULL,
  PRIMARY KEY (`TeacherId`),
  KEY `StudentID` (`StudentID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountant`
--
ALTER TABLE `accountant`
  ADD CONSTRAINT `accountant_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `parents` (`ParentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `accountant_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON UPDATE CASCADE;

--
-- Constraints for table `librarian`
--
ALTER TABLE `librarian`
  ADD CONSTRAINT `librarian_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON UPDATE CASCADE;

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `parents` (`ParentID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
