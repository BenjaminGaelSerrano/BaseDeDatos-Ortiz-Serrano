-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: remiseria
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Table structure for table `Auto`
--

DROP TABLE IF EXISTS `Auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auto` (
  `patente` int NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auto`
--

LOCK TABLES `Auto` WRITE;
/*!40000 ALTER TABLE `Auto` DISABLE KEYS */;
INSERT INTO `Auto` VALUES (123456,'Toyota Corolla'),(345678,'Chevrolet Cruze'),(654321,'Honda Civic'),(789012,'Ford Focus'),(901234,'Volkswagen Gol');
/*!40000 ALTER TABLE `Auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `Id` int NOT NULL,
  `Apellido_y_nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'García, María','Calle Principal 123',1122334455,'Cliente frecuente'),(2,'López, Juan','Avenida Central 456',9988,NULL),(3,'Rodríguez, Pablo','Calle Sur 789',3344,'Nuevo cliente'),(4,'Fernández, Laura','Av. Libertador 456',999888777,'Cliente preferencial'),(5,'Gutiérrez, Carlos','Calle Este 123',777666555,NULL);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuenta_Corriente`
--

DROP TABLE IF EXISTS `Cuenta_Corriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cuenta_Corriente` (
  `id_cc` int NOT NULL,
  `saldo_cc` int DEFAULT NULL,
  `cantidad_viajes` int DEFAULT NULL,
  PRIMARY KEY (`id_cc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuenta_Corriente`
--

LOCK TABLES `Cuenta_Corriente` WRITE;
/*!40000 ALTER TABLE `Cuenta_Corriente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cuenta_Corriente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chofer`
--

DROP TABLE IF EXISTS `chofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chofer` (
  `Id_chofer` int NOT NULL,
  `apellido_y_nombre_chofer` varchar(45) DEFAULT NULL,
  `direccion_chofer` varchar(45) DEFAULT NULL,
  `telefono_chofer` int DEFAULT NULL,
  PRIMARY KEY (`Id_chofer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chofer`
--

LOCK TABLES `chofer` WRITE;
/*!40000 ALTER TABLE `chofer` DISABLE KEYS */;
INSERT INTO `chofer` VALUES (1,'Martínez, Pedro','Ruta 7 Km 10',5544),(2,'Gómez, Ana','Calle Norte 789',6677),(3,'Sánchez, Mario','Calle Oeste 321',5554),(4,'Pérez, Ana María','Av. Principal 789',7778),(5,'González, Luis','Ruta 10 Km 5',3332);
/*!40000 ALTER TABLE `chofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `id_viaje` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `destino` varchar(45) DEFAULT NULL,
  `hora_de_llegada` datetime DEFAULT NULL,
  `costo` int DEFAULT NULL,
  `cuenta_corriente_sn` varchar(45) DEFAULT NULL,
  `chofer_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `patente_auto` int DEFAULT NULL,
  PRIMARY KEY (`id_viaje`),
  KEY `chofer_id` (`chofer_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `patente_auto` (`patente_auto`),
  CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`chofer_id`) REFERENCES `chofer` (`Id_chofer`),
  CONSTRAINT `viaje_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `Cliente` (`Id`),
  CONSTRAINT `viaje_ibfk_3` FOREIGN KEY (`patente_auto`) REFERENCES `Auto` (`patente`),
  CONSTRAINT `viaje_chk_1` CHECK ((`costo` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES (1,'2024-07-05','Aeropuerto','2024-07-05 10:30:00',500,'S',1,1,123456),(2,'2024-07-06','Centro','2024-07-06 15:00:00',300,'N',2,2,654321),(3,'2024-07-07','Shopping Center','2024-07-07 12:00:00',400,'S',3,3,789012),(4,'2024-07-08','Estadio','2024-07-08 18:30:00',250,'N',4,4,345678),(5,'2024-07-09','Parque Industrial','2024-07-09 10:00:00',300,'S',5,5,901234),(6,'2024-07-10','Hospital','2024-07-10 14:15:00',350,'N',1,2,123456),(7,'2024-07-11','Universidad','2024-07-11 09:00:00',280,'S',2,1,654321),(8,'2024-07-12','Museo','2024-07-12 16:45:00',200,'N',3,3,789012),(9,'2024-07-13','Centro Comercial','2024-07-13 11:30:00',320,'S',4,4,345678),(10,'2024-07-14','Parque','2024-07-14 17:00:00',280,'N',5,5,901234);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-05 17:06:37
