-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerid` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAccount437857` (`customerid`),
  CONSTRAINT `FKAccount437857` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerid` int NOT NULL,
  `no` int NOT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAddress64710` (`customerid`),
  CONSTRAINT `FKAddress64710` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add account',7,'add_account'),(26,'Can change account',7,'change_account'),(27,'Can delete account',7,'delete_account'),(28,'Can view account',7,'view_account'),(29,'Can add address',8,'add_address'),(30,'Can change address',8,'change_address'),(31,'Can delete address',8,'delete_address'),(32,'Can view address',8,'view_address'),(33,'Can add author',9,'add_author'),(34,'Can change author',9,'change_author'),(35,'Can delete author',9,'delete_author'),(36,'Can view author',9,'view_author'),(37,'Can add book',10,'add_book'),(38,'Can change book',10,'change_book'),(39,'Can delete book',10,'delete_book'),(40,'Can view book',10,'view_book'),(41,'Can add bookitem',11,'add_bookitem'),(42,'Can change bookitem',11,'change_bookitem'),(43,'Can delete bookitem',11,'delete_bookitem'),(44,'Can view bookitem',11,'view_bookitem'),(45,'Can add cart',12,'add_cart'),(46,'Can change cart',12,'change_cart'),(47,'Can delete cart',12,'delete_cart'),(48,'Can view cart',12,'view_cart'),(49,'Can add cart bookitem',13,'add_cartbookitem'),(50,'Can change cart bookitem',13,'change_cartbookitem'),(51,'Can delete cart bookitem',13,'delete_cartbookitem'),(52,'Can view cart bookitem',13,'view_cartbookitem'),(53,'Can add category',14,'add_category'),(54,'Can change category',14,'change_category'),(55,'Can delete category',14,'delete_category'),(56,'Can view category',14,'view_category'),(57,'Can add clothes',15,'add_clothes'),(58,'Can change clothes',15,'change_clothes'),(59,'Can delete clothes',15,'delete_clothes'),(60,'Can view clothes',15,'view_clothes'),(61,'Can add clothesitem',16,'add_clothesitem'),(62,'Can change clothesitem',16,'change_clothesitem'),(63,'Can delete clothesitem',16,'delete_clothesitem'),(64,'Can view clothesitem',16,'view_clothesitem'),(65,'Can add comment',17,'add_comment'),(66,'Can change comment',17,'change_comment'),(67,'Can delete comment',17,'delete_comment'),(68,'Can view comment',17,'view_comment'),(69,'Can add customer',18,'add_customer'),(70,'Can change customer',18,'change_customer'),(71,'Can delete customer',18,'delete_customer'),(72,'Can view customer',18,'view_customer'),(73,'Can add fullname',19,'add_fullname'),(74,'Can change fullname',19,'change_fullname'),(75,'Can delete fullname',19,'delete_fullname'),(76,'Can view fullname',19,'view_fullname'),(77,'Can add laptop',20,'add_laptop'),(78,'Can change laptop',20,'change_laptop'),(79,'Can delete laptop',20,'delete_laptop'),(80,'Can view laptop',20,'view_laptop'),(81,'Can add laptopitem',21,'add_laptopitem'),(82,'Can change laptopitem',21,'change_laptopitem'),(83,'Can delete laptopitem',21,'delete_laptopitem'),(84,'Can view laptopitem',21,'view_laptopitem'),(85,'Can add manufacture',22,'add_manufacture'),(86,'Can change manufacture',22,'change_manufacture'),(87,'Can delete manufacture',22,'delete_manufacture'),(88,'Can view manufacture',22,'view_manufacture'),(89,'Can add order',23,'add_order'),(90,'Can change order',23,'change_order'),(91,'Can delete order',23,'delete_order'),(92,'Can view order',23,'view_order'),(93,'Can add payment',24,'add_payment'),(94,'Can change payment',24,'change_payment'),(95,'Can delete payment',24,'delete_payment'),(96,'Can view payment',24,'view_payment'),(97,'Can add producer',25,'add_producer'),(98,'Can change producer',25,'change_producer'),(99,'Can delete producer',25,'delete_producer'),(100,'Can view producer',25,'view_producer'),(101,'Can add publisher',26,'add_publisher'),(102,'Can change publisher',26,'change_publisher'),(103,'Can delete publisher',26,'delete_publisher'),(104,'Can view publisher',26,'view_publisher'),(105,'Can add shipment',27,'add_shipment'),(106,'Can change shipment',27,'change_shipment'),(107,'Can delete shipment',27,'delete_shipment'),(108,'Can view shipment',27,'view_shipment'),(109,'Can add styles',28,'add_styles'),(110,'Can change styles',28,'change_styles'),(111,'Can delete styles',28,'delete_styles'),(112,'Can view styles',28,'view_styles'),(113,'Can add type',29,'add_type'),(114,'Can change type',29,'change_type'),(115,'Can delete type',29,'delete_type'),(116,'Can view type',29,'view_type'),(117,'Can add account',30,'add_account'),(118,'Can change account',30,'change_account'),(119,'Can delete account',30,'delete_account'),(120,'Can view account',30,'view_account'),(121,'Can add address',31,'add_address'),(122,'Can change address',31,'change_address'),(123,'Can delete address',31,'delete_address'),(124,'Can view address',31,'view_address'),(125,'Can add customer',32,'add_customer'),(126,'Can change customer',32,'change_customer'),(127,'Can delete customer',32,'delete_customer'),(128,'Can view customer',32,'view_customer'),(129,'Can add fullname',33,'add_fullname'),(130,'Can change fullname',33,'change_fullname'),(131,'Can delete fullname',33,'delete_fullname'),(132,'Can view fullname',33,'view_fullname'),(133,'Can add account',34,'add_account'),(134,'Can change account',34,'change_account'),(135,'Can delete account',34,'delete_account'),(136,'Can view account',34,'view_account'),(137,'Can add address',35,'add_address'),(138,'Can change address',35,'change_address'),(139,'Can delete address',35,'delete_address'),(140,'Can view address',35,'view_address'),(141,'Can add author',36,'add_author'),(142,'Can change author',36,'change_author'),(143,'Can delete author',36,'delete_author'),(144,'Can view author',36,'view_author'),(145,'Can add book',37,'add_book'),(146,'Can change book',37,'change_book'),(147,'Can delete book',37,'delete_book'),(148,'Can view book',37,'view_book'),(149,'Can add bookitem',38,'add_bookitem'),(150,'Can change bookitem',38,'change_bookitem'),(151,'Can delete bookitem',38,'delete_bookitem'),(152,'Can view bookitem',38,'view_bookitem'),(153,'Can add cart',39,'add_cart'),(154,'Can change cart',39,'change_cart'),(155,'Can delete cart',39,'delete_cart'),(156,'Can view cart',39,'view_cart'),(157,'Can add cart bookitem',40,'add_cartbookitem'),(158,'Can change cart bookitem',40,'change_cartbookitem'),(159,'Can delete cart bookitem',40,'delete_cartbookitem'),(160,'Can view cart bookitem',40,'view_cartbookitem'),(161,'Can add category',41,'add_category'),(162,'Can change category',41,'change_category'),(163,'Can delete category',41,'delete_category'),(164,'Can view category',41,'view_category'),(165,'Can add clothes',42,'add_clothes'),(166,'Can change clothes',42,'change_clothes'),(167,'Can delete clothes',42,'delete_clothes'),(168,'Can view clothes',42,'view_clothes'),(169,'Can add clothesitem',43,'add_clothesitem'),(170,'Can change clothesitem',43,'change_clothesitem'),(171,'Can delete clothesitem',43,'delete_clothesitem'),(172,'Can view clothesitem',43,'view_clothesitem'),(173,'Can add comment',44,'add_comment'),(174,'Can change comment',44,'change_comment'),(175,'Can delete comment',44,'delete_comment'),(176,'Can view comment',44,'view_comment'),(177,'Can add customer',45,'add_customer'),(178,'Can change customer',45,'change_customer'),(179,'Can delete customer',45,'delete_customer'),(180,'Can view customer',45,'view_customer'),(181,'Can add fullname',46,'add_fullname'),(182,'Can change fullname',46,'change_fullname'),(183,'Can delete fullname',46,'delete_fullname'),(184,'Can view fullname',46,'view_fullname'),(185,'Can add laptop',47,'add_laptop'),(186,'Can change laptop',47,'change_laptop'),(187,'Can delete laptop',47,'delete_laptop'),(188,'Can view laptop',47,'view_laptop'),(189,'Can add laptopitem',48,'add_laptopitem'),(190,'Can change laptopitem',48,'change_laptopitem'),(191,'Can delete laptopitem',48,'delete_laptopitem'),(192,'Can view laptopitem',48,'view_laptopitem'),(193,'Can add manufacture',49,'add_manufacture'),(194,'Can change manufacture',49,'change_manufacture'),(195,'Can delete manufacture',49,'delete_manufacture'),(196,'Can view manufacture',49,'view_manufacture'),(197,'Can add order',50,'add_order'),(198,'Can change order',50,'change_order'),(199,'Can delete order',50,'delete_order'),(200,'Can view order',50,'view_order'),(201,'Can add payment',51,'add_payment'),(202,'Can change payment',51,'change_payment'),(203,'Can delete payment',51,'delete_payment'),(204,'Can view payment',51,'view_payment'),(205,'Can add producer',52,'add_producer'),(206,'Can change producer',52,'change_producer'),(207,'Can delete producer',52,'delete_producer'),(208,'Can view producer',52,'view_producer'),(209,'Can add publisher',53,'add_publisher'),(210,'Can change publisher',53,'change_publisher'),(211,'Can delete publisher',53,'delete_publisher'),(212,'Can view publisher',53,'view_publisher'),(213,'Can add shipment',54,'add_shipment'),(214,'Can change shipment',54,'change_shipment'),(215,'Can delete shipment',54,'delete_shipment'),(216,'Can view shipment',54,'view_shipment'),(217,'Can add styles',55,'add_styles'),(218,'Can change styles',55,'change_styles'),(219,'Can delete styles',55,'delete_styles'),(220,'Can view styles',55,'view_styles'),(221,'Can add type',56,'add_type'),(222,'Can change type',56,'change_type'),(223,'Can delete type',56,'delete_type'),(224,'Can view type',56,'view_type'),(225,'Can add auth group',57,'add_authgroup'),(226,'Can change auth group',57,'change_authgroup'),(227,'Can delete auth group',57,'delete_authgroup'),(228,'Can view auth group',57,'view_authgroup'),(229,'Can add auth group permissions',58,'add_authgrouppermissions'),(230,'Can change auth group permissions',58,'change_authgrouppermissions'),(231,'Can delete auth group permissions',58,'delete_authgrouppermissions'),(232,'Can view auth group permissions',58,'view_authgrouppermissions'),(233,'Can add auth permission',59,'add_authpermission'),(234,'Can change auth permission',59,'change_authpermission'),(235,'Can delete auth permission',59,'delete_authpermission'),(236,'Can view auth permission',59,'view_authpermission'),(237,'Can add auth user',60,'add_authuser'),(238,'Can change auth user',60,'change_authuser'),(239,'Can delete auth user',60,'delete_authuser'),(240,'Can view auth user',60,'view_authuser'),(241,'Can add auth user groups',61,'add_authusergroups'),(242,'Can change auth user groups',61,'change_authusergroups'),(243,'Can delete auth user groups',61,'delete_authusergroups'),(244,'Can view auth user groups',61,'view_authusergroups'),(245,'Can add auth user user permissions',62,'add_authuseruserpermissions'),(246,'Can change auth user user permissions',62,'change_authuseruserpermissions'),(247,'Can delete auth user user permissions',62,'delete_authuseruserpermissions'),(248,'Can view auth user user permissions',62,'view_authuseruserpermissions'),(249,'Can add django admin log',63,'add_djangoadminlog'),(250,'Can change django admin log',63,'change_djangoadminlog'),(251,'Can delete django admin log',63,'delete_djangoadminlog'),(252,'Can view django admin log',63,'view_djangoadminlog'),(253,'Can add django content type',64,'add_djangocontenttype'),(254,'Can change django content type',64,'change_djangocontenttype'),(255,'Can delete django content type',64,'delete_djangocontenttype'),(256,'Can view django content type',64,'view_djangocontenttype'),(257,'Can add django migrations',65,'add_djangomigrations'),(258,'Can change django migrations',65,'change_djangomigrations'),(259,'Can delete django migrations',65,'delete_djangomigrations'),(260,'Can view django migrations',65,'view_djangomigrations'),(261,'Can add django session',66,'add_djangosession'),(262,'Can change django session',66,'change_djangosession'),(263,'Can delete django session',66,'delete_djangosession'),(264,'Can view django session',66,'view_djangosession'),(265,'Can add auth group',67,'add_authgroup'),(266,'Can change auth group',67,'change_authgroup'),(267,'Can delete auth group',67,'delete_authgroup'),(268,'Can view auth group',67,'view_authgroup'),(269,'Can add auth group permissions',68,'add_authgrouppermissions'),(270,'Can change auth group permissions',68,'change_authgrouppermissions'),(271,'Can delete auth group permissions',68,'delete_authgrouppermissions'),(272,'Can view auth group permissions',68,'view_authgrouppermissions'),(273,'Can add author',69,'add_author'),(274,'Can change author',69,'change_author'),(275,'Can delete author',69,'delete_author'),(276,'Can view author',69,'view_author'),(277,'Can add auth permission',70,'add_authpermission'),(278,'Can change auth permission',70,'change_authpermission'),(279,'Can delete auth permission',70,'delete_authpermission'),(280,'Can view auth permission',70,'view_authpermission'),(281,'Can add auth user',71,'add_authuser'),(282,'Can change auth user',71,'change_authuser'),(283,'Can delete auth user',71,'delete_authuser'),(284,'Can view auth user',71,'view_authuser'),(285,'Can add auth user groups',72,'add_authusergroups'),(286,'Can change auth user groups',72,'change_authusergroups'),(287,'Can delete auth user groups',72,'delete_authusergroups'),(288,'Can view auth user groups',72,'view_authusergroups'),(289,'Can add auth user user permissions',73,'add_authuseruserpermissions'),(290,'Can change auth user user permissions',73,'change_authuseruserpermissions'),(291,'Can delete auth user user permissions',73,'delete_authuseruserpermissions'),(292,'Can view auth user user permissions',73,'view_authuseruserpermissions'),(293,'Can add book',74,'add_book'),(294,'Can change book',74,'change_book'),(295,'Can delete book',74,'delete_book'),(296,'Can view book',74,'view_book'),(297,'Can add bookitem',75,'add_bookitem'),(298,'Can change bookitem',75,'change_bookitem'),(299,'Can delete bookitem',75,'delete_bookitem'),(300,'Can view bookitem',75,'view_bookitem'),(301,'Can add cart',76,'add_cart'),(302,'Can change cart',76,'change_cart'),(303,'Can delete cart',76,'delete_cart'),(304,'Can view cart',76,'view_cart'),(305,'Can add cart bookitem',77,'add_cartbookitem'),(306,'Can change cart bookitem',77,'change_cartbookitem'),(307,'Can delete cart bookitem',77,'delete_cartbookitem'),(308,'Can view cart bookitem',77,'view_cartbookitem'),(309,'Can add category',78,'add_category'),(310,'Can change category',78,'change_category'),(311,'Can delete category',78,'delete_category'),(312,'Can view category',78,'view_category'),(313,'Can add clothes',79,'add_clothes'),(314,'Can change clothes',79,'change_clothes'),(315,'Can delete clothes',79,'delete_clothes'),(316,'Can view clothes',79,'view_clothes'),(317,'Can add clothesitem',80,'add_clothesitem'),(318,'Can change clothesitem',80,'change_clothesitem'),(319,'Can delete clothesitem',80,'delete_clothesitem'),(320,'Can view clothesitem',80,'view_clothesitem'),(321,'Can add comment',81,'add_comment'),(322,'Can change comment',81,'change_comment'),(323,'Can delete comment',81,'delete_comment'),(324,'Can view comment',81,'view_comment'),(325,'Can add django admin log',82,'add_djangoadminlog'),(326,'Can change django admin log',82,'change_djangoadminlog'),(327,'Can delete django admin log',82,'delete_djangoadminlog'),(328,'Can view django admin log',82,'view_djangoadminlog'),(329,'Can add django content type',83,'add_djangocontenttype'),(330,'Can change django content type',83,'change_djangocontenttype'),(331,'Can delete django content type',83,'delete_djangocontenttype'),(332,'Can view django content type',83,'view_djangocontenttype'),(333,'Can add django migrations',84,'add_djangomigrations'),(334,'Can change django migrations',84,'change_djangomigrations'),(335,'Can delete django migrations',84,'delete_djangomigrations'),(336,'Can view django migrations',84,'view_djangomigrations'),(337,'Can add django session',85,'add_djangosession'),(338,'Can change django session',85,'change_djangosession'),(339,'Can delete django session',85,'delete_djangosession'),(340,'Can view django session',85,'view_djangosession'),(341,'Can add laptop',86,'add_laptop'),(342,'Can change laptop',86,'change_laptop'),(343,'Can delete laptop',86,'delete_laptop'),(344,'Can view laptop',86,'view_laptop'),(345,'Can add laptopitem',87,'add_laptopitem'),(346,'Can change laptopitem',87,'change_laptopitem'),(347,'Can delete laptopitem',87,'delete_laptopitem'),(348,'Can view laptopitem',87,'view_laptopitem'),(349,'Can add manufacture',88,'add_manufacture'),(350,'Can change manufacture',88,'change_manufacture'),(351,'Can delete manufacture',88,'delete_manufacture'),(352,'Can view manufacture',88,'view_manufacture'),(353,'Can add order',89,'add_order'),(354,'Can change order',89,'change_order'),(355,'Can delete order',89,'delete_order'),(356,'Can view order',89,'view_order'),(357,'Can add payment',90,'add_payment'),(358,'Can change payment',90,'change_payment'),(359,'Can delete payment',90,'delete_payment'),(360,'Can view payment',90,'view_payment'),(361,'Can add producer',91,'add_producer'),(362,'Can change producer',91,'change_producer'),(363,'Can delete producer',91,'delete_producer'),(364,'Can view producer',91,'view_producer'),(365,'Can add publisher',92,'add_publisher'),(366,'Can change publisher',92,'change_publisher'),(367,'Can delete publisher',92,'delete_publisher'),(368,'Can view publisher',92,'view_publisher'),(369,'Can add shipment',93,'add_shipment'),(370,'Can change shipment',93,'change_shipment'),(371,'Can delete shipment',93,'delete_shipment'),(372,'Can view shipment',93,'view_shipment'),(373,'Can add styles',94,'add_styles'),(374,'Can change styles',94,'change_styles'),(375,'Can delete styles',94,'delete_styles'),(376,'Can view styles',94,'view_styles'),(377,'Can add type',95,'add_type'),(378,'Can change type',95,'change_type'),(379,'Can delete type',95,'delete_type'),(380,'Can view type',95,'view_type'),(381,'Can add auth group',96,'add_authgroup'),(382,'Can change auth group',96,'change_authgroup'),(383,'Can delete auth group',96,'delete_authgroup'),(384,'Can view auth group',96,'view_authgroup'),(385,'Can add auth group permissions',97,'add_authgrouppermissions'),(386,'Can change auth group permissions',97,'change_authgrouppermissions'),(387,'Can delete auth group permissions',97,'delete_authgrouppermissions'),(388,'Can view auth group permissions',97,'view_authgrouppermissions'),(389,'Can add auth permission',98,'add_authpermission'),(390,'Can change auth permission',98,'change_authpermission'),(391,'Can delete auth permission',98,'delete_authpermission'),(392,'Can view auth permission',98,'view_authpermission'),(393,'Can add auth user',99,'add_authuser'),(394,'Can change auth user',99,'change_authuser'),(395,'Can delete auth user',99,'delete_authuser'),(396,'Can view auth user',99,'view_authuser'),(397,'Can add auth user groups',100,'add_authusergroups'),(398,'Can change auth user groups',100,'change_authusergroups'),(399,'Can delete auth user groups',100,'delete_authusergroups'),(400,'Can view auth user groups',100,'view_authusergroups'),(401,'Can add auth user user permissions',101,'add_authuseruserpermissions'),(402,'Can change auth user user permissions',101,'change_authuseruserpermissions'),(403,'Can delete auth user user permissions',101,'delete_authuseruserpermissions'),(404,'Can view auth user user permissions',101,'view_authuseruserpermissions'),(405,'Can add django admin log',102,'add_djangoadminlog'),(406,'Can change django admin log',102,'change_djangoadminlog'),(407,'Can delete django admin log',102,'delete_djangoadminlog'),(408,'Can view django admin log',102,'view_djangoadminlog'),(409,'Can add django content type',103,'add_djangocontenttype'),(410,'Can change django content type',103,'change_djangocontenttype'),(411,'Can delete django content type',103,'delete_djangocontenttype'),(412,'Can view django content type',103,'view_djangocontenttype'),(413,'Can add django migrations',104,'add_djangomigrations'),(414,'Can change django migrations',104,'change_djangomigrations'),(415,'Can delete django migrations',104,'delete_djangomigrations'),(416,'Can view django migrations',104,'view_djangomigrations'),(417,'Can add django session',105,'add_djangosession'),(418,'Can change django session',105,'change_djangosession'),(419,'Can delete django session',105,'delete_djangosession'),(420,'Can view django session',105,'view_djangosession');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `biography` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Bjarne Stroustrup','(30 tháng 12 năm 1950, Aarhus, Đan Mạch) là nhà khoa học máy tính, tác giả ngôn ngữ lập trình C++.Bjarne Stroustrup có bằng cử nhân toán học và CNTT (1975) ĐH Aarhus và TS CNTT 1979 ĐH Cambridge, Anh.',NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookitemid` int NOT NULL,
  `categoryid` int NOT NULL,
  `publisherid` int NOT NULL,
  `authorid` int NOT NULL,
  `barcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `numberofpage` int NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBook221643` (`publisherid`),
  KEY `FKBook313834` (`bookitemid`),
  KEY `FKBook666593` (`authorid`),
  KEY `FKBook738236` (`categoryid`),
  CONSTRAINT `FKBook221643` FOREIGN KEY (`publisherid`) REFERENCES `publisher` (`id`),
  CONSTRAINT `FKBook313834` FOREIGN KEY (`bookitemid`) REFERENCES `bookitem` (`id`),
  CONSTRAINT `FKBook666593` FOREIGN KEY (`authorid`) REFERENCES `author` (`id`),
  CONSTRAINT `FKBook738236` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,1,1,1,1,'978-0321-992789','Programming: Principles and Practice Using C++','Tiếng Anh',1039,'những khái niệm cơ bản và phương pháp lập trình truyền thống, phân tích về vấn đề cần lưu ý  với ngôn ngữ C++ hiện đại hơn, thông tin và kiến thức hữu ích về Lập trình hướng đối tượng và Lập trình tổng quát',NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookitem`
--

DROP TABLE IF EXISTS `bookitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `itemcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `currentprice` float NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `discount` float NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookitem`
--

LOCK TABLES `bookitem` WRITE;
/*!40000 ALTER TABLE `bookitem` DISABLE KEYS */;
INSERT INTO `bookitem` VALUES (1,'Programming: Principles and Practice Using C++',NULL,920000,'https://cdn-amz.fadoglobal.io/images/I/81HCIXim7hL.jpg',5,NULL);
/*!40000 ALTER TABLE `bookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'False','Default Cart',0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_bookitem`
--

DROP TABLE IF EXISTS `cart_bookitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_bookitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartid` int NOT NULL,
  `bookitemid` int NOT NULL,
  `itemtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCart_Booki14934` (`cartid`),
  KEY `FKCart_Booki910497` (`bookitemid`),
  CONSTRAINT `FKCart_Booki14934` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKCart_Booki910497` FOREIGN KEY (`bookitemid`) REFERENCES `bookitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_bookitem`
--

LOCK TABLES `cart_bookitem` WRITE;
/*!40000 ALTER TABLE `cart_bookitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_bookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Khoa học - Công nghệ',NULL,NULL),(2,'Giáo dục',NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes`
--

DROP TABLE IF EXISTS `clothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stylesid` int NOT NULL,
  `nanufactureid` int NOT NULL,
  `barcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKClothes317784` (`nanufactureid`),
  KEY `FKClothes80579` (`stylesid`),
  CONSTRAINT `FKClothes317784` FOREIGN KEY (`nanufactureid`) REFERENCES `manufacture` (`id`),
  CONSTRAINT `FKClothes80579` FOREIGN KEY (`stylesid`) REFERENCES `styles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes`
--

LOCK TABLES `clothes` WRITE;
/*!40000 ALTER TABLE `clothes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothesitem`
--

DROP TABLE IF EXISTS `clothesitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothesitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartid` int NOT NULL,
  `clothesid` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clothescode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `currentprice` float NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `discount` float NOT NULL,
  `status` int DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKClothesIte788295` (`cartid`),
  KEY `FKClothesIte895511` (`clothesid`),
  CONSTRAINT `FKClothesIte788295` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKClothesIte895511` FOREIGN KEY (`clothesid`) REFERENCES `clothes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothesitem`
--

LOCK TABLES `clothesitem` WRITE;
/*!40000 ALTER TABLE `clothesitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothesitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookitemid` int NOT NULL,
  `customerid` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createat` datetime DEFAULT CURRENT_TIMESTAMP,
  `rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKComment320270` (`bookitemid`),
  KEY `FKComment814179` (`customerid`),
  CONSTRAINT `FKComment320270` FOREIGN KEY (`bookitemid`) REFERENCES `bookitem` (`id`),
  CONSTRAINT `FKComment814179` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ccode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'ecommere','account'),(8,'ecommere','address'),(57,'ecommere','authgroup'),(58,'ecommere','authgrouppermissions'),(9,'ecommere','author'),(59,'ecommere','authpermission'),(60,'ecommere','authuser'),(61,'ecommere','authusergroups'),(62,'ecommere','authuseruserpermissions'),(10,'ecommere','book'),(11,'ecommere','bookitem'),(12,'ecommere','cart'),(13,'ecommere','cartbookitem'),(14,'ecommere','category'),(15,'ecommere','clothes'),(16,'ecommere','clothesitem'),(17,'ecommere','comment'),(18,'ecommere','customer'),(63,'ecommere','djangoadminlog'),(64,'ecommere','djangocontenttype'),(65,'ecommere','djangomigrations'),(66,'ecommere','djangosession'),(19,'ecommere','fullname'),(20,'ecommere','laptop'),(21,'ecommere','laptopitem'),(22,'ecommere','manufacture'),(23,'ecommere','order'),(24,'ecommere','payment'),(25,'ecommere','producer'),(26,'ecommere','publisher'),(27,'ecommere','shipment'),(28,'ecommere','styles'),(29,'ecommere','type'),(34,'productsview','account'),(35,'productsview','address'),(96,'productsview','authgroup'),(97,'productsview','authgrouppermissions'),(36,'productsview','author'),(98,'productsview','authpermission'),(99,'productsview','authuser'),(100,'productsview','authusergroups'),(101,'productsview','authuseruserpermissions'),(37,'productsview','book'),(38,'productsview','bookitem'),(39,'productsview','cart'),(40,'productsview','cartbookitem'),(41,'productsview','category'),(42,'productsview','clothes'),(43,'productsview','clothesitem'),(44,'productsview','comment'),(45,'productsview','customer'),(102,'productsview','djangoadminlog'),(103,'productsview','djangocontenttype'),(104,'productsview','djangomigrations'),(105,'productsview','djangosession'),(46,'productsview','fullname'),(47,'productsview','laptop'),(48,'productsview','laptopitem'),(49,'productsview','manufacture'),(50,'productsview','order'),(51,'productsview','payment'),(52,'productsview','producer'),(53,'productsview','publisher'),(54,'productsview','shipment'),(55,'productsview','styles'),(56,'productsview','type'),(6,'sessions','session'),(30,'usermanagement','account'),(31,'usermanagement','address'),(67,'usermanagement','authgroup'),(68,'usermanagement','authgrouppermissions'),(69,'usermanagement','author'),(70,'usermanagement','authpermission'),(71,'usermanagement','authuser'),(72,'usermanagement','authusergroups'),(73,'usermanagement','authuseruserpermissions'),(74,'usermanagement','book'),(75,'usermanagement','bookitem'),(76,'usermanagement','cart'),(77,'usermanagement','cartbookitem'),(78,'usermanagement','category'),(79,'usermanagement','clothes'),(80,'usermanagement','clothesitem'),(81,'usermanagement','comment'),(32,'usermanagement','customer'),(82,'usermanagement','djangoadminlog'),(83,'usermanagement','djangocontenttype'),(84,'usermanagement','djangomigrations'),(85,'usermanagement','djangosession'),(33,'usermanagement','fullname'),(86,'usermanagement','laptop'),(87,'usermanagement','laptopitem'),(88,'usermanagement','manufacture'),(89,'usermanagement','order'),(90,'usermanagement','payment'),(91,'usermanagement','producer'),(92,'usermanagement','publisher'),(93,'usermanagement','shipment'),(94,'usermanagement','styles'),(95,'usermanagement','type');
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
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-05 05:32:13.810173'),(2,'auth','0001_initial','2022-05-05 05:32:15.221226'),(3,'admin','0001_initial','2022-05-05 05:32:15.517899'),(4,'admin','0002_logentry_remove_auto_add','2022-05-05 05:32:15.536983'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-05 05:32:15.555554'),(6,'contenttypes','0002_remove_content_type_name','2022-05-05 05:32:15.756005'),(7,'auth','0002_alter_permission_name_max_length','2022-05-05 05:32:15.890414'),(8,'auth','0003_alter_user_email_max_length','2022-05-05 05:32:16.236531'),(9,'auth','0004_alter_user_username_opts','2022-05-05 05:32:16.256341'),(10,'auth','0005_alter_user_last_login_null','2022-05-05 05:32:16.370526'),(11,'auth','0006_require_contenttypes_0002','2022-05-05 05:32:16.380474'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-05 05:32:16.400425'),(13,'auth','0008_alter_user_username_max_length','2022-05-05 05:32:16.536319'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-05 05:32:16.676834'),(15,'auth','0010_alter_group_name_max_length','2022-05-05 05:32:16.807623'),(16,'auth','0011_update_proxy_permissions','2022-05-05 05:32:16.825306'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-05 05:32:17.167208'),(18,'ecommere','0001_initial','2022-05-05 05:32:17.239045'),(19,'sessions','0001_initial','2022-05-05 05:32:17.427410'),(20,'usermanagement','0001_initial','2022-05-05 05:45:22.404480'),(21,'productsview','0001_initial','2022-05-14 02:07:42.506426'),(22,'ecommere','0002_authgroup_authgrouppermissions_authpermission_authuser_authusergroups_authuseruserpermissions_django','2022-05-14 11:08:10.923578'),(23,'productsview','0002_authgroup_authgrouppermissions_authpermission_authuser_authusergroups_authuseruserpermissions_django','2022-05-14 11:08:10.963482'),(24,'usermanagement','0002_authgroup_authgrouppermissions_author_authpermission_authuser_authusergroups_authuseruserpermissions','2022-05-14 11:08:11.057221');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fullname`
--

DROP TABLE IF EXISTS `fullname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fullname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerid` int NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `midname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFullname417515` (`customerid`),
  CONSTRAINT `FKFullname417515` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fullname`
--

LOCK TABLES `fullname` WRITE;
/*!40000 ALTER TABLE `fullname` DISABLE KEYS */;
/*!40000 ALTER TABLE `fullname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS `laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeid` int NOT NULL,
  `producerid` int NOT NULL,
  `barcode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `warranty` int NOT NULL,
  `specification` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKLaptop810784` (`producerid`),
  KEY `FKLaptop537172` (`typeid`),
  CONSTRAINT `FKLaptop537172` FOREIGN KEY (`typeid`) REFERENCES `type` (`id`),
  CONSTRAINT `FKLaptop810784` FOREIGN KEY (`producerid`) REFERENCES `producer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

LOCK TABLES `laptop` WRITE;
/*!40000 ALTER TABLE `laptop` DISABLE KEYS */;
INSERT INTO `laptop` VALUES (1,1,1,'123-456-7891','Laptop Dell 5577',12,'laptop đẹp, mạnh, gaming tầm trung','');
/*!40000 ALTER TABLE `laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptopitem`
--

DROP TABLE IF EXISTS `laptopitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptopitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartid` int NOT NULL,
  `laptopid` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `laptopcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `currentprice` float NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `discount` float NOT NULL,
  `status` int DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKLaptopItem489593` (`laptopid`),
  KEY `FKLaptopItem826445` (`cartid`),
  CONSTRAINT `FKLaptopItem489593` FOREIGN KEY (`laptopid`) REFERENCES `laptop` (`id`),
  CONSTRAINT `FKLaptopItem826445` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptopitem`
--

LOCK TABLES `laptopitem` WRITE;
/*!40000 ALTER TABLE `laptopitem` DISABLE KEYS */;
INSERT INTO `laptopitem` VALUES (1,1,1,'','Dell001',20000000,'https://laptopaz.vn/media/product/1078_dell_5577__1_.jpg',5,0,'');
/*!40000 ALTER TABLE `laptopitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacture`
--

DROP TABLE IF EXISTS `manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacture`
--

LOCK TABLES `manufacture` WRITE;
/*!40000 ALTER TABLE `manufacture` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerid` int NOT NULL,
  `cartid` int NOT NULL,
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createat` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKOrder556711` (`customerid`),
  KEY `FKOrder795597` (`cartid`),
  CONSTRAINT `FKOrder556711` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKOrder795597` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `discount` float NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKPayment972219` (`orderid`),
  CONSTRAINT `FKPayment972219` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Dell','','');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Bjarne Stroustrup','Aarhus, Đan Mạch',NULL);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKShipment314014` (`orderid`),
  CONSTRAINT `FKShipment314014` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `styles`
--

DROP TABLE IF EXISTS `styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `styles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `styles`
--

LOCK TABLES `styles` WRITE;
/*!40000 ALTER TABLE `styles` DISABLE KEYS */;
/*!40000 ALTER TABLE `styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ram` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cpu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `screensize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gpu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'16 GB','intel core i7','15,6 inches','Gerforce GTX 1080','màn hình fullHD');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 14:11:06
