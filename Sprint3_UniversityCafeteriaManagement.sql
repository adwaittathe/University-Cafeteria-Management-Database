-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: dbteam27adwait.cfxhoutuua1g.us-east-2.rds.amazonaws.com    Database: University_Cafeteria_Management
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Delivery` (
  `orderId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL,
  `isDelivered` varchar(45) NOT NULL DEFAULT 'No',
  KEY `del_fk_userId_idx` (`userId`),
  KEY `del_fk_vendorId_idx` (`vendorId`),
  KEY `del_fk_personId_idx` (`personId`),
  KEY `del_fk_locationId_idx` (`locationId`),
  KEY `del_fk_orderId_idx` (`orderId`),
  CONSTRAINT `del_fk_locationId` FOREIGN KEY (`locationId`) REFERENCES `Location` (`locationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `del_fk_personId` FOREIGN KEY (`personId`) REFERENCES `DeliveryPerson` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `del_fk_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `del_fk_vendorId` FOREIGN KEY (`vendorId`) REFERENCES `Vendor` (`vendorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1,8010001,1,1,1,'Yes'),(3,8010003,2,5,4,'Yes'),(4,8010004,1,2,3,'Yes'),(14,8010007,3,7,3,'Yes'),(16,8010006,2,6,3,'Yes'),(17,8010006,3,7,4,'Yes'),(18,8010006,2,6,3,'Yes'),(19,8010005,2,6,5,'No'),(22,8010001,3,7,5,'Yes'),(23,8010002,3,5,5,'Yes');
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adwait_tathe`@`%`*/ /*!50003 trigger AFTER_Delivery_INSERT AFTER INSERT ON Delivery for each row
BEGIN
  call set_availability(new.isDelivered,new.personId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adwait_tathe`@`%`*/ /*!50003 trigger AFTER_Delivery_UPDATE AFTER UPDATE ON Delivery for each row
BEGIN
  call set_availability(new.isDelivered,new.personId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DeliveryPerson`
--

DROP TABLE IF EXISTS `DeliveryPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeliveryPerson` (
  `personId` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `workContactNo` varchar(45) NOT NULL,
  PRIMARY KEY (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryPerson`
--

LOCK TABLES `DeliveryPerson` WRITE;
/*!40000 ALTER TABLE `DeliveryPerson` DISABLE KEYS */;
INSERT INTO `DeliveryPerson` VALUES (1,'Dawn','Jenkins','5704417456'),(2,'Denise','Springer','3154504906'),(3,'John','Valentine','2135988345'),(4,'David','Schwartz','4323459685'),(5,'Ethan','Carver','5015029221'),(6,'Marie','Williams','8589235748'),(7,'Paul','Hosey','9035831374'),(8,'Robert','Marshal','4125830123'),(9,'Patricia','Beck','7039113242'),(10,'Peter','Martin','3721395432');
/*!40000 ALTER TABLE `DeliveryPerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedback` (
  `feedbackId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `suggestion` varchar(200) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `feedback_fk_userId_idx` (`userId`),
  KEY `feedback_fk_vendorId_idx` (`vendorId`),
  CONSTRAINT `feedback_fk_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `feedback_fk_vendorId` FOREIGN KEY (`vendorId`) REFERENCES `Vendor` (`vendorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES (1,8010006,3,NULL,4,'2018-10-11');
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food`
--

DROP TABLE IF EXISTS `Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Food` (
  `foodId` int(11) NOT NULL AUTO_INCREMENT,
  `vendorId` int(20) NOT NULL,
  `foodName` varchar(100) NOT NULL,
  `foodCategory` enum('Veg','NonVeg','Vegan') NOT NULL,
  `price` float NOT NULL,
  `ingredients` varchar(500) NOT NULL,
  `image` varchar(700) DEFAULT NULL,
  `availability` tinyint(4) NOT NULL DEFAULT '1',
  `preparationTime` varchar(45) NOT NULL,
  PRIMARY KEY (`foodId`),
  KEY `fk_vendorId_idx` (`vendorId`),
  KEY `idx_food_price` (`price`),
  CONSTRAINT `fk_vendorId` FOREIGN KEY (`vendorId`) REFERENCES `Vendor` (`vendorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food`
--

LOCK TABLES `Food` WRITE;
/*!40000 ALTER TABLE `Food` DISABLE KEYS */;
INSERT INTO `Food` VALUES (1,1,'Buffalo Chicken','NonVeg',6.2,'Chicken,Buffalo Chicken, Ranch','buffalo_chicken.jpg',1,'10'),(2,2,'Chocolate Lava Crunch','Veg',3.2,'Chocolate, Coffee, Sugar','chocolate_lava.jpg',1,'5'),(3,3,'Pulled Pork Sandwich','NonVeg',5.6,'Pulled Pork,Barbeque Sauce','Pulled_pork_sandwitch.png',1,'10'),(4,3,'Macroni and Cheese','Veg',1.59,'Macroni, Cheese, Mayonnaise','MacAndCheese.jpg',1,'7'),(5,5,'Chicken Nachos','NonVeg',5.2,'Chicken,tortilla chips, creamy queso, tomatoes','nachos_chicken.png',1,'4'),(6,5,'Rosted Beef Burrito','NonVeg',6.1,'Beef, Tomato, Onion','roasted_beef_burrito.jpg',1,'12');
/*!40000 ALTER TABLE `Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `locationName` varchar(45) NOT NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'Kennedy'),(2,'Woodward Hall'),(3,'Fretwell'),(4,'Atkins Library'),(5,'Belk Gym'),(6,'EPIC'),(7,'Grigg Hall'),(8,'McEnquiry'),(9,'Portal'),(10,'Bioinformatics');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `vendorId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `takeAwayType` enum('Inperson','CampusDelivery') NOT NULL,
  `totalAmount` float DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `order_fk_vendorId_idx` (`vendorId`),
  KEY `order_fk_userId_idx` (`userId`),
  CONSTRAINT `order_fk_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_fk_vendorId` FOREIGN KEY (`vendorId`) REFERENCES `Vendor` (`vendorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,3,8010001,'Inperson',0),(2,1,8010002,'Inperson',0),(3,2,8010003,'CampusDelivery',0),(4,3,8010004,'CampusDelivery',0),(5,3,8010013,'Inperson',0),(6,5,8010005,'Inperson',0),(11,3,8010001,'Inperson',11.2),(12,3,8010006,'Inperson',16.8),(13,3,8010007,'CampusDelivery',NULL),(14,3,8010007,'CampusDelivery',16.8),(15,2,8010006,'CampusDelivery',NULL),(16,2,8010006,'CampusDelivery',16),(17,3,8010006,'CampusDelivery',11.2),(18,2,8010006,'CampusDelivery',12.8),(19,2,8010005,'CampusDelivery',19.2),(20,3,8010010,'Inperson',43.14),(21,3,8010012,'Inperson',8.78),(22,3,8010001,'CampusDelivery',31.18),(23,3,8010002,'CampusDelivery',31.18);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderedFood`
--

DROP TABLE IF EXISTS `OrderedFood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderedFood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordfood_fk_foodId_idx` (`foodId`),
  CONSTRAINT `ordfood_fk_foodId` FOREIGN KEY (`foodId`) REFERENCES `Food` (`foodId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderedFood`
--

LOCK TABLES `OrderedFood` WRITE;
/*!40000 ALTER TABLE `OrderedFood` DISABLE KEYS */;
INSERT INTO `OrderedFood` VALUES (1,1,1,3),(2,2,1,1),(3,3,2,2),(4,4,4,1),(5,4,3,2),(6,5,4,1),(7,6,6,2),(8,11,3,2),(9,12,3,3),(10,13,3,3),(11,14,3,3),(12,15,2,7),(13,16,2,5),(14,17,3,2),(15,18,2,4),(16,19,2,6),(17,20,3,6),(18,20,4,6),(19,21,3,1),(20,21,4,2),(21,22,3,5),(22,22,4,2),(23,23,3,5),(24,23,4,2);
/*!40000 ALTER TABLE `OrderedFood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `contactNo1` varchar(10) NOT NULL,
  `contactNo2` varchar(10) DEFAULT NULL,
  `emailID` varchar(100) NOT NULL,
  `ninerWallet` float NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `emailID_UNIQUE` (`emailID`)
) ENGINE=InnoDB AUTO_INCREMENT=8010014 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (8010001,'password1','Bob','Smith','7049057642',NULL,'bsmith@uncc.edu',29.15),(8010002,'password2','Alex','Watson','7048234491',NULL,'awatson@uncc.edu',635.66),(8010003,'password3','Ravi','Rajan','9049057777',NULL,'ravirajan@uncc.edu',211.01),(8010004,'password4','Mike','Hillyer','7047082345','8048059634','mike203@uncc.edu',623.63),(8010005,'password5','Chikako','Honoka','7047026678',NULL,'honoka.ch@uncc.edu',452.97),(8010006,'password6','Meju','Kyoko','7047055758',NULL,'meju876@uncc.edu',295.84),(8010007,'password7','Sadeq','Alsaif','7057075678','8067894657','Sadeqa@uncc.edu',896.99),(8010008,'password8','Xing','Ming','6123731376','5417530864','xming@uncc.edu',100),(8010009,'password9','Michael','Cook','7047055678','3035550111','michaelcook@uncc.edu',0.4),(8010010,'password10','Taylor','Brady','2025550102',NULL,'bradym@uncc.edu',200.4),(8010011,'password11','Parker','Deaton','2058347123','6155014924','deaton233@uncc.edu',50.23),(8010012,'password12','Nathan','Collins','8028042331',NULL,'nathan1994@uncc.edu',19.24),(8010013,'password13','Amir','Ali','8038047253',NULL,'amir.ali@uncc.edu',8.2);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `vendorId` int(11) NOT NULL AUTO_INCREMENT,
  `shopName` varchar(60) NOT NULL,
  `vendorUserName` varchar(60) NOT NULL,
  `password` varchar(45) NOT NULL,
  `vendorFirstName` varchar(45) NOT NULL,
  `vendorLastName` varchar(45) NOT NULL,
  `vendorEmail` varchar(50) NOT NULL,
  PRIMARY KEY (`vendorId`),
  UNIQUE KEY `vendorUserName_UNIQUE` (`vendorUserName`),
  FULLTEXT KEY `idx_Vendor_ShopName` (`shopName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor`
--

LOCK TABLES `Vendor` WRITE;
/*!40000 ALTER TABLE `Vendor` DISABLE KEYS */;
INSERT INTO `Vendor` VALUES (1,'Bojangles','joey.smith','vendorpassword1','Joey','Smith','joey495@uncc.edu'),(2,'Dominos','victoria.bobinson ','vendorpassword2','Victoria','Robinson','robinson.victoria@uncc.edu'),(3,'Smoked','sachin.kulkarni','vendorpassword3','Sachin','Kulkarni','sachin.kulkarni@uncc.edu'),(4,'Wendy\'s','hlytch','vendorpassword4','Horace','Lytch','hlytch@uncc.edu'),(5,'Salsaritas','johnny.holdorf','vendorpassword5','Johny','Holdorf','jhny@uncc.edu');
/*!40000 ALTER TABLE `Vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VendorDeliveryPerson`
--

DROP TABLE IF EXISTS `VendorDeliveryPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VendorDeliveryPerson` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `availability` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`Id`),
  KEY `vendel_fk_vendorId_idx` (`vendorId`),
  KEY `vendel_fk_personId_idx` (`personId`),
  CONSTRAINT `vendel_fk_personId` FOREIGN KEY (`personId`) REFERENCES `DeliveryPerson` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vendel_fk_vendorId` FOREIGN KEY (`vendorId`) REFERENCES `Vendor` (`vendorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VendorDeliveryPerson`
--

LOCK TABLES `VendorDeliveryPerson` WRITE;
/*!40000 ALTER TABLE `VendorDeliveryPerson` DISABLE KEYS */;
INSERT INTO `VendorDeliveryPerson` VALUES (1,1,1,'Yes'),(2,1,2,'Yes'),(3,2,6,'Yes'),(4,2,3,'Yes'),(5,2,4,'Yes'),(6,3,7,'Yes'),(7,3,5,'Yes'),(8,4,10,'Yes'),(9,5,8,'Yes'),(10,5,9,'Yes');
/*!40000 ALTER TABLE `VendorDeliveryPerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getAllOrdersOfBojangles`
--

DROP TABLE IF EXISTS `getAllOrdersOfBojangles`;
/*!50001 DROP VIEW IF EXISTS `getAllOrdersOfBojangles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getAllOrdersOfBojangles` AS SELECT 
 1 AS `orderId`,
 1 AS `User Name`,
 1 AS `takeAwayType`,
 1 AS `Total Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `getAllOrdersOfDominos`
--

DROP TABLE IF EXISTS `getAllOrdersOfDominos`;
/*!50001 DROP VIEW IF EXISTS `getAllOrdersOfDominos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getAllOrdersOfDominos` AS SELECT 
 1 AS `orderId`,
 1 AS `User Name`,
 1 AS `takeAwayType`,
 1 AS `Total Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `getAllOrdersOfSmoked`
--

DROP TABLE IF EXISTS `getAllOrdersOfSmoked`;
/*!50001 DROP VIEW IF EXISTS `getAllOrdersOfSmoked`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getAllOrdersOfSmoked` AS SELECT 
 1 AS `orderId`,
 1 AS `User Name`,
 1 AS `takeAwayType`,
 1 AS `Total Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'University_Cafeteria_Management'
--

--
-- Dumping routines for database 'University_Cafeteria_Management'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetOrderDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adwait_tathe`@`%` PROCEDURE `GetOrderDetails`(IN in_userId INT, IN in_orderId INT)
BEGIN
select concat_ws(' ',u.firstName,u.lastName) as USER,o.orderId, 
 v.shopName, f.foodName, f.price as Price, of.quantity as Quantity,
 o.totalAmount as TotalAmount
from University_Cafeteria_Management.Order o, 
OrderedFood of, Food f, Vendor v, User u where 
o.orderId = of.orderId and of.foodId = f.foodId and o.userId = u.userId and
o.vendorId = v.vendorId and u.userId = in_userId and o.orderId = in_orderId;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PlaceOrderDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adwait_tathe`@`%` PROCEDURE `PlaceOrderDelivery`(IN in_userId INT, IN in_vendorId INT, 
In in_takeawaytype ENUM('Inperson','CampusDelivery'),
In in_locationId INT, In in_foodId varchar(225), IN in_quantity varchar(225))
BEGIN
DECLARE sp_orderId INT; 
DECLARE sp_price FLOAT; 
DECLARE sp_tot FLOAT;
DECLARE sp_personId INT;

DECLARE element varchar(150);
DECLARE ele_quant varchar(100);
DECLARE amount FLOAT default 0.0;
insert into University_Cafeteria_Management.Order(vendorId, userId, takeAwayType) values(in_vendorId,
		in_userId, in_takeawaytype);
SELECT MAX(orderId) INTO sp_orderId FROM University_Cafeteria_Management.Order;
while in_foodId != '' 
DO 
		set element = SUBSTRING_INDEX(in_foodId, ',', 1); 
        set ele_quant = SUBSTRING_INDEX(in_quantity, ',', 1); 
		insert into OrderedFood(orderId,foodId,quantity) values(sp_orderId,element,ele_quant);
		SELECT price INTO sp_price FROM Food WHERE foodId = element;
		set amount = amount + (sp_price * ele_quant);
		
		IF LOCATE(',', in_foodId) > 0 THEN
			SET in_foodId = SUBSTRING(in_foodId, LOCATE(',', in_foodId) + 1);
            SET in_quantity = SUBSTRING(in_quantity, LOCATE(',', in_quantity) + 1);
		ELSE
			SET in_foodId = '';
		END IF;

END WHILE;
UPDATE University_Cafeteria_Management.Order SET totalAmount = amount WHERE orderId = sp_orderId;
IF(in_takeawaytype ='CampusDelivery') THEN
			Select personId into sp_personId from VendorDeliveryPerson where vendorId=in_vendorId 
			and availability='Yes' LIMIT 1;
			Insert into Delivery values (sp_orderId,in_userId,in_vendorId,sp_personId,in_locationId,
			'No');
		END IF;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`adwait_tathe`@`%` PROCEDURE `set_availability`(IN in_isDelivered ENUM("Yes","No"),IN in_personId INT)
BEGIN
  IF (in_isDelivered = "Yes") then
	update VendorDeliveryPerson set availability = "Yes" where personId=in_personId;
 END IF;
 IF (in_isDelivered = "No") THEN
  update VendorDeliveryPerson set availability = "No" where personId=in_personId;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `getAllOrdersOfBojangles`
--

/*!50001 DROP VIEW IF EXISTS `getAllOrdersOfBojangles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adwait_tathe`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `getAllOrdersOfBojangles` AS select `o`.`orderId` AS `orderId`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `User Name`,`o`.`takeAwayType` AS `takeAwayType`,`o`.`totalAmount` AS `Total Amount` from ((`Order` `o` join `User` `u`) join `Vendor` `v`) where ((`o`.`vendorId` = `v`.`vendorId`) and (`o`.`userId` = `u`.`userId`) and (`v`.`vendorId` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getAllOrdersOfDominos`
--

/*!50001 DROP VIEW IF EXISTS `getAllOrdersOfDominos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adwait_tathe`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `getAllOrdersOfDominos` AS select `o`.`orderId` AS `orderId`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `User Name`,`o`.`takeAwayType` AS `takeAwayType`,`o`.`totalAmount` AS `Total Amount` from ((`Order` `o` join `User` `u`) join `Vendor` `v`) where ((`o`.`vendorId` = `v`.`vendorId`) and (`o`.`userId` = `u`.`userId`) and (`v`.`vendorId` = 2)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getAllOrdersOfSmoked`
--

/*!50001 DROP VIEW IF EXISTS `getAllOrdersOfSmoked`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adwait_tathe`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `getAllOrdersOfSmoked` AS select `o`.`orderId` AS `orderId`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `User Name`,`o`.`takeAwayType` AS `takeAwayType`,`o`.`totalAmount` AS `Total Amount` from ((`Order` `o` join `User` `u`) join `Vendor` `v`) where ((`o`.`vendorId` = `v`.`vendorId`) and (`o`.`userId` = `u`.`userId`) and (`v`.`vendorId` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-01 16:56:05
