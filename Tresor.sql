-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel_management
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `customer_managements`
--

DROP TABLE IF EXISTS `customer_managements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_managements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `booking_history_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_history_id` (`booking_history_id`),
  CONSTRAINT `customer_managements_ibfk_1` FOREIGN KEY (`booking_history_id`) REFERENCES `room_reservations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_managements`
--

LOCK TABLES `customer_managements` WRITE;
/*!40000 ALTER TABLE `customer_managements` DISABLE KEYS */;
INSERT INTO `customer_managements` VALUES (1,'louis','andre','658248624','louis@gmail.com',3),(2,'mada','dess','86766786786','mada@gmail.com',2),(3,'ben','call','56465198165','ben@gmail.com',1);
/*!40000 ALTER TABLE `customer_managements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rate` varchar(200) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `reserve_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `reserve_id` (`reserve_id`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `customer_managements` (`id`),
  CONSTRAINT `feedbacks_ibfk_2` FOREIGN KEY (`reserve_id`) REFERENCES `room_reservations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'4','loved','2024-02-05',1,3),(2,'5','excellent','2024-06-12',3,2),(3,'2','not satisfied','2024-05-09',2,1);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_services`
--

DROP TABLE IF EXISTS `hotel_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service` varchar(200) DEFAULT NULL,
  `reserved_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reserve_id` (`reserved_id`),
  CONSTRAINT `reserve_id` FOREIGN KEY (`reserved_id`) REFERENCES `room_reservations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_services`
--

LOCK TABLES `hotel_services` WRITE;
/*!40000 ALTER TABLE `hotel_services` DISABLE KEYS */;
INSERT INTO `hotel_services` VALUES (1,'gym',3),(2,'spa',1),(3,'restaurant',2);
/*!40000 ALTER TABLE `hotel_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `method_name` varchar(200) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `payment_status` varchar(200) DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `payment_methods_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'paypal','make payments only via paypal','paid',3),(2,'bank','payments made through credit cards','partially paid',2),(3,'cash','payments paid cash','due',1);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cost` varchar(200) DEFAULT NULL,
  `additional_services` varchar(200) DEFAULT NULL,
  `taxes` varchar(200) DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `room_reservations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'20000','gym','2500',2),(2,'25000','restaurant','3000',1),(3,'5000','spa','5000',3);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_managements`
--

DROP TABLE IF EXISTS `room_managements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_managements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_type` varchar(200) DEFAULT NULL,
  `room_status` varchar(200) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_managements`
--

LOCK TABLES `room_managements` WRITE;
/*!40000 ALTER TABLE `room_managements` DISABLE KEYS */;
INSERT INTO `room_managements` VALUES (1,'suit','available',50000),(2,'double','occupied',25000),(3,'single','cleaning',2500);
/*!40000 ALTER TABLE `room_managements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_reservations`
--

DROP TABLE IF EXISTS `room_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `arrival_date` date DEFAULT NULL,
  `depature_date` date DEFAULT NULL,
  `number_of_guest` int DEFAULT NULL,
  `special_references` varchar(200) DEFAULT NULL,
  `reservation_status` varchar(200) DEFAULT NULL,
  `chosen_room_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chosen_room_id` (`chosen_room_id`),
  CONSTRAINT `room_reservations_ibfk_1` FOREIGN KEY (`chosen_room_id`) REFERENCES `room_managements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_reservations`
--

LOCK TABLES `room_reservations` WRITE;
/*!40000 ALTER TABLE `room_reservations` DISABLE KEYS */;
INSERT INTO `room_reservations` VALUES (1,'2024-02-05','2024-02-09',2,'none','confirmed',1),(2,'2024-03-08','2024-03-19',1,'none','canceled',3),(3,'2024-06-12','2024-06-18',3,'none','pending',2);
/*!40000 ALTER TABLE `room_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_details`
--

DROP TABLE IF EXISTS `service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detail` varchar(200) DEFAULT NULL,
  `opening_hours` varchar(200) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `service_details_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `hotel_services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_details`
--

LOCK TABLES `service_details` WRITE;
/*!40000 ALTER TABLE `service_details` DISABLE KEYS */;
INSERT INTO `service_details` VALUES (1,'both european and local meals','19:02:25',25000,3),(2,'all equipments required to exercise your body','06:30:00',2500,1),(3,'the best af all','15:20:00',3000,2);
/*!40000 ALTER TABLE `service_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 17:57:49
