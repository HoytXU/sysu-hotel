-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `accommodation`
--

DROP TABLE IF EXISTS `accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodation` (
  `入住时间` varchar(45) DEFAULT NULL,
  `id` int NOT NULL,
  `客房编号` int NOT NULL,
  `顾客id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accommodation_客房编号_eb67e2dc_fk_room_房间号` (`客房编号`),
  KEY `accommodation_顾客id_62abfda5_fk_client_顾客id` (`顾客id`),
  CONSTRAINT `accommodation_客房编号_eb67e2dc_fk_room_房间号` FOREIGN KEY (`客房编号`) REFERENCES `room` (`房间号`),
  CONSTRAINT `accommodation_顾客id_62abfda5_fk_client_顾客id` FOREIGN KEY (`顾客id`) REFERENCES `client` (`顾客id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation`
--

LOCK TABLES `accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation` DISABLE KEYS */;
INSERT INTO `accommodation` VALUES ('2023-5-23',101,1,1),('2023-6-6',102,2,2);
/*!40000 ALTER TABLE `accommodation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add accommodation',7,'add_accommodation'),(26,'Can change accommodation',7,'change_accommodation'),(27,'Can delete accommodation',7,'delete_accommodation'),(28,'Can view accommodation',7,'view_accommodation'),(57,'Can add 顾客管理',8,'add_client'),(58,'Can change 顾客管理',8,'change_client'),(59,'Can delete 顾客管理',8,'delete_client'),(60,'Can view 顾客管理',8,'view_client'),(61,'Can add 餐厅管理',9,'add_food'),(62,'Can change 餐厅管理',9,'change_food'),(63,'Can delete 餐厅管理',9,'delete_food'),(64,'Can view 餐厅管理',9,'view_food'),(65,'Can add 餐厅订单管理',10,'add_order'),(66,'Can change 餐厅订单管理',10,'change_order'),(67,'Can delete 餐厅订单管理',10,'delete_order'),(68,'Can view 餐厅订单管理',10,'view_order'),(69,'Can add 停车场管理',11,'add_park'),(70,'Can change 停车场管理',11,'change_park'),(71,'Can delete 停车场管理',11,'delete_park'),(72,'Can view 停车场管理',11,'view_park'),(73,'Can add 客房信息管理',12,'add_room'),(74,'Can change 客房信息管理',12,'change_room'),(75,'Can delete 客房信息管理',12,'delete_room'),(76,'Can view 客房信息管理',12,'view_room'),(77,'Can add 员工信息管理',13,'add_staff'),(78,'Can change 员工信息管理',13,'change_staff'),(79,'Can delete 员工信息管理',13,'delete_staff'),(80,'Can view 员工信息管理',13,'view_staff'),(81,'Can add 会员信息管理',14,'add_vip'),(82,'Can change 会员信息管理',14,'change_vip'),(83,'Can delete 会员信息管理',14,'delete_vip'),(84,'Can view 会员信息管理',14,'view_vip');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$2cvU9VzEWlr0LlreRyv2t3$wnPXxo8+gl40oTi5hy6f1vx2KJMqNyg52rvGCeY7pzk=','2023-05-25 08:51:51.645995',1,'admin','','','123@qq.com',1,1,'2023-05-23 05:47:09.487388');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `顾客id` int NOT NULL AUTO_INCREMENT,
  `姓名` varchar(45) DEFAULT NULL,
  `身份证号` varchar(45) DEFAULT NULL,
  `顾客相片` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`顾客id`)
) ENGINE=InnoDB AUTO_INCREMENT=114515 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'xuhao_client','114514','Client_images/campus-east.jpg'),(2,'test','111111','Client_images/f2.jpg'),(3,'333','3333','Client_images/f3.jpg'),(4,'222','22222','Client_images/f7.jpg');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (9,'2023-06-05 13:49:08.351908','101','xuhao_chef',3,'',13,1),(10,'2023-06-05 14:42:10.813924','2','雪',3,'',9,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'hotelapp','accommodation'),(8,'hotelapp','client'),(9,'hotelapp','food'),(10,'hotelapp','order'),(11,'hotelapp','park'),(12,'hotelapp','room'),(13,'hotelapp','staff'),(14,'hotelapp','vip'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-21 12:39:46.358777'),(2,'auth','0001_initial','2022-03-21 12:39:47.243488'),(3,'admin','0001_initial','2022-03-21 12:39:47.468309'),(4,'admin','0002_logentry_remove_auto_add','2022-03-21 12:39:47.481960'),(5,'admin','0003_logentry_add_action_flag_choices','2022-03-21 12:39:47.496090'),(6,'contenttypes','0002_remove_content_type_name','2022-03-21 12:39:47.628961'),(7,'auth','0002_alter_permission_name_max_length','2022-03-21 12:39:47.703590'),(8,'auth','0003_alter_user_email_max_length','2022-03-21 12:39:47.783079'),(9,'auth','0004_alter_user_username_opts','2022-03-21 12:39:47.796093'),(10,'auth','0005_alter_user_last_login_null','2022-03-21 12:39:47.867664'),(11,'auth','0006_require_contenttypes_0002','2022-03-21 12:39:47.875785'),(12,'auth','0007_alter_validators_add_error_messages','2022-03-21 12:39:47.889429'),(13,'auth','0008_alter_user_username_max_length','2022-03-21 12:39:47.966852'),(14,'auth','0009_alter_user_last_name_max_length','2022-03-21 12:39:48.045694'),(15,'hotelapp','0001_initial','2022-03-21 12:39:48.054417'),(16,'hotelapp','0002_auto_20220321_2039','2022-03-21 12:39:49.548506'),(17,'sessions','0001_initial','2022-03-21 12:39:49.636921'),(18,'auth','0010_alter_group_name_max_length','2023-05-25 08:51:15.641399'),(19,'auth','0011_update_proxy_permissions','2023-05-25 08:51:15.647296'),(20,'auth','0012_alter_user_first_name_max_length','2023-05-25 08:51:15.701702'),(21,'hotelapp','0003_alter_accommodation_options_alter_client_options_and_more','2023-05-25 08:51:15.720273'),(22,'hotelapp','0004_client_顾客相片_food_菜品相片_room_客房款式相片_staff_员工相片_and_more','2023-06-04 10:12:30.646933');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fge7n7xfn9o5lxnisrg4i2hvs81ab3g7','YjA1YjBmMzIyYWM1MDA4Y2Q5MWNiYjRmMzQ1YzhmMDJjZTgyOTNmNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTAxZDQzMmFmYzA0ZjA3ZjdjZjQ1OWQzYzgwMTViMDA5ZGYzNzVhIiwiX21lbnVzIjoiW3tcIm5hbWVcIjogXCJIb3RlbGFwcFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1NGYxYVxcdTU0NThcXHU0ZmUxXFx1NjA2ZlxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vaG90ZWxhcHAvdmlwL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC92aXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiSG90ZWxhcHBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTRmMWFcXHU1NDU4XFx1NGZlMVxcdTYwNmZcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1MDVjXFx1OGY2NlxcdTU3M2FcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3BhcmsvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3BhcmsvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiSG90ZWxhcHBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTUwNWNcXHU4ZjY2XFx1NTczYVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDAzfSwge1wibmFtZVwiOiBcIlxcdTU0NThcXHU1ZGU1XFx1NGZlMVxcdTYwNmZcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3N0YWZmL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9zdGFmZi9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJIb3RlbGFwcFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NTQ1OFxcdTVkZTVcXHU0ZmUxXFx1NjA2ZlxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA0fSwge1wibmFtZVwiOiBcIlxcdTViYTJcXHU2MjNmXFx1NGZlMVxcdTYwNmZcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3Jvb20vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL3Jvb20vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiSG90ZWxhcHBcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTViYTJcXHU2MjNmXFx1NGZlMVxcdTYwNmZcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwNX0sIHtcIm5hbWVcIjogXCJcXHU1YmEyXFx1NjIzZlxcdThiYTJcXHU1MzU1XFx1N2JhMVxcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9hY2NvbW1vZGF0aW9uL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9hY2NvbW1vZGF0aW9uL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkhvdGVsYXBwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1YmEyXFx1NjIzZlxcdThiYTJcXHU1MzU1XFx1N2JhMVxcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1OTg3ZVxcdTViYTJcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL2NsaWVudC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vaG90ZWxhcHAvY2xpZW50L2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkhvdGVsYXBwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU5ODdlXFx1NWJhMlxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA3fSwge1wibmFtZVwiOiBcIlxcdTk5MTBcXHU1Mzg1XFx1N2JhMVxcdTc0MDZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9mb29kL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9mb29kL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIkhvdGVsYXBwXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU5OTEwXFx1NTM4NVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA4fSwge1wibmFtZVwiOiBcIlxcdTk5MTBcXHU1Mzg1XFx1OGJhMlxcdTUzNTVcXHU3YmExXFx1NzQwNlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2hvdGVsYXBwL29yZGVyL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9ob3RlbGFwcC9vcmRlci9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJIb3RlbGFwcFwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1OTkxMFxcdTUzODVcXHU4YmEyXFx1NTM1NVxcdTdiYTFcXHU3NDA2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA5fV0sIFwiZWlkXCI6IDEwMDF9LCB7XCJuYW1lXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXNoaWVsZC1hbHRcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU3NTI4XFx1NjIzN1wiLCBcImljb25cIjogXCJmYXIgZmEtdXNlclwiLCBcInVybFwiOiBcIi9hZG1pbi9hdXRoL3VzZXIvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2F1dGgvdXNlci9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwifSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XCIsIFwiaWNvblwiOiBcImZhciBmYS11c2VyXCJ9XSwgXCJlaWRcIjogMTAxMX0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhcyBmYS11c2Vycy1jb2dcIiwgXCJ1cmxcIjogXCIvYWRtaW4vYXV0aC9ncm91cC9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vYXV0aC9ncm91cC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wiLCBcImljb25cIjogXCJmYXMgZmEtc2hpZWxkLWFsdFwifSwge1wibmFtZVwiOiBcIlxcdTdlYzRcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXVzZXJzLWNvZ1wifV0sIFwiZWlkXCI6IDEwMTJ9XSwgXCJlaWRcIjogMTAxMH1dIn0=','2022-04-05 06:09:11.603463'),('qqu8nql6mg68wd7kinl32duewxoifmyg','.eJzFl8mSmzAQhl_FxdkLizbmmFMuOeYUplyNFpsMIJeAXKb87pHAVTMm2KPywOQkS_27f_XXgOA12EPXHvddI82-EMFTEAXr92s58BdZu4D4DfVBb7muW1PkWyfZXqLN9ocWsvx20V4lOEJztP9mEKMkx4hRoWJCCWEyjOMUKEm4oGmoZGJ_KSEiydI0ZFRSEuWIYGk9UJS6pJWsu8bm-vWaBTVUMgueVlnwXbeyhNMpC9Z2Vtj9DesKzErBhheGl3IIVm6XjQtfp8iyDqkI7IARZv1MRnYgIVF2oDm4GUUh8TDpTDnEdiCqot4dL_vb_SlOu0ECQvy8p7LxizI3EgQ3XZVPbNuz8vN6tUy152cXloVw0SgM4wknHGJuB6YIcTOawHxAT2BePIj2ssWRfrLQMctkymJoFxYSL3WNNi0o5cF00C0PdZaKx2zRlFMOscsdJ2optkbrygNtL1ue7Cz1jsniD53YMMMJxvORBc51ZR_u0Ba69kB8rf9i1o8SGLMmE06pPTffDGeiy8tC1q0H1otwcZ6PVjkmSKdyp1HYd4fNeH0qrYUHv162PL0HKxzTYx_mXuRe10ZI4wFz0H0xzbnu7XS8EE1YWzPUDzzqj0rm3j9IwtyJSShK_vVsnGdzLGQpNlC2H74UUxyz4cFFbxTgXvGnG-a-AHYufLtXbxLPNs1T9ARK30JHbYmm2kIlRzd24ZI0G64Pd5AdjO7ufCe80_x3aF6FjpHF44Xw_Byc_wKVb4yY:1q6RVw:VgXO2cOMRa2_SuzSvozxxcIZV7W-10x95wVdwKU9iik','2023-06-20 07:54:00.002396');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `菜品编号` int NOT NULL,
  `菜名` varchar(45) NOT NULL,
  `价格` varchar(45) NOT NULL,
  `厨师id` int NOT NULL,
  `菜品相片` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`菜品编号`),
  KEY `food_厨师id_1eda2d69_fk_staff_员工id` (`厨师id`),
  CONSTRAINT `food_厨师id_1eda2d69_fk_staff_员工id` FOREIGN KEY (`厨师id`) REFERENCES `staff` (`员工id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'红烧肉','38',101,'Food_images/sina.jpg');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `桌号` int NOT NULL,
  `id` int NOT NULL,
  `服务员编号` int NOT NULL,
  `菜品编号` int NOT NULL,
  `顾客编号` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_服务员编号_0debb5b8_fk_staff_员工id` (`服务员编号`),
  KEY `order_菜品编号_6da89f1d_fk_food_菜品编号` (`菜品编号`),
  KEY `order_顾客编号_45bccbd4_fk_client_顾客id` (`顾客编号`),
  CONSTRAINT `order_服务员编号_0debb5b8_fk_staff_员工id` FOREIGN KEY (`服务员编号`) REFERENCES `staff` (`员工id`),
  CONSTRAINT `order_菜品编号_6da89f1d_fk_food_菜品编号` FOREIGN KEY (`菜品编号`) REFERENCES `food` (`菜品编号`),
  CONSTRAINT `order_顾客编号_45bccbd4_fk_client_顾客id` FOREIGN KEY (`顾客编号`) REFERENCES `client` (`顾客id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,101,101,1,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park`
--

DROP TABLE IF EXISTS `park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park` (
  `车位编号` int NOT NULL,
  `当前状态` varchar(45) NOT NULL,
  `车辆牌号` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`车位编号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park`
--

LOCK TABLES `park` WRITE;
/*!40000 ALTER TABLE `park` DISABLE KEYS */;
INSERT INTO `park` VALUES (1,'空闲','黑A12345'),(2,'空闲','湘C66666'),(3,'空闲','粤B54321');
/*!40000 ALTER TABLE `park` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `房间号` int NOT NULL,
  `客房类型` varchar(45) NOT NULL,
  `价格` int NOT NULL,
  `负责人编号` int NOT NULL,
  `客房款式相片` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`房间号`),
  KEY `room_负责人编号_2dabc7af_fk_staff_员工id` (`负责人编号`),
  CONSTRAINT `room_负责人编号_2dabc7af_fk_staff_员工id` FOREIGN KEY (`负责人编号`) REFERENCES `staff` (`员工id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'标准间',188,102,'Room_images/home_pLNDkkC.gif'),(2,'豪华间',388,102,'Room_images/home.gif');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `员工id` int NOT NULL AUTO_INCREMENT,
  `姓名` varchar(45) NOT NULL,
  `职务` varchar(45) NOT NULL,
  `月薪` varchar(45) NOT NULL,
  `工龄` varchar(45) NOT NULL,
  `员工相片` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`员工id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (101,'xuhao_chef','厨师','3000','1','Staff_images/f2.jpg'),(102,'xuhao_waiter','服务员','3000','1','Staff_images/tencent.jpg');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip`
--

DROP TABLE IF EXISTS `vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip` (
  `会员编号` int NOT NULL AUTO_INCREMENT,
  `姓名` varchar(45) NOT NULL,
  `会员等级` varchar(45) NOT NULL,
  `联系方式` varchar(45) NOT NULL,
  `会员相片` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`会员编号`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip`
--

LOCK TABLES `vip` WRITE;
/*!40000 ALTER TABLE `vip` DISABLE KEYS */;
INSERT INTO `vip` VALUES (1,'xuhao_vip','高级会员','1999999999','Vip_images/f2_0UgPeYy.jpg'),(2,'htw_vip','高级会员','188888888','Vip_images/f5.jpg');
/*!40000 ALTER TABLE `vip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-07 19:26:46
