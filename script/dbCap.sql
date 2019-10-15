-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbcap
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `student_authority` varchar(45) COLLATE utf8_bin NOT NULL,
  `professor_authority` varchar(45) COLLATE utf8_bin NOT NULL,
  `ta_authority` varchar(45) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `student_authority_UNIQUE` (`student_authority`),
  UNIQUE KEY `professor_authority_UNIQUE` (`professor_authority`),
  UNIQUE KEY `ta_authority_UNIQUE` (`ta_authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES ('test123','iamprofessor','TA123');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_no` int(11) NOT NULL AUTO_INCREMENT,
  `notice_no` int(11) NOT NULL,
  `notice_date` date NOT NULL,
  `depth` int(11) NOT NULL,
  `content` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_no`),
  KEY `FK_Comment_Notice_idx` (`notice_no`),
  CONSTRAINT `FK_Comment_Notice` FOREIGN KEY (`notice_no`) REFERENCES `professor_notice` (`notice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'2019-10-08',0,'what?',0),(2,1,'2019-10-08',1,'hello?',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_no` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`department_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'소프트웨어공학과'),(2,'컴퓨터공학과'),(3,'정보통신학과'),(4,'글로컬IT학과');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homework` (
  `hw_no` int(11) NOT NULL AUTO_INCREMENT,
  `student_no` int(11) NOT NULL,
  `notice_no` int(11) NOT NULL,
  `file_no` varchar(45) COLLATE utf8_bin NOT NULL,
  `submitdate` date NOT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`hw_no`),
  KEY `FK_Homework_Student_idx` (`student_no`),
  KEY `FK_Homework_Notice_idx` (`notice_no`),
  CONSTRAINT `FK_Homework_Notice` FOREIGN KEY (`notice_no`) REFERENCES `professor_notice` (`notice_no`),
  CONSTRAINT `FK_Homework_Student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,1,1,'1','2019-10-07',10),(2,2,1,'1','2019-10-08',10),(3,3,1,'hw1_1.zip','2019-10-08',10);
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `lecture_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `lecture_type` varchar(45) COLLATE utf8_bin NOT NULL,
  `professor_no` int(11) NOT NULL,
  PRIMARY KEY (`lecture_no`),
  KEY `FK_Lecture_Professor_idx` (`professor_no`),
  CONSTRAINT `FK_Lecture_Professor` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'데이터베이스 캡스톤디자인','전공',1),(2,'C 프로그래밍','전공',1),(3,'Python','전공',1),(4,'모바일프로그래밍','전공',2);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `professor_no` int(11) NOT NULL AUTO_INCREMENT,
  `professor_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `professor_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `department_no` int(11) NOT NULL,
  `professor_email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `professor_phone` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL,
  `password_question` varchar(45) COLLATE utf8_bin NOT NULL,
  `password_answer` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`professor_no`),
  UNIQUE KEY `professor_id_UNIQUE` (`professor_id`),
  KEY `FK_Professor_Department_idx` (`department_no`),
  CONSTRAINT `FK_Professor_Department` FOREIGN KEY (`department_no`) REFERENCES `department` (`department_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'hong','홍은지',1,'hong@skhu.ac.kr',NULL,'test123','나의성은?','홍'),(2,'lsj','이승진',1,'lsj@skhu.ac.kr',NULL,'test123','나의성은?','이'),(3,'park','박정식',3,'park@skhu.ac.kr',NULL,'test123','나의성은?','박'),(4,'jay','김정기',4,'jay@skhu.ac.kr',NULL,'test123','나의성은?','김');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_lecture`
--

DROP TABLE IF EXISTS `professor_lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_lecture` (
  `professor_no` int(11) NOT NULL,
  `lecture_no` int(11) NOT NULL,
  PRIMARY KEY (`professor_no`,`lecture_no`),
  KEY `FK_ProfessorLecture_Professor_idx` (`professor_no`),
  KEY `FK_ProfessorLecture_Lecture_idx` (`lecture_no`),
  CONSTRAINT `FK_ProfessorLecture_Lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`),
  CONSTRAINT `FK_ProfessorLecture_Professor` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_lecture`
--

LOCK TABLES `professor_lecture` WRITE;
/*!40000 ALTER TABLE `professor_lecture` DISABLE KEYS */;
INSERT INTO `professor_lecture` VALUES (1,1),(1,2),(1,3),(2,4);
/*!40000 ALTER TABLE `professor_lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_notice`
--

DROP TABLE IF EXISTS `professor_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_notice` (
  `notice_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_no` int(11) NOT NULL,
  `professor_no` int(11) NOT NULL,
  `header` varchar(45) COLLATE utf8_bin NOT NULL,
  `title` varchar(45) COLLATE utf8_bin NOT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `submitdate` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `deadline_add` date DEFAULT NULL,
  `perfect_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`notice_no`),
  KEY `FK_ProfessorNotice_Lecture_idx` (`lecture_no`),
  KEY `FK_ProfessorNotice_Professor_idx` (`professor_no`),
  CONSTRAINT `FK_ProfessorNotice_Lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`),
  CONSTRAINT `FK_ProfessorNotice_Professor` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_notice`
--

LOCK TABLES `professor_notice` WRITE;
/*!40000 ALTER TABLE `professor_notice` DISABLE KEYS */;
INSERT INTO `professor_notice` VALUES (1,2,1,'과제','hw1_1','구구단 코드 작성해보기','2019-10-08','2019-10-10','2019-10-12',10),(2,1,1,'공지','자율주제 결정 및 게시 ','11/12일에 조별자율주제를 발표할 예정입니다. 게시판에 아래의 제목으로 주제를 올려주세요. 다른 조들의 발표 주제를 확인한 후, 이미 주제를 선정한 조와 겹치지 않은 주제로 자율주제를 정하시오','2019-10-08',NULL,NULL,NULL),(3,4,2,'공지','중간고사','10월 14일에 6202에서 모바일 프로그래밍 코딩 시험 봅니다.','2019-10-08',NULL,NULL,NULL);
/*!40000 ALTER TABLE `professor_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_no` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `student_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `department_no` int(11) NOT NULL,
  `student_email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `student_phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password_question` varchar(45) COLLATE utf8_bin NOT NULL,
  `password_answer` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`student_no`),
  UNIQUE KEY `student_id_UNIQUE` (`student_id`),
  KEY `FK_Student_Department_idx` (`department_no`),
  CONSTRAINT `FK_Student_Department` FOREIGN KEY (`department_no`) REFERENCES `department` (`department_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'201632012','안세연',1,NULL,NULL,'0000','바보는?','세연뭉치'),(2,'201732032','장은애',1,NULL,'01064331361','test123','나는','장그래'),(3,'201732003','김규희',1,'rbgmll10331@gmail.com','01036198488','0000','김','구랑'),(4,'201332039 ','탁희윤',1,NULL,NULL,'test123','축구','좋아'),(5,'201332020','용동중',1,NULL,NULL,'test123','게임','좋아'),(6,'201532004','김보미',1,NULL,'01043783904','test123','나는','김보미'),(7,'201435003','김컴공',2,NULL,'01022222222','2222','김','컴공'),(8,'201436030','박정통',3,NULL,'01033333333','3333','박','정통'),(9,'201231025','최글티',4,NULL,'01044444444','4444','최','글티');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_lecture`
--

DROP TABLE IF EXISTS `student_lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_lecture` (
  `student_no` int(11) NOT NULL,
  `lecture_no` int(11) NOT NULL,
  PRIMARY KEY (`student_no`,`lecture_no`),
  KEY `FK_StudentLecture_Student_idx` (`student_no`),
  KEY `FK_StudentLecture_Lecture_idx` (`lecture_no`),
  CONSTRAINT `FK_StudentLecture_Lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`),
  CONSTRAINT `FK_StudentLecture_Student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_lecture`
--

LOCK TABLES `student_lecture` WRITE;
/*!40000 ALTER TABLE `student_lecture` DISABLE KEYS */;
INSERT INTO `student_lecture` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(3,2),(4,2),(6,2);
/*!40000 ALTER TABLE `student_lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_notice`
--

DROP TABLE IF EXISTS `student_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_notice` (
  `studentnotice_no` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_no` int(11) NOT NULL,
  `student_no` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_bin NOT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `submitdate` date NOT NULL,
  PRIMARY KEY (`studentnotice_no`),
  KEY `FK_StudentNotice_Student_idx` (`student_no`),
  KEY `FK_StudentNotice_Lecture_idx` (`lecture_no`),
  CONSTRAINT `FK_StudentNotice_Lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`),
  CONSTRAINT `FK_StudentNotice_Student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_notice`
--

LOCK TABLES `student_notice` WRITE;
/*!40000 ALTER TABLE `student_notice` DISABLE KEYS */;
INSERT INTO `student_notice` VALUES (1,1,1,'hw1_1 정답코드','public class gugudan { ... }','2019-10-08'),(2,1,4,'hw2_3 정답코드','public class dealer { ...}','2019-10-14'),(3,2,2,'중간고사답','1, 4 ,5 ,3 ,1 ,3 ,2 ,2 ,2 ,3','2019-10-16');
/*!40000 ALTER TABLE `student_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta`
--

DROP TABLE IF EXISTS `ta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta` (
  `ta_no` int(11) NOT NULL AUTO_INCREMENT,
  `ta_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `professor_no` int(11) NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password_question` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password_answer` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ta_no`),
  UNIQUE KEY `ta_id_UNIQUE` (`ta_id`),
  UNIQUE KEY `professor_no_UNIQUE` (`professor_no`),
  KEY `FK_Ta_Professor_idx` (`professor_no`),
  CONSTRAINT `FK_Ta_Professor` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta`
--

LOCK TABLES `ta` WRITE;
/*!40000 ALTER TABLE `ta` DISABLE KEYS */;
INSERT INTO `ta` VALUES (6,'201732003',1,'0000','1+1','=2'),(7,'201732012',3,'0000','나는','뭉치'),(8,'201332039',2,'0000','나는','카키');
/*!40000 ALTER TABLE `ta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-14 21:00:42
