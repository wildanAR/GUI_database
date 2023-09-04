-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: plastik_solusa
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `stok_plastik`
--

DROP TABLE IF EXISTS `stok_plastik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stok_plastik` (
  `nomor` int NOT NULL AUTO_INCREMENT,
  `ID` varchar(255) NOT NULL,
  `jenis_brg` varchar(255) NOT NULL,
  `Stok_per_dus` varchar(255) NOT NULL,
  `hrg_beli_dus` varchar(255) NOT NULL,
  `hrg_beli_pcs` varchar(255) NOT NULL,
  `hrg_jual_dus` varchar(255) NOT NULL,
  `hrg_jual_pcs` varchar(255) NOT NULL,
  `etalase` varchar(255) NOT NULL,
  UNIQUE KEY `nomor` (`nomor`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stok_plastik`
--

LOCK TABLES `stok_plastik` WRITE;
/*!40000 ALTER TABLE `stok_plastik` DISABLE KEYS */;
INSERT INTO `stok_plastik` VALUES (1,'GX-4','Mika GX-4','20','245000','12250','250000','16500','4'),(2,'jolly250','Tissue Jolly Softpack 250','12','320000','6750','30000','8000','12'),(3,'TULS60100','Tulip Sampah 60x100','0','0','19750','0','23000','3'),(4,'TULS80120','Tulip Sampah 80x120','0','0','19750','0','24000','3'),(5,'OPP1010','Plastik OPP 10x10','0','0','4700','0','7000','2'),(6,'OPP1012','Plastik OPP 10x12','0','0','4700','0','7000','2'),(7,'OPP1212','Plastik OPP 12x12','0','0','5600','0','8000','3'),(8,'OPP1416','Plastik OPP 14x16','0','0','7400','0','10000','2'),(9,'OPP812','Plastik OPP 8x12','0','0','4400','0','7000','2'),(10,'OPP814','Plastik OPP 8x14','0','0','4400','0','7000','2'),(11,'OPP810','Plastik OPP 8x10','0','0','4600','0','7000','2'),(12,'rodamas40','Kresek rodamas 40','0','0','14000','0','17000','4'),(13,'tomat2035','Plastik Tomat 20x35','4','33500','8375','0','10000','4'),(14,'tomat1530','Plastik Tomat 15x30','4','33500','8375','0','10000','4'),(15,'semar6010004','Plastik Semar 60x100x04','0','0','27000','0','33000','2'),(16,'semar407003','Plastik Semar 40x70x03','0','0','27000','0','33000','2'),(17,'semar355003','Plastik Semar 35x50x03','0','0','27000','0','35000','1'),(18,'semar101806','Plastik Semar 10x18x06','4','27000','6750','0','10000','28'),(19,'sedotan bubble steril','Sedotan Bubble Steril 6mm','40','400000','10000','0','14000','40'),(20,'TXH15','Taxi Hitam 15','0','0','5150','0','6500','9'),(21,'TXP15','Taxi Putih 15','0','0','5150','0','6500','20'),(22,'fresh6mm','Sedotan Fresh 6mm','0','34000','8500','0','11500','5'),(23,'ECO22','Cup Ecoplas 22oz','20','335000','16750','0','20000','15'),(24,'tomatb15','Kresek Tomat Bening 15','0','0','8400','0','10000','4'),(25,'barista','Kresek Barista','0','0','2000','0','5000','11'),(26,'semar81506','Plastik Semar 8x15x06','4','27000','6750','0','10000','4'),(27,'semar81503','Plastik Semar 8x15x03','4','2700','6750','0','10000','3'),(28,'semar122006','Plastik Semar 12x20x06','4','27000','6750','0','10000','3'),(29,'semar122003','Plastik Semar 12x20x03','4','27000','6750','0','10000','3'),(30,'semar153006','Plastik Semar 15x30x06','4','27000','7650','0','10000','3'),(31,'tulip1530','Plastik Tulip 15x30','4','33000','8250','0','10000','7'),(32,'semar122506','Plastik Semar 12x25x06','4','27000','6750','0','10000','6'),(33,'bola15','Kresek Bola 15','10','19000','1900','0','2500','18'),(34,'HD1225','Plastik Burem HD 12x25','0','29600','3700','0','5500','15'),(35,'HD1530','Plastik HD Burem 15x30','8','30000','3750','0','7500','10'),(36,'HebatBB','Keras Nasi Hebat Bunga Besar','0','0','18000','0','25000','4'),(37,'HebatBK','Kertas Nasi Hebat Bunga Kecil','0','0','14100','0','22000','3'),(38,'karetmerah','Karet Merah','10','66000','6600','0','8500','10'),(39,'tomat1225','Plastik Tomat 12x25','4','33000','8250','0','10000','3');
/*!40000 ALTER TABLE `stok_plastik` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-16 17:43:44
