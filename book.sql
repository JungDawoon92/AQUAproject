-- MySQL dump 10.16  Distrib 10.2.31-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: aqua
-- ------------------------------------------------------
-- Server version	10.2.31-MariaDB

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `pno` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(20) NOT NULL,
  `ref_ino` int(11) NOT NULL,
  `cnt` int(11) NOT NULL,
  `up_date` date NOT NULL,
  PRIMARY KEY (`pno`),
  KEY `ref_ino` (`ref_ino`),
  KEY `book_ibfk_2` (`ref_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`ref_ino`) REFERENCES `item` (`no`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`ref_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (16,'testId',93,2,'2020-05-13'),(18,'testId',91,2,'2020-05-13'),(19,'testId',91,8,'2020-05-13'),(23,'testId',90,2,'2020-05-14'),(24,'testId',88,2,'2020-05-14'),(25,'testId',71,2,'2020-05-14'),(29,'testId',88,2,'2020-05-14'),(30,'testId',89,2,'2020-05-14'),(31,'testId',89,2,'2020-05-14'),(32,'testId',90,2,'2020-05-14'),(33,'testId',9,2,'2020-05-14'),(34,'testId',43,2,'2020-05-14'),(35,'testId',65,2,'2020-05-14'),(36,'testId',23,2,'2020-05-14'),(37,'testId',89,2,'2020-05-14'),(38,'testId',11,2,'2020-05-14'),(39,'testId',65,2,'2020-05-14'),(40,'testId',72,2,'2020-05-14'),(41,'testId',76,2,'2020-05-14'),(42,'testId',77,2,'2020-05-14'),(43,'testId',71,2,'2020-05-14'),(44,'testId',89,2,'2020-05-14'),(45,'testId',71,2,'2020-05-14'),(46,'testId',95,1,'2020-05-14'),(47,'testId',94,2,'2020-05-14'),(48,'testId',12,10,'2020-05-14'),(49,'testId',16,2,'2020-05-14'),(50,'testId',92,2,'2020-05-14'),(51,'testId',93,2,'2020-05-14'),(52,'testId',92,2,'2020-05-14'),(53,'testId',94,2,'2020-05-14'),(54,'testId',94,2,'2020-05-14'),(55,'testId',94,2,'2020-05-14'),(56,'testId',92,2,'2020-05-14'),(90,'testId',107,2,'2020-05-15'),(91,'testId',188,2,'2020-05-16'),(92,'testId',193,2,'2020-05-17'),(93,'testId',192,1,'2020-05-17'),(95,'testId',193,2,'2020-05-18'),(96,'testId',191,2,'2020-05-18'),(97,'testId',1,2,'2020-05-18'),(98,'testId',191,2,'2020-05-18'),(99,'testId',164,1,'2020-05-18'),(107,'testId',4,1,'2020-05-18'),(109,'testId',161,2,'2020-05-18'),(110,'testId',189,2,'2020-05-18'),(111,'testId',1,3,'2020-05-18'),(114,'testId',193,2,'2020-05-19'),(115,'testId',192,2,'2020-05-19'),(116,'testId',191,2,'2020-05-20'),(117,'testId',1,2,'2020-05-20'),(118,'testId',193,1,'2020-05-21'),(119,'testId',193,1,'2020-05-21'),(121,'testId',192,2,'2020-05-21'),(126,'qwer',7,1,'2020-05-25'),(129,'testId',193,2,'2020-05-26'),(130,'testId',106,10,'2020-05-26'),(131,'testId',199,1,'2020-05-26'),(146,'qwer',192,1,'2020-05-27'),(151,'testId',190,5,'2020-05-27'),(159,'testId',190,9,'2020-05-27');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-28 15:39:11
