-- MySQL dump 10.13  Distrib 5.5.40, for osx10.9 (x86_64)
--
-- Host: localhost    Database: RealState_development
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Current Database: `RealState_development`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `realstate_development` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `RealState_development`;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2016-08-30 19:36:35','2016-08-30 19:36:35');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_images_on_property_id` (`property_id`) USING BTREE,
  CONSTRAINT `fk_rails_9d256130f9` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'http://photos1.zillowstatic.com/p_f/IS9t4gd1bacd160000000000.jpg',0,1,'2016-08-30 19:36:36','2016-08-30 19:36:36'),(2,'http://photos2.zillowstatic.com/p_f/ISp5dz4r4hag760000000000.jpg',0,1,'2016-08-30 19:36:36','2016-08-30 19:36:36'),(3,'http://maps.googleapis.com/maps/api/streetview?client=gme-truliainc&size=640x480&sensor=false&location=45.724525%2C-94.47628&signature=wsJZ45Nj6accHBOC29pfpg6GyRQ=',1,1,'2016-08-30 19:36:36','2016-08-30 19:36:36'),(4,'http://images.kw.com/listings/8/0/1/8014622/1465994760992__kwipfn01_1_.jpg',1,2,'2016-08-30 19:36:37','2016-08-30 19:36:37'),(5,'http://ap.rdcpix.com/540656623/f18ca0fbedbcfd8dcfb1e8ce911609dfl-m5xd-w640_h480_q80.jpg',0,2,'2016-08-30 19:36:37','2016-08-30 19:36:37'),(6,'http://photos3.zillowstatic.com/p_f/IShzanmk092j760000000000.jpg',0,2,'2016-08-30 19:36:37','2016-08-30 19:36:37');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `livable_area_square_feet` int(11) DEFAULT NULL,
  `land_size_acres` decimal(8,2) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `property_type` varchar(255) DEFAULT NULL,
  `features` text,
  `latitude` decimal(9,7) DEFAULT NULL,
  `longitude` decimal(9,7) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_sold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'20 Pine St 1710','New York','NY',10005,122500.00,1,1,1100,0.15,'Steps to the city','Step in to this giant loft with a little over 1100 sf and immediately you will begin to the feel generous and spacious layout.','APARTMENT','[\"POOL\",\"LAUNDRY\"]',40.7077299,-74.0097298,'2016-08-30 19:36:36','2016-08-30 19:36:36',0),(2,'111 Main St','Holdingford','MN',56340,189000.00,4,2,1500,1.50,'Small town corner','This lovely city corner lot has great access to the town and views of the country side.','DETACHED_HOME','[\"LAUNDRY\",\"GARAGE\",\"CORNER_LOT\"]',45.7241609,-94.4757876,'2016-08-30 19:36:37','2016-08-30 19:36:37',1),(3,'1965 Moorhead Rd','Cloquet','MN',55720,339000.00,4,4,3592,0.35,'Stunning home located on over 6 acres!','Enjoy this 4 bedroom, 4 bathroom, 2+ car heated attached garage. The main floor features 9\' ceilings and includes a bedroom, 3/4 bath, large living room with french doors & gas fireplace, gorgeous kitchen with double hung ovens, gas stove top, center island, formal dining room, and a laundry room. The second floor has 3 bedrooms and 2 full baths. The master suite has vaulted ceilings and walk in tiled shower, double sink vanity(knotty alder), huge walk-in closet. The lower level walkout has 9\' ceilings and is finished with a family room including a fireplace and french doors, 1/2 bath, storage room, and utility room. There is in-floor heat throughout the house and garage.','DETACHED_HOME','[\"LAUNDRY\",\"GARAGE\",\"CORNER_LOT\"]',46.6783065,-92.4911914,'2016-08-30 19:36:37','2016-08-30 19:36:37',1),(4,'114 Chase Ave','Nicollet','MN',56074,249000.00,3,2,1650,1.00,'New construction','Located in Nicollet by the walking trails to school! 3 bedroom, 2 bathrooms. 1650 Sq ft. on the main floor. Basement unfinished. Gas fireplace, whirlpool tub in master, vaulted ceilings.','DETACHED_HOME','[\"LAUNDRY\",\"GARAGE\",\"CORNER_LOT\",\"CENTRAL_AC\"]',44.2800734,-94.1831394,'2016-08-30 19:36:37','2016-08-30 19:36:37',0),(5,'209 N Grant St','Taunton','MN',56291,165000.00,3,3,2898,2.00,'Truly a sight to behold','Original home totally updated w/new addition to meet your every need! New plumbing, wiring, insulation, shingles, siding, windows, flooring amazing baths & kitchen. Spacious lot includes Quonset garage/shop mature trees, asparagus and apple trees. Beautiful new kitchen is plumbed & wired for island. Two zone HVAC for comfort & efficiency. Basement is ready to finish as family room or billiards. Lots of storage in updated, clean & welcoming basement will be one more great surprise in this home. Don\'t miss your chance to drive by and appreciate the curb appeal- new landscaping and front porch are highlights. Make as appointment for interior viewing & check out the office or main floor bedroom, open concept living, dining and kitchen, handy back foyer/laundry. ','DETACHED_HOME','[\"LAUNDRY\",\"GARAGE\",\"CORNER_LOT\"]',44.5964020,-96.0678280,'2016-08-30 19:36:37','2016-08-30 19:36:37',0);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sql_query` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'All Properties','select id, address, city, state, postal_code, price, CASE is_sold WHEN 1 THEN \'yes\' ELSE \'no\' END as is_sold from properties;','2016-08-30 19:36:37','2016-08-30 19:36:37'),(2,'Sold Properties','select id, address, city, state, postal_code, price, CASE is_sold WHEN 1 THEN \'yes\' ELSE \'no\' END as is_sold from properties where is_sold=1;','2016-08-30 19:36:37','2016-08-30 19:36:37'),(3,'Unsold Properties','select id, address, city, state, postal_code, price, CASE is_sold WHEN 1 THEN \'yes\' ELSE \'no\' END as is_sold from properties where is_sold=0 or is_sold is null;','2016-08-30 19:36:37','2016-08-30 19:36:37'),(4,'Cheap Properties','select id, address, city, state, postal_code, price, CASE is_sold WHEN 1 THEN \'yes\' ELSE \'no\' END as is_sold from properties where price < 200000;','2016-08-30 19:36:37','2016-08-30 19:36:37'),(5,'Expensive Properties','select id, address, city, state, postal_code, price, CASE is_sold WHEN 1 THEN \'yes\' ELSE \'no\' END as is_sold from properties where price >= 200000;','2016-08-30 19:36:37','2016-08-30 19:36:37'),(6,'All Users','select id, email, role from users;','2016-08-30 19:36:37','2016-08-30 19:36:37'),(7,'Admin Users','select id, email, role from users where role=\'ADMIN\';','2016-08-30 19:36:37','2016-08-30 19:36:37'),(8,'Agent Users','select id, email, role from users where role=\'AGENT\';','2016-08-30 19:36:37','2016-08-30 19:36:37'),(9,'Customer Users','select id, email, role from users where role=\'CUSTOMER_USER\';','2016-08-30 19:36:37','2016-08-30 19:36:37');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160829163843'),('20160829205538'),('20160830020542'),('20160830021410'),('20160830150519'),('20160830153755');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `api_auth_token` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_api_auth_token` (`api_auth_token`) USING BTREE,
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE,
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@mail.com','$2a$11$GdeIgdGYJKwTiGIZSGEBD.LPNmGjdhcWaxuOJDqf0GX9OQT892J.u',NULL,NULL,NULL,1,'2016-08-30 19:36:49','2016-08-30 19:36:49','127.0.0.1','127.0.0.1',NULL,'2016-08-30 19:36:36',NULL,0,NULL,NULL,'ADMIN','2016-08-30 19:36:36','2016-08-30 19:36:49','fHbJFzPUazQNttLh3LhU'),(2,'agent@mail.com','$2a$11$s9Yavt0iyABQoH51BNmhne03AvlHW4ILTqvmxW/elPFzfLzeCsrty',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2016-08-30 19:36:36',NULL,0,NULL,NULL,'AGENT','2016-08-30 19:36:36','2016-08-30 19:36:36','2PtUnUFE_k6jVTYXTa6K'),(3,'customer_user@mail.com','$2a$11$pnbi44jvFLNC/80Ws/nGWuCimPMDr3QL17FVR0wmlE3c77rCzO7ii',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2016-08-30 19:36:36',NULL,0,NULL,NULL,'CUSTOMER_USER','2016-08-30 19:36:36','2016-08-30 19:36:36','hc-djsjViWrzahyJZKX5');
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

-- Dump completed on 2016-08-30 13:55:08
