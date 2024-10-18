CREATE DATABASE  IF NOT EXISTS `canciones_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `canciones_db`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: canciones_db
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `biografia` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Styles','Harry Styles, nacido el 1 de febrero de 1994 en Inglaterra, es un cantante y actor. Famoso por ser miembro de One Direction, lanzó su carrera en solitario en 2016 con álbumes como \"Harry Styles\" y \"Fine Line\".','2024-10-18','2024-10-18','Harry'),(2,'Tomlinson','Louis Tomlinson, nacido el 24 de diciembre de 1991 en Inglaterra, es un cantante y compositor. Fue miembro de One Direction y lanzó su álbum debut en solitario, \"Walls\", en 2020.','2024-10-18','2024-10-18','Louis'),(3,'Valenzuela','\r\nFrancisca Valenzuela es una cantante y compositora chilena, nacida el 17 de marzo de 1987 en Santiago. Se destacó con su EP debut en 2006 y ha lanzado varios álbumes, incluyendo \"Muérdete la lengua\" (2010).','2024-10-18','2024-10-18','Francisca ');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `album` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `id_artista` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4uglpx9joj5tsshddbdgf6tk3` (`id_artista`),
  CONSTRAINT `FK4uglpx9joj5tsshddbdgf6tk3` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (2,'Fine Line','2024-10-18',NULL,'Pop','English','Fine Line',1),(3,'Faith in the Future','2024-10-18','2024-10-18','Pop','English','Silver Tongues',2),(4,'Harry\'s House','2024-10-18','2024-10-18','Pop','English','As It Was',1),(6,' Sign of the Times','2024-10-18','2024-10-18','Pop','English','Sign of the Times',1),(7,'Muérdete la lengua','2024-10-18','2024-10-18','Pop','Español',' Afortunada',3);
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-18 18:21:23
