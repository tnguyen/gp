-- DINNO SQL Database - built using phpMyAdmin
-- PHP Version: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Dinno_Database_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `Ingredient`
--

CREATE TABLE IF NOT EXISTS `Ingredient` (
  `IngredientID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `BestBefore` date NOT NULL,
  `Category` varchar(60) NOT NULL,
  `Description` varchar(500) NOT NULL,
  PRIMARY KEY (`IngredientID`),
  KEY `UserID` (`UserID`),
  KEY `LocationID` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE IF NOT EXISTS `Location` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `Postcode` varchar(8) NOT NULL,
  `HouseNoName` varchar(60) NOT NULL,
  `Street` varchar(60) NOT NULL,
  `Town/City` varchar(60) NOT NULL,
  `County` varchar(60) NOT NULL,
  `IsDropbox` tinyint(1) NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Test data for table `Location`
--

INSERT INTO `Location` (`LocationID`, `Postcode`, `HouseNoName`, `Street`, `Town/City`, `County`, `IsDropbox`, `Latitude`, `Longitude`) VALUES
(1, 'DH13RH', '18', 'North Bailey', 'Durham', 'County Durham', 0, 54.7731, -1.57489),
(2, 'DH13LE', 'Bill Bryson Library', 'South Road', 'Durham', 'County Durham', 0, 54.7683, -1.57322);

-- --------------------------------------------------------

--
-- Table structure for table `Meal`
--

CREATE TABLE IF NOT EXISTS `Meal` (
  `MealID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `DateServed` date NOT NULL,
  `Description` varchar(500) NOT NULL,
  PRIMARY KEY (`MealID`),
  KEY `UserID` (`UserID`),
  KEY `LocationID` (`LocationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Test data for table `Meal`
--

INSERT INTO `Meal` (`MealID`, `LocationID`, `UserID`, `Name`, `DateServed`, `Description`) VALUES
(1, 1, 2, 'Cauliflower Cheese', '2017-01-02', 'Some tasty cauliflower cheese.'),
(2, 2, 3, 'Bangers & Mash', '2017-01-12', 'Tasty bangers.');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) NOT NULL,
  `Firstname` varchar(60) NOT NULL,
  `Surname` varchar(60) NOT NULL,
  `EmailAddress` varchar(80) NOT NULL,
  `DOB` date NOT NULL,
  `EncryptedPass` varchar(70) NOT NULL,
  `Rating` float NOT NULL,
  `IsVerified` boolean NOT NULL,
  `VerificationCode` varchar(70) NOT NULL,
  `LoginCode` varchar(70) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `LocationID` (`LocationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Test data for table `User`
--

INSERT INTO `User` (`UserID`, `LocationID`, `Firstname`, `Surname`, `EmailAddress`, `DOB`, `EncryptedPass`, `Rating`, `IsVerified`, `VerificationCode`, `LoginCode`) VALUES
(1, 1, 'Johnny', 'Test', 'johnnytest@gmail.com', '2001-03-09', 'testpass', 9.9, 0, NULL, NULL),
(2, 1, 'David', 'Testington', 'davidtestington@gmail.com', '1992-01-02', 'testpass',9.8, 0, NULL, NULL),
(3, 2, 'Lucy', 'Testperson', 'lucytestperson@gmail.com', '1998-11-11', 'testpass',0.1, 0, NULL, NULL),
(4, 1, 'john' , 'jennings' , 'johnmjennings97@gmail.com', '2017-01-01',  '32afa0427b1dd0dca98da012bebbca918fc8ede9d7d4e8bc06ed019020179087',  5, 1, '230d7b0b2ddd9f7c8c237d19d3434964442e85e32eb6c1c706ff1caa2ad7cad3', '84e918d198058f007cb5f6c32c03416c5d0b0c77ebf8532e132289428af965c9'), 
(5 ,1 ,'not john',  'jennings',  'juanuncalcetin@gmail.com' , '2017-01-01',  'b328473224ad100b5021818149d79347cbf5217490cb65959626a54b47089cb4' , 5, 1 ,'b256f0aa70f968d1a5b0ebefde8da550ea852359330b81ac3d59da6fbe5f0c4a','a3dd40fd0e0e2b75c88757004682a629c2e16eb2ae9ecfb9e2975ae1bb01adef');
-- --------------------------------------------------------

--
-- Table structure for table `Tag`
--

CREATE TABLE IF NOT EXISTS `Tag` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) NOT NULL,
  PRIMARY KEY (`TagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `TagIngredient`
--

CREATE TABLE IF NOT EXISTS `TagIngredient` (
  `TagIngredientID` int(11) NOT NULL AUTO_INCREMENT,
  `IngredientID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL,
  PRIMARY KEY (`TagIngredientID`),
  KEY `IngredientID` (`IngredientID`),
  KEY `TagID` (`TagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `TagMeal`
--

CREATE TABLE IF NOT EXISTS `TagMeal` (
  `TagMealID` int(11) NOT NULL AUTO_INCREMENT,
  `MealID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL,
  PRIMARY KEY (`TagMealID`),
  KEY `MealID` (`MealID`),
  KEY `TagID` (`TagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `Chat`
--

CREATE TABLE IF NOT EXISTS `Chat` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `FromID` int(11) NOT NULL,
  `ToID` int(11) NOT NULL,
  `TimeSent` datetime NOT NULL,
  `Contents` varchar(280) NOT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `FromID` (`FromID`),
  KEY `ToID` (`ToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
-- --------------------------------------------------------


--
-- Test data for table `Chat`
--

INSERT INTO `Chat` (`MessageID`, `FromID`, `ToID`, `TimeSent`, `Contents`) VALUES
(1, 4, 5, '2017-01-02 03:14:07', 'Can I have some food?'),
(2, 5, 4, '2017-01-02 03:14:30', 'No?'),
(3, 4, 5, '2017-01-02 03:18:07', ':(');
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Ingredient`
--
ALTER TABLE `Ingredient`
  ADD CONSTRAINT `fk_Ingredient_UserID` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Ingredient_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`) ON UPDATE CASCADE;

--
-- Constraints for table `Meal`
--
ALTER TABLE `Meal`
  ADD CONSTRAINT `fk_Meal_UserID` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Meal_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`) ON UPDATE CASCADE;

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `fk_User_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`) ON UPDATE CASCADE;
  
--
-- Constraints for table `TagIngredient`
--
ALTER TABLE `TagIngredient`
  ADD CONSTRAINT `fk_TagIngredient_TagID` FOREIGN KEY (`TagID`) REFERENCES `Tag` (`TagID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_TagIngredient_IngredientID` FOREIGN KEY (`IngredientID`) REFERENCES `Ingredient` (`IngredientID`) ON UPDATE CASCADE;

--
-- Constraints for table `TagMeal`
--
ALTER TABLE `TagMeal`
  ADD CONSTRAINT `fk_TagMeal_TagID` FOREIGN KEY (`TagID`) REFERENCES `Tag` (`TagID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_TagMeal_MealID` FOREIGN KEY (`MealID`) REFERENCES `Meal` (`MealID`) ON UPDATE CASCADE;


--
-- Constraints for table `TagMeal`
--
ALTER TABLE `Chat`
  ADD CONSTRAINT `fk_Chat_FromID` FOREIGN KEY (`FromID`) REFERENCES `User` (`UserID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Chat_ToID` FOREIGN KEY (`ToID`) REFERENCES `User` (`UserID`) ON UPDATE CASCADE;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
