-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: localhost    Database: ourspace
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basics`
--

DROP TABLE IF EXISTS `basics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basics`
--

LOCK TABLES `basics` WRITE;
/*!40000 ALTER TABLE `basics` DISABLE KEYS */;
INSERT INTO `basics` VALUES (1,'코딩의 기본은 공식 문서를 보자','2021-08-26 01:28:51.157674'),(2,'도커의 기본도 공식 문서이다.','2021-08-26 01:28:51.159417'),(3,'도커 공식 홈페이지 주소는 http://docker.com 이다','2021-08-26 01:28:51.160514'),(4,'백엔드 화이팅!!','2021-08-26 01:28:51.162056');
/*!40000 ALTER TABLE `basics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookers`
--

DROP TABLE IF EXISTS `bookers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `purpose` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookers`
--

LOCK TABLES `bookers` WRITE;
/*!40000 ALTER TABLE `bookers` DISABLE KEYS */;
INSERT INTO `bookers` VALUES (1,'예약자','01012345678','email@naver.com',NULL,NULL),(2,'예약자2','01012345679','email2@naver.com',NULL,NULL);
/*!40000 ALTER TABLE `bookers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'파티룸','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/category/category1.png'),(2,'연습실','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/category/category2.png'),(3,'보컬연습실','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/category/category3.png'),(4,'스터디룸','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/category/category4.png'),(5,'촬영스튜디오','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/category/category5.png'),(6,'회의실','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/category/category6.png'),(7,'세미나실','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/category/category7.png'),(8,'악기연습실','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/category/category8.png');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `lattitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'강남',37.519066,127.047099),(2,'강북',37.639955,127.025507),(3,'강서',37.550755,126.849454),(4,'강동',37.529883,127.123644);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'basic','basic'),(1,'contenttypes','contenttype'),(11,'orders','booker'),(13,'orders','order'),(12,'orders','orderstatus'),(2,'sessions','session'),(4,'spaces','category'),(5,'spaces','district'),(10,'spaces','facility'),(9,'spaces','image'),(8,'spaces','option'),(7,'spaces','review'),(6,'spaces','space'),(3,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-08-25 14:01:03.870028'),(2,'contenttypes','0002_remove_content_type_name','2021-08-25 14:01:03.917340'),(3,'users','0001_initial','2021-08-25 14:01:03.939182'),(4,'spaces','0001_initial','2021-08-25 14:01:04.246926'),(5,'orders','0001_initial','2021-08-25 14:01:04.397589'),(6,'sessions','0001_initial','2021-08-25 14:01:04.415272'),(7,'basic','0001_initial','2021-08-26 01:28:50.754184'),(8,'basic','0002_remove_basic_updated_at','2021-08-26 01:28:50.795658'),(9,'users','0002_alter_user_email','2021-08-26 16:41:34.652524');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'TV','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/facility/182cb6ff-5112-40b3-ae0a-aa3ba391b17afacility1.png'),(2,'WIFI','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/facility/8a1d5613-427e-4d2d-a100-091dbfd25557facility2.png'),(3,'DOG','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/facility/1169c2bf-911a-4ad3-9e0e-8cbabcdc0d2ffacility3.png'),(4,'BED','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/facility/589c5e20-fcf8-4ca2-8184-8c7eabc925a1facility4.png'),(5,'BEER','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/facility/481f8976-ff4b-4245-a9b4-36a8a1265c1bfacility5.png'),(6,'CAR','https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/facility/6e9797c8-6869-4dbc-b6e4-15c8985e5508facility6.png');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities_space`
--

DROP TABLE IF EXISTS `facilities_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities_space` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `facility_id` bigint NOT NULL,
  `space_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `facilities_space_facility_id_space_id_5cc5ed6d_uniq` (`facility_id`,`space_id`),
  KEY `facilities_space_space_id_8aa4eebf_fk_spaces_id` (`space_id`),
  CONSTRAINT `facilities_space_facility_id_6dd42f6a_fk_facilities_id` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`),
  CONSTRAINT `facilities_space_space_id_8aa4eebf_fk_spaces_id` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities_space`
--

LOCK TABLES `facilities_space` WRITE;
/*!40000 ALTER TABLE `facilities_space` DISABLE KEYS */;
INSERT INTO `facilities_space` VALUES (1,1,1),(3,1,2),(13,1,6),(24,1,10),(34,1,13),(44,1,16),(48,1,17),(50,1,18),(60,1,22),(71,1,26),(82,1,29),(92,1,32),(101,1,35),(104,1,36),(107,1,37),(109,1,38),(125,1,44),(135,1,47),(144,1,50),(147,1,51),(150,1,52),(152,1,53),(164,1,58),(174,1,61),(184,1,64),(188,1,65),(190,1,66),(200,1,70),(206,1,72),(213,1,75),(218,1,76),(222,1,77),(225,1,79),(234,1,84),(310,1,126),(311,1,127),(2,2,1),(4,2,2),(8,2,4),(11,2,5),(14,2,6),(17,2,7),(25,2,10),(30,2,12),(45,2,16),(49,2,17),(51,2,18),(55,2,20),(58,2,21),(61,2,22),(64,2,23),(72,2,26),(78,2,28),(93,2,32),(99,2,34),(105,2,36),(117,2,41),(121,2,43),(136,2,47),(142,2,49),(148,2,51),(160,2,56),(165,2,58),(170,2,60),(185,2,64),(189,2,65),(191,2,66),(195,2,68),(198,2,69),(201,2,70),(207,2,72),(214,2,75),(223,2,78),(312,2,127),(9,3,4),(18,3,7),(22,3,9),(26,3,10),(31,3,12),(41,3,15),(56,3,20),(65,3,23),(69,3,25),(73,3,26),(79,3,28),(89,3,31),(96,3,33),(102,3,35),(108,3,37),(112,3,39),(114,3,40),(122,3,43),(132,3,46),(139,3,48),(145,3,50),(151,3,52),(155,3,54),(157,3,55),(162,3,57),(166,3,58),(171,3,60),(181,3,63),(196,3,68),(204,3,71),(208,3,72),(211,3,73),(224,3,78),(279,3,110),(306,3,124),(308,3,125),(6,4,3),(10,4,4),(19,4,8),(27,4,10),(32,4,12),(35,4,13),(38,4,14),(46,4,16),(53,4,19),(57,4,20),(66,4,24),(74,4,26),(80,4,28),(83,4,29),(86,4,30),(94,4,32),(97,4,33),(100,4,34),(106,4,36),(113,4,39),(123,4,43),(126,4,44),(129,4,45),(137,4,47),(140,4,48),(143,4,49),(149,4,51),(156,4,54),(167,4,58),(172,4,60),(175,4,61),(178,4,62),(186,4,64),(193,4,67),(197,4,68),(209,4,72),(215,4,75),(219,4,76),(280,4,110),(307,4,124),(309,4,125),(314,4,127),(5,5,2),(7,5,3),(15,5,6),(20,5,8),(23,5,9),(28,5,10),(36,5,13),(39,5,14),(42,5,15),(47,5,16),(52,5,18),(54,5,19),(62,5,22),(67,5,24),(70,5,25),(75,5,26),(76,5,27),(84,5,29),(87,5,30),(90,5,31),(95,5,32),(98,5,33),(103,5,35),(110,5,38),(115,5,40),(118,5,41),(119,5,42),(127,5,44),(130,5,45),(133,5,46),(138,5,47),(141,5,48),(146,5,50),(153,5,53),(158,5,55),(161,5,56),(163,5,57),(168,5,58),(176,5,61),(179,5,62),(182,5,63),(187,5,64),(192,5,66),(194,5,67),(202,5,70),(205,5,71),(210,5,72),(216,5,75),(221,5,76),(226,5,80),(228,5,81),(230,5,82),(232,5,83),(235,5,85),(237,5,86),(239,5,87),(241,5,88),(243,5,89),(245,5,90),(247,5,91),(249,5,92),(251,5,93),(254,5,94),(256,5,95),(257,5,96),(259,5,97),(261,5,98),(263,5,99),(265,5,100),(267,5,101),(269,5,102),(271,5,103),(273,5,104),(275,5,105),(277,5,106),(281,5,111),(284,5,112),(286,5,113),(288,5,114),(289,5,115),(290,5,116),(292,5,117),(294,5,118),(296,5,119),(298,5,120),(300,5,121),(302,5,122),(304,5,123),(315,5,127),(12,6,5),(16,6,6),(21,6,8),(29,6,11),(33,6,12),(37,6,13),(40,6,14),(43,6,15),(59,6,21),(63,6,22),(68,6,24),(77,6,27),(81,6,28),(85,6,29),(88,6,30),(91,6,31),(111,6,38),(116,6,40),(120,6,42),(124,6,43),(128,6,44),(131,6,45),(134,6,46),(154,6,53),(159,6,55),(169,6,59),(173,6,60),(177,6,61),(180,6,62),(183,6,63),(199,6,69),(203,6,70),(212,6,73),(217,6,75),(220,6,76),(227,6,80),(229,6,81),(231,6,82),(233,6,83),(236,6,85),(238,6,86),(240,6,87),(242,6,88),(244,6,89),(246,6,90),(248,6,91),(250,6,92),(252,6,93),(253,6,94),(255,6,95),(258,6,96),(260,6,97),(262,6,98),(264,6,99),(266,6,100),(268,6,101),(270,6,102),(272,6,103),(274,6,104),(276,6,105),(278,6,106),(282,6,111),(283,6,112),(285,6,113),(287,6,114),(291,6,116),(293,6,117),(295,6,118),(297,6,119),(299,6,120),(301,6,121),(303,6,122),(305,6,123),(313,6,127);
/*!40000 ALTER TABLE `facilities_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `space_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `images_space_id_b17bee2e_fk_spaces_id` (`space_id`),
  CONSTRAINT `images_space_id_b17bee2e_fk_spaces_id` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/1.jpg',1),(2,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/2.jpg',1),(3,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/3.jpg',1),(4,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/4.jpg',2),(5,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/5.jpg',2),(6,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/6.jpg',2),(7,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/7.jpg',3),(8,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/8.jpg',3),(9,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/9.jpg',3),(10,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/10.jpg',4),(11,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/11.jpg',4),(12,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/12.jpg',4),(13,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/13.jpg',5),(14,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/14.jpg',5),(15,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/15.jpg',5),(16,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/16.jpg',6),(17,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/17.jpg',6),(18,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/18.jpg',6),(19,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/19.jpg',7),(20,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/20.jpg',7),(21,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/21.jpg',7),(22,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/22.jpg',8),(23,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/23.jpg',8),(24,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/24.jpg',8),(25,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/25.jpg',9),(26,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/26.jpg',9),(27,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/27.jpg',9),(28,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/28.jpg',10),(29,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/29.jpg',10),(30,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/30.jpg',10),(31,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/1.jpg',11),(32,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/2.jpg',11),(33,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/3.jpg',11),(34,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/4.jpg',12),(35,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/5.jpg',12),(36,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/6.jpg',12),(37,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/7.jpg',13),(38,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/8.jpg',13),(39,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/9.jpg',13),(40,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/10.jpg',14),(41,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/11.jpg',14),(42,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/12.jpg',14),(43,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/13.jpg',15),(44,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/14.jpg',15),(45,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/15.jpg',15),(46,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/16.jpg',16),(47,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/17.jpg',16),(48,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/18.jpg',16),(49,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/19.jpg',17),(50,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/20.jpg',17),(51,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/21.jpg',17),(52,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/22.jpg',18),(53,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/23.jpg',18),(54,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/24.jpg',18),(55,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/25.jpg',19),(56,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/26.jpg',19),(57,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/27.jpg',19),(58,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/28.jpg',20),(59,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/29.jpg',20),(60,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/30.jpg',20),(61,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/1.jpg',21),(62,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/2.jpg',21),(63,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/3.jpg',21),(64,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/4.jpg',22),(65,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/5.jpg',22),(66,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/6.jpg',22),(67,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/7.jpg',23),(68,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/8.jpg',23),(69,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/9.jpg',23),(70,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/10.jpg',24),(71,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/11.jpg',24),(72,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/12.jpg',24),(73,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/13.jpg',25),(74,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/14.jpg',25),(75,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/15.jpg',25),(76,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/16.jpg',26),(77,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/17.jpg',26),(78,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/18.jpg',26),(79,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/19.jpg',27),(80,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/20.jpg',27),(81,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/21.jpg',27),(82,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/22.jpg',28),(83,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/23.jpg',28),(84,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/24.jpg',28),(85,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/25.jpg',29),(86,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/26.jpg',29),(87,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/27.jpg',29),(88,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/28.jpg',30),(89,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/29.jpg',30),(90,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/30.jpg',30),(91,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/1.jpg',31),(92,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/2.jpg',31),(93,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/3.jpg',31),(94,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/4.jpg',32),(95,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/5.jpg',32),(96,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/6.jpg',32),(97,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/7.jpg',33),(98,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/8.jpg',33),(99,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/9.jpg',33),(100,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/10.jpg',34),(101,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/11.jpg',34),(102,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/12.jpg',34),(103,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/13.jpg',35),(104,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/14.jpg',35),(105,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/15.jpg',35),(106,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/16.jpg',36),(107,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/17.jpg',36),(108,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/18.jpg',36),(109,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/19.jpg',37),(110,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/20.jpg',37),(111,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/21.jpg',37),(112,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/22.jpg',38),(113,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/23.jpg',38),(114,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/24.jpg',38),(115,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/25.jpg',39),(116,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/26.jpg',39),(117,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/27.jpg',39),(118,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/28.jpg',40),(119,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/29.jpg',40),(120,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/30.jpg',40),(121,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/1.jpg',41),(122,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/2.jpg',41),(123,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/3.jpg',41),(124,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/4.jpg',42),(125,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/5.jpg',42),(126,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/6.jpg',42),(127,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/7.jpg',43),(128,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/8.jpg',43),(129,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/9.jpg',43),(130,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/10.jpg',44),(131,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/11.jpg',44),(132,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/12.jpg',44),(133,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/13.jpg',45),(134,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/14.jpg',45),(135,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/15.jpg',45),(136,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/16.jpg',46),(137,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/17.jpg',46),(138,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/18.jpg',46),(139,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/19.jpg',47),(140,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/20.jpg',47),(141,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/21.jpg',47),(142,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/22.jpg',48),(143,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/23.jpg',48),(144,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/24.jpg',48),(145,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/25.jpg',49),(146,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/26.jpg',49),(147,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/27.jpg',49),(148,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/28.jpg',50),(149,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/29.jpg',50),(150,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/30.jpg',50),(151,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/1.jpg',51),(152,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/2.jpg',51),(153,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/3.jpg',51),(154,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/4.jpg',52),(155,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/5.jpg',52),(156,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/6.jpg',52),(157,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/7.jpg',53),(158,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/8.jpg',53),(159,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/9.jpg',53),(160,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/10.jpg',54),(161,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/11.jpg',54),(162,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/12.jpg',54),(163,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/13.jpg',55),(164,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/14.jpg',55),(165,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/15.jpg',55),(166,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/16.jpg',56),(167,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/17.jpg',56),(168,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/18.jpg',56),(169,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/19.jpg',57),(170,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/20.jpg',57),(171,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/21.jpg',57),(172,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/22.jpg',58),(173,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/23.jpg',58),(174,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/24.jpg',58),(175,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/25.jpg',59),(176,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/26.jpg',59),(177,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/27.jpg',59),(178,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/28.jpg',60),(179,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/29.jpg',60),(180,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/30.jpg',60),(181,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/1.jpg',61),(182,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/2.jpg',61),(183,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/3.jpg',61),(184,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/4.jpg',62),(185,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/5.jpg',62),(186,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/6.jpg',62),(187,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/7.jpg',63),(188,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/8.jpg',63),(189,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/9.jpg',63),(190,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/10.jpg',64),(191,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/11.jpg',64),(192,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/12.jpg',64),(193,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/13.jpg',65),(194,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/14.jpg',65),(195,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/15.jpg',65),(196,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/16.jpg',66),(197,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/17.jpg',66),(198,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/18.jpg',66),(199,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/19.jpg',67),(200,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/20.jpg',67),(201,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/21.jpg',67),(202,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/22.jpg',68),(203,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/23.jpg',68),(204,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/24.jpg',68),(205,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/25.jpg',69),(206,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/26.jpg',69),(207,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/27.jpg',69),(208,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/28.jpg',70),(209,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/29.jpg',70),(210,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/30.jpg',70),(211,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/1.jpg',71),(212,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/2.jpg',71),(213,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/3.jpg',71),(214,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/4.jpg',72),(215,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/5.jpg',72),(216,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/6.jpg',72),(217,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/7.jpg',73),(218,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/8.jpg',73),(219,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/9.jpg',73),(220,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/c06fc36e-7ffa-4cf6-bfd0-6d8dea8a0aa3TIL.png',77),(221,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/80d64a97-be91-4b01-b20c-7b898d5571fbTIL.png',79),(222,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/0af9152d-a87b-48c1-9d4a-c0fe4037c7b7TIL.png',84),(223,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/09c5ce6a-48ee-45e3-8006-34e7a5314dd6con2_3.png',111),(224,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/45b0e0fe-36ff-4afc-8c2f-ade4b5909e3fcon2_1.png',116),(225,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/783fc71e-9949-4687-9423-7cda7dd5622ccon3_1.png',117),(226,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/621f646f-e41d-4dcb-8c1b-1ba1cde84c0bcon3_1.png',118),(227,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/dcbe32e7-62b6-408f-8059-a5caf2a1347fcon2_1.png',119),(228,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/612cd1eb-42fc-4ab4-9349-b95033ce99a4con2_2.png',120),(229,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/cec79335-4fbd-4437-8dd8-2f516e6dc74acon2_3.png',124),(230,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/fa4712af-76f7-4762-8866-d124f3a6d987con2_3.png',125),(231,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/d85eb2e3-29e9-4041-b9b8-22e4ea2d288dTIL.png',126),(232,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/b5bd3b43-f54d-4d61-b4f7-15e2317cadcapeople-2575362_640.jpg',127),(233,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/cc7d8ca3-c5c3-4e16-88af-2699c20e23c4problem-2778155_640.png',127),(234,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/c7221b19-9aab-4bcf-9d75-9e88a6e2cfc7sign-1719905_640.png',127),(235,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/image/df864411-98b9-4746-85ff-07e486a14a36writing-828911_1920.jpg',127);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `option` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `space_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `options_space_id_abaa0af0_fk_spaces_id` (`space_id`),
  CONSTRAINT `options_space_id_abaa0af0_fk_spaces_id` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'day',5000.00,1),(2,'night',10000.00,1),(3,'all',14000.00,1),(4,'day',4000.00,2),(5,'night',5000.00,2),(6,'all',8000.00,2),(7,'day',10000.00,3),(8,'night',9000.00,3),(9,'all',20000.00,3),(10,'day',50000.00,4),(11,'night',30000.00,4),(12,'all',80000.00,4),(13,'day',30000.00,5),(14,'night',25000.00,5),(15,'all',50000.00,5),(16,'day',7777.00,6),(17,'night',8888.00,6),(18,'all',15555.00,6),(19,'day',5000.00,7),(20,'night',10000.00,7),(21,'all',14000.00,7),(22,'day',4000.00,8),(23,'night',5000.00,8),(24,'all',8000.00,8),(25,'day',10000.00,9),(26,'night',9000.00,9),(27,'all',20000.00,9),(28,'day',50000.00,10),(29,'night',30000.00,10),(30,'all',80000.00,10),(31,'day',30000.00,11),(32,'night',25000.00,11),(33,'all',50000.00,11),(34,'day',7777.00,12),(35,'night',8888.00,12),(36,'all',15555.00,12),(37,'day',5000.00,13),(38,'night',10000.00,13),(39,'all',14000.00,13),(40,'day',4000.00,14),(41,'night',5000.00,14),(42,'all',8000.00,14),(43,'day',10000.00,15),(44,'night',9000.00,15),(45,'all',20000.00,15),(46,'day',50000.00,16),(47,'night',30000.00,16),(48,'all',80000.00,16),(49,'day',5000.00,17),(50,'night',10000.00,17),(51,'all',14000.00,17),(52,'day',4000.00,18),(53,'night',5000.00,18),(54,'all',8000.00,18),(55,'day',10000.00,19),(56,'night',9000.00,19),(57,'all',20000.00,19),(58,'day',50000.00,20),(59,'night',30000.00,20),(60,'all',80000.00,20),(61,'day',30000.00,21),(62,'night',25000.00,21),(63,'all',50000.00,21),(64,'day',7777.00,22),(65,'night',8888.00,22),(66,'all',15555.00,22),(67,'day',5000.00,23),(68,'night',10000.00,23),(69,'all',14000.00,23),(70,'day',4000.00,24),(71,'night',5000.00,24),(72,'all',8000.00,24),(73,'day',10000.00,25),(74,'night',9000.00,25),(75,'all',20000.00,25),(76,'day',50000.00,26),(77,'night',30000.00,26),(78,'all',80000.00,26),(79,'day',30000.00,27),(80,'night',25000.00,27),(81,'all',50000.00,27),(82,'day',7777.00,28),(83,'night',8888.00,28),(84,'all',15555.00,28),(85,'day',5000.00,29),(86,'night',10000.00,29),(87,'all',14000.00,29),(88,'day',4000.00,30),(89,'night',5000.00,30),(90,'all',8000.00,30),(91,'day',10000.00,31),(92,'night',9000.00,31),(93,'all',20000.00,31),(94,'day',50000.00,32),(95,'night',30000.00,32),(96,'all',80000.00,32),(97,'day',5000.00,33),(98,'night',10000.00,33),(99,'all',14000.00,33),(100,'day',4000.00,34),(101,'night',5000.00,34),(102,'all',8000.00,34),(103,'day',10000.00,35),(104,'night',9000.00,35),(105,'all',20000.00,35),(106,'day',50000.00,36),(107,'night',30000.00,36),(108,'all',80000.00,36),(109,'day',30000.00,37),(110,'night',25000.00,37),(111,'all',50000.00,37),(112,'day',7777.00,38),(113,'night',8888.00,38),(114,'all',15555.00,38),(115,'day',5000.00,39),(116,'night',10000.00,39),(117,'all',14000.00,39),(118,'day',4000.00,40),(119,'night',5000.00,40),(120,'all',8000.00,40),(121,'day',10000.00,41),(122,'night',9000.00,41),(123,'all',20000.00,41),(124,'day',50000.00,42),(125,'night',30000.00,42),(126,'all',80000.00,42),(127,'day',30000.00,43),(128,'night',25000.00,43),(129,'all',50000.00,43),(130,'day',7777.00,44),(131,'night',8888.00,44),(132,'all',15555.00,44),(133,'day',5000.00,45),(134,'night',10000.00,45),(135,'all',14000.00,45),(136,'day',4000.00,46),(137,'night',5000.00,46),(138,'all',8000.00,46),(139,'day',10000.00,47),(140,'night',9000.00,47),(141,'all',20000.00,47),(142,'day',50000.00,48),(143,'night',30000.00,48),(144,'all',80000.00,48),(145,'day',5000.00,49),(146,'night',10000.00,49),(147,'all',14000.00,49),(148,'day',4000.00,50),(149,'night',5000.00,50),(150,'all',8000.00,50),(151,'day',10000.00,51),(152,'night',9000.00,51),(153,'all',20000.00,51),(154,'day',50000.00,52),(155,'night',30000.00,52),(156,'all',80000.00,52),(157,'day',30000.00,53),(158,'night',25000.00,53),(159,'all',50000.00,53),(160,'day',7777.00,54),(161,'night',8888.00,54),(162,'all',15555.00,54),(163,'day',5000.00,55),(164,'night',10000.00,55),(165,'all',14000.00,55),(166,'day',4000.00,56),(167,'night',5000.00,56),(168,'all',8000.00,56),(169,'day',10000.00,57),(170,'night',9000.00,57),(171,'all',20000.00,57),(172,'day',50000.00,58),(173,'night',30000.00,58),(174,'all',80000.00,58),(175,'day',30000.00,59),(176,'night',25000.00,59),(177,'all',50000.00,59),(178,'day',7777.00,60),(179,'night',8888.00,60),(180,'all',15555.00,60),(181,'day',5000.00,61),(182,'night',10000.00,61),(183,'all',14000.00,61),(184,'day',4000.00,62),(185,'night',5000.00,62),(186,'all',8000.00,62),(187,'day',10000.00,63),(188,'night',9000.00,63),(189,'all',20000.00,63),(190,'day',50000.00,64),(191,'night',30000.00,64),(192,'all',80000.00,64),(193,'day',5000.00,65),(194,'night',10000.00,65),(195,'all',14000.00,65),(196,'day',4000.00,66),(197,'night',5000.00,66),(198,'all',8000.00,66),(199,'day',10000.00,67),(200,'night',9000.00,67),(201,'all',20000.00,67),(202,'day',50000.00,68),(203,'night',30000.00,68),(204,'all',80000.00,68),(205,'day',30000.00,69),(206,'night',25000.00,69),(207,'all',50000.00,69),(208,'day',7777.00,70),(209,'night',8888.00,70),(210,'all',15555.00,70),(211,'day',5000.00,71),(212,'night',10000.00,71),(213,'all',14000.00,71),(214,'day',4000.00,72),(215,'night',5000.00,72),(216,'all',8000.00,72),(217,'day',10000.00,73),(218,'night',9000.00,73),(219,'all',20000.00,73),(223,'day',50000.00,75),(224,'night',50000.00,75),(225,'all',90000.00,75),(226,'day',50000.00,76),(227,'night',50000.00,76),(228,'all',90000.00,76),(229,'day',50000.00,77),(230,'night',50000.00,77),(231,'all',50000.00,77),(232,'day',1.00,78),(233,'night',1.00,78),(234,'all',1.00,78),(235,'day',50000.00,79),(236,'night',50000.00,79),(237,'all',50000.00,79),(238,'day',1.00,80),(239,'night',1.00,80),(240,'all',1.00,80),(241,'day',1.00,81),(242,'night',1.00,81),(243,'all',1.00,81),(244,'day',1.00,82),(245,'night',1.00,82),(246,'all',1.00,82),(247,'day',1.00,83),(248,'night',1.00,83),(249,'all',1.00,83),(250,'day',50000.00,84),(251,'night',50000.00,84),(252,'all',50000.00,84),(253,'day',1.00,85),(254,'night',1.00,85),(255,'all',1.00,85),(256,'day',1.00,86),(257,'night',1.00,86),(258,'all',1.00,86),(259,'day',1.00,87),(260,'night',1.00,87),(261,'all',1.00,87),(262,'day',1.00,88),(263,'night',1.00,88),(264,'all',1.00,88),(265,'day',1.00,89),(266,'night',1.00,89),(267,'all',1.00,89),(268,'day',1.00,90),(269,'night',1.00,90),(270,'all',1.00,90),(271,'day',1.00,91),(272,'night',1.00,91),(273,'all',1.00,91),(274,'day',1.00,92),(275,'night',1.00,92),(276,'all',1.00,92),(277,'day',1.00,93),(278,'night',1.00,93),(279,'all',1.00,93),(280,'day',1.00,94),(281,'night',1.00,94),(282,'all',1.00,94),(283,'day',1.00,95),(284,'night',1.00,95),(285,'all',1.00,95),(286,'day',1.00,96),(287,'night',1.00,96),(288,'all',1.00,96),(289,'day',1.00,97),(290,'night',1.00,97),(291,'all',1.00,97),(292,'day',1.00,98),(293,'night',1.00,98),(294,'all',1.00,98),(295,'day',1.00,99),(296,'night',1.00,99),(297,'all',1.00,99),(298,'day',1.00,100),(299,'night',1.00,100),(300,'all',1.00,100),(301,'day',1.00,101),(302,'night',1.00,101),(303,'all',1.00,101),(304,'day',1.00,102),(305,'night',1.00,102),(306,'all',1.00,102),(307,'day',1.00,103),(308,'night',1.00,103),(309,'all',1.00,103),(310,'day',1.00,104),(311,'night',1.00,104),(312,'all',1.00,104),(313,'day',1.00,105),(314,'night',1.00,105),(315,'all',1.00,105),(316,'day',1.00,106),(317,'night',1.00,106),(318,'all',1.00,106),(328,'day',200.00,110),(329,'night',200.00,110),(330,'all',200.00,110),(331,'day',1.00,111),(332,'night',1.00,111),(333,'all',1.00,111),(334,'day',1.00,112),(335,'night',1.00,112),(336,'all',1.00,112),(337,'day',1.00,113),(338,'night',1.00,113),(339,'all',1.00,113),(340,'day',1.00,114),(341,'night',1.00,114),(342,'all',1.00,114),(343,'day',1.00,115),(344,'night',1.00,115),(345,'all',1.00,115),(346,'day',1.00,116),(347,'night',1.00,116),(348,'all',1.00,116),(349,'day',1.00,117),(350,'night',1.00,117),(351,'all',1.00,117),(352,'day',1.00,118),(353,'night',1.00,118),(354,'all',1.00,118),(355,'day',1.00,119),(356,'night',1.00,119),(357,'all',1.00,119),(358,'day',1.00,120),(359,'night',1.00,120),(360,'all',1.00,120),(361,'day',1.00,121),(362,'night',1.00,121),(363,'all',1.00,121),(364,'day',1.00,122),(365,'night',1.00,122),(366,'all',1.00,122),(367,'day',1.00,123),(368,'night',1.00,123),(369,'all',1.00,123),(370,'day',10.00,124),(371,'night',10.00,124),(372,'all',10.00,124),(373,'day',10.00,125),(374,'night',10.00,125),(375,'all',10.00,125),(376,'day',50000.00,126),(377,'night',50000.00,126),(378,'all',50000.00,126),(379,'day',50000.00,127),(380,'night',50000.00,127),(381,'all',90000.00,127);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `date` date NOT NULL,
  `booker_id` bigint DEFAULT NULL,
  `option_id` bigint NOT NULL,
  `space_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_booker_id_45fd9db5_fk_bookers_id` (`booker_id`),
  KEY `orders_option_id_31d7e715_fk_options_id` (`option_id`),
  KEY `orders_space_id_a105c5d1_fk_spaces_id` (`space_id`),
  KEY `orders_status_id_e763064e_fk_statuses_id` (`status_id`),
  KEY `orders_user_id_7e2523fb_fk_users_id` (`user_id`),
  CONSTRAINT `orders_booker_id_45fd9db5_fk_bookers_id` FOREIGN KEY (`booker_id`) REFERENCES `bookers` (`id`),
  CONSTRAINT `orders_option_id_31d7e715_fk_options_id` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  CONSTRAINT `orders_space_id_a105c5d1_fk_spaces_id` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`),
  CONSTRAINT `orders_status_id_e763064e_fk_statuses_id` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `orders_user_id_7e2523fb_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,4,'2021-08-26',1,15,5,2,2),(2,4,'2021-08-26',1,16,6,2,2),(3,4,'2021-08-26',1,17,6,2,2),(4,4,'2021-08-26',1,20,7,2,2),(5,5,'2021-08-26',2,3,1,2,2),(6,5,'2021-08-26',2,4,2,2,2),(7,5,'2021-08-26',2,5,2,2,2),(8,5,'2021-08-26',2,8,3,2,2),(9,5,'2021-08-26',2,10,4,2,2),(62,3,'2021-08-27',NULL,119,40,1,1),(65,2,'2021-08-27',NULL,379,127,1,13);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_at` datetime(6) NOT NULL,
  `grade` decimal(4,2) NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `space_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_space_id_5d620892_fk_spaces_id` (`space_id`),
  KEY `reviews_user_id_c23b0903_fk_users_id` (`user_id`),
  CONSTRAINT `reviews_space_id_5d620892_fk_spaces_id` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`),
  CONSTRAINT `reviews_user_id_c23b0903_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/review/fa330759-d0e3-43cb-979a-717ff64ae97aTIL.png','2021-08-25 21:57:15.567269',4.00,'\"안녕하세요?\"',1,1),(2,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/review/4938d2d2-3a24-4bc2-8db6-e52aaa97c154TIL.png','2021-08-25 21:59:16.171860',4.00,'\"안녕하세요?\"',1,1),(3,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/review14c0351b-fa90-4eee-9d9c-b08378dba0f5TIL.png','2021-08-26 00:48:51.438224',4.00,'\"안녕하세요?\"',1,1),(4,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/review/cc473e80-244b-4d5c-9800-4feeff601bdaTIL.png','2021-08-26 00:58:37.596268',4.00,'\"안녕하세요?\"',1,1),(5,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/review/5043c192-9736-4553-aeb2-f80c5b0b7d58TIL.png','2021-08-26 00:59:50.397577',4.00,'\"안녕하세요?\"',1,1),(6,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/review/76514e58-abf6-486d-90e9-5ca027c9c84fTIL.png','2021-08-26 01:21:09.928337',4.00,'\"안녕하세요?\"',1,1),(7,'https://ourspace-js.s3.ap-northeast-2.amazonaws.com/static/review/ebeb3891-9247-4fb8-b13b-6c90d835b6cbTIL.png','2021-08-26 01:38:31.754921',4.00,'\"안녕하세요?\"',1,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces`
--

DROP TABLE IF EXISTS `spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spaces` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `sub_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `min_count` int NOT NULL,
  `max_count` int NOT NULL,
  `like` int NOT NULL,
  `lattitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` bigint NOT NULL,
  `district_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spaces_category_id_852ef44b_fk_categories_id` (`category_id`),
  KEY `spaces_district_id_7eaa64f1_fk_districts_id` (`district_id`),
  KEY `spaces_user_id_2e66fc2b_fk_users_id` (`user_id`),
  CONSTRAINT `spaces_category_id_852ef44b_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `spaces_district_id_7eaa64f1_fk_districts_id` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `spaces_user_id_2e66fc2b_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces`
--

LOCK TABLES `spaces` WRITE;
/*!40000 ALTER TABLE `spaces` DISABLE KEYS */;
INSERT INTO `spaces` VALUES (1,'서울각 스튜디오 파티룸 세미나실','서울역, 느낌있는 공간 스튜디오 서울각입니다:)',2,30,30,NULL,NULL,'서울 용산구 후암동 446-33 301호',1,1,1),(2,'꽃다운파티룸 2호점','꽃다운파티룸 2호점',2,8,12,NULL,NULL,'서울 강남구 봉은사로30길 59 3층',1,1,1),(3,'선릉루프탑파티룸 코지테라스','선릉루프탑파티룸 코지테라스',2,28,12,NULL,NULL,'서울 강남구 테헤란로43길 30 리티차워 6층',1,1,1),(4,'아일랜드이너프파티룸 선릉점','아일랜드이너프파티룸 선릉점',2,10,22,NULL,NULL,'서울 강남구 선릉로76길 25 지하1층',1,1,1),(5,'파티룸굿럭','파티룸굿럭',2,20,10,NULL,NULL,'서울 강남구 강남대로124길 26 유성빌딩 지하 1층',1,1,1),(6,'강남페차쿠차파티룸','강남페차쿠차파티룸',2,30,13,NULL,NULL,'서울 강남구 테헤란로1길 44 4층 404호',1,1,1),(7,'돔파티룸클럽','돔파티룸클럽',2,10,46,NULL,NULL,'서울 강남구 도산대로 541',1,1,1),(8,'판 파티룸','판 파티룸',2,20,12,NULL,NULL,'서울 강남구 도산대로53길 29 지하1층',1,1,1),(9,'베러데이즈 파티룸 강남점','베러데이즈 파티룸 강남점',2,13,43,NULL,NULL,'서울 강남구 도산대로49길 6-8 마태빌딩 지하1층',1,1,1),(10,'아일랜드이너프파티룸 선릉점','아일랜드이너프파티룸 선릉점',2,15,34,NULL,NULL,'서울 강남구 선릉로76길 25 지하1층',1,1,1),(11,'압구정 루프탑파티룸루캉스','압구정 루프탑파티룸루캉스',2,12,33,NULL,NULL,'서울 강남구 압구정로18길 32 6층',1,1,1),(12,'제니공간 파티룸','제니공간 파티룸',2,14,21,NULL,NULL,'서울 강남구 신사동 613-9 B102',1,1,1),(13,'강남브라이덜샤워파티룸 식물학작업실','강남 한복판 꽃과 식물이 함께하는 감성 공간',2,12,23,NULL,NULL,'서울 강남구 논현동 160 1층 식물학작업실',1,1,1),(14,'일상하나','채광좋은 아늑한 작업 및 모임공간',2,13,23,NULL,NULL,'서울특별시 강남구 청담동 44-19 링구아빌딩 4층',1,1,1),(15,'프라이빗 시네마 VOD SUITE','복합문화공간 VOD SUITE',2,12,11,NULL,NULL,'서울 강남구 논현로120길 6 VOD SUITE빌딩',1,1,1),(16,'엠팟홀','음악과 문화 창조의 열기가 가득한 이곳 엠팟홀!',2,59,45,NULL,NULL,'서울 강남구 학동로 171 삼익악기빌딩 3층 엠팟홀',1,1,1),(17,'[강남 브라이덜 샤워]퍼센트파티룸','25평 단독 사용 가능한 감성 가득 파티룸',2,43,11,NULL,NULL,'서울 강남구 학동로1길 19 2층(진순대국 건물)',1,1,1),(18,'카페코넌 (cafeconun)','편안하고 아늑한 공간은 물론, 무료로 주차도하세요',2,33,12,NULL,NULL,'서울특별시 강남구 봉은사로37길 7-9 글래드큐브빌딩 1층 카페코넌',1,1,1),(19,'청담동 루프탑 프라이빗 파티 공간','살롱콘서트 및 스페셜 이벤트를 위한 프라이빗파티',2,66,32,NULL,NULL,'서울특별시 강남구 청담동 83 금학빌딩 6층',1,1,1),(20,'심플- 요리하는공간, 키친파티룸','직접 요리해서 먹고 가거나 제품촬영하는 곳입니다',1,33,12,NULL,NULL,'서울특별시 강남구 논현동 39-1 스카이빌라 102호',1,1,1),(21,'7월올나잇 이용가능 미아아지트','우리들만의 소음걱정없는 프라이빗 파티!!',1,43,64,NULL,NULL,'서울 강북구 미아동 62-3 올레 kt 건물 3층',1,2,1),(22,'강북 파티룸 더캠프스튜디오','강북 미아 수유 감성 캠핑 스타일 파티룸 스튜디오',2,33,32,NULL,NULL,'서울 강북구 미아동 309-62 B1',1,2,1),(23,'러브잇스튜디오','감성가득 자연광 렌탈스튜디오, 파티룸',2,32,11,NULL,NULL,'서울 도봉구 노해로 218-1 3층',1,2,1),(24,'중립국','다목적 모임 공간, 중립국',2,11,12,NULL,NULL,'서울 강북구 도봉로76길 13',1,2,1),(25,'미아사거리 와이인 [공간대여]','골목길, 모던 레트로와 네추럴한 감성의 작은 공간',2,34,12,NULL,NULL,'서울 강북구 오패산로31길 25 ',1,2,1),(26,'파티 세미나 스튜디오 카페더캐빈','다목적 공간, 더 캐빈입니다',2,12,33,NULL,NULL,'서울 강북구 삼양로 190 5층',1,2,1),(27,'도봉구 슈바벤 공간대여 스튜디오','도봉구 최대규모 감성 공간대여 스튜디오',2,10,12,NULL,NULL,'서울 도봉구 방학로3길 6 1층 슈바벤',1,2,1),(28,'강북 파티룸 수에르떼 오픈행사','생일파티, 모임, 행사, 파티, 동호회, 파티룸',2,5,55,NULL,NULL,'서울특별시 강북구 도봉로8길 70',1,2,1),(29,'(특가할인) 창동 유어스','화이트&핑크로 꾸며진 감성적인 공간, 유어스!',2,65,12,NULL,NULL,'서울 도봉구 노해로69길 15 3층 유어스',1,2,1),(30,'강북미아파티룸[스테이포레]오픈할인','[강북 미아 성신여대]보테니컬 감성 힐링공간',2,21,43,NULL,NULL,'서울특별시 강북구 솔매로45길',1,2,1),(31,'[강서] 놀만한곳 마곡점','이세상의 모든 놀이 공간',2,16,11,NULL,NULL,'서울 강서구 마곡중앙6로 11 보타닉파크타워 3차',1,3,1),(32,'[여름특가]목동파티룸 비바파티룸','목동로데오거리 빈티지 프라이빗 파티룸',2,12,7,NULL,NULL,'서울특별시 양천구 목동로23길 23 B1 목동로데오 비바파티룸',1,3,1),(33,'(특가할인)강서구 파티룸 오늘도','발산역 도보 3분 거리 복합문화공간 파티룸 오늘도',2,14,68,NULL,NULL,'서울 강서구 강서로52길 16',1,3,1),(34,'드레스대여 목동파티룸 우리지금','우리는 지금 we.are.now에서 파티중!',1,64,23,NULL,NULL,'서울 양천구 목동로25길 20',1,3,1),(35,'렌탈스튜디오 보타닉','단독으로 사용하는 식물원 컨셉의 다목적 스튜디오',2,54,22,NULL,NULL,'서울 강서구 강서로 454 웅진프라자',1,3,1),(36,'[목동] 플랜비 스튜디오 파티룸','루프탑을 보유한 목동 스튜디오 & 파티룸 공간',2,22,12,NULL,NULL,'서울 양천구 오목로 337-2',1,3,1),(37,'파티맛집, 마곡 스튜디오 아미띠에','all about party, 파티 맛집 아미띠에',2,31,5,NULL,NULL,'서울 강서구 공항대로 209 지엠지엘스타',1,3,1),(38,'[오픈특가]목동파티룸 플레이파티룸','목동 최고의 파티룸입니다.',2,43,1,NULL,NULL,'서울 양천구 오목로48길 1',1,3,1),(39,'시차','증미역 근처 스튜디오',2,41,1,NULL,NULL,'서울특별시 강서구 허준로 209 XICHA',1,3,1),(40,'From Dirty','ON mY WAY',2,51,61,NULL,NULL,'서울특별시 강서구 공항대로 631',1,3,1),(41,'화곡목동 30평 렌탈스튜디오온하다','따스한 오후 자연광이 쏟아지는 스튜디오 & 파티룸',2,11,2,NULL,NULL,'서울 강서구 곰달래로60길 9 2층 스튜디오 온하다',1,3,1),(42,'목동파티룸 슈가맨','노래방, pc방, 분위기있는 BAR와 키친 까지',2,44,3,NULL,NULL,'서울 양천구 신정동 895-25',1,3,1),(43,'스튜디오 띠캔띤','[오픈 이벤트] 목동 자연광 렌탈 스튜디오',2,15,23,NULL,NULL,'서울 양천구 신정동 978-1',1,3,1),(44,'[강서]온돌이네(대규모 모임가능)','도심속 여유와 낭만을 채워줄 나만의 공간',2,51,1,NULL,NULL,'서울특별시 강서구 양천로 721 2층 온돌이네',1,3,1),(45,'[송파 파티룸_일비] 브라이덜샤워','브라이덜샤워,베이비샤워,생일파티등 다양한 공간대여',2,15,4,NULL,NULL,'서울 송파구 석촌동 297-10',1,4,1),(46,'[송리단길]스튜디오 정오 파티룸','송리단길에 위치한 스튜디오 정오 파티룸 입니다.',4,13,23,NULL,NULL,'서울 송파구 송파동 37-11 용진빌딩',1,4,1),(47,'생일파티 브라이덜샤워 대관 프레임','송파구 잠실에 위치한 자연광 스튜디오 겸 다목적홀',2,11,2,NULL,NULL,'서울 송파구 올림픽로10길 35 3층 스튜디오프레임',1,4,1),(48,'(잠실송파파티룸)송파모임공간JUN','석촌역에서 가까운 다목적모임공간',1,31,3,NULL,NULL,'서울 송파구 백제고분로42길 8',1,4,1),(49,'논현역 신논현역 댄스,보컬 연습실','기둥없는 28평 댄스연습실,신논현역,언주역5분',1,40,1,NULL,NULL,'서울특별시 강남구 논현동 204-3 상원빌딩',2,1,1),(50,'강남댄스연습실-NY','강남구 논현역 2분 거리 보컬 피아노 댄스 미디',1,50,12,NULL,NULL,'서울특별시 강남구 논현동 141-9 명진빌딩 4층 원스연습실 와이홀',2,1,1),(51,'원스연습실강남논현점-피아노연습실','강남 논현역 2분 24시간 보컬 댄스 DJ 미디',1,40,11,NULL,NULL,'서울특별시 강남구 학동로4길 20 명진빌딩',2,1,1),(52,'수유 I Do studio 연습실','I Do studio 댄스연습실',1,20,12,NULL,NULL,'서울 강북구 수유동 224-15 5층 I Do studio',2,2,1),(53,'강북구연습실 와스튜디오 수유점','강북구 번동 프리미엄 댄스연습실 음악연습실',1,15,9,NULL,NULL,'서울 강북구 한천로131길 33 B1 와스튜디오',2,2,1),(54,'공간시너리 스튜디오시너리 쌍문','쌍문역3분거리 21평 단독홀 !! SCENERY',1,5,12,NULL,NULL,'서울 도봉구 창동 657-87',2,2,1),(55,'루츠댄스아카데미','안녕하세요 루츠댄스아카데미 입니다!',1,4,6,NULL,NULL,'서울 강북구 노해로 107',2,2,1),(56,'[발산역]제이비스페이스 연습실','발산역 도보5분 모두가 즐길수 있는 연습실',1,8,1,NULL,NULL,'서울특별시 강서구 강서로56가길 45 르네상스 빌딩',2,3,1),(57,'브리츠 댄스연습실 [화곡점]','까치산역 6분거리 가성비갑 지상3층 연습실',1,72,5,NULL,NULL,'서울 강서구 화곡동 871-12',2,3,1),(58,'[우장산역] 제이비스페이스 연습실','우장산역 4번출구 3분 거리 / 사이즈별 공간',2,53,7,NULL,NULL,'서울 강서구 강서로 279',2,3,1),(59,'[오픈특가] 다이아 연습실 강서점','등촌역/증미역 도보 3분거리 / 매주 방역소독진행',2,55,12,NULL,NULL,'서울 강서구 공항대로55길 17 B1 다이아 연습실',2,3,1),(60,'목동 홀릭댄스연습실(구,참살이센터','오목교역 5분 거리 접근성 좋은 연습공간',2,12,4,NULL,NULL,'서울 양천구 목동동로12길 26',2,3,1),(61,'[여름특가]바바 연습실 등촌역점','등촌역 도보 2분 / 쾌적한 35평대 다목적 홀',2,61,3,NULL,NULL,'서울특별시 강서구 등촌로53길 7 B1 VAVA STUDIO',2,3,1),(62,'마마초이스 목동연습실','평일5천원주말6천원15평형 댄스/보컬/연기연습실',2,7,5,NULL,NULL,'서울특별시 양천구 목동 786-18 목동 786-18',2,3,1),(63,'[리뉴얼특가]바바연습실 증미역점','증미역 대로변 3분거리 / 총 35평대 대형연습실',3,42,12,NULL,NULL,'서울특별시 강서구 양천로 607',2,3,1),(64,'[잠실연습실] 팔로우스튜디오','송파연습실, 잠실연습실, 석촌연습실 FOLLOW',3,14,1,NULL,NULL,'서울 송파구 송파동 93-2',2,4,1),(65,'브리츠 댄스연습실 [송파문정점]','비교할 수 없는 극강의 가성비 (총 10개 지점)',2,34,4,NULL,NULL,'서울 송파구 새말로5길 6',2,4,1),(66,'잠실 JD연습실 석촌역3분거리','조명맛집! JD연습실 석촌점입니다',2,43,1,NULL,NULL,'서울 송파구 석촌동 283-10 ',2,4,1),(67,'원스연습실강남논현점-미디NM','강남 논현역 2분 24시간 보컬 댄스 DJ 미디',2,3,1,NULL,NULL,'서울특별시 강남구 학동로4길 20 명진빌딩',3,1,1),(68,'다시 꿈-스튜디오(신사동 연습실)','다양한 예술활동이 가능한 공간 (스튜디오&연습실)',2,5,1,NULL,NULL,'서울 강남구 신사동 516 국제빌딩',3,1,1),(69,'강북구연습실 와스튜디오 수유점','강북구 번동 프리미엄 댄스연습실 음악연습실',2,5,1,NULL,NULL,'서울 강북구 한천로131길 33 B1 와스튜디오',3,2,1),(70,'수유 연습실 [유수 사운드]','엔틱 분위기의 녹음실에서 운영하는 프리미엄 연습실',2,4,1,NULL,NULL,'서울 강북구 화계사길 17',3,2,1),(71,'[강서]푸른나무 피아노연습실','강서구 우장산역 덕원예고 앞 피아노.악기연습실',2,3,1,NULL,NULL,'서울 강서구 강서로45길 118 2층 푸른나무음악학원',3,3,1),(72,'[리뉴얼특가]사운드하우스음악연습실','덕원예고 앞 3분 거리 피아노 악기 성악 연습실',2,7,2,NULL,NULL,'서울 강서구 강서로45길 40 지하1층',3,3,1),(73,'엠보이스 연습실 석촌점','보컬레슨,미디레슨,피아노레슨,작곡레슨,연습실대여',2,7,1,NULL,NULL,'서울특별시 송파구 송파동 13',3,4,1),(75,'아워스페이스','우리의 공간을 소개합니다.',2,5,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,1,1),(76,'아워스페이스2','우리의 공간을 소개합니다.',2,7,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,1,1),(77,'dd','dd\n',2,5,0,NULL,NULL,'',4,2,1),(78,'ㅇ','ㅇ',2,2,0,NULL,NULL,'서울 강남구 테헤란로1길 16 (역삼동)',3,4,1),(79,'dd','dd\n',2,5,0,NULL,NULL,'',4,2,1),(80,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(81,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(82,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(83,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(84,'dd','dd\n',2,5,0,NULL,NULL,'',4,2,1),(85,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(86,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(87,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(88,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(89,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(90,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(91,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(92,'하이','하이',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(93,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',2,3,1),(94,'ㅇ','ㅇ',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(95,'ㅇ','ㅇ',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,3,1),(96,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(97,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(98,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(99,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(100,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(101,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(102,'ㅇ','ㅇ',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(103,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(104,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(105,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(106,'d','d',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(110,'ㅇ','ㅇ',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',2,2,1),(111,'dks','dks',2,2,0,NULL,NULL,'서울 강남구 테헤란로 105 (역삼동)',5,2,1),(112,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(113,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(114,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,2,1),(115,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로1길 16 (역삼동)',3,1,1),(116,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,3,1),(117,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,3,1),(118,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',3,3,1),(119,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,1,1),(120,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,1,1),(121,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,1,1),(122,'d','d',2,1,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,1,1),(123,'제발','되라',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',2,2,1),(124,'안녕','안녕',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,2,1),(125,'안녕','안녕',2,2,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',4,2,1),(126,'dd','dd\n',2,5,0,NULL,NULL,'',4,2,13),(127,'아워스페이스','우리의 공간을 소개합니다',2,4,0,NULL,NULL,'서울 강남구 테헤란로 101 (역삼동, 이즈타워)',1,1,13);
/*!40000 ALTER TABLE `spaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'WAITING'),(2,'COMPLETED'),(3,''),(4,''),(5,''),(6,''),(7,''),(8,''),(9,''),(10,''),(11,''),(12,''),(13,''),(14,''),(15,''),(16,''),(17,''),(18,''),(19,''),(20,''),(21,''),(22,''),(23,''),(24,''),(25,''),(26,''),(27,''),(28,''),(29,''),(30,''),(31,''),(32,''),(33,''),(34,''),(35,''),(36,''),(37,''),(38,''),(39,''),(40,''),(41,''),(42,''),(43,''),(44,''),(45,''),(46,''),(47,''),(48,''),(49,''),(50,''),(51,''),(52,''),(53,''),(54,''),(55,''),(56,''),(57,''),(58,''),(59,''),(60,''),(61,''),(62,''),(63,''),(64,''),(65,''),(66,''),(67,''),(68,''),(69,''),(70,''),(71,''),(72,''),(73,''),(74,''),(75,''),(76,''),(77,''),(78,''),(79,''),(80,''),(81,''),(82,''),(83,''),(84,''),(85,''),(86,''),(87,''),(88,''),(89,''),(90,''),(91,''),(92,''),(93,''),(94,''),(95,''),(96,''),(97,''),(98,''),(99,''),(100,''),(101,''),(102,''),(103,''),(104,''),(105,''),(106,''),(107,''),(108,''),(109,''),(110,''),(111,''),(112,''),(113,''),(114,''),(115,''),(116,''),(117,''),(118,''),(119,''),(120,''),(121,''),(122,''),(123,''),(124,''),(125,''),(126,''),(127,''),(128,''),(129,''),(130,''),(131,''),(132,''),(133,''),(134,''),(135,''),(136,''),(137,''),(138,''),(139,''),(140,''),(141,''),(142,''),(143,''),(144,''),(145,''),(146,''),(147,''),(148,''),(149,''),(150,''),(151,''),(152,''),(153,''),(154,''),(155,''),(156,''),(157,''),(158,''),(159,''),(160,''),(161,''),(162,''),(163,''),(164,''),(165,''),(166,''),(167,''),(168,''),(169,''),(170,''),(171,''),(172,''),(173,''),(174,''),(175,''),(176,''),(177,''),(178,''),(179,''),(180,''),(181,''),(182,''),(183,''),(184,''),(185,''),(186,''),(187,''),(188,''),(189,''),(190,''),(191,''),(192,''),(193,''),(194,''),(195,''),(196,''),(197,''),(198,''),(199,''),(200,''),(201,''),(202,''),(203,''),(204,''),(205,''),(206,''),(207,''),(208,''),(209,''),(210,''),(211,''),(212,''),(213,''),(214,''),(215,''),(216,''),(217,''),(218,''),(219,'');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kakao_id` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nickname` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `point` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kakao_id` (`kakao_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'12345678','123@naver.com','test',NULL),(2,'98765432','456@naver.com','test2',NULL),(10,'1856342726','guswns1411@naver.com','현준',1903.00),(11,'1870316984','leon1111@naver.com','임종성',1800.00),(13,'1870057904',NULL,'심택준',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-26 19:04:07
