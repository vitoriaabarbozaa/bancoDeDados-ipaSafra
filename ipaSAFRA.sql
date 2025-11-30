CREATE DATABASE  IF NOT EXISTS `ipa_safra` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ipa_safra`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ipa_safra
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `agricultor`
--

DROP TABLE IF EXISTS `agricultor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agricultor` (
  `id_agricultor` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(150) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `tipo_propriedade` varchar(60) DEFAULT NULL,
  `caf` varchar(30) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `complemento` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_agricultor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agricultor`
--

LOCK TABLES `agricultor` WRITE;
/*!40000 ALTER TABLE `agricultor` DISABLE KEYS */;
INSERT INTO `agricultor` VALUES (1,'José Roberto da Silva','12345678901','Familiar','CAF12345','50711010','Sítio Santa Luzia'),(2,'Maria Eduarda Pereira','23456789012','Familiar','CAF23456','50720310','Chácara Boa Vista'),(3,'Antônio Barros Neto','34567890123','Pequeno Produtor','CAF34567','50610220','Sítio Barros'),(4,'João Paulo Fernandes','45678901234','Familiar','CAF45678','50080000','Área Rural 12'),(5,'Carla Beatriz Moura','56789012345','Familiar','CAF56789','52041010','Fazenda Morada Nova'),(6,'Pedro Henrique Lira','67890123456','Pequeno Produtor','CAF67890','54753000','Sítio Lira'),(7,'Ana Raquel Gomes','78901234567','Familiar','CAF78901','53415020','Chácara Flor do Campo'),(8,'Rafael Matos Lima','89012345678','Familiar','CAF89012','53625040','Sítio Matos'),(9,'Cláudia Ferreira Rocha','90123456789','Familiar','CAF90123','53030300','Terreno 21'),(10,'Lucas Gabriel Torres','01928374655','Pequeno Produtor','CAF11223','50751010','Sítio Torres'),(11,'Juliana Andrade Souza','10987654321','Familiar','CAF22134','51030100','Rural Lote 8'),(12,'Bruno César Albuquerque','11223344556','Pequeno Produtor','CAF33445','50770000','Sítio Esperança'),(13,'Gabriela Tavares Lima','22334455667','Familiar','CAF44556','52080000','Chácara Lima'),(14,'Miguel Santos Duarte','33445566778','Familiar','CAF55667','52110000','Fazenda Santa Rita'),(15,'Fernanda Reis Costa','44556677889','Pequeno Produtor','CAF66778','54720000','Terreno Verde'),(16,'Eduardo Lopes Barbalho','55667788990','Familiar','CAF77889','53600000','Sítio Barbalho'),(17,'Larissa Monteiro Silva','66778899001','Familiar','CAF88990','53510000','Chácara Lago Azul'),(18,'Rodrigo Paiva Campos','77889900112','Pequeno Produtor','CAF99001','53060000','Sítio Campos'),(19,'Beatriz Mourão Leite','88990011223','Familiar','CAF00112','53530300','Área Rural 19'),(20,'Fábio Henrique Araújo','99001122334','Pequeno Produtor','CAF11223','53410210','Sítio Araújo');
/*!40000 ALTER TABLE `agricultor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_block_duplicate_cpf` BEFORE INSERT ON `agricultor` FOR EACH ROW BEGIN
IF (SELECT COUNT(*) FROM agricultor WHERE cpf = NEW.cpf) > 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CPF já cadastrado!';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_format_nome_agricultor` BEFORE INSERT ON `agricultor` FOR EACH ROW BEGIN
SET NEW.nome_completo = CONCAT(UCASE(LEFT(NEW.nome_completo,1)),
SUBSTRING(NEW.nome_completo,2));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_block_cpf_update` BEFORE UPDATE ON `agricultor` FOR EACH ROW BEGIN
IF OLD.cpf <> NEW.cpf THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CPF não pode ser alterado!';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `endereco_propriedade`
--

DROP TABLE IF EXISTS `endereco_propriedade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_propriedade` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(150) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(120) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `ponto_referencia` varchar(200) DEFAULT NULL,
  `fk_agricultor_id_agricultor` int DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `FK_agricultor_endereco` (`fk_agricultor_id_agricultor`),
  CONSTRAINT `FK_agricultor_endereco` FOREIGN KEY (`fk_agricultor_id_agricultor`) REFERENCES `agricultor` (`id_agricultor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_propriedade`
--

LOCK TABLES `endereco_propriedade` WRITE;
/*!40000 ALTER TABLE `endereco_propriedade` DISABLE KEYS */;
INSERT INTO `endereco_propriedade` VALUES (1,'Sítio Santa Luzia','50711010','Várzea','SN','','PE','Perto da barragem',1),(2,'Chácara Boa Vista','50720310','IBURA','45','','PE','Próx. Escola Municipal',2),(3,'Rua Rural 12','50610220','Caxangá','SN','','PE','Entrada antes da ponte',3),(4,'Sítio Barros','50080000','Centro','33','','PE','Ao lado do campo',4),(5,'Fazenda Morada Nova','52041010','Encruzilhada','120','','PE','Trilha de terra',5),(6,'Sítio Lira','54753000','Camaragibe','SN','','PE','Após o posto BR',6),(7,'Chácara Flor do Campo','53415020','Paulista','SN','','PE','Placa azul',7),(8,'Sítio Matos','53625040','Igarassu','SN','','PE','Casa com portão verde',8),(9,'Terreno 21','53030300','Olinda','21','','PE','Em frente ao mercadinho',9),(10,'Sítio Torres','50751010','Afogados','SN','','PE','Rua sem saída',10),(11,'Lote 8 Rural','51030100','Boa Viagem','8','','PE','Morro pequeno',11),(12,'Sítio Esperança','50770000','Madalena','SN','','PE','Placa de madeira',12),(13,'Chácara Lima','52080000','Tamarineira','30','','PE','Cerca branca',13),(14,'Fazenda Santa Rita','52110000','Arruda','SN','','PE','Perto da caixa d água',14),(15,'Terreno Verde','54720000','Camaragibe','99','','PE','Ponte de madeira',15),(16,'Sítio Barbalho','53600000','Igarassu','SN','','PE','Km 12 da BR',16),(17,'Chácara Lago Azul','53510000','Abreu e Lima','SN','','PE','Lago artificial',17),(18,'Sítio Campos','53060000','Olinda','15','','PE','Caminho estreito',18),(19,'Área Rural 19','53530300','Abreu e Lima','SN','','PE','Final da estrada',19),(20,'Sítio Araújo','53410210','Paulista','SN','','PE','Perto do açude',20);
/*!40000 ALTER TABLE `endereco_propriedade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `quantidade_estoque` int DEFAULT NULL,
  `status_estoque` enum('disponivel','critico','esgotado') DEFAULT NULL,
  PRIMARY KEY (`id_estoque`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,120,'disponivel'),(2,85,'disponivel'),(3,40,'critico'),(4,0,'esgotado'),(5,300,'disponivel'),(6,200,'disponivel'),(7,15,'critico'),(8,0,'esgotado'),(9,50,'disponivel'),(10,75,'disponivel'),(11,20,'critico'),(12,10,'critico'),(13,500,'disponivel'),(14,5,'critico'),(15,0,'esgotado'),(16,60,'disponivel'),(17,140,'disponivel'),(18,30,'critico'),(19,250,'disponivel'),(20,90,'disponivel');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_estoque_zero` BEFORE UPDATE ON `estoque` FOR EACH ROW BEGIN
IF NEW.quantidade_estoque = 0 THEN
SET NEW.status_estoque = 'esgotado';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_estoque_critico` BEFORE UPDATE ON `estoque` FOR EACH ROW BEGIN
IF NEW.quantidade_estoque < 10 AND NEW.quantidade_estoque > 0 THEN
SET NEW.status_estoque = 'critico';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `tipo_insumo` varchar(80) DEFAULT NULL,
  `cultura` varchar(80) DEFAULT NULL,
  `variedade` varchar(100) DEFAULT NULL,
  `quantidade_solicitada` varchar(20) DEFAULT NULL,
  `fk_estoque_id_estoque` int DEFAULT NULL,
  PRIMARY KEY (`id_insumo`),
  KEY `FK_insumo_estoque` (`fk_estoque_id_estoque`),
  CONSTRAINT `FK_insumo_estoque` FOREIGN KEY (`fk_estoque_id_estoque`) REFERENCES `estoque` (`id_estoque`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Semente','Milho','Híbrido 30F53','10 kg',1),(2,'Semente','Feijão','Mulato','8 kg',2),(3,'Adubo','NPK','04-14-08','5 sacos',3),(4,'Adubo','Orgânico','Composto Verde','12 sacos',4),(5,'Semente','Mandioca','Aipim Branco','20 kg',5),(6,'Semente','Tomate','Santa Cruz','3 kg',6),(7,'Semente','Pimentão','Verde Híbrido','2 kg',7),(8,'Semente','Coentro','Verdão','1 kg',8),(9,'Adubo','Ureia','45%','4 sacos',9),(10,'Semente','Abóbora','Jacarezinho','6 kg',10),(11,'Semente','Cebola','Roxa','2 kg',11),(12,'Semente','Cenoura','Brasília','2 kg',12),(13,'Semente','Batata-doce','Roxa','25 kg',13),(14,'Semente','Arroz','Sequeiro','15 kg',14),(15,'Adubo','Calcário','PRNT 80%','8 sacos',15),(16,'Semente','Alface','Americana','1 kg',16),(17,'Semente','Pepino','Caipira','2 kg',17),(18,'Semente','Melancia','Crimson Sweet','10 kg',18),(19,'Semente','Banana','Maçã','30 mudas',19),(20,'Semente','Cacau','Híbrido PH16','40 mudas',20);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_block_insumo_sem_estoque` BEFORE INSERT ON `insumo` FOR EACH ROW BEGIN
IF NEW.fk_estoque_id_estoque IS NULL THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insumo deve estar vinculado a um estoque!';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_insumo_movimento` AFTER INSERT ON `insumo` FOR EACH ROW BEGIN
UPDATE estoque
SET quantidade_estoque = quantidade_estoque - NEW.quantidade_solicitada
WHERE id_estoque = NEW.fk_estoque_id_estoque;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logistica`
--

DROP TABLE IF EXISTS `logistica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistica` (
  `id_logistica` int NOT NULL AUTO_INCREMENT,
  `cidade` varchar(100) DEFAULT NULL,
  `forma_entrega` enum('retirada','entrega') DEFAULT NULL,
  `rua` varchar(150) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `complemento` varchar(120) DEFAULT NULL,
  `destinatario` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `previsao_despacho` date DEFAULT NULL,
  `fk_solicitacao_id_solicitacao` int DEFAULT NULL,
  PRIMARY KEY (`id_logistica`),
  KEY `FK_logistica_solicitacao` (`fk_solicitacao_id_solicitacao`),
  CONSTRAINT `FK_logistica_solicitacao` FOREIGN KEY (`fk_solicitacao_id_solicitacao`) REFERENCES `solicitacao` (`id_solicitacao`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistica`
--

LOCK TABLES `logistica` WRITE;
/*!40000 ALTER TABLE `logistica` DISABLE KEYS */;
INSERT INTO `logistica` VALUES (1,'Recife','entrega','Rua A','50000000','Casa 1','João Silva','81999990001','2025-02-01',1),(2,'Olinda','retirada','Rua B','53000000','---','Maria Lima','81999990002','2025-02-03',2),(3,'Paulista','entrega','Rua C','53400000','Bloco 2','José Carlos','81999990003','2025-02-04',3),(4,'Jaboatão','entrega','Rua D','54000000','Casa 4','Ana Souza','81999990004','2025-02-06',4),(5,'Cabo','retirada','Rua E','54500000','---','Leonardo Alves','81999990005','2025-02-08',5),(6,'Recife','entrega','Rua F','51000000','Apto 301','Lucas Ferreira','81999990006','2025-02-10',6),(7,'Olinda','retirada','Rua G','53100000','---','Amanda Rocha','81999990007','2025-02-11',7),(8,'Paulista','entrega','Rua H','53410000','Casa 7','Marcos Pinto','81999990008','2025-02-12',8),(9,'Jaboatão','entrega','Rua I','54010000','Casa 2','Carla Nunes','81999990009','2025-02-14',9),(10,'Cabo','retirada','Rua J','54520000','---','Pedro Barros','81999990010','2025-02-16',10),(11,'Recife','entrega','Rua K','50700000','Casa 5','Rafael Santos','81999990011','2025-02-17',11),(12,'Olinda','entrega','Rua L','53020000','Apto 203','Larissa Dias','81999990012','2025-02-18',12),(13,'Paulista','retirada','Rua M','53420000','---','Eduardo Melo','81999990013','2025-02-20',13),(14,'Jaboatão','entrega','Rua N','54030000','Casa 8','Juliana Prado','81999990014','2025-02-21',14),(15,'Cabo','entrega','Rua O','54530000','Casa 6','Bruno Teixeira','81999990015','2025-02-22',15),(16,'Recife','retirada','Rua P','50600000','---','Tiago Azevedo','81999990016','2025-02-24',16),(17,'Olinda','entrega','Rua Q','53030000','Bloco C','Vitória Ramos','81999990017','2025-02-25',17),(18,'Paulista','entrega','Rua R','53430000','Casa 9','Samuel Dias','81999990018','2025-02-26',18),(19,'Jaboatão','retirada','Rua S','54040000','---','Felipe Gomes','81999990019','2025-02-27',19),(20,'Cabo','entrega','Rua T','54540000','Casa 3','Renato Farias','81999990020','2025-02-28',20);
/*!40000 ALTER TABLE `logistica` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_auto_previsao_logistica` BEFORE INSERT ON `logistica` FOR EACH ROW BEGIN
IF NEW.previsao_despacho IS NULL THEN
SET NEW.previsao_despacho = DATE_ADD(CURDATE(), INTERVAL 3 DAY);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_default_rastreamento` AFTER INSERT ON `logistica` FOR EACH ROW BEGIN
INSERT INTO rastreamento (numero_rastreio, status_processamento, data_atualizacao,
fk_solicitacao_id_solicitacao, fk_logistica_id_logistica)
VALUES (CONCAT('RT', NEW.id_logistica, FLOOR(RAND() * 9999)),
'pendente', NOW(), NEW.fk_solicitacao_id_solicitacao, NEW.id_logistica);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `perfil_sustentabilidade`
--

DROP TABLE IF EXISTS `perfil_sustentabilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_sustentabilidade` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `data_geracao` date DEFAULT NULL,
  `arquivo_pdf` varchar(255) DEFAULT NULL,
  `fk_agricultor_id_agricultor` int DEFAULT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `FK_perfil_agricultor` (`fk_agricultor_id_agricultor`),
  CONSTRAINT `FK_perfil_agricultor` FOREIGN KEY (`fk_agricultor_id_agricultor`) REFERENCES `agricultor` (`id_agricultor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_sustentabilidade`
--

LOCK TABLES `perfil_sustentabilidade` WRITE;
/*!40000 ALTER TABLE `perfil_sustentabilidade` DISABLE KEYS */;
INSERT INTO `perfil_sustentabilidade` VALUES (1,'2024-01-10','perfil_1.pdf',1),(2,'2024-01-11','perfil_2.pdf',2),(3,'2024-01-12','perfil_3.pdf',3),(4,'2024-01-13','perfil_4.pdf',4),(5,'2024-01-14','perfil_5.pdf',5),(6,'2024-01-15','perfil_6.pdf',6),(7,'2024-01-16','perfil_7.pdf',7),(8,'2024-01-17','perfil_8.pdf',8),(9,'2024-01-18','perfil_9.pdf',9),(10,'2024-01-19','perfil_10.pdf',10),(11,'2024-01-20','perfil_11.pdf',11),(12,'2024-01-21','perfil_12.pdf',12),(13,'2024-01-22','perfil_13.pdf',13),(14,'2024-01-23','perfil_14.pdf',14),(15,'2024-01-24','perfil_15.pdf',15),(16,'2024-01-25','perfil_16.pdf',16),(17,'2024-01-26','perfil_17.pdf',17),(18,'2024-01-27','perfil_18.pdf',18),(19,'2024-01-28','perfil_19.pdf',19),(20,'2024-01-29','perfil_20.pdf',20);
/*!40000 ALTER TABLE `perfil_sustentabilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreamento`
--

DROP TABLE IF EXISTS `rastreamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rastreamento` (
  `id_rastreamento` int NOT NULL AUTO_INCREMENT,
  `numero_rastreio` varchar(50) DEFAULT NULL,
  `status_processamento` enum('pendente','em processamento','despachado','entregue') DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT NULL,
  `fk_solicitacao_id_solicitacao` int DEFAULT NULL,
  `fk_logistica_id_logistica` int DEFAULT NULL,
  PRIMARY KEY (`id_rastreamento`),
  KEY `FK_rastreamento_solicitacao` (`fk_solicitacao_id_solicitacao`),
  KEY `FK_rastreamento_logistica` (`fk_logistica_id_logistica`),
  CONSTRAINT `FK_rastreamento_logistica` FOREIGN KEY (`fk_logistica_id_logistica`) REFERENCES `logistica` (`id_logistica`) ON DELETE CASCADE,
  CONSTRAINT `FK_rastreamento_solicitacao` FOREIGN KEY (`fk_solicitacao_id_solicitacao`) REFERENCES `solicitacao` (`id_solicitacao`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreamento`
--

LOCK TABLES `rastreamento` WRITE;
/*!40000 ALTER TABLE `rastreamento` DISABLE KEYS */;
INSERT INTO `rastreamento` VALUES (1,'R001','pendente','2025-02-01 10:00:00',1,1),(2,'R002','em processamento','2025-02-03 11:20:00',2,2),(3,'R003','despachado','2025-02-04 09:30:00',3,3),(4,'R004','pendente','2025-02-06 08:15:00',4,4),(5,'R005','entregue','2025-02-08 14:45:00',5,5),(6,'R006','pendente','2025-02-10 12:10:00',6,6),(7,'R007','em processamento','2025-02-11 16:22:00',7,7),(8,'R008','despachado','2025-02-12 13:05:00',8,8),(9,'R009','entregue','2025-02-14 18:55:00',9,9),(10,'R010','pendente','2025-02-16 07:40:00',10,10),(11,'R011','despachado','2025-02-17 15:32:00',11,11),(12,'R012','entregue','2025-02-18 20:12:00',12,12),(13,'R013','pendente','2025-02-20 11:11:00',13,13),(14,'R014','em processamento','2025-02-21 17:05:00',14,14),(15,'R015','despachado','2025-02-22 10:10:00',15,15),(16,'R016','entregue','2025-02-24 13:55:00',16,16),(17,'R017','pendente','2025-02-25 09:20:00',17,17),(18,'R018','despachado','2025-02-26 14:33:00',18,18),(19,'R019','em processamento','2025-02-27 16:44:00',19,19),(20,'R020','entregue','2025-02-28 19:00:00',20,20);
/*!40000 ALTER TABLE `rastreamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_update_rastreamento_timestamp` BEFORE UPDATE ON `rastreamento` FOR EACH ROW BEGIN
SET NEW.data_atualizacao = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `solicitacao`
--

DROP TABLE IF EXISTS `solicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitacao` (
  `id_solicitacao` int NOT NULL AUTO_INCREMENT,
  `data_solicitacao` date DEFAULT NULL,
  `finalidade` varchar(150) DEFAULT NULL,
  `area_plantio` decimal(10,2) DEFAULT NULL,
  `data_plantio_ideal` date DEFAULT NULL,
  `fk_agricultor_id_agricultor` int DEFAULT NULL,
  `fk_insumo_id_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_solicitacao`),
  KEY `FK_agricultor_solicitacao` (`fk_agricultor_id_agricultor`),
  KEY `FK_solicitacao_insumo` (`fk_insumo_id_insumo`),
  CONSTRAINT `FK_agricultor_solicitacao` FOREIGN KEY (`fk_agricultor_id_agricultor`) REFERENCES `agricultor` (`id_agricultor`) ON DELETE CASCADE,
  CONSTRAINT `FK_solicitacao_insumo` FOREIGN KEY (`fk_insumo_id_insumo`) REFERENCES `insumo` (`id_insumo`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao`
--

LOCK TABLES `solicitacao` WRITE;
/*!40000 ALTER TABLE `solicitacao` DISABLE KEYS */;
INSERT INTO `solicitacao` VALUES (1,'2025-01-10','Plantio de milho',2.50,'2025-01-20',1,1),(2,'2025-01-12','Plantio de feijão',1.80,'2025-01-25',2,2),(3,'2025-01-14','Plantio de mandioca',3.20,'2025-02-05',3,3),(4,'2025-01-15','Plantio de hortaliças',1.10,'2025-01-30',4,4),(5,'2025-01-16','Plantio de milho safrinha',2.90,'2025-02-10',5,5),(6,'2025-01-20','Plantio de batata',1.50,'2025-02-04',6,6),(7,'2025-01-22','Plantio de abóbora',2.00,'2025-02-12',7,7),(8,'2025-01-25','Plantio de tomate',1.30,'2025-02-15',8,8),(9,'2025-01-26','Plantio de cebola',3.40,'2025-02-20',9,9),(10,'2025-01-28','Plantio de pimentão',2.80,'2025-02-18',10,10),(11,'2025-01-30','Plantio de melancia',4.00,'2025-02-25',11,11),(12,'2025-02-01','Plantio de alface',1.00,'2025-02-12',12,12),(13,'2025-02-03','Plantio de milho',3.10,'2025-02-28',13,13),(14,'2025-02-04','Plantio de cenoura',2.20,'2025-02-20',14,14),(15,'2025-02-05','Plantio de beterraba',1.90,'2025-02-22',15,15),(16,'2025-02-06','Plantio de repolho',2.30,'2025-03-01',16,16),(17,'2025-02-08','Plantio de melão',3.60,'2025-03-10',17,17),(18,'2025-02-09','Plantio de couve',1.70,'2025-03-05',18,18),(19,'2025-02-11','Plantio de rúcula',0.90,'2025-02-25',19,19),(20,'2025-02-12','Plantio de soja',4.50,'2025-03-15',20,20);
/*!40000 ALTER TABLE `solicitacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_log_solicitacao` AFTER INSERT ON `solicitacao` FOR EACH ROW BEGIN
INSERT INTO suporte (nome,email,cidade,telefone,estado,assunto,mensagem,data_envio)
VALUES ('Sistema','sistema@ipa.com','Recife','00000000','PE','Nova Solicitação',
CONCAT('Solicitação criada ID: ', NEW.id_solicitacao), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `suporte`
--

DROP TABLE IF EXISTS `suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suporte` (
  `id_suporte` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `assunto` varchar(120) DEFAULT NULL,
  `mensagem` text,
  `data_envio` datetime DEFAULT NULL,
  PRIMARY KEY (`id_suporte`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suporte`
--

LOCK TABLES `suporte` WRITE;
/*!40000 ALTER TABLE `suporte` DISABLE KEYS */;
INSERT INTO `suporte` VALUES (21,'João Almeida','joaoa@example.com','Recife','81988000001','PE','Dúvida sobre cadastro','Não estou conseguindo atualizar meus dados.','2025-02-01 09:10:00'),(22,'Maria Lopes','marial@example.com','Olinda','81988000002','PE','Problema no login','Esqueci minha senha e não consigo recuperar.','2025-02-01 10:45:00'),(23,'Carlos Henrique','carlos.h@example.com','Paulista','81988000003','PE','Erro no sistema','A página de solicitação está travando.','2025-02-02 08:20:00'),(24,'Ana Paula','anap@example.com','Jaboatão','81988000004','PE','Suporte','Preciso de ajuda com a emissão do perfil sustentável.','2025-02-02 11:05:00'),(25,'Lucas Neri','lucasn@example.com','Cabo','81988000005','PE','Sugestão','Seria bom ter notificações por SMS.','2025-02-03 14:33:00'),(26,'Fernanda Silva','fersilva@example.com','Recife','81988000006','PE','Erro no rastreio','Meu código não aparece no sistema.','2025-02-03 17:55:00'),(27,'Rafael Gomes','rafaelg@example.com','Olinda','81988000007','PE','Informações','Como posso alterar meu endereço?','2025-02-04 12:44:00'),(28,'Juliana Araujo','julianaa@example.com','Paulista','81988000008','PE','Problema com entrega','Meu pedido não chegou na data prevista.','2025-02-05 09:21:00'),(29,'Eduardo Freitas','edu.f@example.com','Jaboatão','81988000009','PE','Dúvida','Quantos insumos posso solicitar por mês?','2025-02-05 15:15:00'),(30,'Carolina Dias','carold@example.com','Cabo','81988000010','PE','Feedback','Gostei do sistema, mas poderia ser mais rápido.','2025-02-06 08:40:00'),(31,'Tiago Moura','tmoura@example.com','Recife','81988000011','PE','Configurações','Não consigo alterar minha foto.','2025-02-06 16:18:00'),(32,'Bianca Rocha','biancar@example.com','Olinda','81988000012','PE','Ajuda','Como excluo uma solicitação antiga?','2025-02-07 07:50:00'),(33,'Henrique Pires','hpires@example.com','Paulista','81988000013','PE','Erro de atualização','O app fecha sozinho.','2025-02-07 11:33:00'),(34,'Larissa Farias','larissaf@example.com','Jaboatão','81988000014','PE','Informação','Qual horário de atendimento?','2025-02-08 13:12:00'),(35,'Marcos Silva','marcoss@example.com','Cabo','81988000015','PE','Problema','Recebi o insumo errado.','2025-02-08 15:30:00'),(36,'Priscila Souza','psouza@example.com','Recife','81988000016','PE','Ajuda','Não consigo anexar documentos.','2025-02-09 09:10:00'),(37,'Wesley Andrade','wandrade@example.com','Olinda','81988000017','PE','Falha no sistema','Está aparecendo erro 500.','2025-02-09 17:25:00'),(38,'Gabriela Melo','gmelo@example.com','Paulista','81988000018','PE','Mensagem','Minha dúvida não foi respondida.','2025-02-10 11:44:00'),(39,'Felipe Duarte','fduarte@example.com','Jaboatão','81988000019','PE','Problema de acesso','Meu CPF não está sendo reconhecido.','2025-02-10 16:59:00'),(40,'Renata Braga','rbraga@example.com','Cabo','81988000020','PE','Solicitação','Quero saber o status do meu pedido.','2025-02-11 10:28:00');
/*!40000 ALTER TABLE `suporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_agricultores_sem_solicitacao`
--

DROP TABLE IF EXISTS `vw_agricultores_sem_solicitacao`;
/*!50001 DROP VIEW IF EXISTS `vw_agricultores_sem_solicitacao`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_agricultores_sem_solicitacao` AS SELECT 
 1 AS `id_agricultor`,
 1 AS `nome_completo`,
 1 AS `cpf`,
 1 AS `tipo_propriedade`,
 1 AS `caf`,
 1 AS `cep`,
 1 AS `complemento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_estoque_critico`
--

DROP TABLE IF EXISTS `vw_estoque_critico`;
/*!50001 DROP VIEW IF EXISTS `vw_estoque_critico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estoque_critico` AS SELECT 
 1 AS `id_estoque`,
 1 AS `quantidade_estoque`,
 1 AS `status_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_insumos_estoque`
--

DROP TABLE IF EXISTS `vw_insumos_estoque`;
/*!50001 DROP VIEW IF EXISTS `vw_insumos_estoque`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_insumos_estoque` AS SELECT 
 1 AS `id_insumo`,
 1 AS `tipo_insumo`,
 1 AS `cultura`,
 1 AS `variedade`,
 1 AS `quantidade_solicitada`,
 1 AS `fk_estoque_id_estoque`,
 1 AS `status_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_logistica_com_solicitacao`
--

DROP TABLE IF EXISTS `vw_logistica_com_solicitacao`;
/*!50001 DROP VIEW IF EXISTS `vw_logistica_com_solicitacao`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_logistica_com_solicitacao` AS SELECT 
 1 AS `id_logistica`,
 1 AS `cidade`,
 1 AS `forma_entrega`,
 1 AS `rua`,
 1 AS `cep`,
 1 AS `complemento`,
 1 AS `destinatario`,
 1 AS `telefone`,
 1 AS `previsao_despacho`,
 1 AS `fk_solicitacao_id_solicitacao`,
 1 AS `finalidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_rastreio_completo`
--

DROP TABLE IF EXISTS `vw_rastreio_completo`;
/*!50001 DROP VIEW IF EXISTS `vw_rastreio_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rastreio_completo` AS SELECT 
 1 AS `id_rastreamento`,
 1 AS `numero_rastreio`,
 1 AS `status_processamento`,
 1 AS `data_atualizacao`,
 1 AS `fk_solicitacao_id_solicitacao`,
 1 AS `fk_logistica_id_logistica`,
 1 AS `cidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_solicitacoes_area_ordenada`
--

DROP TABLE IF EXISTS `vw_solicitacoes_area_ordenada`;
/*!50001 DROP VIEW IF EXISTS `vw_solicitacoes_area_ordenada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_solicitacoes_area_ordenada` AS SELECT 
 1 AS `id_solicitacao`,
 1 AS `data_solicitacao`,
 1 AS `finalidade`,
 1 AS `area_plantio`,
 1 AS `data_plantio_ideal`,
 1 AS `fk_agricultor_id_agricultor`,
 1 AS `fk_insumo_id_insumo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_solicitacoes_com_agricultor`
--

DROP TABLE IF EXISTS `vw_solicitacoes_com_agricultor`;
/*!50001 DROP VIEW IF EXISTS `vw_solicitacoes_com_agricultor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_solicitacoes_com_agricultor` AS SELECT 
 1 AS `id_solicitacao`,
 1 AS `data_solicitacao`,
 1 AS `finalidade`,
 1 AS `area_plantio`,
 1 AS `data_plantio_ideal`,
 1 AS `fk_agricultor_id_agricultor`,
 1 AS `fk_insumo_id_insumo`,
 1 AS `nome_completo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_solicitacoes_insumos`
--

DROP TABLE IF EXISTS `vw_solicitacoes_insumos`;
/*!50001 DROP VIEW IF EXISTS `vw_solicitacoes_insumos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_solicitacoes_insumos` AS SELECT 
 1 AS `id_solicitacao`,
 1 AS `tipo_insumo`,
 1 AS `cultura`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_suporte_cidades`
--

DROP TABLE IF EXISTS `vw_suporte_cidades`;
/*!50001 DROP VIEW IF EXISTS `vw_suporte_cidades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_suporte_cidades` AS SELECT 
 1 AS `cidade`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_suporte_resumo`
--

DROP TABLE IF EXISTS `vw_suporte_resumo`;
/*!50001 DROP VIEW IF EXISTS `vw_suporte_resumo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_suporte_resumo` AS SELECT 
 1 AS `nome`,
 1 AS `email`,
 1 AS `assunto`,
 1 AS `data_envio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'ipa_safra'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_cidade_logistica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_cidade_logistica`(idLog INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
RETURN (SELECT cidade FROM logistica WHERE id_logistica = idLog) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_estoque_atual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_estoque_atual`(est INT) RETURNS int
    DETERMINISTIC
RETURN (SELECT quantidade_estoque FROM estoque WHERE id_estoque = est) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_insumos_solicitados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_insumos_solicitados`(idS INT) RETURNS int
    DETERMINISTIC
RETURN (SELECT COUNT(*) FROM insumo WHERE id_insumo = (SELECT fk_insumo_id_insumo FROM solicitacao WHERE id_solicitacao=idS)) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_nome_agricultor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_nome_agricultor`(idA INT) RETURNS varchar(150) CHARSET utf8mb4
    DETERMINISTIC
RETURN (SELECT nome_completo FROM agricultor WHERE id_agricultor = idA) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_status_rastreio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_status_rastreio`(idR INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
RETURN (SELECT status_processamento FROM rastreamento WHERE id_rastreamento = idR) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_solicitacoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_solicitacoes`(agri INT) RETURNS int
    DETERMINISTIC
RETURN (SELECT COUNT(*) FROM solicitacao WHERE fk_agricultor_id_agricultor = agri) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_logistica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_logistica`(
IN pid INT,
IN petapa VARCHAR(50)
)
BEGIN
UPDATE logistica
SET etapa = petapa
WHERE id_logistica = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_rastreamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_rastreamento`(
IN pid INT,
IN pstatus VARCHAR(50)
)
BEGIN
UPDATE rastreamento
SET status_rastreio = pstatus
WHERE id_rastreamento = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_status_solicitacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_status_solicitacao`(
IN pid INT,
IN pnovo_status VARCHAR(50)
)
BEGIN
UPDATE solicitacao
SET status = pnovo_status
WHERE id_solicitacao = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criar_logistica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_logistica`(
IN pid_solicitacao INT,
IN petapa VARCHAR(50),
IN pdata DATE
)
BEGIN
INSERT INTO logistica (id_solicitacao, etapa, data_prevista)
VALUES (pid_solicitacao, petapa, pdata);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criar_rastreamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_rastreamento`(
IN pid_log INT,
IN pstatus VARCHAR(50),
IN pdata DATETIME
)
BEGIN
INSERT INTO rastreamento (id_logistica, status_rastreio, data_atualizacao)
VALUES (pid_log, pstatus, pdata);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criar_solicitacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_solicitacao`(
IN pid_agricultor INT,
IN pdescricao VARCHAR(255),
IN pstatus VARCHAR(50)
)
BEGIN
INSERT INTO solicitacao (id_agricultor, descricao, status)
VALUES (pid_agricultor, pdescricao, pstatus);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletar_solicitacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_solicitacao`(IN pid INT)
BEGIN
DELETE FROM solicitacao WHERE id_solicitacao = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_solicitacoes_agricultor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_solicitacoes_agricultor`(IN pid_agri INT)
BEGIN
SELECT * FROM solicitacao WHERE id_agricultor = pid_agri;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_agricultores_sem_solicitacao`
--

/*!50001 DROP VIEW IF EXISTS `vw_agricultores_sem_solicitacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_agricultores_sem_solicitacao` AS select `a`.`id_agricultor` AS `id_agricultor`,`a`.`nome_completo` AS `nome_completo`,`a`.`cpf` AS `cpf`,`a`.`tipo_propriedade` AS `tipo_propriedade`,`a`.`caf` AS `caf`,`a`.`cep` AS `cep`,`a`.`complemento` AS `complemento` from (`agricultor` `a` left join `solicitacao` `s` on((`s`.`fk_agricultor_id_agricultor` = `a`.`id_agricultor`))) where (`s`.`id_solicitacao` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_estoque_critico`
--

/*!50001 DROP VIEW IF EXISTS `vw_estoque_critico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estoque_critico` AS select `estoque`.`id_estoque` AS `id_estoque`,`estoque`.`quantidade_estoque` AS `quantidade_estoque`,`estoque`.`status_estoque` AS `status_estoque` from `estoque` where (`estoque`.`status_estoque` = 'critico') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_insumos_estoque`
--

/*!50001 DROP VIEW IF EXISTS `vw_insumos_estoque`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_insumos_estoque` AS select `i`.`id_insumo` AS `id_insumo`,`i`.`tipo_insumo` AS `tipo_insumo`,`i`.`cultura` AS `cultura`,`i`.`variedade` AS `variedade`,`i`.`quantidade_solicitada` AS `quantidade_solicitada`,`i`.`fk_estoque_id_estoque` AS `fk_estoque_id_estoque`,`e`.`status_estoque` AS `status_estoque` from (`insumo` `i` join `estoque` `e` on((`e`.`id_estoque` = `i`.`fk_estoque_id_estoque`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_logistica_com_solicitacao`
--

/*!50001 DROP VIEW IF EXISTS `vw_logistica_com_solicitacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_logistica_com_solicitacao` AS select `l`.`id_logistica` AS `id_logistica`,`l`.`cidade` AS `cidade`,`l`.`forma_entrega` AS `forma_entrega`,`l`.`rua` AS `rua`,`l`.`cep` AS `cep`,`l`.`complemento` AS `complemento`,`l`.`destinatario` AS `destinatario`,`l`.`telefone` AS `telefone`,`l`.`previsao_despacho` AS `previsao_despacho`,`l`.`fk_solicitacao_id_solicitacao` AS `fk_solicitacao_id_solicitacao`,`s`.`finalidade` AS `finalidade` from (`logistica` `l` join `solicitacao` `s` on((`s`.`id_solicitacao` = `l`.`fk_solicitacao_id_solicitacao`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rastreio_completo`
--

/*!50001 DROP VIEW IF EXISTS `vw_rastreio_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rastreio_completo` AS select `r`.`id_rastreamento` AS `id_rastreamento`,`r`.`numero_rastreio` AS `numero_rastreio`,`r`.`status_processamento` AS `status_processamento`,`r`.`data_atualizacao` AS `data_atualizacao`,`r`.`fk_solicitacao_id_solicitacao` AS `fk_solicitacao_id_solicitacao`,`r`.`fk_logistica_id_logistica` AS `fk_logistica_id_logistica`,`l`.`cidade` AS `cidade` from (`rastreamento` `r` join `logistica` `l` on((`r`.`fk_logistica_id_logistica` = `l`.`id_logistica`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_solicitacoes_area_ordenada`
--

/*!50001 DROP VIEW IF EXISTS `vw_solicitacoes_area_ordenada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_solicitacoes_area_ordenada` AS select `solicitacao`.`id_solicitacao` AS `id_solicitacao`,`solicitacao`.`data_solicitacao` AS `data_solicitacao`,`solicitacao`.`finalidade` AS `finalidade`,`solicitacao`.`area_plantio` AS `area_plantio`,`solicitacao`.`data_plantio_ideal` AS `data_plantio_ideal`,`solicitacao`.`fk_agricultor_id_agricultor` AS `fk_agricultor_id_agricultor`,`solicitacao`.`fk_insumo_id_insumo` AS `fk_insumo_id_insumo` from `solicitacao` order by `solicitacao`.`area_plantio` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_solicitacoes_com_agricultor`
--

/*!50001 DROP VIEW IF EXISTS `vw_solicitacoes_com_agricultor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_solicitacoes_com_agricultor` AS select `s`.`id_solicitacao` AS `id_solicitacao`,`s`.`data_solicitacao` AS `data_solicitacao`,`s`.`finalidade` AS `finalidade`,`s`.`area_plantio` AS `area_plantio`,`s`.`data_plantio_ideal` AS `data_plantio_ideal`,`s`.`fk_agricultor_id_agricultor` AS `fk_agricultor_id_agricultor`,`s`.`fk_insumo_id_insumo` AS `fk_insumo_id_insumo`,`a`.`nome_completo` AS `nome_completo` from (`solicitacao` `s` join `agricultor` `a` on((`s`.`fk_agricultor_id_agricultor` = `a`.`id_agricultor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_solicitacoes_insumos`
--

/*!50001 DROP VIEW IF EXISTS `vw_solicitacoes_insumos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_solicitacoes_insumos` AS select `s`.`id_solicitacao` AS `id_solicitacao`,`i`.`tipo_insumo` AS `tipo_insumo`,`i`.`cultura` AS `cultura` from (`solicitacao` `s` join `insumo` `i` on((`i`.`id_insumo` = `s`.`fk_insumo_id_insumo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_suporte_cidades`
--

/*!50001 DROP VIEW IF EXISTS `vw_suporte_cidades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_suporte_cidades` AS select `suporte`.`cidade` AS `cidade`,count(0) AS `total` from `suporte` group by `suporte`.`cidade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_suporte_resumo`
--

/*!50001 DROP VIEW IF EXISTS `vw_suporte_resumo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_suporte_resumo` AS select `suporte`.`nome` AS `nome`,`suporte`.`email` AS `email`,`suporte`.`assunto` AS `assunto`,`suporte`.`data_envio` AS `data_envio` from `suporte` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-30 18:58:54
