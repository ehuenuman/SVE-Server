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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
INSERT INTO `alert` VALUES (1,0.03,'2018-09-07 19:38:00',0,NULL,NULL,NULL,1,1),(2,0.05,'2018-09-07 19:39:04',0,NULL,NULL,NULL,2,6),(3,0.06,'2018-09-07 19:30:04',0,NULL,NULL,NULL,1,5),(4,1454,'2018-09-07 19:31:04',0,NULL,NULL,NULL,2,5),(5,-5,'2018-09-07 19:39:04',0,NULL,NULL,NULL,3,4),(6,-0.25,'2018-09-07 19:20:04',0,NULL,NULL,NULL,5,1),(7,-0.25,'2018-09-07 19:35:04',0,NULL,NULL,NULL,4,3),(8,-54,'2018-09-07 19:45:04',0,NULL,NULL,NULL,5,5),(9,54,'2018-09-07 19:38:04',0,NULL,NULL,NULL,3,1),(10,645,'2018-09-07 19:28:04',0,NULL,NULL,NULL,1,8),(11,2.89,'2018-09-07 19:38:00',0,NULL,NULL,NULL,3,2),(54,113,'2017-03-16 11:09:22',0,NULL,NULL,NULL,3,1),(55,85,'2018-07-13 22:06:48',0,NULL,NULL,NULL,3,1),(56,-176,'2017-05-07 17:49:58',0,NULL,NULL,NULL,3,2),(57,198,'2018-04-20 09:33:51',0,NULL,NULL,NULL,3,2),(58,-279,'2018-07-19 22:33:14',0,NULL,NULL,NULL,3,2),(59,-127,'2017-12-17 22:53:08',0,NULL,NULL,NULL,3,1),(60,-288,'2017-09-06 05:19:26',0,NULL,NULL,NULL,3,2),(61,-102,'2018-03-12 19:17:18',0,NULL,NULL,NULL,3,1),(62,259,'2017-05-12 17:23:24',0,NULL,NULL,NULL,3,2),(63,-152,'2018-07-30 09:51:13',0,NULL,NULL,NULL,3,2),(64,-135,'2018-07-20 14:55:05',0,NULL,NULL,NULL,3,1),(65,-253,'2017-11-21 23:11:23',0,NULL,NULL,NULL,3,2),(66,130,'2017-12-06 09:10:43',0,NULL,NULL,NULL,3,1),(67,-133,'2017-05-29 10:15:36',0,NULL,NULL,NULL,3,1),(68,70,'2017-07-07 11:54:43',0,NULL,NULL,NULL,3,1),(69,215,'2018-05-08 00:01:29',0,NULL,NULL,NULL,3,2),(70,-232,'2018-01-10 04:58:50',0,NULL,NULL,NULL,3,2),(71,76,'2018-01-29 22:05:48',0,NULL,NULL,NULL,3,1),(72,93,'2017-10-08 15:50:47',0,NULL,NULL,NULL,3,1),(73,-233,'2017-09-20 04:19:22',0,NULL,NULL,NULL,3,2),(74,279,'2018-06-14 21:55:12',0,NULL,NULL,NULL,3,2),(75,177,'2018-04-30 09:27:49',0,NULL,NULL,NULL,3,2),(76,157,'2017-06-13 00:21:44',0,NULL,NULL,NULL,3,1),(77,181,'2018-08-30 13:46:32',0,NULL,NULL,NULL,3,2);
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `daq`
--

LOCK TABLES `daq` WRITE;
/*!40000 ALTER TABLE `daq` DISABLE KEYS */;
INSERT INTO `daq` VALUES (1,'2018-01-01','2018-02-01','912345678',NULL,NULL,1),(2,'2018-01-01','2018-02-01','912345678',NULL,NULL,2),(3,'2018-01-01','2018-02-01','912345678',NULL,NULL,3),(4,'2018-01-01','2018-02-01','912345678',NULL,NULL,4),(5,'2018-01-01','2018-02-01','912345678',NULL,NULL,5);
/*!40000 ALTER TABLE `daq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `daq_has_error_list`
--

LOCK TABLES `daq_has_error_list` WRITE;
/*!40000 ALTER TABLE `daq_has_error_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `daq_has_error_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `enterprise`
--

LOCK TABLES `enterprise` WRITE;
/*!40000 ALTER TABLE `enterprise` DISABLE KEYS */;
INSERT INTO `enterprise` VALUES (1,'Dirección de Vialidad Región de los Ríos'),(2,'MOP');
/*!40000 ALTER TABLE `enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `error_list`
--

LOCK TABLES `error_list` WRITE;
/*!40000 ALTER TABLE `error_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `freq_measure`
--

LOCK TABLES `freq_measure` WRITE;
/*!40000 ALTER TABLE `freq_measure` DISABLE KEYS */;
/*!40000 ALTER TABLE `freq_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `justify_alert`
--

LOCK TABLES `justify_alert` WRITE;
/*!40000 ALTER TABLE `justify_alert` DISABLE KEYS */;
INSERT INTO `justify_alert` VALUES (1,'Error de medición.'),(2,'Evento no causó daños.'),(3,'Daños causados se encuentran controlados.');
/*!40000 ALTER TABLE `justify_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `justify_threshold`
--

LOCK TABLES `justify_threshold` WRITE;
/*!40000 ALTER TABLE `justify_threshold` DISABLE KEYS */;
INSERT INTO `justify_threshold` VALUES (1,'Calibración inicial.'),(2,'Evento no causó daños, es seguro aumentar el umbral.'),(3,'Corrección del umbral por estar mal definido.');
/*!40000 ALTER TABLE `justify_threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'nodo1',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,1),(2,'nodo2',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,2),(3,'nodo3',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,3),(4,'nodo4',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,4),(5,'nodo5',NULL,'2018-01-01','39°48\'42\",0S','73°14\'52\",0\'\'O',NULL,NULL,5);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `node_has_error_list`
--

LOCK TABLES `node_has_error_list` WRITE;
/*!40000 ALTER TABLE `node_has_error_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_has_error_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `procedure`
--

LOCK TABLES `procedure` WRITE;
/*!40000 ALTER TABLE `procedure` DISABLE KEYS */;
INSERT INTO `procedure` VALUES (1,'Inspeccionar el puente físicamente dentro de un plazo de 24 horas.',NULL),(2,'Evaluar el estado del puente.',NULL),(3,'Evaluar el registro del sensor que casa la advertencia.',NULL),(4,'Reportar solución en PONTINEL.',NULL),(5,'Inspección del puente físicamente de forma inmediata.',NULL),(6,'Notificar a carabineros.',NULL),(7,'Solicitar cerrar el tránsito sobre el puente hasta análisis del estado del puente.',NULL);
/*!40000 ALTER TABLE `procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Administrador','Dueños del sistema. Pueden ver y modificar todas las estructuras del sistema. Será notificado al pasar el umbral de cualquier sensor.'),(2,'Representante','Puede ver y modificar todo de las estructuras de su empresa. Será notifcado al pasar el umbral de cualquier sensor de su empresa.'),(3,'Responsable','Puede ver y modificar uno o más estructuras de su empresa, además será notifcado al pasar el umbral de las estructuras asignadas al usuario.'),(4,'Invitado','Puede ver todas las estructuras de su empresa.');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'XV','Región de Arica y Parinacota'),(2,'I','Región de Tarapacá'),(3,'II','Región de Antofagasta'),(4,'III','Región de Atacama'),(5,'IV','Región de Coquimbo'),(6,'V','Región de Valparaiso'),(7,'RM','Región Metropolitana de Santiago'),(8,'VI','Región del libertador Bernardo O\'Higgins'),(9,'VII','Región del Maule'),(10,'VIII','Región del BioBío'),(11,'IX','Región de La Araucanía'),(12,'XIV','Región de Los Ríos'),(13,'X','Región de Los Lagos'),(14,'XI','Región de Aysén del General Carlos Ibáñez del Campo'),(15,'XII','Región de magallanes y de la Antártica Chilena');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,'Inclinómetro Cepa 1','2018-08-01','39°48\'42.2\"S','73°14\'52.4\"O',NULL,NULL,1,NULL,NULL,1,4),(2,'Inclinómetro Cepa 2','2018-08-01','39°48\'41.8\"S','73°14\'54.6\"O',NULL,NULL,1,NULL,NULL,1,4),(3,'Inclinómetro Cepa 3','2018-08-01','39°48\'41.3\"S','73°14\'57.2\"O',NULL,NULL,1,NULL,NULL,1,4),(4,'Inclinómetro Cepa 4','2018-08-01','39°48\'41.0\"S','73°14\'59.2\"O',NULL,NULL,1,NULL,NULL,1,4),(5,'Acelerómetro vertical, centro Vano 1','2018-08-01','39°48\'42.3\"S','73°14\'51.4\"O',NULL,NULL,1,NULL,NULL,1,7),(6,'Acelerómetro vertical, centro Vano 2','2018-08-01','39°48\'42.0\"S','73°14\'53.2\"O',NULL,NULL,1,NULL,NULL,1,10),(7,'Acelerómetro vertical, centro Vano 3','2018-08-01','39°48\'41.6\"S','73°14\'55.6\"O',NULL,NULL,1,NULL,NULL,1,13),(8,'Temperatura ambiental','2018-08-01','39°48\'41.0\"S','73°14\'59.2\"O',NULL,NULL,1,NULL,NULL,1,19),(9,'RH ambiental','2018-08-01','39°48\'41.0\"S','73°14\'59.2\"O',NULL,NULL,1,NULL,NULL,1,18),(10,'Inclinómetro Cepa 1','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(11,'Inclinómetro Cepa 2','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(12,'Inclinómetro Cepa 3','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(13,'Inclinómetro Cepa 4','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(14,'Inclinómetro Cepa 5','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(15,'Inclinómetro Cepa 6','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(16,'Inclinómetro Cepa 7','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(17,'Inclinómetro Cepa 8','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(18,'Inclinómetro Cepa 9','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(19,'Inclinómetro Cepa 10','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(20,'Inclinómetro Cepa 11','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(21,'Inclinómetro Cepa 12','2018-08-01','39°49\'26.9\"S','73°15\'49.6\"O',NULL,NULL,1,NULL,NULL,2,4),(22,'Inclinómetro Cepa 1','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(23,'Inclinómetro Cepa 2','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(24,'Inclinómetro Cepa 3','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(25,'Inclinómetro Cepa 4','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(26,'Inclinómetro Cepa 5','2018-08-01','39°26\'40.5\"S','73°13\'05.9\"O',NULL,NULL,1,NULL,NULL,3,4),(27,'Inclinómetro Cepa 1','2018-08-01','39°41\'15.2\"S','73°06\'09.4\"O',NULL,NULL,1,NULL,NULL,4,4),(28,'Inclinómetro Cepa 2','2018-08-01','39°41\'14.5\"S','73°06\'08.8\"O',NULL,NULL,1,NULL,NULL,4,4),(29,'Inclinómetro Cepa 1','2018-08-01','39°49\'27.1\"S','71°59\'48.3\"O',NULL,NULL,1,NULL,NULL,5,4),(30,'Inclinómetro Cepa 2','2018-08-01','39°49\'26.7\"S','71°59\'47.6\"O',NULL,NULL,1,NULL,NULL,5,4);
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sensor_has_error`
--

LOCK TABLES `sensor_has_error` WRITE;
/*!40000 ALTER TABLE `sensor_has_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor_has_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `structure`
--

LOCK TABLES `structure` WRITE;
/*!40000 ALTER TABLE `structure` DISABLE KEYS */;
INSERT INTO `structure` VALUES (1,'Puente Pedro de Valdivia','-73.2477','-39.8116',240,12,'T-338',0.450,'2018-01-01 00:00:00','PuentePedroDeValdivia.jpg',NULL,1,12),(2,'Puente Cruces','39°49\'25.96\"S','73°15\'49.04\'\'O',485,10,'T-350',1.650,'2018-02-01 00:00:00','PuenteCruces.jpg','',1,12),(3,'Puente Lingue','39°26\'43.2\"S','73°13\'06.7\"O',220,11.7,'T-250',1.000,'2018-03-01 00:00:00','PuenteLingue.jpg',NULL,2,12),(4,'Puente Pichoy','39°41\'13.87\"S','73°06\'08.59\'\'O',87,13,'202',23.100,'2018-04-01 00:00:00','PuentePichoy.jpg',NULL,1,12),(5,'Puente Huilo Huilo','39°49\'27.87\"S','71°59\'49.23\'\'O',100,7.5,'203 CH',100.000,'2018-05-01 00:00:00','PuenteHuiloHuilo.jpg',NULL,2,12);
/*!40000 ALTER TABLE `structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `structure_has_alert`
--

LOCK TABLES `structure_has_alert` WRITE;
/*!40000 ALTER TABLE `structure_has_alert` DISABLE KEYS */;
INSERT INTO `structure_has_alert` VALUES (1,1,1),(1,2,1),(1,9,0),(2,3,1),(2,4,1),(2,6,1),(3,7,1),(3,8,1),(4,5,1),(4,10,0);
/*!40000 ALTER TABLE `structure_has_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `threshold`
--

LOCK TABLES `threshold` WRITE;
/*!40000 ALTER TABLE `threshold` DISABLE KEYS */;
INSERT INTO `threshold` VALUES (1,-0.2,'2018-08-01 00:00:00',0,1,NULL,1,2),(2,0.2,'2018-08-01 00:00:00',0,1,NULL,1,2),(3,-0.02,'2018-08-01 00:00:00',0,1,NULL,1,1),(4,0.02,'2018-08-01 00:00:00',0,1,NULL,1,1),(5,-150,'2018-08-01 00:00:00',0,1,NULL,3,2),(6,170,'2018-08-01 00:00:00',0,1,NULL,3,2),(7,-50,'2018-08-01 00:00:00',0,1,NULL,3,1),(8,70,'2018-08-01 00:00:00',0,1,NULL,3,1),(9,-150,'2018-08-01 00:00:00',0,1,NULL,2,2),(10,150,'2018-08-01 00:00:00',0,1,NULL,2,2),(11,-30,'2018-08-01 00:00:00',0,1,NULL,2,1),(12,30,'2018-08-01 00:00:00',0,1,NULL,2,1),(13,-0.5,'2018-08-01 00:00:00',0,1,NULL,4,2),(14,0.5,'2018-08-01 00:00:00',0,1,NULL,4,2),(59,-0.01,'2018-08-01 00:00:00',0,1,NULL,4,1),(60,0.01,'2018-08-01 00:00:00',0,1,NULL,4,1);
/*!40000 ALTER TABLE `threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trigger`
--

LOCK TABLES `trigger` WRITE;
/*!40000 ALTER TABLE `trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type_sensor`
--

LOCK TABLES `type_sensor` WRITE;
/*!40000 ALTER TABLE `type_sensor` DISABLE KEYS */;
INSERT INTO `type_sensor` VALUES (1,'Desplazamiento lineal 5 mm','Miran KPC-5mm','mm',NULL),(2,'Desplazamiento lineal 10 mm','Miran KPC-10mm','mm',NULL),(3,'Desplazamiento lineal 50 mm','Miran KPC-50mm','mm',NULL),(4,'Inclinometro 10 grados','Leveldevelopments DAS-10-R','º',NULL),(5,'Acelerometro 2 g - X','Murata SCA3100-D04','m/s2',NULL),(6,'Acelerometro 2 g - Y','Murata SCA3100-D04','m/s2',NULL),(7,'Acelerometro 2 g - Z','Murata SCA3100-D04','m/s2',NULL),(8,'Acelerometro 1 g - X','MEMSIC MXR7900CF','m/s2',NULL),(9,'Acelerometro 1 g - Y','MEMSIC MXR7900CF','m/s2',NULL),(10,'Acelerometro 1 g - Z','MEMSIC MXR7900CF','m/s2',NULL),(11,'Acelerometro 0.5 g - X','PANASONIC AGF10711','m/s2',NULL),(12,'Acelerometro 0.5 g - Y','PANASONIC AGF10711','m/s2',NULL),(13,'Acelerometro 0.5 g - Z','PANASONIC AGF10711','m/s2',NULL),(14,'Anemómetro 3D - U','Gill Instruments WindMaster 3D sonic anemometer','m/s',NULL),(15,'Anemómetro 3D - V','Gill Instruments WindMaster 3D sonic anemometer','m/s',NULL),(16,'Anemómetro 3D - W','Gill Instruments WindMaster 3D sonic anemometer','m/s',NULL),(17,'Anemómetro 3D - Angulo','Gill Instruments WindMaster 3D sonic anemometer','º',NULL),(18,'Humedad ambiental','Outside Humidity & Temperature Sensor (TPOH & TPVOH)','%',NULL),(19,'Temperatura ambiental','Outside Humidity & Temperature Sensor (TPOH & TPVOH)','ºC',NULL),(20,'Strain gauge acero','Ejemplostraingauge','N/mm2',NULL),(21,'Strain gauge hormigón','Ejemplostraingauge','N/mm2',NULL);
/*!40000 ALTER TABLE `type_sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type_threshold`
--

LOCK TABLES `type_threshold` WRITE;
/*!40000 ALTER TABLE `type_threshold` DISABLE KEYS */;
INSERT INTO `type_threshold` VALUES (1,'Advertencia','Primer umbral. Notifica mediante correo electrónico al administrador y responsable de la empresa.','ffc107'),(2,'Alerta','Segundo umbral. Notifica mediante Whatsapps al administrador, responsable y representante de la empresa.','dc3545');
/*!40000 ALTER TABLE `type_threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type_threshold_has_procedure`
--

LOCK TABLES `type_threshold_has_procedure` WRITE;
/*!40000 ALTER TABLE `type_threshold_has_procedure` DISABLE KEYS */;
INSERT INTO `type_threshold_has_procedure` VALUES (1,1,0),(1,2,1),(1,3,2),(1,4,3),(2,2,3),(2,3,4),(2,4,5),(2,5,0),(2,6,1),(2,7,2);
/*!40000 ALTER TABLE `type_threshold_has_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type_trigger`
--

LOCK TABLES `type_trigger` WRITE;
/*!40000 ALTER TABLE `type_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','','$2a$10$C8Oo22l4GVib96eBIZyOPuffGOevFD10B/5fAhDcqHCC0ISD3w5V6','test','test','test','test@test.cl','2018-09-06 16:13:14','2018-09-13 19:43:45',1,1,1),(2,'Administrador','fb1c43bf717b458e964689dbb5fde472','5ec533bfed33a7f0c07fd67c7fba8a567b747c641fe523b195fca1813bad6ddc30253741074e738c5c10101991f8e69393c29b2df549a02172be3352e18aa77d','Admistrador','Administrador','912345678','email@administrador.lc','2018-09-13 20:00:30','2018-10-03 06:01:24',1,1,1),(3,'Representante','ce0b9238261b63dec0ee2c1558f576cf','98faa6d197324f9d5a250fbd4267b882788d1e1fc6073be1cecea6d5f7d18bef06521bdb3845f903e26c1813065ff11cdb809beb2b8ea93a9b07652df51bad39','Representante','Representante','912345678','email@representante.cl','2018-09-13 20:00:30','2018-09-24 12:24:20',1,1,2),(4,'Responsable','ed74a1b634733152949f5a761d47829f','c4a4805fd76545eba6a2ccf5c57f742162f21079e6cf7041623f69cd98c69ceb1cfae166e4bf7627b94e3b897b71a764edf25b04fa9e483b635fb2888ba5b305','Responsable','Responsable','912345678','email@responsable.cl','2018-09-13 20:00:30','2018-09-24 17:31:06',1,1,3),(5,'Invitado','343c44dd9dd3773384d8b788b44e0e82','fae8deaf9d65a56720b8be2cae8d867e7beb7124477660db931be5baff7c67e12813be4c0b12e73626580a821e05a50889f491ff02c23c1c7d3008f783c9c01d','Invitado','Invitado','912345678','email@invitado.cl','2018-09-13 20:00:30','2018-09-27 18:23:02',1,1,4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_has_structure`
--

LOCK TABLES `user_has_structure` WRITE;
/*!40000 ALTER TABLE `user_has_structure` DISABLE KEYS */;
INSERT INTO `user_has_structure` VALUES (4,2,'2018-09-13 20:36:51'),(4,4,'2018-09-13 20:36:51');
/*!40000 ALTER TABLE `user_has_structure` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-03  6:44:38
