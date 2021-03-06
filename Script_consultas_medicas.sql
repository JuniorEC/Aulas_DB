﻿-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.36-community-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema consultas
--

CREATE DATABASE IF NOT EXISTS consultas;
USE consultas;

--
-- Definition of table `ambulatorio`
--

DROP TABLE IF EXISTS `ambulatorio`;
CREATE TABLE `ambulatorio` (
  `idAMBULATORIO` int(11) NOT NULL,
  `Andar` int(11) NOT NULL,
  `Capacidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAMBULATORIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ambulatorio`
--

/*!40000 ALTER TABLE `ambulatorio` DISABLE KEYS */;
INSERT INTO `ambulatorio` (`idAMBULATORIO`,`Andar`,`Capacidade`) VALUES 
 (1,1,5),
 (2,1,5),
 (3,1,10),
 (4,2,5),
 (5,2,5),
 (6,2,10);
/*!40000 ALTER TABLE `ambulatorio` ENABLE KEYS */;


--
-- Definition of table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE `consulta` (
  `PACIENTE_RGPaciente` int(11) NOT NULL,
  `MEDICO_CRM` int(11) NOT NULL,
  `Data` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  PRIMARY KEY (`PACIENTE_RGPaciente`,`MEDICO_CRM`),
  KEY `fk_PACIENTE_has_MEDICO_PACIENTE` (`PACIENTE_RGPaciente`),
  KEY `fk_PACIENTE_has_MEDICO_MEDICO` (`MEDICO_CRM`),
  CONSTRAINT `fk_PACIENTE_has_MEDICO_MEDICO` FOREIGN KEY (`MEDICO_CRM`) REFERENCES `medico` (`CRM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_has_MEDICO_PACIENTE` FOREIGN KEY (`PACIENTE_RGPaciente`) REFERENCES `paciente` (`RGPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consulta`
--

/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` (`PACIENTE_RGPaciente`,`MEDICO_CRM`,`Data`,`Hora`) VALUES 
 (1,1,'2003-04-03','08:00:00'),
 (1,2,'2003-04-15','08:30:00'),
 (2,2,'2003-04-15','09:30:00'),
 (3,1,'2005-01-15','10:00:00'),
 (3,3,'2010-05-07','09:00:00'),
 (4,1,'2005-01-15','09:00:00'),
 (5,1,'2005-01-15','09:30:00');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;


--
-- Definition of table `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico` (
  `CRM` int(11) NOT NULL,
  `RGMedico` varchar(45) DEFAULT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Idade` tinyint(4) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  `AMBULATORIO_idAMBULATORIO` int(11) NOT NULL,
  PRIMARY KEY (`CRM`,`AMBULATORIO_idAMBULATORIO`),
  KEY `fk_MEDICO_AMBULATORIO1` (`AMBULATORIO_idAMBULATORIO`),
  CONSTRAINT `fk_MEDICO_AMBULATORIO1` FOREIGN KEY (`AMBULATORIO_idAMBULATORIO`) REFERENCES `ambulatorio` (`idAMBULATORIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medico`
--

/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` (`CRM`,`RGMedico`,`Nome`,`Idade`,`Cidade`,`Especialidade`,`AMBULATORIO_idAMBULATORIO`) VALUES 
 (1,'1','JOÃƒO',45,'BELEM','ORTOPEDISTA',1),
 (2,'2','MARIA',55,'BELEM','ORTOPEDISTA',2),
 (3,'3','CELINA',37,'BELEM','PNEUMOLOGISTA',2),
 (4,'4','PAULO',42,'SÃƒO PAULO','PNEUMOLOGISTA',4),
 (6,'6','Marta',45,'RIO DE JANEIRO','PNEUMOLOGISTA',4);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;


--
-- Definition of table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `RGPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(25) NOT NULL,
  `Idade` tinyint(4) DEFAULT NULL,
  `Cidade` varchar(15) DEFAULT NULL,
  `Doenca` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`RGPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paciente`
--

/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`RGPaciente`,`Nome`,`Idade`,`Cidade`,`Doenca`) VALUES 
 (1,'SELMA',5,'BELÃ‰M','SARAMPO'),
 (2,'MARCOS',1,'BELÃ‰M','CATAPORA'),
 (3,'ALFREDO',22,'BELÃ‰M','DENGUE'),
 (4,'SERGIO',18,'MARABÃ','DENGUE'),
 (5,'VERA',35,'PARAGOMINAS','SARAMPO'),
 (6,'MARTA',42,'CASTANHAL','SARAMPO');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;