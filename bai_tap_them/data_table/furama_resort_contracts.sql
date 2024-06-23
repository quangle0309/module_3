-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: furama_resort
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_employee` int DEFAULT NULL,
  `id_customer` int DEFAULT NULL,
  `id_service` int DEFAULT NULL,
  `contract_date` date DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `deposits` decimal(10,0) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_employee` (`id_employee`),
  KEY `id_customer` (`id_customer`),
  KEY `id_service` (`id_service`),
  CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`),
  CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  CONSTRAINT `contracts_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,1,1,1,'2019-01-01','2019-01-10',100,1500),(2,2,2,2,'2019-02-01','2019-02-20',200,1600),(3,3,4,3,'2018-01-01','2018-01-05',100,800),(4,1,5,1,'2020-09-01','2020-09-20',200,4500),(5,2,3,2,'2019-10-10','2019-10-22',100,1900);
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 18:55:55
