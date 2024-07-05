-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TP1
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `alojamientos`
--

DROP TABLE IF EXISTS `alojamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alojamientos` (
  `codigo` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `cantidad de personas` int DEFAULT NULL,
  `bar` varchar(45) DEFAULT NULL,
  `cocina(cabaña)` varchar(45) DEFAULT NULL,
  `garage(cabaña)` varchar(45) DEFAULT NULL,
  `parrilla(cabaña)` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamientos`
--

LOCK TABLES `alojamientos` WRITE;
/*!40000 ALTER TABLE `alojamientos` DISABLE KEYS */;
INSERT INTO `alojamientos` VALUES (6,'nestor','cabaña','griveo 3223',1127389131,7,'si','si','si','si'),(29,'pablo','hotel','ladines 5496',1139026734,6,NULL,NULL,NULL,NULL),(56,'benjamin','cabaña','emilio lamarca 7896',1142982582,2,'si','si','si','si'),(63,'alber','cabaña','andonaegui 7896',1194568582,8,'si','si','si','si'),(113,'gustavo','cabaña','lavallol 9284',1147292582,6,'si','si','si','si'),(127,'Gaston','hotel','lavallol 5629',1134562396,5,NULL,NULL,NULL,NULL),(129,'lautaro','cabaña','moscu 7896',1134565189,1,'si','si','si','si'),(133,'Hernan','cabaña','lavallol 7896',1134562582,4,'si','si','si','si'),(736,'humberto','cabaña','emilio lamarca 4913',1137862582,3,'si','si','si','si'),(1339,'felipe','hotel','san martin 7273',1125821795,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `alojamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `DNI` int NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `apellido_y_nombre` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `celular` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (4658865,'juan b. justo 5432','Luciano Rojas',74325587,63653656),(6765123,'yucatan 33','Franco piertnaz',43564356,43245435),(23456931,'bolivia 568','Lorenzo schingol',73927494,95847363),(25635464,'figeroa alcorta 801','lautaro Fernandez',54254534,75439865),(35687432,'alberdi 5643','José Fernandez',34522375,75632787),(37354343,'llerena 401','Santiago Schumaguer',43226543,43243234),(38485432,'Moscú 3243','Augusto Gonzalez',43575845,43223423),(42354934,'nazca 5643','Alfredo Perez',24242424,76687857),(45334543,'rivadavia 8765','Luca de santis',87543285,47356843),(45358679,'Pepo 4567','Florencia Salomon',39584732,75498769);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `codigo` int NOT NULL,
  `metodo_de_pago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (439,'efectivo'),(717,'efectivo'),(797,'tarjeta debito'),(918,'tarjeta de debito'),(938,'mercado pago'),(1024,'mercado pago'),(1073,'tarjeta de credito'),(1829,'efectivo'),(2098,'tarjeta de credito'),(2945,'tarjeta de credito');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete de viajes`
--

DROP TABLE IF EXISTS `paquete de viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete de viajes` (
  `codigo` int NOT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `cantidad_dias` int DEFAULT NULL,
  `cantidad_noches` int DEFAULT NULL,
  `costo` int DEFAULT NULL,
  `tipo de pago` varchar(45) DEFAULT NULL,
  `cantidad_excursiones` int DEFAULT NULL,
  `viaje(aereo-bus-barco)` varchar(45) DEFAULT NULL,
  `alojamiento` varchar(45) DEFAULT NULL,
  `pago_codigo` int NOT NULL,
  `alojamientos_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_paquete de viajes_pago_idx` (`pago_codigo`),
  KEY `fk_paquete de viajes_alojamientos1_idx` (`alojamientos_codigo`),
  CONSTRAINT `fk_paquete de viajes_alojamientos1` FOREIGN KEY (`alojamientos_codigo`) REFERENCES `alojamientos` (`codigo`),
  CONSTRAINT `fk_paquete de viajes_pago` FOREIGN KEY (`pago_codigo`) REFERENCES `pago` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete de viajes`
--

LOCK TABLES `paquete de viajes` WRITE;
/*!40000 ALTER TABLE `paquete de viajes` DISABLE KEYS */;
INSERT INTO `paquete de viajes` VALUES (1,'Bahamas',4,3,800,'efectivo',3,'aereo','nestor',439,6),(2,'Maldivas',5,4,5000,'efectivo',1,'aereo','felipe',439,1339),(3,'salta',8,8,500,'tarjeta de credito',7,'bus','alber',1073,63),(4,'rio',9,8,1200,'tarjeta de credito',3,'aereo','humberto',2098,736),(5,'colombo',6,5,2050,'tarjeta de credito',1,'aereo','benjamin',918,56),(6,'venecia',5,5,2000,'mercado pago',3,'aereo','gustavo',1024,113),(7,'bahamas',4,3,800,'efectivo',3,'aereo','pablo',439,29),(8,'villa san carlos',25,24,770,'tarjeta de credito',0,'bus','pablo',2945,29),(9,'villa pepo',1,0,50,'efectivo',0,'barco','gaston',1829,127),(10,'villa san nehu',7,7,10000,'tarjeta de debito',0,'barco','hernan',797,133);
/*!40000 ALTER TABLE `paquete de viajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `codigo` int NOT NULL,
  `cliente` varchar(45) DEFAULT NULL,
  `paquete_de_viaje` varchar(45) DEFAULT NULL,
  `f/i` date DEFAULT NULL,
  `f/f` date DEFAULT NULL,
  `cantidad_personas` int DEFAULT NULL,
  `clientes_DNI` int NOT NULL,
  `paquete de viajes_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_reserva_clientes1_idx` (`clientes_DNI`),
  KEY `fk_reserva_paquete de viajes1_idx` (`paquete de viajes_codigo`),
  CONSTRAINT `fk_reserva_clientes1` FOREIGN KEY (`clientes_DNI`) REFERENCES `clientes` (`DNI`),
  CONSTRAINT `fk_reserva_paquete de viajes1` FOREIGN KEY (`paquete de viajes_codigo`) REFERENCES `paquete de viajes` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (11,'jose fernandez','bahamas','2024-05-02','2024-05-06',3,35687432,1),(12,'augusto gonzalez','Maldivas','2024-05-01','2024-05-06',6,38485432,2),(13,'lautaro fernandez','salta','2024-04-30','2024-05-08',2,25635464,3),(15,'luciano rojas','colombo','2024-05-05','2024-05-11',6,4658865,5),(16,'santiago schumager','venecia','2024-05-03','2024-05-08',4,37354343,6),(17,'alfredo perez','villa ballester','2024-04-03','2024-04-18',9,42354934,7),(18,'franco piertnaz','villa san carlos','2024-05-03','2024-05-28',3,6765123,8),(19,'lorenzo schingol','villa pepo','2024-05-06','2024-05-07',1,23456931,9),(20,'florencia salomon','villa san nehu','2024-04-06','2024-04-13',2,45358679,10),(21,'José Fernandez','bahamas','2024-05-02','2024-05-06',3,35687432,1),(22,'augusto gonzalez','Maldivas','2024-05-01','2024-05-06',6,38485432,2),(24,'luca de santis','rio','2024-05-07','2024-05-16',2,45334543,4);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 17:29:46
