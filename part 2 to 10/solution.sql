-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: db-und.ida.liu.se    Database: TDDD37
-- ------------------------------------------------------
-- Server version	5.5.52

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `TDDD37`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `TDDD37` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `TDDD37`;

--
-- Table structure for table `Question7CorrectResult`
--

DROP TABLE IF EXISTS `Question7CorrectResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question7CorrectResult` (
  `departure_city_name` varchar(30) DEFAULT NULL,
  `destination_city_name` varchar(30) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `departure_day` varchar(10) NOT NULL DEFAULT '',
  `departure_week` int(11) DEFAULT NULL,
  `departure_year` int(11) NOT NULL,
  `nr_of_free_seats` int(11) DEFAULT NULL,
  `current_price_per_seat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question7CorrectResult`
--

LOCK TABLES `Question7CorrectResult` WRITE;
/*!40000 ALTER TABLE `Question7CorrectResult` DISABLE KEYS */;
INSERT INTO `Question7CorrectResult` VALUES ('Minas Tirith','Hobbiton','09:00:00','Monday',1,2010,34,805),('Minas Tirith','Hobbiton','09:00:00','Monday',2,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',3,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',4,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',5,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',6,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',7,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',8,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',9,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',10,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',11,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',12,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',13,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',14,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',15,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',16,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',17,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',18,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',19,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',20,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',21,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',22,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',23,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',24,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',25,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',26,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',27,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',28,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',29,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',30,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',31,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',32,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',33,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',34,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',35,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',36,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',37,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',38,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',39,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',40,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',41,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',42,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',43,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',44,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',45,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',46,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',47,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',48,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',49,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',50,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',51,2010,40,115),('Minas Tirith','Hobbiton','09:00:00','Monday',52,2010,40,115),('Minas Tirith','Hobbiton','11:00:00','Sunday',1,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',2,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',3,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',4,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',5,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',6,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',7,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',8,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',9,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',10,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',11,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',12,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',13,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',14,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',15,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',16,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',17,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',18,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',19,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',20,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',21,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',22,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',23,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',24,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',25,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',26,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',27,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',28,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',29,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',30,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',31,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',32,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',33,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',34,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',35,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',36,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',37,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',38,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',39,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',40,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',41,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',42,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',43,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',44,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',45,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',46,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',47,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',48,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',49,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',50,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',51,2011,40,328.125),('Minas Tirith','Hobbiton','11:00:00','Sunday',52,2011,40,328.125),('Hobbiton','Minas Tirith','10:00:00','Tuesday',1,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',2,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',3,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',4,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',5,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',6,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',7,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',8,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',9,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',10,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',11,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',12,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',13,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',14,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',15,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',16,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',17,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',18,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',19,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',20,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',21,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',22,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',23,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',24,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',25,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',26,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',27,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',28,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',29,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',30,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',31,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',32,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',33,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',34,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',35,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',36,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',37,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',38,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',39,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',40,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',41,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',42,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',43,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',44,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',45,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',46,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',47,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',48,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',49,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',50,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',51,2010,40,138),('Hobbiton','Minas Tirith','10:00:00','Tuesday',52,2010,40,138),('Hobbiton','Minas Tirith','12:00:00','Sunday',1,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',2,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',3,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',4,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',5,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',6,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',7,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',8,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',9,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',10,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',11,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',12,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',13,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',14,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',15,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',16,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',17,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',18,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',19,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',20,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',21,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',22,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',23,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',24,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',25,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',26,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',27,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',28,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',29,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',30,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',31,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',32,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',33,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',34,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',35,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',36,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',37,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',38,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',39,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',40,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',41,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',42,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',43,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',44,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',45,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',46,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',47,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',48,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',49,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',50,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',51,2011,40,234.375),('Hobbiton','Minas Tirith','12:00:00','Sunday',52,2011,40,234.375);
/*!40000 ALTER TABLE `Question7CorrectResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (2);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-07 12:55:27
