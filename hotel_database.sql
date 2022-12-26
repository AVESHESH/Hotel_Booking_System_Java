-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hotel_database
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing` (
  `Billing_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Booking_ID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `VAT` int(10) DEFAULT NULL,
  `Service_Charge` int(11) NOT NULL,
  `Room_Price` int(10) DEFAULT NULL,
  `Total_Bill` double(20,1) DEFAULT NULL,
  `Biiling_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Billing_ID`),
  KEY `Booking_ID` (`Booking_ID`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,54,'Loman',13,0,4000,9065.4,'Paid'),(2,56,'Nitesh Hamal',13,0,3000,5369.0,'Paid'),(3,56,'Nitesh Hamal',13,0,3000,5369.0,'Paid'),(4,60,'Neuve Limbu',13,0,3000,6376.0,'Paid'),(5,61,'Neuve Limbu',13,0,2000,6511.6,'Paid'),(6,62,'Loman',13,0,9000,14432.9,'Paid'),(7,63,'Neuve Limbu',13,0,3000,9562.6,'Paid'),(8,58,'Neuve Limbu',13,500,4000,5020.0,'Paid'),(9,75,'Hancie Phago',13,500,0,500.0,'Paid'),(10,76,'Hancie Phago',13,500,9000,10670.0,'Paid');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `Booking_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(11) DEFAULT NULL,
  `CheckIn` date NOT NULL,
  `CheckOut` date NOT NULL,
  `Room_ID` int(11) DEFAULT NULL,
  `Booking_Type` varchar(50) DEFAULT NULL,
  `Booking_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Room_ID` (`Room_ID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Room_ID`) REFERENCES `rooms` (`Room_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (54,37,'2022-05-26','2022-05-28',3,'Double','Inactive'),(56,5,'2022-05-26','2022-05-27',10,'Twin','Inactive'),(58,1,'2022-05-26','2022-05-28',1,'Double','Inactive'),(59,5,'2022-05-26','2022-05-28',6,'Double','Inactive'),(60,1,'2022-05-26','2022-05-27',12,'Twin','Inactive'),(61,1,'2022-05-26','2022-05-27',3,'Double','Inactive'),(62,37,'2022-05-26','2022-05-29',10,'Twin','Inactive'),(63,1,'2022-05-26','2022-05-27',10,'Twin','Inactive'),(64,1,'2022-05-26','2022-05-27',11,'Twin','Inactive'),(70,43,'2022-08-31','2022-09-02',12,'Single','Booked'),(74,1,'2022-09-06','2022-09-07',10,'Twin','Booked'),(75,43,'2022-09-07','2022-09-07',4,'Single','Inactive'),(76,43,'2022-09-07','2022-09-10',12,'Twin','Inactive');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `Customer_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(20) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Mobile` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `Username` varchar(150) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Credit_Number` varchar(20) NOT NULL,
  `Role` varchar(50) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Mobile` (`Mobile`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Credit_Number` (`Credit_Number`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Mr.','Neuve Limbu','Male','2003-05-04','+977 9866556657','neuvelimbu@gmail.com','KTM','Neuve720','0720','4576-2486-9876-3467','Customer'),(5,'Mr.','Nitesh Hamal','Male','2003-04-20','9813371345','nitesh0hamal@gmail.com','Jhapa','Nitesh720','0720','3453654654767','Corp Client'),(26,'Mr.','Yogya','Male','2002-05-01','9861432346','yogyata11@gmail.com','Bhaktapur','Yogyata12','1234','1234567891','Corp Client'),(30,'Mr.','Anil Timalsina','Male','2002-05-12','9864244266','anil112@gmail.com','Kupondole','Anil112','1122','5566738790','Customer'),(32,'Miss.','Smarika Ran','Female','2002-07-01','9823116871','Smarika99@gmail.com','Jhapa','Smarika9','9999','1238899765','Corp Client'),(33,'Mr.','Ritesh','Male','2000-05-25','9816864356','ritesh@gmail.com','Bhaktapur','Ritesh720','0720','5456-6543-5435-3346','Customer'),(34,'Mr.','Pravesh Shakya','Male','2000-05-25','981466543587','praveshshakya@gmail.com','Bhadrapur','Pravesh123','123','5435-6543-5433-5556','Customer'),(35,'Mr.','Biraj Pokhrel','Male','2001-12-11','9814578654','birajpokhrel@gmail.com','Chandragadhi','Biraj720','0720','5675-5456-3356-4335','Corp Client'),(36,'Mr.','Soya','Female','2002-05-01','9813226677','Soya12@gmail.com','Bhakta','Soya11','1111','1234567890','Customer'),(37,'Mr.','Loman','Male','2022-05-02','9810264299','loman123@gmail.com','swoyambhu','Loman34','loman54','00111000023','Customer'),(43,'Mr.','Hancie Phago','Male','2022-08-17','9825915122','hanciephago@gmail.com','KTM','Hancie720','1234','6456765758','Customer'),(46,'Mr.','Pravesh Rai','Male','2022-09-03','9856789345','praveshraaai@gmail.com','KTM','Pravesh7200','12345','4565467587','Customer'),(49,'Mr.','Hari Limbu','Male','2022-09-06','9836782456','harilimbu@gmail.com','KTM','Hari123','1234','2324543566','Customer');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `Registration_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Mobile` bigint(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Role` varchar(50) NOT NULL,
  PRIMARY KEY (`Registration_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,'Mr.','Nidaan Maharjan','New Baneshwor',9815566767,'nidaanmaharjan@gmail.com','Nidaan720','0720','Manager'),(2,'Miss','Nikita Thapa','Bhaktapur',98013455,'nikitathapa@gmail.com','Nikita720','0720','Receptionist'),(3,'Mr.','Nishav Rayamajhi','Kupondole',98134556655,'nishavrayamajhi@gmail.com','Nishav720','0720','Bar Staff'),(4,'Mr.','Loman Gurung','KTM',9813555444,'lomangurung@gmail.com','Loman720','0720','Restaurant Staff');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `Room_ID` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `rate` double(9,2) DEFAULT NULL,
  `rooms_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Room_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Double',2000.00,'Available'),(2,'Deluxe',3000.00,'Available'),(3,'Double',2000.00,'Available'),(4,'Single',1000.00,'Available'),(5,'Single',1000.00,'Available'),(6,'Double',2000.00,'Available'),(7,'Double',2000.00,'Available'),(8,'Single',1000.00,'Available'),(9,'Single',1000.00,'Available'),(10,'Twin',3000.00,'Available'),(11,'Twin',3000.00,'Available'),(12,'Twin',3000.00,'Available'),(13,'Single',1000.00,'Available');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-08 22:14:58
