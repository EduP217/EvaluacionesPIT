CREATE DATABASE  IF NOT EXISTS `evaluaciones` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `evaluaciones`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: evaluaciones
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idadministrador` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `fechanac` varchar(11) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idadministrador`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'72187701','Eduardo Elías','Prieto Borja','19-03-1994','5248629','986999555',1);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Computación e Informática');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo`
--

DROP TABLE IF EXISTS `ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciclo` (
  `idciclo` int(11) NOT NULL AUTO_INCREMENT,
  `nomciclo` varchar(50) NOT NULL,
  PRIMARY KEY (`idciclo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo`
--

LOCK TABLES `ciclo` WRITE;
/*!40000 ALTER TABLE `ciclo` DISABLE KEYS */;
INSERT INTO `ciclo` VALUES (1,'PRIMERO'),(2,'SEGUNDO'),(3,'TERCERO'),(4,'CUARTO'),(5,'QUINTO'),(6,'SEXTO');
/*!40000 ALTER TABLE `ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `idcarrera` int(11) NOT NULL,
  `idciclo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `idcarrera` (`idcarrera`),
  KEY `idciclo` (`idciclo`),
  CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`),
  CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`idciclo`) REFERENCES `ciclo` (`idciclo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,1,1,'Arquitectura de Computación'),(2,1,1,'PHP'),(3,1,1,'CSS3'),(4,1,2,'Algoritmos y Estructura I'),(5,1,2,'Base de Datos'),(6,1,2,'Sublime'),(7,1,3,'ADS I'),(8,1,3,'Algoritmos y Estructura II'),(9,1,4,'ADS2'),(10,1,4,'Lenguaje de Programación I'),(11,1,4,'Programación Orientada a Objetos'),(12,1,5,'Desarrollo Entorno Web'),(13,1,5,'Proyecto de Investigación'),(14,1,6,'Bussiness Intelligent');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecursoseccion`
--

DROP TABLE IF EXISTS `detallecursoseccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallecursoseccion` (
  `idcurso` int(11) NOT NULL,
  `idseccion` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idestado` int(11) NOT NULL,
  KEY `idcurso` (`idcurso`),
  KEY `idseccion` (`idseccion`),
  CONSTRAINT `detallecursoseccion_ibfk_1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`),
  CONSTRAINT `detallecursoseccion_ibfk_2` FOREIGN KEY (`idseccion`) REFERENCES `seccion` (`idseccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecursoseccion`
--

LOCK TABLES `detallecursoseccion` WRITE;
/*!40000 ALTER TABLE `detallecursoseccion` DISABLE KEYS */;
INSERT INTO `detallecursoseccion` VALUES (1,2,15,1),(2,2,0,1),(7,4,0,1),(6,4,0,1);
/*!40000 ALTER TABLE `detallecursoseccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleexamencurso`
--

DROP TABLE IF EXISTS `detalleexamencurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleexamencurso` (
  `idexamen` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  KEY `idexamen` (`idexamen`),
  KEY `idcurso` (`idcurso`),
  CONSTRAINT `detalleexamencurso_ibfk_1` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`),
  CONSTRAINT `detalleexamencurso_ibfk_2` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleexamencurso`
--

LOCK TABLES `detalleexamencurso` WRITE;
/*!40000 ALTER TABLE `detalleexamencurso` DISABLE KEYS */;
INSERT INTO `detalleexamencurso` VALUES (1,1);
/*!40000 ALTER TABLE `detalleexamencurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleseccionalumno`
--

DROP TABLE IF EXISTS `detalleseccionalumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleseccionalumno` (
  `idseccion` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  KEY `fkdetasecc_idx` (`idseccion`),
  KEY `fkdetaalum_idx` (`idusuario`),
  CONSTRAINT `fkdetaalum` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkdetasecc` FOREIGN KEY (`idseccion`) REFERENCES `seccion` (`idseccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleseccionalumno`
--

LOCK TABLES `detalleseccionalumno` WRITE;
/*!40000 ALTER TABLE `detalleseccionalumno` DISABLE KEYS */;
INSERT INTO `detalleseccionalumno` VALUES (2,15),(4,21);
/*!40000 ALTER TABLE `detalleseccionalumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `iddocente` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `fechanac` varchar(11) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`iddocente`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'1234567','Jorge','Benavides','01-01-2016','6543211','97645181',2),(2,'7654321','Maria','Clifforden','01-01-2000','6543211','987654321',3),(3,'9638527','Inc','Monsters','19-03-1994','5248629','966839200',6),(4,'8527412','Juan Bryan','Martinez Lopez','19-03-1994','5248629','966839200',7),(5,'72187702','Eduardo Elias','Prieto Borja','19-03-1994','5248629','966839200',8),(6,'12345678','asd','asd','09-11-2016','123333','12333333',9),(7,'85274163','Mayra Medaly','Arce Pacheco','01-01-2016','9668574','987542136',10),(8,'65432179','verde','avispon','03-02-2010','968574','321654987',11),(9,'96345572','marta','kira','16-07-2004','645127','3645137894',12),(10,'94616455','que mas aplauda','mesa','27-01-2010','3461244','555544442',13),(11,'94677223','try','ultimo','27-01-2016','0152486','946513214',14),(12,'76451422','Eduardo','Prieto','08-06-1984','94617541','1647845892',16),(13,'64542145','Maria','Mercedes','03-11-2016','6543211','978451214',17),(14,'65498712','Magaly Roc�o','Pacheco Magaly','10-07-2016','32165465','3213216544',18),(15,'72187710','Eduardo Elias','Prieto Borja','27-01-2016','5248929','9468552551',19);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enlaces`
--

DROP TABLE IF EXISTS `enlaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enlaces` (
  `idenlace` int(11) NOT NULL AUTO_INCREMENT,
  `idperfil` int(11) NOT NULL,
  `enlace` varchar(30) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idenlace`),
  KEY `idperfil` (`idperfil`),
  CONSTRAINT `enlaces_ibfk_1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enlaces`
--

LOCK TABLES `enlaces` WRITE;
/*!40000 ALTER TABLE `enlaces` DISABLE KEYS */;
INSERT INTO `enlaces` VALUES (1,1,'m_profesor','Mantenimiento de Docentes'),(2,1,'m_curso','Mantenimiento de cursos'),(3,1,'m_seccion','Mantenimiento de Seccion'),(4,1,'c_usuarios','Consultar Usuarios'),(5,1,'t_examen','Registro de Evaluaciones'),(7,1,'m_alumno','Mantenimiento de Alumnos'),(8,1,'m_coordi','Mantenimiento de Coordinadores');
/*!40000 ALTER TABLE `enlaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `idestudiante` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `fechanac` varchar(11) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idestudiante`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'10254618','Martha','Acevedo Ramirez','10-10-1994','5648394','967448153',15),(2,'34512441','Jorge aa','Meteo','27-01-2010','653214','99877456123',21);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examen` (
  `idexamen` int(11) NOT NULL AUTO_INCREMENT,
  `fecini` datetime NOT NULL,
  `fecfin` datetime NOT NULL,
  `fecreg` datetime DEFAULT CURRENT_TIMESTAMP,
  `duracion` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`idexamen`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--


--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opciones` (
  `idopciones` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `respuesta` char(1) DEFAULT NULL,
  `idpregunta` int(11) NOT NULL,
  PRIMARY KEY (`idopciones`),
  KEY `idpregunta` (`idpregunta`),
  CONSTRAINT `opciones_ibfk_1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(30) NOT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador'),(2,'Estudiante'),(3,'Docente'),(4,'Coordinador');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` text NOT NULL,
  `idexamen` int(11) NOT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `idexamen` (`idexamen`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultados` (
  `idresultados` int(11) NOT NULL AUTO_INCREMENT,
  `idestudiante` int(11) NOT NULL,
  `idexamen` int(11) NOT NULL,
  `cantcorrec` int(11) NOT NULL,
  `cantincorr` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `presentado` int(11) NOT NULL,
  PRIMARY KEY (`idresultados`),
  KEY `idestudiante` (`idestudiante`),
  KEY `idexamen` (`idexamen`),
  CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`),
  CONSTRAINT `resultados_ibfk_2` FOREIGN KEY (`idexamen`) REFERENCES `examen` (`idexamen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados`
--

LOCK TABLES `resultados` WRITE;
/*!40000 ALTER TABLE `resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccion` (
  `idseccion` int(11) NOT NULL AUTO_INCREMENT,
  `idciclo` int(11) NOT NULL,
  `nomseccion` varchar(50) NOT NULL,
  PRIMARY KEY (`idseccion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (1,1,'T1AN'),(2,2,'T2AN'),(3,3,'T3AN'),(4,4,'T4AN'),(5,5,'T5AN'),(6,6,'T6AN'),(8,2,'T2BN'),(9,1,'T1BN'),(10,6,'T6BN');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(8) NOT NULL,
  `clave` varchar(15) NOT NULL,
  `urlImagen` varchar(50) DEFAULT 'avatar-user.png',
  `estado` char(1) NOT NULL,
  `idperfil` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idperfil` (`idperfil`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'72187701','123456','72187701.png','1',1),(2,'1234567','123456','avatar-user.png','1',3),(3,'7654321','123456','avatar-user.png','1',4),(4,'7894561','123456','avatar-user.png','1',3),(5,'1234567','123456','avatar-user.png','1',3),(6,'9638527','123456','avatar-user.png','0',3),(7,'8527412','123456','avatar-user.png','0',3),(8,'72187702','123456','avatar-user.png','1',3),(9,'12345678','123456','avatar-user.png','0',3),(10,'85274163','123456','avatar-user.png','1',3),(11,'65432179','123456','avatar-user.png','1',3),(12,'96345572','123456','avatar-user.png','1',3),(13,'94616455','123456','avatar-user.png','1',3),(14,'94677223','123456','avatar-user.png','1',3),(15,'10254618','123456','10254618.png','1',2),(16,'76451422','123456','avatar-user.png','1',3),(17,'64542145','123456','avatar-user.png','0',4),(18,'65498712','123456','avatar-user.png','1',4),(19,'72187710','123456','avatar-user.png','1',3),(20,'12312311','123456','avatar-user.png','1',2),(21,'34512441','123456','avatar-user.png','1',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11  4:12:24
