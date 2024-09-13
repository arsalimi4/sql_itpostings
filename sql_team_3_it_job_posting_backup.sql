-- MySQL dump 10.13 Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost Database: g3_it_job_listings
-- ------------------------------------------------------
-- Server version 8.0.36
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
-- Table structure for table `country`
--
DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
`Country_ID` int NOT NULL AUTO_INCREMENT,
`Country_Code` varchar(10) NOT NULL,
PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `country`
--
LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USD'),(2,'PL'),(3,'GB'),(4,'Unknown ');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Temporary view structure for view `data_only_pl`
--
DROP TABLE IF EXISTS `data_only_pl`;
/*!50001 DROP VIEW IF EXISTS `data_only_pl`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `data_only_pl` AS SELECT
1 AS `Job_ID`,
1 AS `Country_Code`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `job_salary_outside_of_us`
--
DROP TABLE IF EXISTS `job_salary_outside_of_us`;
/*!50001 DROP VIEW IF EXISTS `job_salary_outside_of_us`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `job_salary_outside_of_us` AS SELECT
1 AS `Currency`,
1 AS `Title`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `job_skills_without_pl`
--
DROP TABLE IF EXISTS `job_skills_without_pl`;
/*!50001 DROP VIEW IF EXISTS `job_skills_without_pl`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `job_skills_without_pl` AS SELECT
1 AS `Country_Code`,
1 AS `job_listing_id`,
1 AS `Skills_Name`*/;
SET character_set_client = @saved_cs_client;
--
-- Table structure for table `jobs`
--
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
`Job_ID` int NOT NULL AUTO_INCREMENT COMMENT ' ',
`Title` varchar(45) NOT NULL,
`Country_ID` int NOT NULL,
PRIMARY KEY (`Job_ID`),
KEY `fk_Jobs_Country1_idx` (`Country_ID`),
CONSTRAINT `fk_Jobs_Country1` FOREIGN KEY (`Country_ID`) REFERENCES `country`
(`Country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `jobs`
--
LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Python Engineer',1),(2,'Head of Engineering',2),
(3,'React Native Developer',2),(4,'Senior ReactJS Developer (Remote)',2),(5,'Mobile
Team Lead',3),(6,'ETL/IPC Developer',2),(7,'.NET Developer',2),(8,'Frontend
Developer',2),(9,'.Net Azure Developer',2),(10,'Senior Data Engineer',2),(11,'Mid
Back-End JavaScript Developer',2),(12,'Product Manager',2),(13,'Angular
Developer',2),(14,'IT Administrator',2),(15,'Junior PHP Developer',2),(16,'(Not so)
Regular Developer',2),(17,'Business Analyst ',2),(18,'Backend Web Developer',2),
(19,'Python Developer',2);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `jobs_modality`
--
DROP TABLE IF EXISTS `jobs_modality`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_modality` (
`Remote_ID` int NOT NULL,
`Job_ID` int NOT NULL,
PRIMARY KEY (`Remote_ID`,`Job_ID`),
KEY `fk_Modality_has_Jobs_Jobs1_idx` (`Job_ID`),
KEY `fk_Modality_has_Jobs_Modality1_idx` (`Remote_ID`),
CONSTRAINT `fk_Modality_has_Jobs_Jobs1` FOREIGN KEY (`Job_ID`) REFERENCES `jobs`
(`Job_ID`),
CONSTRAINT `fk_Modality_has_Jobs_Modality1` FOREIGN KEY (`Remote_ID`) REFERENCES
`modality` (`Remote_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `jobs_modality`
--
LOCK TABLES `jobs_modality` WRITE;
/*!40000 ALTER TABLE `jobs_modality` DISABLE KEYS */;
INSERT INTO `jobs_modality` VALUES (1,1),(1,2),(1,3),(2,3),(2,4),(3,5),(1,6),(1,7),
(1,8),(2,8),(1,9),(3,9),(1,10),(2,10),(1,11),(1,12),(1,13),(2,13),(1,14),(2,14),
(1,15),(2,15),(1,16),(2,16),(1,17),(3,17),(1,18),(1,19),(2,19);
/*!40000 ALTER TABLE `jobs_modality` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `jobs_salary`
--
DROP TABLE IF EXISTS `jobs_salary`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_salary` (
`Salary_ID` int NOT NULL,
`Job_ID` int NOT NULL,
PRIMARY KEY (`Salary_ID`,`Job_ID`),
KEY `fk_Salary_has_Jobs_Jobs1_idx` (`Job_ID`),
KEY `fk_Salary_has_Jobs_Salary1_idx` (`Salary_ID`),
CONSTRAINT `fk_Salary_has_Jobs_Jobs1` FOREIGN KEY (`Job_ID`) REFERENCES `jobs`
(`Job_ID`),
CONSTRAINT `fk_Salary_has_Jobs_Salary1` FOREIGN KEY (`Salary_ID`) REFERENCES
`salary` (`Salary_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `jobs_salary`
--
LOCK TABLES `jobs_salary` WRITE;
/*!40000 ALTER TABLE `jobs_salary` DISABLE KEYS */;
INSERT INTO `jobs_salary` VALUES (1,1),(2,2),(2,3),(2,4),(3,5),(2,8),(2,9),(2,10),
(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19);
/*!40000 ALTER TABLE `jobs_salary` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `jobs_skills`
--
DROP TABLE IF EXISTS `jobs_skills`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_skills` (
`Job_ID` int NOT NULL,
`Skills_ID` int NOT NULL,
PRIMARY KEY (`Job_ID`,`Skills_ID`),
KEY `fk_Jobs_has_Skills_Skills1_idx` (`Skills_ID`),
KEY `fk_Jobs_has_Skills_Jobs1_idx` (`Job_ID`),
CONSTRAINT `fk_Jobs_has_Skills_Jobs1` FOREIGN KEY (`Job_ID`) REFERENCES `jobs`
(`Job_ID`),
CONSTRAINT `fk_Jobs_has_Skills_Skills1` FOREIGN KEY (`Skills_ID`) REFERENCES
`skills` (`Skills_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `jobs_skills`
--
LOCK TABLES `jobs_skills` WRITE;
/*!40000 ALTER TABLE `jobs_skills` DISABLE KEYS */;
INSERT INTO `jobs_skills` VALUES (1,1),(16,1),(1,2),(16,2),(2,3),(17,3),(2,4),
(17,4),(3,5),(18,5),(3,6),(18,6),(4,7),(19,7),(4,8),(19,8),(5,9),(5,10),(6,11),
(6,12),(7,13),(7,14),(8,15),(8,16),(9,17),(9,18),(10,19),(10,20),(11,21),(11,22),
(12,23),(12,24),(13,25),(13,26),(14,27),(14,28),(15,29),(15,30);
/*!40000 ALTER TABLE `jobs_skills` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `modality`
--
DROP TABLE IF EXISTS `modality`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modality` (
`Remote_ID` int NOT NULL AUTO_INCREMENT,
`Remote_Interview` tinyint DEFAULT NULL,
`Remote_Job` tinyint DEFAULT NULL,
PRIMARY KEY (`Remote_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `modality`
--
LOCK TABLES `modality` WRITE;
/*!40000 ALTER TABLE `modality` DISABLE KEYS */;
INSERT INTO `modality` VALUES (1,1,1),(2,0,1),(3,1,0);
/*!40000 ALTER TABLE `modality` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Temporary view structure for view `remote_only_a_to_s`
--
DROP TABLE IF EXISTS `remote_only_a_to_s`;
/*!50001 DROP VIEW IF EXISTS `remote_only_a_to_s`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `remote_only_a_to_s` AS SELECT
1 AS `Fully Remote`,
1 AS `Jobs`*/;
SET character_set_client = @saved_cs_client;
--
-- Table structure for table `salary`
--
DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
`Salary_ID` int NOT NULL AUTO_INCREMENT,
`salary_currency_b2b` varchar(5) NOT NULL,
PRIMARY KEY (`Salary_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `salary`
--
LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'usd '),(2,'pln '),(3,'gbp'),(5,'esd');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `skills`
--
DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
`Skills_ID` int NOT NULL AUTO_INCREMENT,
`Skills_Name` varchar(50) NOT NULL,
`Skills_Value` int NOT NULL,
PRIMARY KEY (`Skills_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `skills`
--
LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'AWS',2),(2,'PostgreSQL',4),(3,'JavaScript ',3),
(4,'TypeScript',3),(5,'Animations',1),(6,'Kotlin',3),(7,'iOS',3),(8,'PL/SQL',4),
(9,'Oracle',4),(10,'ORM (EF)',3),(11,'ASP.NET MVC',3),(12,'React',3),(13,'React
Native',3),(14,'JIRA',3),(15,'HP QC',3),(16,'CRM',1),(17,'UML',3),(18,'Angular
2+',4),(19,'unknown',0),(20,'R',4),(21,'shiny',4),(22,'HTML5',4),(23,'Active
Directory',3),(24,'Windows Administration',4),(25,'Web API',3),(26,'ASP.NET Web
API',3),(27,'MS SQL Server',3),(28,'WPF',1),(29,'.Net',4),(30,'Angular',3);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Temporary view structure for view `skills_only_sql`
--
DROP TABLE IF EXISTS `skills_only_sql`;
/*!50001 DROP VIEW IF EXISTS `skills_only_sql`*/;
SET @saved_cs_client = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `skills_only_sql` AS SELECT
1 AS `Skills_Name`,
1 AS `Skills_Value`,
1 AS `Title`*/;
SET character_set_client = @saved_cs_client;
--
-- Final view structure for view `data_only_pl`
--
/*!50001 DROP VIEW IF EXISTS `data_only_pl`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `data_only_pl` AS select `jobs_salary`.`Job_ID` AS
`Job_ID`,`country`.`Country_Code` AS `Country_Code` from (`country` join
`jobs_salary`) where (`country`.`Country_ID` = 2) group by
`jobs_salary`.`Job_ID`,`country`.`Country_Code` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `job_salary_outside_of_us`
--
/*!50001 DROP VIEW IF EXISTS `job_salary_outside_of_us`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `job_salary_outside_of_us` AS select `salary`.`salary_currency_b2b`
AS `Currency`,`jobs`.`Title` AS `Title` from ((`salary` join `jobs_salary`
on((`salary`.`Salary_ID` = `jobs_salary`.`Salary_ID`))) join `jobs`
on((`jobs_salary`.`Job_ID` = `jobs`.`Job_ID`))) where
(`salary`.`salary_currency_b2b` <> 'usd') order by
`salary`.`salary_currency_b2b`,`jobs`.`Title` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `job_skills_without_pl`
--
/*!50001 DROP VIEW IF EXISTS `job_skills_without_pl`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `job_skills_without_pl` AS select `country`.`Country_Code` AS
`Country_Code`,`jobs`.`Job_ID` AS `job_listing_id`,`skills`.`Skills_Name` AS
`Skills_Name` from (((`country` join `jobs` on((`country`.`Country_ID` =
`jobs`.`Country_ID`))) join `jobs_skills` on((`jobs`.`Job_ID` =
`jobs_skills`.`Job_ID`))) join `skills` on((`jobs_skills`.`Skills_ID` =
`skills`.`Skills_ID`))) where `country`.`Country_Code` in (select
`country`.`Country_Code` from (((`country` join `jobs` on((`country`.`Country_ID` =
`jobs`.`Country_ID`))) join `jobs_skills` on((`jobs`.`Job_ID` =
`jobs_skills`.`Job_ID`))) join `skills` on((`jobs_skills`.`Skills_ID` =
`skills`.`Skills_ID`))) where ((`country`.`Country_Code` <> 'PL') and
(`jobs`.`Job_ID` between 1 and 9))) group by
`jobs`.`Job_ID`,`country`.`Country_Code`,`skills`.`Skills_Name` order by
`jobs`.`Job_ID` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `remote_only_a_to_s`
--
/*!50001 DROP VIEW IF EXISTS `remote_only_a_to_s`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `remote_only_a_to_s` AS select
count(concat(`modality`.`Remote_Interview`,`modality`.`Remote_Job`)) AS `Fully
Remote`,`jobs`.`Title` AS `Jobs` from ((`modality` join `jobs_modality`
on((`modality`.`Remote_ID` = `jobs_modality`.`Remote_ID`))) join `jobs`
on((`jobs_modality`.`Job_ID` = `jobs`.`Job_ID`))) where (`jobs`.`Title` between 'A'
and 'S') group by `Jobs` order by 'Fully Remote',`Jobs` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
--
-- Final view structure for view `skills_only_sql`
--
/*!50001 DROP VIEW IF EXISTS `skills_only_sql`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `skills_only_sql` AS select `skills`.`Skills_Name` AS
`Skills_Name`,count(`skills`.`Skills_Value`) AS `Skills_Value`,`jobs`.`Title` AS
`Title` from ((`skills` join `jobs_skills` on((`skills`.`Skills_ID` =
`jobs_skills`.`Skills_ID`))) join `jobs` on((`jobs_skills`.`Job_ID` =
`jobs`.`Job_ID`))) where (`skills`.`Skills_Name` like '%SQL%') group by
`skills`.`Skills_Name`,`jobs`.`Title` order by `Skills_Value`
desc,`skills`.`Skills_Name`,`jobs`.`Title` */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-12 17:13:09
