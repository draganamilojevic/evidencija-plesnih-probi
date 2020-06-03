-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: evidencija_plesne_skole
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clan` (
  `identifikacioni_broj` int NOT NULL,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(40) DEFAULT NULL,
  `pol` varchar(10) DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `datum_uclanjenja` date DEFAULT NULL,
  `broj_nagrada` int DEFAULT NULL,
  `disciplina` int DEFAULT NULL,
  `grupaID` int DEFAULT NULL,
  `plesni_partner` int DEFAULT NULL,
  PRIMARY KEY (`identifikacioni_broj`),
  KEY `clan_fk1` (`grupaID`),
  KEY `clan_fk2` (`plesni_partner`),
  KEY `clan_fk3` (`disciplina`),
  CONSTRAINT `clan_fk1` FOREIGN KEY (`grupaID`) REFERENCES `plesna_grupa` (`grupaID`),
  CONSTRAINT `clan_fk2` FOREIGN KEY (`plesni_partner`) REFERENCES `clan` (`identifikacioni_broj`),
  CONSTRAINT `clan_fk3` FOREIGN KEY (`disciplina`) REFERENCES `disciplina` (`disciplinaID`),
  CONSTRAINT `clan_check` CHECK ((`pol` in (_utf8mb4'muski',_utf8mb4'zenski')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` VALUES (11,'Pavle','Maric','muski','1993-05-14','2015-01-05',7,111,20,33),(12,'Teodor','Tomasevic','muski','1997-09-27','2016-09-10',2,444,30,NULL),(22,'Milan','Lalic','muski','1988-02-02','2014-12-23',2,111,10,NULL),(23,'Katarina','Dukic','zenski','1994-09-22','2017-10-05',4,555,30,45),(33,'Ivana','Mitrovic','zenski','1992-03-13','2017-10-18',3,111,30,11),(34,'Branko','Ilic','muski','1989-07-16','2018-11-11',3,555,10,NULL),(44,'Sandra','Ivanovic','zenski','1984-12-22','2016-01-31',4,222,20,55),(45,'Petar','Ljubojevic','muski','1995-03-03','2019-02-01',6,555,50,23),(55,'Ana','Velimirovic','zenski','2000-06-23','2018-11-12',2,222,40,44),(56,'Petra','Spasic','zenski','1999-05-11','2015-04-19',3,666,10,67),(66,'Jovana','Krasic','zenski','2002-08-15','2016-04-20',1,222,50,NULL),(67,'Lazar','Jankovic','muski','2003-09-29','2017-08-12',10,666,50,56),(77,'Aleksandar','Micic','muski','1998-01-05','2015-02-11',5,333,20,88),(88,'Kristina','Bogdanovic','zenski','2001-12-11','2018-06-21',11,333,10,77),(99,'Vesna','Djordjevic','zenski','1995-04-30','2017-07-07',7,444,40,NULL);
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `disciplinaID` int NOT NULL,
  `naziv_discipline` varchar(50) DEFAULT NULL,
  `aktuelni_sampion` int DEFAULT NULL,
  PRIMARY KEY (`disciplinaID`),
  KEY `disciplina_fk` (`aktuelni_sampion`),
  CONSTRAINT `disciplina_fk` FOREIGN KEY (`aktuelni_sampion`) REFERENCES `clan` (`identifikacioni_broj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (111,'Standardni plesovi',11),(222,'Latino-americki plesovi',NULL),(333,'Break Dance',77),(444,'Belly Dance',NULL),(555,'Hip Hop',34),(666,'Kombinacija',NULL);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruktor`
--

DROP TABLE IF EXISTS `instruktor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruktor` (
  `instruktorID` int NOT NULL,
  `ime` varchar(30) DEFAULT NULL,
  `prezime` varchar(30) DEFAULT NULL,
  `godineIskustva` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`instruktorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruktor`
--

LOCK TABLES `instruktor` WRITE;
/*!40000 ALTER TABLE `instruktor` DISABLE KEYS */;
INSERT INTO `instruktor` VALUES (1,'Jovan','Milanovic',12.00),(2,'Nemanja','Popadic',23.00),(3,'Luka','Todorovic',6.00),(4,'Lena','Lazic',7.00),(5,'Milica','Stijovic',3.50);
/*!40000 ALTER TABLE `instruktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plesna_grupa`
--

DROP TABLE IF EXISTS `plesna_grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plesna_grupa` (
  `grupaID` int NOT NULL,
  `naziv_grupe` varchar(50) DEFAULT NULL,
  `max_broj_clanova` int DEFAULT NULL,
  `datum_osnivanja` date DEFAULT NULL,
  `broj_nagrada` int DEFAULT NULL,
  PRIMARY KEY (`grupaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plesna_grupa`
--

LOCK TABLES `plesna_grupa` WRITE;
/*!40000 ALTER TABLE `plesna_grupa` DISABLE KEYS */;
INSERT INTO `plesna_grupa` VALUES (10,'BEODANCE',30,'2007-03-26',54),(20,'AURORA',25,'2011-11-07',23),(30,'DANCE FACTORY',50,'2013-07-18',45),(40,'FIESTA',37,'2012-09-12',19),(50,'STAR DANCE',22,'2013-01-03',28);
/*!40000 ALTER TABLE `plesna_grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proba`
--

DROP TABLE IF EXISTS `proba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proba` (
  `grupaID` int NOT NULL,
  `instruktorID` int NOT NULL,
  `datum` date NOT NULL,
  `adresa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`grupaID`,`instruktorID`,`datum`),
  KEY `proba_fk2` (`instruktorID`),
  CONSTRAINT `proba_fk1` FOREIGN KEY (`grupaID`) REFERENCES `plesna_grupa` (`grupaID`),
  CONSTRAINT `proba_fk2` FOREIGN KEY (`instruktorID`) REFERENCES `instruktor` (`instruktorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proba`
--

LOCK TABLES `proba` WRITE;
/*!40000 ALTER TABLE `proba` DISABLE KEYS */;
INSERT INTO `proba` VALUES (10,1,'2018-10-12','Bulevar Zorana Djindjica 23'),(10,1,'2020-03-30','Rasinska 30'),(10,2,'2019-01-16','Karadjordjeva 65'),(10,3,'2020-04-14','Paunova 14'),(10,4,'2020-05-20','Ljermontova 20'),(10,4,'2020-05-27','Ljermontova 27'),(10,5,'2017-11-02','Nemanjina 16'),(10,5,'2020-01-15','Rasinska 17'),(20,1,'2018-04-30','Niksicka 26'),(20,4,'2019-07-20','Vitanovacka 37'),(30,3,'2019-06-02','Resavska 123'),(30,5,'2018-02-12','Nemanjina 16'),(30,5,'2019-05-23','Beogradska 33'),(40,1,'2018-03-20','Niksicka 26'),(40,3,'2019-06-12','Bulevar Zorana Djindjica 23'),(40,5,'2020-06-23','Tuzlanska 23'),(50,2,'2018-11-12','Bulevar Zorana Djindjica 23'),(50,3,'2019-09-12','Vitanovacka 37'),(50,4,'2017-12-12','Vitanovacka 37');
/*!40000 ALTER TABLE `proba` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-03 20:26:10
