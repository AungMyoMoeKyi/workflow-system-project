-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wfms_new_database
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` varchar(20) NOT NULL,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('DP01','Human Resource'),('DP02','Sales and Marketing'),('DP03','IT');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_form`
--

DROP TABLE IF EXISTS `leave_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_form` (
  `leave_form_id` varchar(20) NOT NULL,
  `leave_type` varchar(20) NOT NULL,
  `leave_applicant` varchar(20) NOT NULL,
  `start_date` varchar(20) NOT NULL,
  `end_date` varchar(20) NOT NULL,
  `date_range` double NOT NULL,
  `full_or_half` double NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `assign_to` varchar(45) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`leave_form_id`),
  KEY `leave_type_id_idx` (`leave_type`),
  KEY `applicant_id_idx` (`leave_applicant`),
  CONSTRAINT `leave_applicant` FOREIGN KEY (`leave_applicant`) REFERENCES `user` (`user_id`),
  CONSTRAINT `leave_type` FOREIGN KEY (`leave_type`) REFERENCES `leave_type` (`leave_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_form`
--

LOCK TABLES `leave_form` WRITE;
/*!40000 ALTER TABLE `leave_form` DISABLE KEYS */;
INSERT INTO `leave_form` VALUES ('LV2021/02/21-001','LV02','U005','02/25/2021','02/26/2021',2,1,'Travelling.','U006','2021-02-21'),('LV2021/02/21-002','LV01','U005','02/26/2021','02/26/2021',1,1,'Travelling','U006','2021-02-21'),('LV2021/03/07-003','LV01','U006','03/07/2021','03/08/2021',2,1,'To look after my mom at hospital','U005','2021-03-07'),('LV2021/03/07-004','LV01','U006','03/07/2021','03/09/2021',3,1,'Personal Case','U005','2021-03-07'),('LV2021/03/07-005','LV02','U006','03/07/2021','03/09/2021',3,1,'Personal Case!','U005','2021-03-07'),('LV2021/03/07-006','LV02','U006','03/07/2021','03/09/2021',3,1,'Personal Case!!','U005','2021-03-07'),('LV2021/03/08-007','LV01','U006','03/07/2021','03/09/2021',3,1,'Personal Case','U005','2021-03-08');
/*!40000 ALTER TABLE `leave_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_status`
--

DROP TABLE IF EXISTS `leave_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `approver` varchar(20) NOT NULL,
  `leave_form` varchar(20) NOT NULL,
  `status` varchar(45) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  KEY `approver_id_idx` (`approver`),
  KEY `request_form_id_idx` (`leave_form`),
  CONSTRAINT `leave_approver` FOREIGN KEY (`approver`) REFERENCES `user` (`user_id`),
  CONSTRAINT `leave_form` FOREIGN KEY (`leave_form`) REFERENCES `leave_form` (`leave_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_status`
--

LOCK TABLES `leave_status` WRITE;
/*!40000 ALTER TABLE `leave_status` DISABLE KEYS */;
INSERT INTO `leave_status` VALUES (41,'U003','LV2021/02/21-001','Rejected','not ok.','2021-02-21'),(42,'U004','LV2021/02/21-002','Sendback','please again','2021-02-21'),(43,'U002','LV2021/02/21-002','Approved Complete','ok','2021-02-21'),(44,'U003','LV2021/03/07-003','Sendback','Please submit again!','2021-03-07'),(45,'U003','LV2021/03/07-003','Approved','Yes','2021-03-07'),(46,'U004','LV2021/03/07-003','Approved','Yess!','2021-03-07'),(47,'U002','LV2021/03/07-003','Approved Complete','Of course!!','2021-03-07'),(48,'U002','LV2021/03/07-005','Rejected','Your leave is full!!','2021-03-07'),(49,'U004','LV2021/03/07-006','Approved Complete','I approved!','2021-03-07'),(50,'U003','LV2021/03/08-007','Approved','Approve','2021-03-08'),(51,'U004','LV2021/03/08-007','Approved','Approve!','2021-03-08'),(52,'U002','LV2021/03/08-007','Sendback','Incomplete!!','2021-03-08'),(53,'U002','LV2021/03/08-007','Approved Complete','Approved!!','2021-03-08');
/*!40000 ALTER TABLE `leave_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_type` (
  `leave_type_id` varchar(20) NOT NULL,
  `leave_name` varchar(45) NOT NULL,
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` VALUES ('LV01','Annual Leave'),('LV02','Medical Leave'),('LV03','Casual Leave');
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_form`
--

DROP TABLE IF EXISTS `ot_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_form` (
  `ot_form_id` varchar(20) NOT NULL,
  `ot_type` varchar(20) NOT NULL,
  `ot_applicant` varchar(20) NOT NULL,
  `start_time` varchar(40) NOT NULL,
  `end_time` varchar(40) NOT NULL,
  `time_range` varchar(40) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`ot_form_id`),
  KEY `ot_type_id_idx` (`ot_type`),
  KEY `applicant_id_idx` (`ot_applicant`),
  CONSTRAINT `ot_applicant` FOREIGN KEY (`ot_applicant`) REFERENCES `user` (`user_id`),
  CONSTRAINT `ot_type` FOREIGN KEY (`ot_type`) REFERENCES `ot_type` (`ot_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_form`
--

LOCK TABLES `ot_form` WRITE;
/*!40000 ALTER TABLE `ot_form` DISABLE KEYS */;
INSERT INTO `ot_form` VALUES ('OT2021/02/21-001','OT02','U005','02/27/2021 09:00','02/27/2021 17:00','8 hr 0 min','To finish task.','2021-02-21'),('OT2021/02/21-002','OT02','U005','02/27/2021 10:00','02/27/2021 17:00','7 hr 0 min','To finish task.','2021-02-21'),('OT2021/03/07-003','OT01','U005','03/07/2021 00:00','03/08/2021 23:00','47 hr 0 min','To finish tasks','2021-03-07'),('OT2021/03/08-004','OT01','U006','03/08/2021 18:00','03/09/2021 19:30','25 hr 30 min','To finish tasks','2021-03-08'),('OT2021/03/08-005','OT01','U006','03/08/2021 18:00','03/09/2021 19:00','25 hr 0 min','To finish tasks','2021-03-08'),('OT2021/03/08-006','OT02','U006','03/08/2021 06:00','03/10/2021 19:00','61 hr 0 min','To finish tasks','2021-03-08');
/*!40000 ALTER TABLE `ot_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_status`
--

DROP TABLE IF EXISTS `ot_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `approver` varchar(20) NOT NULL,
  `ot_form` varchar(20) NOT NULL,
  `status` varchar(45) NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  KEY `approver_idx` (`approver`),
  KEY `ot_form_idx` (`ot_form`),
  CONSTRAINT `ot_approver` FOREIGN KEY (`approver`) REFERENCES `user` (`user_id`),
  CONSTRAINT `ot_form` FOREIGN KEY (`ot_form`) REFERENCES `ot_form` (`ot_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_status`
--

LOCK TABLES `ot_status` WRITE;
/*!40000 ALTER TABLE `ot_status` DISABLE KEYS */;
INSERT INTO `ot_status` VALUES (34,'U003','OT2021/02/21-001','Rejected','not ok.','2021-02-21'),(35,'U004','OT2021/02/21-002','Sendback','please again','2021-02-21'),(36,'U002','OT2021/02/21-002','Approved Complete','ok','2021-02-21'),(37,'U003','OT2021/03/07-003','Sendback','Incomplete!','2021-03-07'),(38,'U003','OT2021/03/07-003','Rejected','No!','2021-03-07'),(39,'U003','OT2021/03/08-004','Approved','Yess!',NULL),(40,'U004','OT2021/03/08-004','Approved','yesss!','2021-03-08'),(41,'U002','OT2021/03/08-004','Sendback','Incomplete!','2021-03-08'),(42,'U002','OT2021/03/08-004','Approved Complete','Approved!','2021-03-08'),(43,'U002','OT2021/03/08-005','Rejected','Rejected!','2021-03-08'),(44,'U004','OT2021/03/08-006','Approved Complete','Approved!!','2021-03-08');
/*!40000 ALTER TABLE `ot_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_type`
--

DROP TABLE IF EXISTS `ot_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ot_type` (
  `ot_type_id` varchar(20) NOT NULL,
  `ot_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ot_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_type`
--

LOCK TABLES `ot_type` WRITE;
/*!40000 ALTER TABLE `ot_type` DISABLE KEYS */;
INSERT INTO `ot_type` VALUES ('OT01','Weekday'),('OT02','Weekend');
/*!40000 ALTER TABLE `ot_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` varchar(20) NOT NULL,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('R001','Staff'),('R002','Project Manager'),('R003','Head of Department'),('R004','HR'),('R005','Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone_no` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_idx` (`role`),
  KEY `department_idx` (`department`),
  CONSTRAINT `department` FOREIGN KEY (`department`) REFERENCES `department` (`department_id`),
  CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('U001','Phyo Zaw Oo','12345678','09757522354','phyozawoo@gmail.com','Male','YGN','R005','DP01'),('U002','Thet Zin Aye','12345678','09-458239273','tt123@gmail.com','Female','','R004','DP03'),('U003','Lin Lin','87654321','0938475504','meepont@gmail.com','Male','Ygn','R002','DP01'),('U004','Aung Myo Moe Kyi','87654321','0938475504','tt123@gmail.com','Female','Ygn','R003','DP01'),('U005','Aung Kaung Myat','12345678','09-458239273','phyozawoo@gmail.com','Male','Ygn','R001','DP01'),('U006','Michael','87654321','09-458239273','michael@gmail.com','Male','YGN','R001','DP01'),('U007','Owen','12345678','09-458239273','owen@gmail.com','Male','MDY','R002','DP03'),('U008','Rooney','12345678','09-458239273','rooney@gmail.com','Male','MDY','R003','DP03'),('U009','Steven','12345678','09-458239273','steven@gmail.com','Male','MDY','R004','DP01'),('U010','Lucas','12345678','09-458239273','lucas@gmail.com','Male','MDY','R005','DP03'),('U011','John','12345678','09-458239273','david@gmail.com','Male','YGN','R001','DP01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-04 19:47:11
