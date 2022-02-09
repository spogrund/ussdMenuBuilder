CREATE DATABASE  IF NOT EXISTS `av_microservice_ussd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `av_microservice_ussd`;
-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: av_microservice_ussd
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `caption` varchar(45) DEFAULT NULL,
  `options` varchar(2000) DEFAULT NULL COMMENT 'Types:\n\n<inputType:INTEGER|TEXT|ALL/><minDigit:n/>,<maxDigit:n/>,\n<nbDigits:n/>,<minLength:n/>,<maxLength:n/>,<invalidMessage:a/>,\n<javaVarName:a/>,<ynlogic:Y|N/>,<foroption:n/>,<parentid:n/>,<validateForID/>\n<menuType:YNLOGIC|NOTICE|INPUT/>\n\n',
  `USSDText` varchar(5000) DEFAULT NULL COMMENT 'Replacements:\n<thisyear/>,<nextyear/>,<thismonth/>,<nextmonth/><firstname/>,<lastname/>,\n<idnumber/>,<msisdn/>,<sql:…/>',
  `BRANCHLogic` varchar(2000) DEFAULT NULL,
  `preprocessing` varchar(2000) DEFAULT NULL COMMENT 'Use this column to execute any additional web service call before the USSDText is being processed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3 COMMENT='Stores the menu configuration.\nThroughout this table, replacement strings in the form of tags can be used:\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Starting point','<menutype:INPUT/><inputtype:ALL/><minLength:1/><maxLength:50/>','Invalid menu selection. Please dial *147# to get Emergency Airtime. Cell C','1',''),(3,'Under Maintenance','<menutype:NOTICE/><parentId:1/>','Hello, due to maintenance this service is currently unavailable. Please try again later. We apologise for the inconvenience.','(<sql_select:select coalesce(value,0) from setting where item = \'USSD_MAINTENANCE\' />=1)\n',''),(12,'Terms and Conditions','<menutype:NOTICE/><parentId:1/>','For full Terms and Conditions please visit www.cellc.co.za/emergencyairtime. ','(<response_from_menuid:12 />= 1)',''),(15,'Proceed with Airtime Recharge','<menutype:INPUT/><inputtype:INTEGER/><minDigit:0/><maxDigit:2/><minLength:1/><maxLength:1/><parentId:1/>\n','Choose to proceed with Airtime Recharge.\n1 Proceed\n2 More Info\n0 Main Menu\n','(<response_from_menuid:15 />= 1)\n',''),(16,'Select Amount','<menutype:INPUT/><inputtype:INTEGER/><minDigit:0/><maxDigit:4/><minLength:1/><maxLength:1/><parentId:15/>','Select new Airtime Recharge Amount:\n1 R5\n2 R10\n3 R100\n0 Main Menu','[(<response_from_menuid:15 />=1)]?[(<http_get:$$GETTENURE AttributeFilter:tenureMonths/>>=1)]:[0]','<http_get:$$GETAUTOTOPUPFEE AttributeFilter:none/>'),(17,'Confirm Amount R5','<menutype:INPUT/><inputtype:INTEGER/><minDigit:0/><maxDigit:1/><minLength:1/><maxLength:1/><parentId:16/>','Confirm your Airtime Recharge of R5 & accept T&Cs.\n1. Proceed \n0. Main Menu','(<response_from_menuid:16 />=1)',''),(19,'Confirm Amount R10','<menutype:INPUT/><inputtype:INTEGER/><minDigit:0/><maxDigit:1/><minLength:1/><maxLength:1/><parentId:16/>','Confirm your Airtime Recharge of R10 & accept T&Cs. \n1. Proceed \n0. Main Menu','(<response_from_menuid:16 />=2)',''),(21,'Confirm Amount R100','<menutype:INPUT/><inputtype:INTEGER/><minDigit:0/><maxDigit:1/><minLength:1/><maxLength:1/><parentId:16/>','Confirm your Auto TopUp of R100 & accept T&Cs.\n1. Proceed \n0. Main Menu','(<response_from_menuid:16 />=3)','(<response_from_menuid:15 />= 1)\n');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-17  8:13:26
