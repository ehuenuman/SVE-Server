CREATE DATABASE  IF NOT EXISTS `pontinel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pontinel`;
-- MySQL dump 10.16  Distrib 10.1.8-MariaDB, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: pontinel
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float NOT NULL,
  `trigger_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_revised` tinyint(1) NOT NULL DEFAULT '0',
  `revised_by` int(11) DEFAULT NULL,
  `revised_date` datetime DEFAULT NULL,
  `justification` varchar(254) DEFAULT NULL,
  `sensor_id` int(11) NOT NULL,
  `threshold_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alert_sensor1_idx` (`sensor_id`),
  KEY `fk_alert_threshold1_idx` (`threshold_id`),
  CONSTRAINT `fk_alert_sensor1` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`id`),
  CONSTRAINT `fk_alert_threshold1` FOREIGN KEY (`threshold_id`) REFERENCES `threshold` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daq`
--

DROP TABLE IF EXISTS `daq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fab_date` date DEFAULT NULL,
  `installation` date DEFAULT NULL,
  `phone` varchar(9) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `commentary` varchar(200) DEFAULT NULL,
  `structure_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_daq_structure1_idx` (`structure_id`),
  CONSTRAINT `fk_daq_structure1` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daq`
--

LOCK TABLES `daq` WRITE;
/*!40000 ALTER TABLE `daq` DISABLE KEYS */;
INSERT INTO `daq` VALUES (1,'2018-01-01','2018-02-01','912345678',NULL,NULL,1),(2,'2018-01-01','2018-02-01','912345678',NULL,NULL,2),(3,'2018-01-01','2018-02-01','912345678',NULL,NULL,3),(4,'2018-01-01','2018-02-01','912345678',NULL,NULL,4),(5,'2018-01-01','2018-02-01','912345678',NULL,NULL,5);
/*!40000 ALTER TABLE `daq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daq_has_error_list`
--

DROP TABLE IF EXISTS `daq_has_error_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daq_has_error_list` (
  `daq_id` int(11) NOT NULL,
  `error_list_id` int(11) NOT NULL,
  `trigger_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `revised_by` int(11) DEFAULT NULL,
  `solution` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`daq_id`,`error_list_id`),
  KEY `fk_daq_has_error_list_error_list1_idx` (`error_list_id`),
  KEY `fk_daq_has_error_list_daq1_idx` (`daq_id`),
  CONSTRAINT `fk_daq_has_error_list_daq1` FOREIGN KEY (`daq_id`) REFERENCES `daq` (`id`),
  CONSTRAINT `fk_daq_has_error_list_error_list1` FOREIGN KEY (`error_list_id`) REFERENCES `error_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daq_has_error_list`
--

LOCK TABLES `daq_has_error_list` WRITE;
/*!40000 ALTER TABLE `daq_has_error_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `daq_has_error_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise`
--

DROP TABLE IF EXISTS `enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise`
--

LOCK TABLES `enterprise` WRITE;
/*!40000 ALTER TABLE `enterprise` DISABLE KEYS */;
INSERT INTO `enterprise` VALUES (1,'Dirección de Vialidad Región de los Ríos'),(2,'MOP');
/*!40000 ALTER TABLE `enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_list`
--

DROP TABLE IF EXISTS `error_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(254) NOT NULL,
  `solution` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_list`
--

LOCK TABLES `error_list` WRITE;
/*!40000 ALTER TABLE `error_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freq_measure`
--

DROP TABLE IF EXISTS `freq_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freq_measure` (
  `id` int(11) NOT NULL,
  `value` float NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `assigned_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sensor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_freq_measure_sensor1_idx` (`sensor_id`),
  CONSTRAINT `fk_freq_measure_sensor1` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freq_measure`
--

LOCK TABLES `freq_measure` WRITE;
/*!40000 ALTER TABLE `freq_measure` DISABLE KEYS */;
/*!40000 ALTER TABLE `freq_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `justify_alert`
--

DROP TABLE IF EXISTS `justify_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `justify_alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justify_alert`
--

LOCK TABLES `justify_alert` WRITE;
/*!40000 ALTER TABLE `justify_alert` DISABLE KEYS */;
INSERT INTO `justify_alert` VALUES (1,'Error de medición.'),(2,'Evento no causó daños.'),(3,'Daños causados se encuentran controlados.');
/*!40000 ALTER TABLE `justify_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `justify_threshold`
--

DROP TABLE IF EXISTS `justify_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `justify_threshold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justify_threshold`
--

LOCK TABLES `justify_threshold` WRITE;
/*!40000 ALTER TABLE `justify_threshold` DISABLE KEYS */;
INSERT INTO `justify_threshold` VALUES (1,'Calibración inicial.'),(2,'Evento no causó daños, es seguro aumentar el umbral.'),(3,'Corrección del umbral por estar mal definido.');
/*!40000 ALTER TABLE `justify_threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `fab_date` date DEFAULT NULL,
  `installation` date NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `commentary` varchar(200) DEFAULT NULL,
  `daq_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_node_daq1_idx` (`daq_id`),
  CONSTRAINT `fk_node_daq1` FOREIGN KEY (`daq_id`) REFERENCES `daq` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'nodo1',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,1),(2,'nodo2',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,2),(3,'nodo3',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,3),(4,'nodo4',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,4),(5,'nodo5',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,5);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_has_error_list`
--

DROP TABLE IF EXISTS `node_has_error_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_has_error_list` (
  `node_id` int(11) NOT NULL,
  `error_list_id` int(11) NOT NULL,
  `trigger_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `revised_by` int(11) DEFAULT NULL,
  `solution` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`node_id`,`error_list_id`),
  KEY `fk_node_has_error_list_error_list1_idx` (`error_list_id`),
  KEY `fk_node_has_error_list_node1_idx` (`node_id`),
  CONSTRAINT `fk_node_has_error_list_error_list1` FOREIGN KEY (`error_list_id`) REFERENCES `error_list` (`id`),
  CONSTRAINT `fk_node_has_error_list_node1` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_has_error_list`
--

LOCK TABLES `node_has_error_list` WRITE;
/*!40000 ALTER TABLE `node_has_error_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_has_error_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure`
--

DROP TABLE IF EXISTS `procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedure` (
  `id` int(11) NOT NULL,
  `action` varchar(254) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure`
--

LOCK TABLES `procedure` WRITE;
/*!40000 ALTER TABLE `procedure` DISABLE KEYS */;
INSERT INTO `procedure` VALUES (1,'Inspeccionar el puente físicamente dentro de un plazo de 24 horas.',NULL),(2,'Evaluar el estado del puente.',NULL),(3,'Evaluar el registro del sensor que casa la advertencia.',NULL),(4,'Reportar solución en PONTINEL.',NULL),(5,'Inspección del puente físicamente de forma inmediata.',NULL),(6,'Notificar a carabineros.',NULL),(7,'Solicitar cerrar el tránsito sobre el puente hasta análisis del estado del puente.',NULL);
/*!40000 ALTER TABLE `procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Administrador','Dueños del sistema. Pueden ver y modificar todas las estructuras del sistema. Será notificado al pasar el umbral de cualquier sensor.'),(2,'Representante','Puede ver y modificar todo de las estructuras de su empresa. Será notifcado al pasar el umbral de cualquier sensor de su empresa.'),(3,'Responsable','Puede ver y modificar uno o más estructuras de su empresa, además será notifcado al pasar el umbral de las estructuras asignadas al usuario.'),(4,'Invitado','Puede ver todas las estructuras de su empresa.');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(5) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'XV','Región de Arica y Parinacota'),(2,'I','Región de Tarapacá'),(3,'II','Región de Antofagasta'),(4,'III','Región de Atacama'),(5,'IV','Región de Coquimbo'),(6,'V','Región de Valparaiso'),(7,'RM','Región Metropolitana de Santiago'),(8,'VI','Región del libertador Bernardo O\'Higgins'),(9,'VII','Región del Maule'),(10,'VIII','Región del BioBío'),(11,'IX','Región de La Araucanía'),(12,'XIV','Región de Los Ríos'),(13,'X','Región de Los Lagos'),(14,'XI','Región de Aysén del General Carlos Ibáñez del Campo'),(15,'XII','Región de magallanes y de la Antártica Chilena');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `installation_date` date NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `commentary` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `calibrationsheet` varchar(100) DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `node_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sensor_node1_idx` (`node_id`),
  KEY `fk_sensor_type1_idx` (`type_id`),
  CONSTRAINT `fk_sensor_node1` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`),
  CONSTRAINT `fk_sensor_type1` FOREIGN KEY (`type_id`) REFERENCES `type_sensor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,'Inclinómetro Cepa 1 Eje X','2018-08-01','39°48\'42.2\"S','73°14\'52.4\"O',NULL,NULL,1,NULL,NULL,1,4),(2,'Inclinómetro Cepa 1 Eje Y','2018-08-01','39°48\'41.8\"S','73°14\'54.6\"O',NULL,NULL,1,NULL,NULL,1,4),(3,'Inclinómetro Cepa 2 Eje X','2018-08-01','39°48\'41.3\"S','73°14\'57.2\"O',NULL,NULL,1,NULL,NULL,1,4),(4,'Inclinómetro Cepa 2 Eje Y','2018-08-01','39°48\'41.0\"S','73°14\'59.2\"O',NULL,NULL,1,NULL,NULL,1,4),(5,'Acelerómetro vertical, centro Vano 1','2018-08-01','39°48\'42.3\"S','73°14\'51.4\"O',NULL,NULL,1,NULL,NULL,1,7),(6,'Acelerómetro vertical, centro Vano 2','2018-08-01','39°48\'42.0\"S','73°14\'53.2\"O',NULL,NULL,1,NULL,NULL,1,10),(7,'Acelerómetro vertical, centro Vano 3','2018-08-01','39°48\'41.6\"S','73°14\'55.6\"O',NULL,NULL,1,NULL,NULL,1,13),(8,'Temperatura ambiental','2018-08-01','39°48\'41.0\"S','73°14\'59.2\"O',NULL,NULL,1,NULL,NULL,1,19),(9,'RH ambiental','2018-08-01','39°48\'41.0\"S','73°14\'59.2\"O',NULL,NULL,1,NULL,NULL,1,18),(10,'Inclinómetro Cepa 1','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(11,'Inclinómetro Cepa 2','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(12,'Inclinómetro Cepa 3','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(13,'Inclinómetro Cepa 4','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(14,'Inclinómetro Cepa 5','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(15,'Inclinómetro Cepa 6','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(16,'Inclinómetro Cepa 7','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(17,'Inclinómetro Cepa 8','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(18,'Inclinómetro Cepa 9','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(19,'Inclinómetro Cepa 10','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(20,'Inclinómetro Cepa 11','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(21,'Inclinómetro Cepa 12','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(22,'Inclinómetro Cepa 1','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(23,'Inclinómetro Cepa 2','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(24,'Inclinómetro Cepa 3','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(25,'Inclinómetro Cepa 4','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(26,'Inclinómetro Cepa 5','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(27,'Inclinómetro Cepa 1','2018-08-01','39°41\'15.2\"S','73°06\'09.4\"O',NULL,NULL,1,NULL,NULL,4,4),(28,'Inclinómetro Cepa 2','2018-08-01','39°41\'14.5\"S','73°06\'08.8\"O',NULL,NULL,1,NULL,NULL,4,4),(29,'Inclinómetro Cepa 1','2018-08-01','39°49\'27.1\"S','71°59\'48.3\"O',NULL,NULL,1,NULL,NULL,5,4),(30,'Inclinómetro Cepa 2','2018-08-01','39°49\'26.7\"S','71°59\'47.6\"O',NULL,NULL,1,NULL,NULL,5,4),(31,'Temperatura ambiental','2018-08-01','39°48\'41.0\"S','73°14\'59.2\"O',NULL,NULL,1,NULL,NULL,1,19);
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_has_error`
--

DROP TABLE IF EXISTS `sensor_has_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_has_error` (
  `sensor_id` int(11) NOT NULL,
  `error_list_id` int(11) NOT NULL,
  `trigger_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `revised_by` int(11) DEFAULT NULL,
  `solution` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`sensor_id`,`error_list_id`),
  KEY `fk_sensor_has_error_list_error_list1_idx` (`error_list_id`),
  KEY `fk_sensor_has_error_list_sensor1_idx` (`sensor_id`),
  CONSTRAINT `fk_sensor_has_error_list_error_list1` FOREIGN KEY (`error_list_id`) REFERENCES `error_list` (`id`),
  CONSTRAINT `fk_sensor_has_error_list_sensor1` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_has_error`
--

LOCK TABLES `sensor_has_error` WRITE;
/*!40000 ALTER TABLE `sensor_has_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor_has_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure`
--

DROP TABLE IF EXISTS `structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `length` float NOT NULL,
  `width` float NOT NULL,
  `route` varchar(15) NOT NULL,
  `km` decimal(10,3) NOT NULL,
  `date_joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `photo` varchar(100) DEFAULT NULL,
  `commentary` varchar(200) DEFAULT '""',
  `enterprise_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_structure_enterprise1_idx` (`enterprise_id`),
  KEY `fk_structure_region1_idx` (`region_id`),
  CONSTRAINT `fk_structure_enterprise1` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`id`),
  CONSTRAINT `fk_structure_region1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure`
--

LOCK TABLES `structure` WRITE;
/*!40000 ALTER TABLE `structure` DISABLE KEYS */;
INSERT INTO `structure` VALUES (1,'Puente Pedro de Valdivia','-73.2477','-39.8116',240,12,'T-338',0.450,'2018-01-01 00:00:00','PuentePedroDeValdivia.jpg',NULL,1,12),(2,'Puente Cruces','39°49\'25.96\"S','73°15\'49.04\'\'O',485,10,'T-350',1.650,'2018-02-01 00:00:00','PuenteCruces.jpg','',1,12),(3,'Puente Lingue','39°26\'43.2\"S','73°13\'06.7\"O',220,11.7,'T-250',1.000,'2018-03-01 00:00:00','PuenteLingue.jpg',NULL,2,12),(4,'Puente Pichoy','39°41\'13.87\"S','73°06\'08.59\'\'O',87,13,'202',23.100,'2018-04-01 00:00:00','PuentePichoy.jpg',NULL,1,12),(5,'Puente Huilo Huilo','39°49\'27.87\"S','71°59\'49.23\'\'O',100,7.5,'203 CH',100.000,'2018-05-01 00:00:00','PuenteHuiloHuilo.jpg',NULL,2,12);
/*!40000 ALTER TABLE `structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_has_alert`
--

DROP TABLE IF EXISTS `structure_has_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure_has_alert` (
  `structure_id` int(11) NOT NULL,
  `alert_id` int(11) NOT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`structure_id`,`alert_id`),
  KEY `fk_structure_has_alert_alert1_idx` (`alert_id`),
  KEY `fk_structure_has_alert_structure1_idx` (`structure_id`),
  CONSTRAINT `fk_structure_has_alert_alert1` FOREIGN KEY (`alert_id`) REFERENCES `alert` (`id`),
  CONSTRAINT `fk_structure_has_alert_structure1` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_has_alert`
--

LOCK TABLES `structure_has_alert` WRITE;
/*!40000 ALTER TABLE `structure_has_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `structure_has_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threshold`
--

DROP TABLE IF EXISTS `threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threshold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float NOT NULL,
  `assigned_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assigned_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `justification` varchar(254) DEFAULT NULL,
  `sensor_id` int(11) NOT NULL,
  `type_threshold_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_threshold_sensor1_idx` (`sensor_id`),
  KEY `fk_threshold_type_threshold1_idx` (`type_threshold_id`),
  CONSTRAINT `fk_threshold_sensor1` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`id`),
  CONSTRAINT `fk_threshold_type_threshold1` FOREIGN KEY (`type_threshold_id`) REFERENCES `type_threshold` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threshold`
--

LOCK TABLES `threshold` WRITE;
/*!40000 ALTER TABLE `threshold` DISABLE KEYS */;
INSERT INTO `threshold` VALUES (1,-8,'2018-08-01 00:00:00',0,1,NULL,1,2),(2,8,'2018-08-01 00:00:00',0,1,NULL,1,2),(3,-3,'2018-08-01 00:00:00',0,1,NULL,1,1),(4,3,'2018-08-01 00:00:00',0,1,NULL,1,1),(5,-8,'2018-08-01 00:00:00',0,1,NULL,3,2),(6,8,'2018-08-01 00:00:00',0,1,NULL,3,2),(7,-3,'2018-08-01 00:00:00',0,1,NULL,3,1),(8,3,'2018-08-01 00:00:00',0,1,NULL,3,1),(9,-8,'2018-08-01 00:00:00',0,1,NULL,2,2),(10,8,'2018-08-01 00:00:00',0,1,NULL,2,2),(11,-3,'2018-08-01 00:00:00',0,1,NULL,2,1),(12,3,'2018-08-01 00:00:00',0,1,NULL,2,1),(13,8,'2018-08-01 00:00:00',0,1,NULL,4,2),(14,-8,'2018-08-01 00:00:00',0,1,NULL,4,2),(59,-5,'2018-08-01 00:00:00',0,1,NULL,4,1),(60,5,'2018-08-01 00:00:00',0,1,NULL,4,1),(61,-20,'2018-08-01 00:00:00',0,1,NULL,8,2),(62,40,'2018-08-01 00:00:00',0,1,NULL,8,2),(63,-10,'2018-08-01 00:00:00',0,1,NULL,8,1),(64,30,'2018-08-01 00:00:00',0,1,NULL,8,1),(65,0,'2018-08-01 00:00:00',0,1,NULL,31,2),(66,34,'2018-08-01 00:00:00',0,1,NULL,31,2),(67,10,'2018-08-01 00:00:00',0,1,NULL,31,1),(68,20,'2018-08-01 00:00:00',0,1,NULL,31,1);
/*!40000 ALTER TABLE `threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_user` int(11) NOT NULL,
  `trigger_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alert_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ticket_alert1_idx` (`alert_id`),
  CONSTRAINT `fk_ticket_alert1` FOREIGN KEY (`alert_id`) REFERENCES `alert` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger`
--

DROP TABLE IF EXISTS `trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float NOT NULL,
  `assigned_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assigned_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `justification` varchar(254) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `type_trigger_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trigger_sensor1_idx` (`sensor_id`),
  KEY `fk_trigger_type_trigger1_idx` (`type_trigger_id`),
  CONSTRAINT `fk_trigger_sensor1` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`id`),
  CONSTRAINT `fk_trigger_type_trigger1` FOREIGN KEY (`type_trigger_id`) REFERENCES `type_trigger` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger`
--

LOCK TABLES `trigger` WRITE;
/*!40000 ALTER TABLE `trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_sensor`
--

DROP TABLE IF EXISTS `type_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `model` varchar(254) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `datasheet` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_sensor`
--

LOCK TABLES `type_sensor` WRITE;
/*!40000 ALTER TABLE `type_sensor` DISABLE KEYS */;
INSERT INTO `type_sensor` VALUES (1,'Desplazamiento lineal 5 mm','Miran KPC-5mm','mm',NULL),(2,'Desplazamiento lineal 10 mm','Miran KPC-10mm','mm',NULL),(3,'Desplazamiento lineal 50 mm','Miran KPC-50mm','mm',NULL),(4,'Inclinometro 10 grados','Leveldevelopments DAS-10-R','º',NULL),(5,'Acelerometro 2 g - X','Murata SCA3100-D04','m/s2',NULL),(6,'Acelerometro 2 g - Y','Murata SCA3100-D04','m/s2',NULL),(7,'Acelerometro 2 g - Z','Murata SCA3100-D04','m/s2',NULL),(8,'Acelerometro 1 g - X','MEMSIC MXR7900CF','m/s2',NULL),(9,'Acelerometro 1 g - Y','MEMSIC MXR7900CF','m/s2',NULL),(10,'Acelerometro 1 g - Z','MEMSIC MXR7900CF','m/s2',NULL),(11,'Acelerometro 0.5 g - X','PANASONIC AGF10711','m/s2',NULL),(12,'Acelerometro 0.5 g - Y','PANASONIC AGF10711','m/s2',NULL),(13,'Acelerometro 0.5 g - Z','PANASONIC AGF10711','m/s2',NULL),(14,'Anemómetro 3D - U','Gill Instruments WindMaster 3D sonic anemometer','m/s',NULL),(15,'Anemómetro 3D - V','Gill Instruments WindMaster 3D sonic anemometer','m/s',NULL),(16,'Anemómetro 3D - W','Gill Instruments WindMaster 3D sonic anemometer','m/s',NULL),(17,'Anemómetro 3D - Angulo','Gill Instruments WindMaster 3D sonic anemometer','º',NULL),(18,'Humedad ambiental','Outside Humidity & Temperature Sensor (TPOH & TPVOH)','%',NULL),(19,'Temperatura ambiental','Outside Humidity & Temperature Sensor (TPOH & TPVOH)','ºC',NULL),(20,'Strain gauge acero','Ejemplostraingauge','N/mm2',NULL),(21,'Strain gauge hormigón','Ejemplostraingauge','N/mm2',NULL);
/*!40000 ALTER TABLE `type_sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_threshold`
--

DROP TABLE IF EXISTS `type_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_threshold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `color` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_threshold`
--

LOCK TABLES `type_threshold` WRITE;
/*!40000 ALTER TABLE `type_threshold` DISABLE KEYS */;
INSERT INTO `type_threshold` VALUES (1,'Advertencia','Primer umbral. Notifica mediante correo electrónico al administrador y responsable de la empresa.','ffc107'),(2,'Alerta','Segundo umbral. Notifica mediante Whatsapps al administrador, responsable y representante de la empresa.','dc3545');
/*!40000 ALTER TABLE `type_threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_threshold_has_procedure`
--

DROP TABLE IF EXISTS `type_threshold_has_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_threshold_has_procedure` (
  `type_threshold_id` int(11) NOT NULL,
  `procedure_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`type_threshold_id`,`procedure_id`),
  KEY `fk_type_threshold_has_procedure_procedure1_idx` (`procedure_id`),
  KEY `fk_type_threshold_has_procedure_type_threshold1_idx` (`type_threshold_id`),
  CONSTRAINT `fk_type_threshold_has_procedure_procedure1` FOREIGN KEY (`procedure_id`) REFERENCES `procedure` (`id`),
  CONSTRAINT `fk_type_threshold_has_procedure_type_threshold1` FOREIGN KEY (`type_threshold_id`) REFERENCES `type_threshold` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_threshold_has_procedure`
--

LOCK TABLES `type_threshold_has_procedure` WRITE;
/*!40000 ALTER TABLE `type_threshold_has_procedure` DISABLE KEYS */;
INSERT INTO `type_threshold_has_procedure` VALUES (1,1,0),(1,2,1),(1,3,2),(1,4,3),(2,2,3),(2,3,4),(2,4,5),(2,5,0),(2,6,1),(2,7,2);
/*!40000 ALTER TABLE `type_threshold_has_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_trigger`
--

DROP TABLE IF EXISTS `type_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_trigger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_trigger`
--

LOCK TABLES `type_trigger` WRITE;
/*!40000 ALTER TABLE `type_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `email` varchar(254) NOT NULL,
  `date_joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `enterprise_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`username`),
  KEY `fk_user_enterprise1_idx` (`enterprise_id`),
  KEY `fk_user_profile1_idx` (`profile_id`),
  CONSTRAINT `fk_user_enterprise1` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`id`),
  CONSTRAINT `fk_user_profile1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','','$2a$10$C8Oo22l4GVib96eBIZyOPuffGOevFD10B/5fAhDcqHCC0ISD3w5V6','test','test','test','test@test.cl','2018-09-06 16:13:14','2018-09-13 19:43:45',1,1,1),(2,'Administrador','fb1c43bf717b458e964689dbb5fde472','5ec533bfed33a7f0c07fd67c7fba8a567b747c641fe523b195fca1813bad6ddc30253741074e738c5c10101991f8e69393c29b2df549a02172be3352e18aa77d','Admistrador','Administrador','912345678','email@administrador.lc','2018-09-13 20:00:30','2018-10-03 13:52:21',1,1,1),(3,'Representante','ce0b9238261b63dec0ee2c1558f576cf','98faa6d197324f9d5a250fbd4267b882788d1e1fc6073be1cecea6d5f7d18bef06521bdb3845f903e26c1813065ff11cdb809beb2b8ea93a9b07652df51bad39','Representante','Representante','912345678','email@representante.cl','2018-09-13 20:00:30','2018-09-24 12:24:20',1,1,2),(4,'Responsable','ed74a1b634733152949f5a761d47829f','c4a4805fd76545eba6a2ccf5c57f742162f21079e6cf7041623f69cd98c69ceb1cfae166e4bf7627b94e3b897b71a764edf25b04fa9e483b635fb2888ba5b305','Responsable','Responsable','912345678','email@responsable.cl','2018-09-13 20:00:30','2018-09-24 17:31:06',1,1,3),(5,'Invitado','343c44dd9dd3773384d8b788b44e0e82','fae8deaf9d65a56720b8be2cae8d867e7beb7124477660db931be5baff7c67e12813be4c0b12e73626580a821e05a50889f491ff02c23c1c7d3008f783c9c01d','Invitado','Invitado','912345678','email@invitado.cl','2018-09-13 20:00:30','2018-09-27 18:23:02',1,1,4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_structure`
--

DROP TABLE IF EXISTS `user_has_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_structure` (
  `user_id` int(11) NOT NULL,
  `structure_id` int(11) NOT NULL,
  `assigned_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`structure_id`,`user_id`),
  KEY `fk_user_has_structure_structure1_idx` (`structure_id`),
  KEY `fk_user_has_structure_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_structure_structure1` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`),
  CONSTRAINT `fk_user_has_structure_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_structure`
--

LOCK TABLES `user_has_structure` WRITE;
/*!40000 ALTER TABLE `user_has_structure` DISABLE KEYS */;
INSERT INTO `user_has_structure` VALUES (4,2,'2018-09-13 20:36:51'),(4,4,'2018-09-13 20:36:51');
/*!40000 ALTER TABLE `user_has_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pontinel'
--
/*!50003 DROP PROCEDURE IF EXISTS `deserializeUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `deserializeUser`(in id int)
BEGIN
	select 
		pontinel.user.id as user_id,
		pontinel.user.username,
		pontinel.user.first_name,
		pontinel.user.last_name,
		pontinel.user.phone,
		pontinel.user.email,
		pontinel.user.date_joined,
		pontinel.user.enterprise_id,
		pontinel.enterprise.name as enterprise_name,
		pontinel.user.profile_id,
		pontinel.profile.name as profile_name,
		pontinel.profile.description as profile_description
	from
		pontinel.user
	inner join
		( pontinel.profile, pontinel.enterprise )
	on
		pontinel.user.id = id and
		pontinel.user.is_active = 1 and
		pontinel.profile.id = pontinel.user.profile_id and
		pontinel.enterprise.id = pontinel.user.enterprise_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSensorOfStructure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `getSensorOfStructure`(in sensorId int, in structureId int)
BEGIN
	select
		sensor.*
	from
		( pontinel.node, pontinel.daq )
	inner join
		( 
			select 
				pontinel.sensor.*, 
				pontinel.type_sensor.name as type_sensor_name,
				pontinel.type_sensor.model as type_sensor_model,
				pontinel.type_sensor.unit as type_sensor_unit,
				pontinel.type_sensor.datasheet as type_sensor_datasheet
			from 
				pontinel.sensor 
			inner join 
				pontinel.type_sensor 
			on 
				pontinel.sensor.type_id = pontinel.type_sensor.id and
				pontinel.sensor.id = sensorId
		) as sensor
	on
		pontinel.node.daq_id = pontinel.daq.id and
		pontinel.node.id = sensor.node_id and
		pontinel.daq.structure_id = structureId
	group by
		pontinel.sensor.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSensorsOfStructure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `getSensorsOfStructure`(in structureId int)
BEGIN
	select 
		sensor_info.*,		
		IFNULL(IF(STRCMP(alert_info.alert_type, "Advertencia") = 0 , count(alert_info.alert_type),0), 0) as adv_count,
		IFNULL(IF(STRCMP(alert_info.alert_type, "Alerta") = 0 , count(alert_info.alert_type),0), 0) as ale_count
	from 
		(
		select
			sensor.id as id,
			sensor.name as name,        
			sensor.type_sensor_name as type_sensor_name
		from
			( pontinel.node, pontinel.daq )
		inner join
			( 
				select 
					pontinel.sensor.*, 
					pontinel.type_sensor.name as type_sensor_name,
					pontinel.type_sensor.model as type_sensor_model,
					pontinel.type_sensor.unit as type_sensor_unit,
					pontinel.type_sensor.datasheet as type_sensor_datasheet
				from pontinel.sensor inner join pontinel.type_sensor on pontinel.sensor.type_id = pontinel.type_sensor.id
			) as sensor
		on
			pontinel.node.daq_id = pontinel.daq.id and
			pontinel.node.id = sensor.node_id and
			pontinel.daq.structure_id = structureId
		group by
			pontinel.sensor.id
		) as sensor_info
	left join 
		(
		select 
			pontinel.alert.id as alert_id,
			pontinel.alert.sensor_id as sensor_id,
			pontinel.type_threshold.name as alert_type
		from
			pontinel.alert
		inner join
			( pontinel.threshold, pontinel.type_threshold )
		on
			pontinel.alert.threshold_id = pontinel.threshold.id and
			pontinel.type_threshold.id = pontinel.threshold.type_threshold_id and
			pontinel.threshold.is_active = 1
		) as alert_info
	on
		alert_info.sensor_id = sensor_info.id
	group by
		sensor_info.id,
		alert_info.alert_type
	order by 
		sensor_info.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStructure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `getStructure`(in structureId int)
BEGIN
	select 
		pontinel.structure.id,
		pontinel.structure.name,
		pontinel.structure.latitude,
		pontinel.structure.longitude,
		pontinel.structure.length,
		pontinel.structure.width,
		pontinel.structure.route,
		pontinel.structure.km,
		pontinel.structure.date_joined,
		pontinel.structure.photo,
		pontinel.structure.commentary,
		pontinel.enterprise.id as enterprise_id,
		pontinel.enterprise.name as enterprise_name,
		pontinel.region.id as region_id,
		pontinel.region.number as region_number,
		pontinel.region.name as region_name
	from 
		pontinel.structure
	inner join
		(pontinel.enterprise, pontinel.region)
	on
		pontinel.structure.id = structureId and 
		pontinel.structure.enterprise_id = pontinel.enterprise.id and
		pontinel.structure.region_id = pontinel.region.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStructuresAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `getStructuresAdmin`()
BEGIN
	select 
		pontinel.structure.id,
		pontinel.structure.name,
		pontinel.structure.latitude,
		pontinel.structure.longitude,
		ifnull(adv_count, 0) as adv_count,
		ifnull(alert_info.ale_count, 0) as ale_count
	from 
		pontinel.structure
	left join
		(
		select
				structure_info.structure_id as id,
				structure_info.structure_name as name,
				structure_info.structure_latitude as latitude,
				structure_info.structure_longitude as longitude,
				IF(STRCMP(alert_info.alert_type, "Advertencia") = 0 , count(alert_info.alert_type),0) as adv_count,
				IF(STRCMP(alert_info.alert_type, "Alerta") = 0 , count(alert_info.alert_type),0) as ale_count
			from
				(
				select
					pontinel.structure.id as structure_id,
					pontinel.structure.name as structure_name,
					pontinel.structure.latitude as structure_latitude,
					pontinel.structure.longitude as structure_longitude,
					pontinel.alert.id as alert_id,
					pontinel.alert.value as alert_value
				from
					pontinel.structure_has_alert
				inner join
					( pontinel.alert, pontinel.structure )
				on
					pontinel.structure_has_alert.alert_id = pontinel.alert.id and
					pontinel.structure_has_alert.structure_id = pontinel.structure.id and
					pontinel.structure_has_alert.is_valid = 1
				) as structure_info
			inner join
				(
				select
					pontinel.alert.id as alert_id,
					pontinel.alert.value as alert_value,
					pontinel.type_threshold.name as alert_type
				from 
					pontinel.threshold
				inner join
					( pontinel.alert, pontinel.type_threshold )
				on
					pontinel.threshold.type_threshold_id = pontinel.type_threshold.id and
					pontinel.alert.threshold_id = pontinel.threshold.id and
					pontinel.threshold.is_active = 1
				) as alert_info
			on
				alert_info.alert_id = structure_info.alert_id
			group by
				structure_info.structure_id,
				alert_info.alert_type
		) as alert_info
	on
		pontinel.structure.id = alert_info.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStructuresOfRepr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `getStructuresOfRepr`(in enterpriseId int)
BEGIN
	select
		structure_info.structure_id as id,
		structure_info.structure_name as name,
        structure_info.structure_latitude as latitude,
        structure_info.structure_longitude as longitude,
		IF(STRCMP(alert_info.alert_type, "Advertencia") = 0 , count(alert_info.alert_type),0) as adv_count,
        IF(STRCMP(alert_info.alert_type, "Alerta") = 0 , count(alert_info.alert_type),0) as ale_count
	from
		(
		select
			pontinel.structure.id as structure_id,
			pontinel.structure.name as structure_name,
            pontinel.structure.latitude as structure_latitude,
            pontinel.structure.longitude as structure_longitude,
			pontinel.alert.id as alert_id,
			pontinel.alert.value as alert_value
		from
			pontinel.structure_has_alert
		inner join
			( pontinel.alert, pontinel.structure )
		on
			pontinel.structure_has_alert.alert_id = pontinel.alert.id and
			pontinel.structure_has_alert.structure_id = pontinel.structure.id and
			pontinel.structure_has_alert.is_valid = 1 and
			pontinel.structure.enterprise_id = enterpriseId
		) as structure_info
	inner join
		(
		select
			pontinel.alert.id as alert_id,
			pontinel.alert.value as alert_value,
			pontinel.type_threshold.name as alert_type
		from 
			pontinel.threshold
		inner join
			( pontinel.alert, pontinel.type_threshold )
		on
			pontinel.threshold.type_threshold_id = pontinel.type_threshold.id and
			pontinel.alert.threshold_id = pontinel.threshold.id and
			pontinel.threshold.is_active = 1
		) as alert_info
	on
		alert_info.alert_id = structure_info.alert_id
	group by
		structure_info.structure_id,
		alert_info.alert_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStructuresOfResp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `getStructuresOfResp`(in user_id int)
BEGIN
	select 
		structure.structure_id as id,
		structure.structure_name as name,
        structure.latitude as latitude,
        structure.longitude as longitude,
        structure.adv_count,
        structure.ale_count
	from 
		pontinel.user_has_structure
	inner join
		(
		select
			structure_info.structure_id,
			structure_info.structure_name,
			structure_info.latitude,
			structure_info.longitude,
			IF(STRCMP(alert_info.alert_type, "Advertencia") = 0 , count(alert_info.alert_type),0) as adv_count,
			IF(STRCMP(alert_info.alert_type, "Alerta") = 0 , count(alert_info.alert_type),0) as ale_count
		from
			(
			select
				pontinel.structure.id as structure_id,
				pontinel.structure.name as structure_name,
				pontinel.structure.latitude,
				pontinel.structure.longitude,
				pontinel.alert.id as alert_id,
				pontinel.alert.value as alert_value
			from
				pontinel.structure_has_alert
			inner join
				( pontinel.alert, pontinel.structure )
			on
				pontinel.structure_has_alert.alert_id = pontinel.alert.id and
				pontinel.structure_has_alert.structure_id = pontinel.structure.id and
				pontinel.structure_has_alert.is_valid = 1
			) as structure_info
		inner join
			(
			select
				pontinel.alert.id as alert_id,
				pontinel.alert.value as alert_value,
				pontinel.type_threshold.name as alert_type		
			from 
				pontinel.threshold
			inner join
				( pontinel.alert, pontinel.type_threshold )
			on
				pontinel.threshold.type_threshold_id = pontinel.type_threshold.id and
				pontinel.alert.threshold_id = pontinel.threshold.id and
				pontinel.threshold.is_active = 1
			) as alert_info
		on
			alert_info.alert_id = structure_info.alert_id
		group by
			structure_info.structure_id,
			alert_info.alert_type
	) as structure
	on
		pontinel.user_has_structure.user_id = user_id and
		pontinel.user_has_structure.structure_id = structure.structure_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getThresholdOfSensor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `getThresholdOfSensor`(in sensorId int)
BEGIN
select
	pontinel.threshold.*,
    pontinel.type_threshold.name as type_threshold_name,
    pontinel.type_threshold.description as type_threshold_description,
    pontinel.type_threshold.color as type_threshold_color
    
from
	pontinel.threshold
inner join
	pontinel.type_threshold
on
	pontinel.threshold.sensor_id = sensorId and
    pontinel.threshold.is_active = 1 and
    pontinel.threshold.type_threshold_id = pontinel.type_threshold.id
order by 
	pontinel.type_threshold.name, pontinel.threshold.value;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `loginUser`(in username varchar(150))
BEGIN
	select 
		pontinel.user.id as user_id,
		pontinel.user.username,
        pontinel.user.password,
        pontinel.user.salt,
		pontinel.user.first_name,
		pontinel.user.last_name,
		pontinel.user.phone,
		pontinel.user.email,
		pontinel.user.date_joined,
        pontinel.user.last_login,
		pontinel.user.enterprise_id,
		pontinel.enterprise.name as enterprise_name,
		pontinel.user.profile_id,
		pontinel.profile.name as profile_name,
		pontinel.profile.description as profile_description
	from
		pontinel.user
	inner join
		( pontinel.profile, pontinel.enterprise )
	on
		pontinel.user.username = username and 	
		pontinel.user.is_active = 1 and
		pontinel.profile.id = pontinel.user.profile_id and
		pontinel.enterprise.id = pontinel.user.enterprise_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setAlert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `setAlert`(in value double, in triggerDate datetime, in sensorId int, in thresholdId int)
BEGIN
	INSERT INTO pontinel.alert 
		(value, trigger_date, sensor_id, threshold_id) 
	VALUES
		(value, triggerDate, sensorId, thresholdId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateLastLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pontinel_root`@`localhost` PROCEDURE `updateLastLogin`(in user_id int)
BEGIN
	UPDATE 
		pontinel.user 
	SET 
		pontinel.user.last_login = NOW() 
	WHERE 
		pontinel.user.id = user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-03 16:00:37
