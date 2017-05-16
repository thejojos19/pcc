-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: pfr
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `nom_area` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistencia` (
  `id_asis` int(11) NOT NULL AUTO_INCREMENT,
  `id_per` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `est_asis` varchar(1) DEFAULT NULL,
  `fec_asis` date DEFAULT NULL,
  PRIMARY KEY (`id_asis`),
  KEY `fk_Asistencia_Persona1_idx` (`id_per`),
  KEY `fk_Asistencia_Curso1_idx` (`id_curso`),
  CONSTRAINT `fk_Asistencia_Curso1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asistencia_Persona1` FOREIGN KEY (`id_per`) REFERENCES `persona` (`id_per`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `id_carr` int(11) NOT NULL,
  `nom_carr` varchar(100) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_carr`),
  KEY `fk_Carrera_Area1_idx` (`id_area`),
  CONSTRAINT `fk_Carrera_Area1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nom_curso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursosemestrecarrera`
--

DROP TABLE IF EXISTS `cursosemestrecarrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursosemestrecarrera` (
  `id_cur_sem_carr` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) DEFAULT NULL,
  `id_sem_carr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cur_sem_carr`),
  KEY `fk_CursoSemestreCarrera_Curso1_idx` (`id_curso`),
  KEY `fk_CursoSemestreCarrera_SemestreCarrera1_idx` (`id_sem_carr`),
  CONSTRAINT `fk_CursoSemestreCarrera_Curso1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CursoSemestreCarrera_SemestreCarrera1` FOREIGN KEY (`id_sem_carr`) REFERENCES `semestrecarrera` (`id_sem_carr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursosemestrecarrera`
--

LOCK TABLES `cursosemestrecarrera` WRITE;
/*!40000 ALTER TABLE `cursosemestrecarrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursosemestrecarrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `id_mat` int(11) NOT NULL AUTO_INCREMENT,
  `id_per` int(11) DEFAULT NULL,
  `id_sem_carr` int(11) DEFAULT NULL,
  `fec_mat` date DEFAULT NULL,
  PRIMARY KEY (`id_mat`),
  KEY `fk_Matricula_Persona1_idx` (`id_per`),
  KEY `fk_Matricula_SemestreCarrera1_idx` (`id_sem_carr`),
  CONSTRAINT `fk_Matricula_Persona1` FOREIGN KEY (`id_per`) REFERENCES `persona` (`id_per`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_SemestreCarrera1` FOREIGN KEY (`id_sem_carr`) REFERENCES `semestrecarrera` (`id_sem_carr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id_per` int(11) NOT NULL AUTO_INCREMENT,
  `nom_per` varchar(100) DEFAULT NULL,
  `ape_per` varchar(100) DEFAULT NULL,
  `dni_per` varchar(8) DEFAULT NULL,
  `fec_nac_per` date DEFAULT NULL,
  `sex_per` varchar(1) DEFAULT NULL,
  `email_per` varchar(50) DEFAULT NULL,
  `cel_per` varchar(15) DEFAULT NULL,
  `dir_per` varchar(100) DEFAULT NULL,
  `log_per` varchar(45) DEFAULT NULL,
  `pass_per` varchar(45) DEFAULT NULL,
  `id_tipo_per` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_per`),
  KEY `fk_Persona_TipoPersona_idx` (`id_tipo_per`),
  CONSTRAINT `fk_Persona_TipoPersona` FOREIGN KEY (`id_tipo_per`) REFERENCES `tipopersona` (`id_tipo_per`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personacurso`
--

DROP TABLE IF EXISTS `personacurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personacurso` (
  `id_per_cur` int(11) NOT NULL AUTO_INCREMENT,
  `id_cur_sem_carr` int(11) DEFAULT NULL,
  `id_per` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_per_cur`),
  KEY `fk_PersonaCurso_CursoSemestreCarrera1_idx` (`id_cur_sem_carr`),
  KEY `fk_PersonaCurso_Persona1_idx` (`id_per`),
  CONSTRAINT `fk_PersonaCurso_CursoSemestreCarrera1` FOREIGN KEY (`id_cur_sem_carr`) REFERENCES `cursosemestrecarrera` (`id_cur_sem_carr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PersonaCurso_Persona1` FOREIGN KEY (`id_per`) REFERENCES `persona` (`id_per`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personacurso`
--

LOCK TABLES `personacurso` WRITE;
/*!40000 ALTER TABLE `personacurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `personacurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre` (
  `id_sem` int(11) NOT NULL AUTO_INCREMENT,
  `nro_sem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestrecarrera`
--

DROP TABLE IF EXISTS `semestrecarrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestrecarrera` (
  `id_sem_carr` int(11) NOT NULL AUTO_INCREMENT,
  `id_sem` int(11) DEFAULT NULL,
  `id_carr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sem_carr`),
  KEY `fk_SemestreCarrera_Semestre1_idx` (`id_sem`),
  KEY `fk_SemestreCarrera_Carrera1_idx` (`id_carr`),
  CONSTRAINT `fk_SemestreCarrera_Carrera1` FOREIGN KEY (`id_carr`) REFERENCES `carrera` (`id_carr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SemestreCarrera_Semestre1` FOREIGN KEY (`id_sem`) REFERENCES `semestre` (`id_sem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestrecarrera`
--

LOCK TABLES `semestrecarrera` WRITE;
/*!40000 ALTER TABLE `semestrecarrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestrecarrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopersona`
--

DROP TABLE IF EXISTS `tipopersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopersona` (
  `id_tipo_per` int(11) NOT NULL AUTO_INCREMENT,
  `desc_tipo_per` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_per`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopersona`
--

LOCK TABLES `tipopersona` WRITE;
/*!40000 ALTER TABLE `tipopersona` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipopersona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-16  9:50:23
