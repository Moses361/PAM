-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecom_store
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_county` text NOT NULL,
  `admin_about` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_job` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (2,'Moses Odhiambo','odhismoses20@gmail.com','Moseso570','mose.jpg','Kenya',' Change the about description for Moses','+254759930912','System Administrator');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (27,'::1',1,'',''),(32,'::1',1,'','');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_date` date NOT NULL,
  `order_status` text NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_orders`
--

LOCK TABLES `customer_orders` WRITE;
/*!40000 ALTER TABLE `customer_orders` DISABLE KEYS */;
INSERT INTO `customer_orders` VALUES (1,3,4200,1754384297,1,'Small','2021-10-25','pending'),(2,3,3800,1527749710,1,'Medium','2021-10-26','pending'),(3,3,4000,1774675043,1,'Medium','2021-10-26','pending'),(4,3,5500,1814567015,1,'','2023-03-02','Complete'),(5,3,20000,1832173183,1,'','2023-03-03','Complete'),(6,2,16000,1645751042,1,'','2023-03-03','pending'),(7,2,8300,1645751042,1,'','2023-03-03','pending'),(8,2,20000,1645751042,1,'','2023-03-03','pending'),(9,2,8000,1645751042,1,'','2023-03-03','Complete'),(10,4,5500,1161203515,1,'','2023-03-03','Complete'),(11,4,8300,51086434,1,'','2023-03-04','Complete');
/*!40000 ALTER TABLE `customer_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_county` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (3,'Linea','Devida','devida@gmail.com','devida','Mombasa','','0790364875','Mptwapa','bell-peppers-421087_640.jpg','127.0.0.1'),(4,'Moses','Odhiambo','odhismoses20@gmail.com','1234','Kiambu','','0759930912','P.o Box 126, Kosele.','mose.jpg','::1'),(5,'oses','Odhiambo','odhismoses20@gmail.com','0759930921','vihiga','','0759930912','po box 126 vihiga','mose.jpg','::1'),(6,'Moses ','Odhiambo ','moses@gmail.com','Moseso570','Homabay','','0790102001','po box 126 Kosele','moses.jpg','::1');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,47548,5500,'Paypall',2147483647,0,'23/04/2023'),(2,47548,20000,'Paypall',2147483647,0,'23/04/2023'),(3,47548,20000,'Paypall',2147483647,0,'23/04/2023'),(4,1358727648,5500,'Paypall',2147483647,0,'23/04/2023'),(5,47548,5500,'Paypall',2147483647,0,'23/04/2023');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_orders`
--

DROP TABLE IF EXISTS `pending_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_status` text NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_orders`
--

LOCK TABLES `pending_orders` WRITE;
/*!40000 ALTER TABLE `pending_orders` DISABLE KEYS */;
INSERT INTO `pending_orders` VALUES (10,4,1161203515,'26',1,'','Complete'),(11,4,51086434,'30',1,'','Complete');
/*!40000 ALTER TABLE `pending_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_cat_title` text NOT NULL,
  `p_cat_desc` text NOT NULL,
  PRIMARY KEY (`p_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'  VEHICLE TRANSPORTATION  ','We move your vehicle from one place to another'),(2,'  OFFICE RELOCATION ','\r\n\r\n\r\n\r\nOffice relocation refers to the process of moving an existing workplace or business to a new physical location.\r\n\r\n\r\n\r\n\r\n'),(3,' COMPUTERS AND ELECTRONICS RELOCATION','The process of moving and transporting electronic equipment and devices, such as computers, servers, and other electronics, from one location to another.'),(4,' WAREHOUSING ','The process of storing and managing goods or products in a designated facility or storage space until they are ready to be distributed or shipped to their final destination.'),(7,'COMMERCIAL AND INDUSTRIAL SHIFTING',' Relocating business operations, equipment, and facilities from one location to another,'),(8,' HOTEL RELOCATION ','Changes physical location, including furniture, equipment, and other assets, to a new property.'),(9,'DECLUTTERING AND ARRANGEMENT ','Organizing and optimizing a living or working space by removing unnecessary or unwanted items and arranging them');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) DEFAULT NULL,
  `product_keywords` text NOT NULL,
  `product_desc` text NOT NULL,
  `product_label` text NOT NULL,
  `product_sale` int(100) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (25,2,0,'2023-03-04 11:36:50','Home relocation','movers.jpg','home.jpg','hotel.jpg',5500,'','<p>Affordable to comrades</p>','',0),(26,2,0,'2023-03-02 20:40:59','Warehousing ','warehouse 2.jpg','store.jpg','warehouse b.jpg',5500,'','<p>Affordable</p>','',0),(27,3,0,'2023-03-04 11:31:11','Commercial Shifting ','commercial moving.jpg','commercial 2.jpg','commercial.jpg',10500,'','<p>Book and enjoy the service</p>','',0),(28,3,0,'2023-03-02 21:05:40','Hotel Relocation ','hotel 1.jpg','hotel.jpg','hotel 2.jpg',15000,'','<p>This service has discounted cost</p>','',0),(29,3,0,'2023-03-02 21:09:51','Office Relocation ','offisi.jpg','office 2.jpg','office 3.jpg',16000,'','<p>We take good care of your office items</p>','',0),(30,3,0,'2023-03-02 21:19:52','Decluttering and Arrangement','Arrangement.jpg','Arrangement.jpg','decluttering.jpg',8300,'','<p>Neat and well organise office office at affordable price</p>','',0),(31,3,0,'2023-03-02 21:26:41','Car Transport ','car transport a.jpg','car b.jpg','car 3.jpg',20000,'','<p>One among the best services you can trust</p>','',0),(32,3,0,'2023-03-04 11:29:49','Computers Relocation ','computers (2).jpg','computers 3.jpg','laptops.jpg',8000,'','<p>Professional handling of goods</p>','',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL AUTO_INCREMENT,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_url` varchar(255) NOT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (16,'slide1','movers.jpg',''),(17,'slide2','car transport a.jpg',''),(18,'slide 3','commercial moving.jpg',''),(19,'slide 4','warehouse b.jpg','');
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL AUTO_INCREMENT,
  `term_title` varchar(100) NOT NULL,
  `term_link` varchar(100) NOT NULL,
  `term_desc` text NOT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (9,'Rules & Regulations','link_1','<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</div>'),(10,'Promo & Regulations','link_2','<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</div>'),(11,'Refund Condition Policy','link_3','<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</p>');
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05  8:12:02
