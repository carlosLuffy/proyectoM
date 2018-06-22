-- MySQL dump 10.16  Distrib 10.1.32-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: taller_industrial
-- ------------------------------------------------------
-- Server version	10.1.32-MariaDB

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
-- Table structure for table `deudas`
--

DROP TABLE IF EXISTS `deudas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deudas` (
  `codigo_Deuda` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_prestamo` int(4) unsigned zerofill NOT NULL,
  PRIMARY KEY (`codigo_Deuda`),
  KEY `id_prestamo` (`id_prestamo`),
  CONSTRAINT `deudas_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamos` (`id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deudas`
--

LOCK TABLES `deudas` WRITE;
/*!40000 ALTER TABLE `deudas` DISABLE KEYS */;
/*!40000 ALTER TABLE `deudas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deudas_alumno`
--

DROP TABLE IF EXISTS `deudas_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deudas_alumno` (
  `numero_deuda` int(4) NOT NULL AUTO_INCREMENT,
  `codigo_Deuda` int(4) unsigned zerofill NOT NULL,
  `id_herramienta` int(4) unsigned zerofill NOT NULL,
  `cantidad` int(2) DEFAULT NULL,
  PRIMARY KEY (`numero_deuda`),
  KEY `codigo_Deuda` (`codigo_Deuda`),
  KEY `id_herramienta` (`id_herramienta`),
  CONSTRAINT `deudas_alumno_ibfk_1` FOREIGN KEY (`codigo_Deuda`) REFERENCES `deudas` (`codigo_Deuda`),
  CONSTRAINT `deudas_alumno_ibfk_2` FOREIGN KEY (`id_herramienta`) REFERENCES `herramientas` (`id_herramientas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deudas_alumno`
--

LOCK TABLES `deudas_alumno` WRITE;
/*!40000 ALTER TABLE `deudas_alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `deudas_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `carnet_estudiante` varchar(7) NOT NULL,
  `nombre_estudiante` varchar(50) DEFAULT NULL,
  `apellidos_estudiante` varchar(50) DEFAULT NULL,
  `grupo_estudiante` int(1) DEFAULT NULL,
  `carrera` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`carnet_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herramientas`
--

DROP TABLE IF EXISTS `herramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herramientas` (
  `id_herramientas` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `cantidad` int(4) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_herramientas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herramientas`
--

LOCK TABLES `herramientas` WRITE;
/*!40000 ALTER TABLE `herramientas` DISABLE KEYS */;
/*!40000 ALTER TABLE `herramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `id_prestamo` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `carnet` varchar(7) NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `carnet` (`carnet`),
  CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`carnet`) REFERENCES `estudiantes` (`carnet_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_devolucion`
--

DROP TABLE IF EXISTS `registro_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_devolucion` (
  `id_prestamo` int(4) unsigned zerofill NOT NULL,
  `id_herramienta` int(4) unsigned zerofill NOT NULL,
  `cantidad` int(2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` date NOT NULL,
  PRIMARY KEY (`hora`),
  KEY `id_prestamo` (`id_prestamo`),
  KEY `id_herramienta` (`id_herramienta`),
  CONSTRAINT `registro_devolucion_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamos` (`id_prestamo`),
  CONSTRAINT `registro_devolucion_ibfk_2` FOREIGN KEY (`id_herramienta`) REFERENCES `herramientas` (`id_herramientas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_devolucion`
--

LOCK TABLES `registro_devolucion` WRITE;
/*!40000 ALTER TABLE `registro_devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_prestamo`
--

DROP TABLE IF EXISTS `registro_prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_prestamo` (
  `id_prestamo` int(4) unsigned zerofill NOT NULL,
  `id_herramienta` int(4) unsigned zerofill NOT NULL,
  `cantidad` int(2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` date NOT NULL,
  PRIMARY KEY (`hora`),
  KEY `id_prestamo` (`id_prestamo`),
  KEY `id_herramienta` (`id_herramienta`),
  CONSTRAINT `registro_prestamo_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamos` (`id_prestamo`),
  CONSTRAINT `registro_prestamo_ibfk_2` FOREIGN KEY (`id_herramienta`) REFERENCES `herramientas` (`id_herramientas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_prestamo`
--

LOCK TABLES `registro_prestamo` WRITE;
/*!40000 ALTER TABLE `registro_prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_prestamo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-22 14:46:39
