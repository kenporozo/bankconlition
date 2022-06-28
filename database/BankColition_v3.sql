CREATE DATABASE  IF NOT EXISTS `bankcolition` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bankcolition`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bankcolition
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banco` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EntidadBancaria` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
INSERT INTO `banco` VALUES (1,'Santander'),(2,'Banco Estado'),(3,'BCI');
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartola`
--

DROP TABLE IF EXISTS `cartola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartola` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_CuentaBancaria` int NOT NULL,
  `CuentaCorriente` varchar(45) NOT NULL,
  `NumeroCartola` int DEFAULT NULL,
  `Moneda` int DEFAULT NULL,
  `FechaDesde` date NOT NULL,
  `FechaHasta` date NOT NULL,
  `SaldoInicial` bigint DEFAULT NULL,
  `Deposito` bigint DEFAULT NULL,
  `OtrosAbonos` bigint DEFAULT NULL,
  `Cheques` bigint DEFAULT NULL,
  `OtrosCargos` bigint DEFAULT NULL,
  `Impuestos` bigint DEFAULT NULL,
  `SaldoFinal` bigint DEFAULT NULL,
  `CreditoCupoAprobado` bigint DEFAULT NULL,
  `CreditoMontoUtilizado` bigint DEFAULT NULL,
  `CreditoSaldoDisponible` bigint DEFAULT NULL,
  `TotalMovimientos` bigint DEFAULT NULL,
  `Cuadratura` tinyint(1) NOT NULL,
  `Archivo` blob,
  PRIMARY KEY (`Id`),
  KEY `Id_CuentaBancaria` (`Id_CuentaBancaria`),
  CONSTRAINT `cartola_ibfk_1` FOREIGN KEY (`Id_CuentaBancaria`) REFERENCES `cuentabancaria` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartola`
--

LOCK TABLES `cartola` WRITE;
/*!40000 ALTER TABLE `cartola` DISABLE KEYS */;
INSERT INTO `cartola` VALUES (1,1,'1',1,2,'2022-05-16','2022-05-16',1,1,1,1,1,1,1,1,1,1,1,1,NULL);
/*!40000 ALTER TABLE `cartola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Rut` varchar(45) NOT NULL,
  `Empresa` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'0-1','BankColition'),(2,'1-9','Inacap');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conciliacionbancaria`
--

DROP TABLE IF EXISTS `conciliacionbancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conciliacionbancaria` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Cliente` int NOT NULL,
  `Id_CuentaBancaria` int NOT NULL,
  `Id_Cartola` int DEFAULT NULL,
  `Id_MovimientoCartola` int DEFAULT NULL,
  `Id_LibroDiario` int DEFAULT NULL,
  `Id_MovimientoLibroDiario` int DEFAULT NULL,
  `FechaMovimiento` date DEFAULT NULL,
  `Id_Estado` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_CuentaBancaria` (`Id_CuentaBancaria`),
  KEY `conciliacionbancaria_ibfk_6_idx` (`Id_Cliente`),
  KEY `conciliacionbancaria_ibfk_1` (`Id_MovimientoLibroDiario`),
  KEY `conciliacionbancaria_ibfk_2` (`Id_MovimientoCartola`),
  KEY `conciliacionbancaria_ibfk_4` (`Id_Cartola`),
  KEY `conciliacionbancaria_ibfk_5` (`Id_LibroDiario`),
  CONSTRAINT `conciliacionbancaria_ibfk_1` FOREIGN KEY (`Id_MovimientoLibroDiario`) REFERENCES `movimientolibrodiario` (`Id`),
  CONSTRAINT `conciliacionbancaria_ibfk_2` FOREIGN KEY (`Id_MovimientoCartola`) REFERENCES `movimientoscartola` (`Id`),
  CONSTRAINT `conciliacionbancaria_ibfk_3` FOREIGN KEY (`Id_CuentaBancaria`) REFERENCES `cuentabancaria` (`Id`),
  CONSTRAINT `conciliacionbancaria_ibfk_4` FOREIGN KEY (`Id_Cartola`) REFERENCES `librodiario` (`Id`),
  CONSTRAINT `conciliacionbancaria_ibfk_5` FOREIGN KEY (`Id_LibroDiario`) REFERENCES `cartola` (`Id`),
  CONSTRAINT `conciliacionbancaria_ibfk_6` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conciliacionbancaria`
--

LOCK TABLES `conciliacionbancaria` WRITE;
/*!40000 ALTER TABLE `conciliacionbancaria` DISABLE KEYS */;
INSERT INTO `conciliacionbancaria` VALUES (1,2,1,1,1,1,1,'2022-05-16',3),(2,2,1,1,2,NULL,NULL,'2022-05-16',6),(3,2,1,NULL,NULL,1,2,'2022-05-16',5);
/*!40000 ALTER TABLE `conciliacionbancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Cliente` int NOT NULL,
  `Contrato` varchar(45) NOT NULL,
  `Descripcion` varchar(1000) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Cliente` (`Id_Cliente`),
  CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,2,'Contrato A','Una Cuenta Bancaria y un banco disponible.');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentabancaria`
--

DROP TABLE IF EXISTS `cuentabancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentabancaria` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Cliente` int NOT NULL,
  `Id_Banco` int NOT NULL,
  `Id_TipoCuenta` int NOT NULL,
  `Rut` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `NumeroCuenta` varchar(45) NOT NULL,
  `Id_Estado` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_TipoCuenta` (`Id_TipoCuenta`),
  KEY `Id_Cliente` (`Id_Cliente`),
  KEY `Id_Banco` (`Id_Banco`),
  KEY `cuentabancaria_ibfk_4_idx` (`Id_Estado`),
  CONSTRAINT `cuentabancaria_ibfk_1` FOREIGN KEY (`Id_TipoCuenta`) REFERENCES `tipocuenta` (`Id`),
  CONSTRAINT `cuentabancaria_ibfk_2` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `cuentabancaria_ibfk_3` FOREIGN KEY (`Id_Banco`) REFERENCES `banco` (`Id`),
  CONSTRAINT `cuentabancaria_ibfk_4` FOREIGN KEY (`Id_Estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentabancaria`
--

LOCK TABLES `cuentabancaria` WRITE;
/*!40000 ALTER TABLE `cuentabancaria` DISABLE KEYS */;
INSERT INTO `cuentabancaria` VALUES (1,2,1,1,'1-9','1234','1',1);
/*!40000 ALTER TABLE `cuentabancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id` int NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Conciliado'),(4,'Sin Conciliar'),(5,'Registro solo en Libro Diario'),(6,'Registro solo en Cartola Bancaria');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librodiario`
--

DROP TABLE IF EXISTS `librodiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librodiario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_CuentaBancaria` int NOT NULL,
  `Moneda` int DEFAULT NULL,
  `FechaDesde` date NOT NULL,
  `FechaHasta` date NOT NULL,
  `TotalMovimientos` bigint DEFAULT NULL,
  `Saldo` bigint NOT NULL,
  `Cuadratura` tinyint(1) NOT NULL,
  `Archivo` blob,
  PRIMARY KEY (`Id`),
  KEY `Id_CuentaBancaria` (`Id_CuentaBancaria`),
  CONSTRAINT `librodiario_ibfk_1` FOREIGN KEY (`Id_CuentaBancaria`) REFERENCES `cuentabancaria` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librodiario`
--

LOCK TABLES `librodiario` WRITE;
/*!40000 ALTER TABLE `librodiario` DISABLE KEYS */;
INSERT INTO `librodiario` VALUES (1,1,1,'2022-03-16','2022-05-16',1,1,1,NULL);
/*!40000 ALTER TABLE `librodiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientolibrodiario`
--

DROP TABLE IF EXISTS `movimientolibrodiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientolibrodiario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_LibroDiario` int NOT NULL,
  `Monto` bigint NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `FechaMovimiento` date NOT NULL,
  `NumeroDocumento` bigint NOT NULL,
  `Sucursal` varchar(45) DEFAULT NULL,
  `CargoAbono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `movimientolibrodiario_ibfk_1` (`Id_LibroDiario`),
  CONSTRAINT `movimientolibrodiario_ibfk_1` FOREIGN KEY (`Id_LibroDiario`) REFERENCES `librodiario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientolibrodiario`
--

LOCK TABLES `movimientolibrodiario` WRITE;
/*!40000 ALTER TABLE `movimientolibrodiario` DISABLE KEYS */;
INSERT INTO `movimientolibrodiario` VALUES (1,1,1,'1','2022-05-16',1,'1','C'),(2,1,2,'1','2022-05-16',2,'1','C');
/*!40000 ALTER TABLE `movimientolibrodiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientoscartola`
--

DROP TABLE IF EXISTS `movimientoscartola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientoscartola` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Cartola` int NOT NULL,
  `Monto` bigint NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `FechaMovimiento` date NOT NULL,
  `NumeroDocumento` bigint NOT NULL,
  `Sucursal` varchar(45) DEFAULT NULL,
  `CargoAbono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Cartola` (`Id_Cartola`),
  CONSTRAINT `movimientoscartola_ibfk_1` FOREIGN KEY (`Id_Cartola`) REFERENCES `cartola` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientoscartola`
--

LOCK TABLES `movimientoscartola` WRITE;
/*!40000 ALTER TABLE `movimientoscartola` DISABLE KEYS */;
INSERT INTO `movimientoscartola` VALUES (1,1,1,'1','2022-05-16',1,'1','C'),(2,1,9,'1','2022-05-16',3,'1','C');
/*!40000 ALTER TABLE `movimientoscartola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocuenta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocuenta`
--

LOCK TABLES `tipocuenta` WRITE;
/*!40000 ALTER TABLE `tipocuenta` DISABLE KEYS */;
INSERT INTO `tipocuenta` VALUES (1,'Cuenta Corriente'),(2,'Cuenta Vista');
/*!40000 ALTER TABLE `tipocuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipousuario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Administrador'),(2,'Consultor');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Cliente` int NOT NULL,
  `Id_TipoUsuario` int NOT NULL,
  `Usuario` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Rut` varchar(45) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  UNIQUE KEY `Rut_UNIQUE` (`Rut`),
  UNIQUE KEY `Correo_UNIQUE` (`Correo`),
  KEY `Id_Cliente` (`Id_Cliente`),
  KEY `Id_TipoUsuario` (`Id_TipoUsuario`),
  KEY `fk_usuario_estado_idx` (`id_estado`),
  CONSTRAINT `fk_usuario_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`Id_TipoUsuario`) REFERENCES `tipousuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,1,'administrador','admin','0-1','Sin Info','Sin Info','Sin Info',1),(2,2,2,'pperez','pperez','1-9','Pedro','Perez','pperez@inacapmail.cl',1),(4,1,2,'userAPI','123abc','9-9','juan','lopez','jlopez@mail.cl',1),(6,1,2,'userAPI2','123abc','8-9','juan','lopez','juan_lopez@mail.cl',1),(7,1,2,'userAPI22','123abc','8-91','juan','lopez','juan_lopez@email.cl',1),(8,1,2,'userAPI221','123abc','8-911','juan','lopez','juan_lopez@gmail.cl',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bankcolition'
--

--
-- Dumping routines for database 'bankcolition'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_banco`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `banco`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_cartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_cartola`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `cartola`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_cliente`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `cliente`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_conciliacionbancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_conciliacionbancaria`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `conciliacionbancaria`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_contrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_contrato`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `contrato`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_cuentabancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_cuentabancaria`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `cuentabancaria`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_librodiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_librodiario`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `librodiario`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_movimientolibrodiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_movimientolibrodiario`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `movimientolibrodiario`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_movimientoscartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_movimientoscartola`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `movimientoscartola`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_tipocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_tipocuenta`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `tipocuenta`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_tipousuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_tipousuario`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `tipousuario`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_del_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_del_usuario`(
  IN `arg_Id` int
)
BEGIN
  DELETE FROM `usuario`
  WHERE     
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_IngresarLibroDiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_IngresarLibroDiario`(
	IN `arg_Cliente_Id` int,
	IN `arg_FechaDesde` varchar(10), 
    IN `arg_FechaHasta` varchar(10)

)
BEGIN
    
	Select 
		c.NumeroCartola,
		mc.FechaMovimiento,
		mc.NumeroDocumento,
		mc.Descripcion,
		mc.Monto,
		mc.CargoAbono
	from bankcolition.cuentabancaria cb
	inner join bankcolition.cartola c on
		cb.Id = c.Id_CuentaBancaria
	inner join bankcolition.movimientoscartola mc on
		c.Id = mc.Id_Cartola
	where 
		cb.Id_Cliente = `arg_Cliente_Id` and mc.FechaMovimiento between date(`arg_FechaDesde`) and date(`arg_FechaHasta`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_banco`(
  IN `arg_EntidadBancaria` varchar(45)
)
BEGIN
  INSERT INTO `banco`
  (
    `EntidadBancaria`
  )
  VALUES 
  (
    `arg_EntidadBancaria`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_cartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_cartola`(
  IN `arg_Id_CuentaBancaria` int,
  IN `arg_CuentaCorriente` varchar(45),
  IN `arg_NumeroCartola` int,
  IN `arg_Moneda` int,
  IN `arg_FechaDesde` date,
  IN `arg_FechaHasta` date,
  IN `arg_SaldoInicial` bigint,
  IN `arg_Deposito` bigint,
  IN `arg_OtrosAbonos` bigint,
  IN `arg_Cheques` bigint,
  IN `arg_OtrosCargos` bigint,
  IN `arg_Impuestos` bigint,
  IN `arg_SaldoFinal` bigint,
  IN `arg_CreditoCupoAprobado` bigint,
  IN `arg_CreditoMontoUtilizado` bigint,
  IN `arg_CreditoSaldoDisponible` bigint,
  IN `arg_TotalMovimientos` bigint,
  IN `arg_Cuadratura` tinyint,
  IN `arg_Archivo` blob
)
BEGIN
  INSERT INTO `cartola`
  (
    `Id_CuentaBancaria`,
    `CuentaCorriente`,
    `NumeroCartola`,
    `Moneda`,
    `FechaDesde`,
    `FechaHasta`,
    `SaldoInicial`,
    `Deposito`,
    `OtrosAbonos`,
    `Cheques`,
    `OtrosCargos`,
    `Impuestos`,
    `SaldoFinal`,
    `CreditoCupoAprobado`,
    `CreditoMontoUtilizado`,
    `CreditoSaldoDisponible`,
    `TotalMovimientos`,
    `Cuadratura`,
    `Archivo`
  )
  VALUES 
  (
    `arg_Id_CuentaBancaria`,
    `arg_CuentaCorriente`,
    `arg_NumeroCartola`,
    `arg_Moneda`,
    `arg_FechaDesde`,
    `arg_FechaHasta`,
    `arg_SaldoInicial`,
    `arg_Deposito`,
    `arg_OtrosAbonos`,
    `arg_Cheques`,
    `arg_OtrosCargos`,
    `arg_Impuestos`,
    `arg_SaldoFinal`,
    `arg_CreditoCupoAprobado`,
    `arg_CreditoMontoUtilizado`,
    `arg_CreditoSaldoDisponible`,
    `arg_TotalMovimientos`,
    `arg_Cuadratura`,
    `arg_Archivo`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_cliente`(
  IN `arg_Rut` varchar(45),
  IN `arg_Empresa` varchar(45)
)
BEGIN
  INSERT INTO `cliente`
  (
    `Rut`,
    `Empresa`
  )
  VALUES 
  (
    `arg_Rut`,
    `arg_Empresa`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_conciliacionbancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_conciliacionbancaria`(
  IN `arg_Id_CuentaBancaria` int,
  IN `arg_Id_Cartola` int,
  IN `arg_Id_MovimientoCartola` int,
  IN `arg_Id_LibroDiario` int,
  IN `arg_Id_MovimientoLibroDiario` int,
  IN `arg_FechaDesde` date,
  IN `arg_FechaHasta` date
)
BEGIN
  INSERT INTO `conciliacionbancaria`
  (
    `Id_CuentaBancaria`,
    `Id_Cartola`,
    `Id_MovimientoCartola`,
    `Id_LibroDiario`,
    `Id_MovimientoLibroDiario`,
    `FechaDesde`,
    `FechaHasta`
  )
  VALUES 
  (
    `arg_Id_CuentaBancaria`,
    `arg_Id_Cartola`,
    `arg_Id_MovimientoCartola`,
    `arg_Id_LibroDiario`,
    `arg_Id_MovimientoLibroDiario`,
    `arg_FechaDesde`,
    `arg_FechaHasta`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_contrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_contrato`(
  IN `arg_Id_Cliente` int,
  IN `arg_Contrato` varchar(45),
  IN `arg_Descripcion` varchar(1000)
)
BEGIN
  INSERT INTO `contrato`
  (
    `Id_Cliente`,
    `Contrato`,
    `Descripcion`
  )
  VALUES 
  (
    `arg_Id_Cliente`,
    `arg_Contrato`,
    `arg_Descripcion`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_cuentabancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_cuentabancaria`(
  IN `arg_Id_Cliente` int,
  IN `arg_Id_Banco` int,
  IN `arg_Id_TipoCuenta` int,
  IN `arg_Rut` varchar(45),
  IN `arg_Password` varchar(45),
  IN `arg_NumeroCuenta` varchar(45),
  IN `arg_Vigencia` tinyint
)
BEGIN
  INSERT INTO `cuentabancaria`
  (
    `Id_Cliente`,
    `Id_Banco`,
    `Id_TipoCuenta`,
    `Rut`,
    `Password`,
    `NumeroCuenta`,
    `Vigencia`
  )
  VALUES 
  (
    `arg_Id_Cliente`,
    `arg_Id_Banco`,
    `arg_Id_TipoCuenta`,
    `arg_Rut`,
    `arg_Password`,
    `arg_NumeroCuenta`,
    `arg_Vigencia`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_librodiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_librodiario`(
  IN `arg_Id_CuentaBancaria` int,
  IN `arg_Moneda` int,
  IN `arg_FechaDesde` date,
  IN `arg_FechaHasta` date,
  IN `arg_TotalMovimientos` bigint,
  IN `arg_Saldo` bigint,
  IN `arg_Cuadratura` tinyint,
  IN `arg_Archivo` blob
)
BEGIN
  INSERT INTO `librodiario`
  (
    `Id_CuentaBancaria`,
    `Moneda`,
    `FechaDesde`,
    `FechaHasta`,
    `TotalMovimientos`,
    `Saldo`,
    `Cuadratura`,
    `Archivo`
  )
  VALUES 
  (
    `arg_Id_CuentaBancaria`,
    `arg_Moneda`,
    `arg_FechaDesde`,
    `arg_FechaHasta`,
    `arg_TotalMovimientos`,
    `arg_Saldo`,
    `arg_Cuadratura`,
    `arg_Archivo`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_movimientolibrodiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_movimientolibrodiario`(
  IN `arg_Id_RegistrosCartola` int,
  IN `arg_Monto` bigint,
  IN `arg_Descripcion` varchar(45),
  IN `arg_FechaMovimiento` date,
  IN `arg_NumeroDocumento` bigint,
  IN `arg_Sucursal` varchar(45),
  IN `arg_CargoAbono` varchar(45)
)
BEGIN
  INSERT INTO `movimientolibrodiario`
  (
    `Id_RegistrosCartola`,
    `Monto`,
    `Descripcion`,
    `FechaMovimiento`,
    `NumeroDocumento`,
    `Sucursal`,
    `CargoAbono`
  )
  VALUES 
  (
    `arg_Id_RegistrosCartola`,
    `arg_Monto`,
    `arg_Descripcion`,
    `arg_FechaMovimiento`,
    `arg_NumeroDocumento`,
    `arg_Sucursal`,
    `arg_CargoAbono`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_movimientoscartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_movimientoscartola`(
  IN `arg_Id_Cartola` int,
  IN `arg_Monto` bigint,
  IN `arg_Descripcion` varchar(45),
  IN `arg_FechaMovimiento` date,
  IN `arg_NumeroDocumento` bigint,
  IN `arg_Sucursal` varchar(45),
  IN `arg_CargoAbono` varchar(45)
)
BEGIN
  INSERT INTO `movimientoscartola`
  (
    `Id_Cartola`,
    `Monto`,
    `Descripcion`,
    `FechaMovimiento`,
    `NumeroDocumento`,
    `Sucursal`,
    `CargoAbono`
  )
  VALUES 
  (
    `arg_Id_Cartola`,
    `arg_Monto`,
    `arg_Descripcion`,
    `arg_FechaMovimiento`,
    `arg_NumeroDocumento`,
    `arg_Sucursal`,
    `arg_CargoAbono`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_tipocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_tipocuenta`(
  IN `arg_Descripcion` varchar(45)
)
BEGIN
  INSERT INTO `tipocuenta`
  (
    `Descripcion`
  )
  VALUES 
  (
    `arg_Descripcion`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_tipousuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ins_tipousuario`(
  IN `arg_Descripcion` varchar(45)
)
BEGIN
  INSERT INTO `tipousuario`
  (
    `Descripcion`
  )
  VALUES 
  (
    `arg_Descripcion`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarCartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ListarCartola`(
	IN `arg_Cliente_Id` int,
	IN `arg_FechaDesde` varchar(10), 
    IN `arg_FechaHasta` varchar(10)

)
BEGIN
    
	Select 
		c.NumeroCartola,
		mc.FechaMovimiento,
		mc.NumeroDocumento,
		mc.Descripcion,
		mc.Monto,
		mc.CargoAbono
	from bankcolition.cuentabancaria cb
	inner join bankcolition.cartola c on
		cb.Id = c.Id_CuentaBancaria
	inner join bankcolition.movimientoscartola mc on
		c.Id = mc.Id_Cartola
	where 
		mc.FechaMovimiento between date(`arg_FechaDesde`) and date(`arg_FechaHasta`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_MostrarConciliacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_MostrarConciliacion`(
	IN `arg_Cliente_Id` int	,
    IN `arg_FechaDesde` varchar(10),
    IN `arg_FechaHasta` varchar(10)
)
BEGIN

	# Buscar Cartolas
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Show AS (
		Select 
			bc.Id_Cliente,
            bc.Id_CuentaBancaria Id_CuentaBancaria,
            bc.Id_Cartola Id_Cartola,
			bc.Id_MovimientoCartola Id_MovimientoCartola,
            bc.Id_LibroDiario Id_LibroDiario,
			bc.Id_MovimientoLibroDiario Id_MovimientoLibroDiario,
			cb.NumeroCuenta NumeroCuenta,
			ca.NumeroCartola NumeroCartola,
			bc.FechaMovimiento FechaMovimiento,
			IFNULL(mca.NumeroDocumento, mcl.NumeroDocumento) NumeroDocumento,
			IFNULL(mca.Descripcion, mcl.Descripcion) Descripcion,
			IFNULL(mca.Monto, mcl.Monto) Monto,
			IFNULL(mca.CargoAbono, mcl.CargoAbono) CargoAbono,
			ec.Descripcion estado
		from bankcolition.conciliacionbancaria bc
		inner join bankcolition.estado ec on
			bc.Id_Estado = ec.Id
		left join bankcolition.movimientoscartola mca on
			bc.Id_MovimientoCartola = mca.Id
		left join bankcolition.cartola ca on
			mca.Id_Cartola = ca.Id
		left join bankcolition.movimientolibrodiario mcl on
			bc.Id_MovimientoLibroDiario = mcl.Id
		left join bankcolition.cuentabancaria cb on
			bc.Id_CuentaBancaria = cb.Id
		where 
			bc.Id_Cliente = `arg_Cliente_Id` 
		and bc.FechaMovimiento between date(`arg_FechaDesde`) and date(`arg_FechaHasta`)
		group by 			
			bc.Id_Cliente,
            bc.Id_CuentaBancaria,
            bc.Id_Cartola,
			bc.Id_MovimientoCartola,
            bc.Id_LibroDiario,
			bc.Id_MovimientoLibroDiario,
			cb.NumeroCuenta,
			ca.NumeroCartola,
			bc.FechaMovimiento,
			IFNULL(mca.NumeroDocumento, mcl.NumeroDocumento),
			IFNULL(mca.Descripcion, mcl.Descripcion),
			IFNULL(mca.Monto, mcl.Monto),
			IFNULL(mca.CargoAbono, mcl.CargoAbono));
        
        Select 
			NumeroCuenta,
			NumeroCartola,
			FechaMovimiento,
			NumeroDocumento,
			Descripcion,
			Monto,
			CargoAbono,
			estado
        from tmp_Show;
        

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RealizaConciliacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_RealizaConciliacion`(
	IN `arg_Cliente_Id` int	,
    IN `arg_FechaDesde` varchar(10),
    IN `arg_FechaHasta` varchar(10)
)
BEGIN

	# Buscar Cartolas
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Union AS (
	Select *
    from (
		Select 
			cb.Id_Cliente CB_Id_Cliente,
            c.Id_CuentaBancaria CB_Id_CuentaBancaria,
            mc.Id_Cartola CB_Id_Cartola,
			mc.Id CB_Id_MovimientoCartola,
			c.NumeroCartola CB_NumeroCartola,
			mc.FechaMovimiento CB_FechaMovimiento,
			mc.NumeroDocumento CB_NumeroDocumento,
			mc.Descripcion CB_Descripcion,
			mc.Monto CB_Monto,
			mc.CargoAbono CB_CargoAbono
		from bankcolition.cuentabancaria cb
		inner join bankcolition.cartola c on
			cb.Id = c.Id_CuentaBancaria
		inner join bankcolition.movimientoscartola mc on
			c.Id = mc.Id_Cartola
		where 
			cb.Id_Cliente = `arg_Cliente_Id` 
		and mc.FechaMovimiento between date(`arg_FechaDesde`) and date(`arg_FechaHasta`)
	) CartolasBancarias
    LEFT OUTER JOIN (
		Select 
			cb.Id_Cliente LD_Id_Cliente,
            rc.Id_CuentaBancaria LD_Id_CuentaBancaria,
            mc.Id_LibroDiario LD_Id_LibroDiario,
            mc.Id LD_Id_MovimientoLibroDiario,
			mc.FechaMovimiento LD_FechaMovimiento,
			mc.NumeroDocumento LD_NumeroDocumento,
			mc.Descripcion LD_Descripcion,
			mc.Monto LD_Monto,
			mc.CargoAbono LD_CargoAbono
		from bankcolition.cuentabancaria cb
		inner join bankcolition.librodiario rc on
			cb.Id = rc.Id_CuentaBancaria
		inner join bankcolition.movimientolibrodiario mc on
			rc.Id = mc.Id_LibroDiario
		where 
			cb.Id_Cliente = `arg_Cliente_Id` 
		and mc.FechaMovimiento between date(`arg_FechaDesde`) and date(`arg_FechaHasta`)
	) LibroDiario on
			CartolasBancarias.CB_Id_Cliente = LibroDiario.LD_Id_Cliente
		and CartolasBancarias.CB_Id_CuentaBancaria = LibroDiario.LD_Id_CuentaBancaria
		and CartolasBancarias.CB_FechaMovimiento = LibroDiario.LD_FechaMovimiento
		and CartolasBancarias.CB_NumeroDocumento = LibroDiario.LD_NumeroDocumento
		and CartolasBancarias.CB_Monto = LibroDiario.LD_Monto
		and CartolasBancarias.CB_CargoAbono = LibroDiario.LD_CargoAbono
	UNION ALL
	Select *
    from (
		Select 
			cb.Id_Cliente CB_Id_Cliente,
            c.Id_CuentaBancaria CB_Id_CuentaBancaria,
            mc.Id_Cartola CB_Id_Cartola,
			mc.Id CB_Id_MovimientoCartola,
			c.NumeroCartola CB_NumeroCartola,
			mc.FechaMovimiento CB_FechaMovimiento,
			mc.NumeroDocumento CB_NumeroDocumento,
			mc.Descripcion CB_Descripcion,
			mc.Monto CB_Monto,
			mc.CargoAbono CB_CargoAbono
		from bankcolition.cuentabancaria cb
		inner join bankcolition.cartola c on
			cb.Id = c.Id_CuentaBancaria
		inner join bankcolition.movimientoscartola mc on
			c.Id = mc.Id_Cartola
		where 
			cb.Id_Cliente = `arg_Cliente_Id` 
		and mc.FechaMovimiento between date(`arg_FechaDesde`) and date(`arg_FechaHasta`)
	) CartolasBancarias
    RIGHT OUTER JOIN (
		Select 
			cb.Id_Cliente LD_Id_Cliente,
            rc.Id_CuentaBancaria LD_Id_CuentaBancaria,
            mc.Id_LibroDiario LD_librodiario,
            mc.Id LD_Id_MovimientoLibroDiario,
			mc.FechaMovimiento LD_FechaMovimiento,
			mc.NumeroDocumento LD_NumeroDocumento,
			mc.Descripcion LD_Descripcion,
			mc.Monto LD_Monto,
			mc.CargoAbono LD_CargoAbono
		from bankcolition.cuentabancaria cb
		inner join bankcolition.librodiario rc on
			cb.Id = rc.Id_CuentaBancaria
		inner join bankcolition.movimientolibrodiario mc on
			rc.Id = mc.Id_LibroDiario
		where 
			cb.Id_Cliente = `arg_Cliente_Id` 
		and mc.FechaMovimiento between date(`arg_FechaDesde`) and date(`arg_FechaHasta`)
	) LibroDiario on
			CartolasBancarias.CB_Id_Cliente = LibroDiario.LD_Id_Cliente
		and CartolasBancarias.CB_Id_CuentaBancaria = LibroDiario.LD_Id_CuentaBancaria
		and CartolasBancarias.CB_FechaMovimiento = LibroDiario.LD_FechaMovimiento
		and CartolasBancarias.CB_NumeroDocumento = LibroDiario.LD_NumeroDocumento
		and CartolasBancarias.CB_Monto = LibroDiario.LD_Monto
		and CartolasBancarias.CB_CargoAbono = LibroDiario.LD_CargoAbono
	WHERE CartolasBancarias.CB_Id_Cliente IS NULL);
	
    #Select * from tmp_Union;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_Bank_Colition AS (
		Select 
			IFNULL(LD_Id_Cliente, CB_Id_Cliente) Id_Cliente,
			IFNULL(LD_Id_CuentaBancaria, CB_Id_CuentaBancaria) Id_CuentaBancaria,
			CB_Id_Cartola Id_Cartola,
			CB_Id_MovimientoCartola Id_MovimientoCartola,
			LD_Id_LibroDiario Id_LibroDiario,
			LD_Id_MovimientoLibroDiario Id_MovimientoLibroDiario,
			IFNULL(LD_FechaMovimiento, CB_FechaMovimiento) FechaMovimiento,
			CASE 
				WHEN LD_Id_Cliente = CB_Id_Cliente THEN 3
				WHEN CB_Id_Cliente is null THEN 5
				WHEN LD_Id_Cliente is null THEN 6
				ELSE 4
			END as Id_Estado
		from tmp_Union tu);    

	Select * from tmp_Bank_Colition tbc;
    
    INSERT INTO `bankcolition`.`conciliacionbancaria` (Id_Cliente, Id_CuentaBancaria, Id_Cartola, Id_MovimientoCartola, Id_LibroDiario, Id_MovimientoLibroDiario,FechaMovimiento, Id_Estado)
		Select * from tmp_Bank_Colition tbc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrarDatos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_registrarDatos`(
	IN `arg_Cliente_Id` int,
	IN `arg_FechaDesde` varchar(10), 
    IN `arg_FechaHasta` varchar(10)

)
BEGIN
    
	Select 
		c.NumeroCartola,
		mc.FechaMovimiento,
		mc.NumeroDocumento,
		mc.Descripcion,
		mc.Monto,
		mc.CargoAbono
	from bankcolition.cuentabancaria cb
	inner join bankcolition.cartola c on
		cb.Id = c.Id_CuentaBancaria
	inner join bankcolition.movimientoscartola mc on
		c.Id = mc.Id_Cartola
	where 
		cb.Id_Cliente = `arg_Cliente_Id` and mc.FechaMovimiento between date(`arg_FechaDesde`) and date(`arg_FechaHasta`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_banco`()
BEGIN
  SELECT
    `Id`,
    `EntidadBancaria`
  FROM `banco`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_cartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_cartola`()
BEGIN
  SELECT
    `Id`,
    `Id_CuentaBancaria`,
    `CuentaCorriente`,
    `NumeroCartola`,
    `Moneda`,
    `FechaDesde`,
    `FechaHasta`,
    `SaldoInicial`,
    `Deposito`,
    `OtrosAbonos`,
    `Cheques`,
    `OtrosCargos`,
    `Impuestos`,
    `SaldoFinal`,
    `CreditoCupoAprobado`,
    `CreditoMontoUtilizado`,
    `CreditoSaldoDisponible`,
    `TotalMovimientos`,
    `Cuadratura`,
    `Archivo`
  FROM `cartola`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_cliente`()
BEGIN
  SELECT
    `Id`,
    `Rut`,
    `Empresa`
  FROM `cliente`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_conciliacionbancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_conciliacionbancaria`()
BEGIN
  SELECT
    `Id`,
    `Id_CuentaBancaria`,
    `Id_Cartola`,
    `Id_MovimientoCartola`,
    `Id_LibroDiario`,
    `Id_MovimientoLibroDiario`,
    `FechaDesde`,
    `FechaHasta`
  FROM `conciliacionbancaria`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_contrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_contrato`()
BEGIN
  SELECT
    `Id`,
    `Id_Cliente`,
    `Contrato`,
    `Descripcion`
  FROM `contrato`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_cuentabancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_cuentabancaria`()
BEGIN
  SELECT
    `Id`,
    `Id_Cliente`,
    `Id_Banco`,
    `Id_TipoCuenta`,
    `Rut`,
    `Password`,
    `NumeroCuenta`,
    `Vigencia`
  FROM `cuentabancaria`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_librodiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_librodiario`()
BEGIN
  SELECT
    `Id`,
    `Id_CuentaBancaria`,
    `Moneda`,
    `FechaDesde`,
    `FechaHasta`,
    `TotalMovimientos`,
    `Saldo`,
    `Cuadratura`,
    `Archivo`
  FROM `librodiario`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_movimientolibrodiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_movimientolibrodiario`()
BEGIN
  SELECT
    `Id`,
    `Id_RegistrosCartola`,
    `Monto`,
    `Descripcion`,
    `FechaMovimiento`,
    `NumeroDocumento`,
    `Sucursal`,
    `CargoAbono`
  FROM `movimientolibrodiario`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_movimientoscartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_movimientoscartola`()
BEGIN
  SELECT
    `Id`,
    `Id_Cartola`,
    `Monto`,
    `Descripcion`,
    `FechaMovimiento`,
    `NumeroDocumento`,
    `Sucursal`,
    `CargoAbono`
  FROM `movimientoscartola`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_tipocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_tipocuenta`()
BEGIN
  SELECT
    `Id`,
    `Descripcion`
  FROM `tipocuenta`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sel_tipousuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_sel_tipousuario`()
BEGIN
  SELECT
    `Id`,
    `Descripcion`
  FROM `tipousuario`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_banco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_banco`(
  IN `arg_Id` int,
  IN `arg_EntidadBancaria` varchar(45)
)
BEGIN
  UPDATE `banco` SET
    `EntidadBancaria` = `arg_EntidadBancaria`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_cartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_cartola`(
  IN `arg_Id` int,
  IN `arg_Id_CuentaBancaria` int,
  IN `arg_CuentaCorriente` varchar(45),
  IN `arg_NumeroCartola` int,
  IN `arg_Moneda` int,
  IN `arg_FechaDesde` date,
  IN `arg_FechaHasta` date,
  IN `arg_SaldoInicial` bigint,
  IN `arg_Deposito` bigint,
  IN `arg_OtrosAbonos` bigint,
  IN `arg_Cheques` bigint,
  IN `arg_OtrosCargos` bigint,
  IN `arg_Impuestos` bigint,
  IN `arg_SaldoFinal` bigint,
  IN `arg_CreditoCupoAprobado` bigint,
  IN `arg_CreditoMontoUtilizado` bigint,
  IN `arg_CreditoSaldoDisponible` bigint,
  IN `arg_TotalMovimientos` bigint,
  IN `arg_Cuadratura` tinyint,
  IN `arg_Archivo` blob
)
BEGIN
  UPDATE `cartola` SET
    `Id_CuentaBancaria` = `arg_Id_CuentaBancaria`,
    `CuentaCorriente` = `arg_CuentaCorriente`,
    `NumeroCartola` = `arg_NumeroCartola`,
    `Moneda` = `arg_Moneda`,
    `FechaDesde` = `arg_FechaDesde`,
    `FechaHasta` = `arg_FechaHasta`,
    `SaldoInicial` = `arg_SaldoInicial`,
    `Deposito` = `arg_Deposito`,
    `OtrosAbonos` = `arg_OtrosAbonos`,
    `Cheques` = `arg_Cheques`,
    `OtrosCargos` = `arg_OtrosCargos`,
    `Impuestos` = `arg_Impuestos`,
    `SaldoFinal` = `arg_SaldoFinal`,
    `CreditoCupoAprobado` = `arg_CreditoCupoAprobado`,
    `CreditoMontoUtilizado` = `arg_CreditoMontoUtilizado`,
    `CreditoSaldoDisponible` = `arg_CreditoSaldoDisponible`,
    `TotalMovimientos` = `arg_TotalMovimientos`,
    `Cuadratura` = `arg_Cuadratura`,
    `Archivo` = `arg_Archivo`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_cliente`(
  IN `arg_Id` int,
  IN `arg_Rut` varchar(45),
  IN `arg_Empresa` varchar(45)
)
BEGIN
  UPDATE `cliente` SET
    `Rut` = `arg_Rut`,
    `Empresa` = `arg_Empresa`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_conciliacionbancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_conciliacionbancaria`(
  IN `arg_Id` int,
  IN `arg_Id_CuentaBancaria` int,
  IN `arg_Id_Cartola` int,
  IN `arg_Id_MovimientoCartola` int,
  IN `arg_Id_LibroDiario` int,
  IN `arg_Id_MovimientoLibroDiario` int,
  IN `arg_FechaDesde` date,
  IN `arg_FechaHasta` date
)
BEGIN
  UPDATE `conciliacionbancaria` SET
    `Id_CuentaBancaria` = `arg_Id_CuentaBancaria`,
    `Id_Cartola` = `arg_Id_Cartola`,
    `Id_MovimientoCartola` = `arg_Id_MovimientoCartola`,
    `Id_LibroDiario` = `arg_Id_LibroDiario`,
    `Id_MovimientoLibroDiario` = `arg_Id_MovimientoLibroDiario`,
    `FechaDesde` = `arg_FechaDesde`,
    `FechaHasta` = `arg_FechaHasta`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_contrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_contrato`(
  IN `arg_Id` int,
  IN `arg_Id_Cliente` int,
  IN `arg_Contrato` varchar(45),
  IN `arg_Descripcion` varchar(1000)
)
BEGIN
  UPDATE `contrato` SET
    `Id_Cliente` = `arg_Id_Cliente`,
    `Contrato` = `arg_Contrato`,
    `Descripcion` = `arg_Descripcion`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_cuentabancaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_cuentabancaria`(
  IN `arg_Id` int,
  IN `arg_Id_Cliente` int,
  IN `arg_Id_Banco` int,
  IN `arg_Id_TipoCuenta` int,
  IN `arg_Rut` varchar(45),
  IN `arg_Password` varchar(45),
  IN `arg_NumeroCuenta` varchar(45),
  IN `arg_Vigencia` tinyint
)
BEGIN
  UPDATE `cuentabancaria` SET
    `Id_Cliente` = `arg_Id_Cliente`,
    `Id_Banco` = `arg_Id_Banco`,
    `Id_TipoCuenta` = `arg_Id_TipoCuenta`,
    `Rut` = `arg_Rut`,
    `Password` = `arg_Password`,
    `NumeroCuenta` = `arg_NumeroCuenta`,
    `Vigencia` = `arg_Vigencia`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_librodiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_librodiario`(
  IN `arg_Id` int,
  IN `arg_Id_CuentaBancaria` int,
  IN `arg_Moneda` int,
  IN `arg_FechaDesde` date,
  IN `arg_FechaHasta` date,
  IN `arg_TotalMovimientos` bigint,
  IN `arg_Saldo` bigint,
  IN `arg_Cuadratura` tinyint,
  IN `arg_Archivo` blob
)
BEGIN
  UPDATE `librodiario` SET
    `Id_CuentaBancaria` = `arg_Id_CuentaBancaria`,
    `Moneda` = `arg_Moneda`,
    `FechaDesde` = `arg_FechaDesde`,
    `FechaHasta` = `arg_FechaHasta`,
    `TotalMovimientos` = `arg_TotalMovimientos`,
    `Saldo` = `arg_Saldo`,
    `Cuadratura` = `arg_Cuadratura`,
    `Archivo` = `arg_Archivo`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_movimientolibrodiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_movimientolibrodiario`(
  IN `arg_Id` int,
  IN `arg_Id_RegistrosCartola` int,
  IN `arg_Monto` bigint,
  IN `arg_Descripcion` varchar(45),
  IN `arg_FechaMovimiento` date,
  IN `arg_NumeroDocumento` bigint,
  IN `arg_Sucursal` varchar(45),
  IN `arg_CargoAbono` varchar(45)
)
BEGIN
  UPDATE `movimientolibrodiario` SET
    `Id_RegistrosCartola` = `arg_Id_RegistrosCartola`,
    `Monto` = `arg_Monto`,
    `Descripcion` = `arg_Descripcion`,
    `FechaMovimiento` = `arg_FechaMovimiento`,
    `NumeroDocumento` = `arg_NumeroDocumento`,
    `Sucursal` = `arg_Sucursal`,
    `CargoAbono` = `arg_CargoAbono`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_movimientoscartola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_movimientoscartola`(
  IN `arg_Id` int,
  IN `arg_Id_Cartola` int,
  IN `arg_Monto` bigint,
  IN `arg_Descripcion` varchar(45),
  IN `arg_FechaMovimiento` date,
  IN `arg_NumeroDocumento` bigint,
  IN `arg_Sucursal` varchar(45),
  IN `arg_CargoAbono` varchar(45)
)
BEGIN
  UPDATE `movimientoscartola` SET
    `Id_Cartola` = `arg_Id_Cartola`,
    `Monto` = `arg_Monto`,
    `Descripcion` = `arg_Descripcion`,
    `FechaMovimiento` = `arg_FechaMovimiento`,
    `NumeroDocumento` = `arg_NumeroDocumento`,
    `Sucursal` = `arg_Sucursal`,
    `CargoAbono` = `arg_CargoAbono`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_tipocuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_tipocuenta`(
  IN `arg_Id` int,
  IN `arg_Descripcion` varchar(45)
)
BEGIN
  UPDATE `tipocuenta` SET
    `Descripcion` = `arg_Descripcion`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upd_tipousuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_upd_tipousuario`(
  IN `arg_Id` int,
  IN `arg_Descripcion` varchar(45)
)
BEGIN
  UPDATE `tipousuario` SET
    `Descripcion` = `arg_Descripcion`
  WHERE 
    (`Id` = `arg_Id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ValidarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bankcolition`@`%` PROCEDURE `sp_ValidarUsuario`(
	IN `arg_Usuario` varchar(100),	 
	IN `arg_Password` varchar(100)
)
BEGIN
	SELECT u.`Id` usuarioId, u.`Id_Cliente` clienteId, u.Nombres nombres, u.Apellidos apellidos, tu.Descripcion rol
	FROM bankcolition.usuario u
	LEFT JOIN bankcolition.tipousuario tu ON u.Id_TipoUsuario = tu.Id 
	WHERE 	u.`Id_TipoUsuario` != 0
		AND u.`Usuario` = `arg_Usuario`
		AND u.`Password` = `arg_Password`
		AND u.`id_estado` = 1;
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

-- Dump completed on 2022-06-27 21:50:45
