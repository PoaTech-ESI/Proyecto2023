CREATE DATABASE  IF NOT EXISTS `proyecto2023` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `proyecto2023`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 44.201.241.190    Database: proyecto2023
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `camion`
--

DROP TABLE IF EXISTS `camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camion` (
  `idCamion` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(45) DEFAULT NULL,
  `chofer` int(11) DEFAULT NULL,
  `capacidadLt` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCamion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camion`
--

LOCK TABLES `camion` WRITE;
/*!40000 ALTER TABLE `camion` DISABLE KEYS */;
INSERT INTO `camion` VALUES (1,'SBL1483',1,5000),(2,'AAU4356',2,6000),(3,'SCK5789',3,5500),(4,'SBL1483',1,5000),(5,'AAU4356',2,6000),(6,'SCK5789',3,5500),(7,'SBL1483',1,5000),(8,'AAU4356',2,6000),(9,'SCK5789',3,5500);
/*!40000 ALTER TABLE `camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositos`
--

DROP TABLE IF EXISTS `depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depositos` (
  `idDeposito` int(11) NOT NULL AUTO_INCREMENT,
  `descDeposito` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `puerta` varchar(45) DEFAULT NULL,
  `flagDelCliente` int(11) DEFAULT NULL,
  `flagDepPropio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDeposito`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositos`
--

LOCK TABLES `depositos` WRITE;
/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
INSERT INTO `depositos` VALUES (1,'Dep Principal','Dirección 12','Calle A','Puerta 1',0,1),(2,NULL,'Dirección 2','Calle B','Puerta 2',0,1),(4,'Dep Malvin','Montevideo','Asamblea','4528',NULL,NULL);
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginSessions`
--

DROP TABLE IF EXISTS `loginSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginSessions` (
  `token` varchar(128) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expireiN` int(11) DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginSessions`
--

LOCK TABLES `loginSessions` WRITE;
/*!40000 ALTER TABLE `loginSessions` DISABLE KEYS */;
INSERT INTO `loginSessions` VALUES ('2938785','pbenitez',NULL,NULL),('394589','alromero',NULL,NULL),('5342890','marcosalan',NULL,NULL);
/*!40000 ALTER TABLE `loginSessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotes`
--

DROP TABLE IF EXISTS `lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotes` (
  `idLote` int(11) NOT NULL AUTO_INCREMENT,
  `descLote` varchar(45) DEFAULT NULL,
  `barrioDestino` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLote`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

LOCK TABLES `lotes` WRITE;
/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
INSERT INTO `lotes` VALUES (124,'Vestimenta','Pocitos'),(239,'Herramientas','Maroñas'),(293,'Indumentaria Deportiva','Cordon');
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquetes`
--

DROP TABLE IF EXISTS `paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquetes` (
  `idPaquete` int(11) NOT NULL AUTO_INCREMENT,
  `idLote` int(11) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `direccionDestino` varchar(45) DEFAULT NULL,
  `propietario` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `idDeposito` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPaquete`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes`
--

LOCK TABLES `paquetes` WRITE;
/*!40000 ALTER TABLE `paquetes` DISABLE KEYS */;
INSERT INTO `paquetes` VALUES (234,0,'Ropa',1.2,'Avenida Las Rosas 456',5,0,'Montevideo - Casavalle',2),(423,101,'Electrónicos',2.5,'Calle Los Alamos 123',0,0,'Montevideo - Carrasco',1),(544,124,'pEPE',1.2,'Asamblea 4529',5,1,NULL,1);
/*!40000 ALTER TABLE `paquetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `descRol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Usuario/Cliente'),(2,'Camionero'),(3,'Encargado Deposito'),(4,'Administracion');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusEnvio`
--

DROP TABLE IF EXISTS `statusEnvio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusEnvio` (
  `idStatus` int(11) NOT NULL AUTO_INCREMENT,
  `descStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusEnvio`
--

LOCK TABLES `statusEnvio` WRITE;
/*!40000 ALTER TABLE `statusEnvio` DISABLE KEYS */;
INSERT INTO `statusEnvio` VALUES (1,'Procesado'),(2,'Arribado a Deposito'),(3,'Procesado en Deposito'),(4,'Procesado para envio desde Deposito'),(5,'En Transito'),(6,'Entregado'),(7,'Demorado');
/*!40000 ALTER TABLE `statusEnvio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL,
  `timestamp_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'mauri','pepe','Mauricio','Vazquez','maurivaz1204@gmail.com',91808469,4,NULL),(2,'juanperez','pass1234','Juan','Pérez','juanperez@gmail.com',92345678,3,'2023-08-21 13:46:00'),(5,'anamartinez','ana7890','Ana','Martínez','anamartinez@gmail.com',99234569,1,'2023-09-16 09:05:00'),(6,'luisgonzalez','luis4567','Luis','González','luisgonzalez@gmail.com',96534680,2,'2023-08-11 11:30:00'),(8,'enzotes','pepe','Enzo','Zucchetti','pepe@pepe.com',1231231,2,NULL),(10,'pepe2','pepe','pepe','pep','pepe@pepe.com',12312321,1,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwPaquetes`
--

DROP TABLE IF EXISTS `vwPaquetes`;
/*!50001 DROP VIEW IF EXISTS `vwPaquetes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwPaquetes` AS SELECT 
 1 AS `idPaquete`,
 1 AS `idLote`,
 1 AS `descLote`,
 1 AS `descripcion`,
 1 AS `peso`,
 1 AS `direccionDestino`,
 1 AS `propietario`,
 1 AS `username`,
 1 AS `estado`,
 1 AS `descStatus`,
 1 AS `ubicacion`,
 1 AS `idDeposito`,
 1 AS `descDeposito`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vwPaquetes`
--

/*!50001 DROP VIEW IF EXISTS `vwPaquetes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vwPaquetes` AS select `p`.`idPaquete` AS `idPaquete`,`p`.`idLote` AS `idLote`,`l`.`descLote` AS `descLote`,`p`.`descripcion` AS `descripcion`,`p`.`peso` AS `peso`,`p`.`direccionDestino` AS `direccionDestino`,`p`.`propietario` AS `propietario`,`u`.`username` AS `username`,`p`.`estado` AS `estado`,`s`.`descStatus` AS `descStatus`,`p`.`ubicacion` AS `ubicacion`,`p`.`idDeposito` AS `idDeposito`,`d`.`descDeposito` AS `descDeposito` from ((((`paquetes` `p` left join `lotes` `l` on((`p`.`idLote` = `l`.`idLote`))) left join `usuarios` `u` on((`u`.`idUser` = `p`.`propietario`))) left join `statusEnvio` `s` on((`s`.`idStatus` = `p`.`estado`))) left join `depositos` `d` on((`d`.`idDeposito` = `p`.`idDeposito`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-15 23:26:47
