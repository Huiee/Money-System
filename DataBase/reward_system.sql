-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: reward_system
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `admin_password` varchar(45) DEFAULT NULL,
  `admin_name` varchar(45) DEFAULT NULL,
  `admin_picture` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chat` (
  `speaker_id` varchar(20) NOT NULL,
  `speaker_name` varchar(20) NOT NULL,
  `listener_id` varchar(20) NOT NULL,
  `listener_name` varchar(20) NOT NULL,
  `mes_content` varchar(200) NOT NULL,
  `mes_time` varchar(30) NOT NULL,
  PRIMARY KEY (`speaker_id`,`listener_id`,`mes_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES ('20190101','飒飒','20190102','绒绒','？？？？','2019-06-29 15:48:05'),('20190101','飒飒','20190102','绒绒','我准备开演唱会了哦！你会来的吧','2019-07-02 12:03:14'),('20190101','飒飒','20190102','绒绒','好呀','2019-07-02 12:04:50'),('20190101','飒飒','20190102','绒绒','不过绒绒，答应我','2019-07-02 12:05:00'),('20190101','飒飒','20190102','绒绒','不许带上壳哥哦','2019-07-02 12:05:22'),('20190101','飒飒','20190102','绒绒','你以后会知道的呢','2019-07-02 12:11:40'),('20190101','飒飒','20190102','绒绒','笨蛋','2019-07-02 12:12:19'),('20190101','飒飒','20190103','雨木木','looooooooooo','2019-07-02 10:28:00'),('20190101','飒飒','20190103','雨木木','kiri','2019-07-02 10:28:29'),('20190101','飒飒','H_Yi_Lee','H_Yi_Lee','我想接这个任务','2019-07-01 18:45:14'),('20190101','飒飒','我也不知道','我也不知道','Hi~','2019-06-26 00:32:02'),('20190101','飒飒','我也不知道','我也不知道','在吗！','2019-06-26 00:35:37'),('20190101','飒飒','我也不知道','我也不知道','hi','2019-06-26 00:46:55'),('20190101','飒飒','我也不知道','我也不知道','你好！','2019-06-26 01:13:46'),('20190101','飒飒','我也不知道','我也不知道','（——。——）','2019-07-02 09:31:49'),('20190102','绒绒','20190101','飒飒','Hi~','2019-06-26 12:40:16'),('20190102','绒绒','20190101','飒飒','(つд⊂)','2019-07-01 23:06:57'),('20190102','绒绒','20190101','飒飒','立风哥哥好！！！','2019-07-02 11:46:59'),('20190102','绒绒','20190101','飒飒','立风哥哥好！！！','2019-07-02 11:48:45'),('20190102','绒绒','20190101','飒飒','当然！！一定到！！','2019-07-02 12:04:07'),('20190102','绒绒','20190101','飒飒','我还可以帮你给ET们伴奏哦！！','2019-07-02 12:04:36'),('20190102','绒绒','20190101','飒飒','为什么呀','2019-07-02 12:05:47'),('20190102','绒绒','20190103','雨木木','哈哈哈','2019-07-02 09:48:06'),('20190102','绒绒','我也不知道','我也不知道','(-.-)','2019-06-26 12:42:05'),('20190103','雨木木','20190101','飒飒','在吗！','2019-06-30 21:46:22'),('20190103','雨木木','20190101','飒飒',':)','2019-07-02 10:27:36'),('369','小小','20190103','雨木木','要睡觉啦','2019-07-02 03:19:47'),('369','小小','我也不知道','我也不知道','在吗！！！！','2019-06-27 01:27:00'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','啊','2019-06-30 22:29:08'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','好的哟！','2019-06-30 22:30:41'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','(-.-)','2019-07-02 11:15:28'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','(o.o)','2019-07-02 11:15:38'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','我','2019-07-02 11:15:46'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','于','2019-07-02 11:17:08'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','成','2019-07-02 11:17:24'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','码','2019-07-02 11:17:46'),('H_Yi_Lee','H_Yi_Lee','m475201314','Z_LiN','！！','2019-07-02 11:18:06'),('m475201314','Z_LiN','H_Yi_Lee','H_Yi_Lee','我现在到了图书馆了','2019-06-30 22:28:30'),('m475201314','Z_LiN','H_Yi_Lee','H_Yi_Lee','试了一下','2019-06-30 22:28:43'),('m475201314','Z_LiN','H_Yi_Lee','H_Yi_Lee','网络也不行','2019-06-30 22:28:49'),('m475201314','Z_LiN','H_Yi_Lee','H_Yi_Lee','我回到宿舍啦','2019-06-30 22:29:21'),('m475201314','Z_LiN','H_Yi_Lee','H_Yi_Lee','终','2019-07-02 11:16:54'),('m475201314','Z_LiN','H_Yi_Lee','H_Yi_Lee','完','2019-07-02 11:17:16'),('m475201314','Z_LiN','H_Yi_Lee','H_Yi_Lee','代','2019-07-02 11:17:38'),('m475201314','Z_LiN','H_Yi_Lee','H_Yi_Lee','啦','2019-07-02 11:17:55'),('我也不知道','我也不知道','20190101','飒飒','？？','2019-06-26 01:45:13'),('我也不知道','我也不知道','20190101','飒飒','!!','2019-06-26 01:57:07'),('我也不知道','我也不知道','20190101','飒飒','!!','2019-06-26 01:57:54'),('我也不知道','我也不知道','20190101','飒飒','本报告的主要作用是确定各个项目模块的开发情况和主要的负责人','2019-06-26 01:58:48'),('我也不知道','我也不知道','20190102','绒绒','！！','2019-06-30 01:09:09'),('我也不知道','我也不知道','20190102','绒绒','??','2019-06-30 01:11:13');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_score`
--

DROP TABLE IF EXISTS `employer_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employer_score` (
  `employer_id` varchar(20) NOT NULL,
  `job_time` varchar(30) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `employee_name` varchar(20) NOT NULL,
  `job_accept_time` varchar(30) NOT NULL,
  `job_finish_time` varchar(30) DEFAULT NULL,
  `employee_job_state` varchar(20) NOT NULL,
  `employee_job_content` varchar(900) DEFAULT NULL,
  `employee_job_result` varchar(20) DEFAULT NULL,
  `job_title` varchar(45) NOT NULL,
  `job_deadline_time` varchar(45) NOT NULL,
  `job_appeal` tinyint(4) DEFAULT NULL,
  `job_appeal_result` varchar(45) DEFAULT NULL,
  `job_fininsh_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`employer_id`,`job_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_score`
--

LOCK TABLES `employer_score` WRITE;
/*!40000 ALTER TABLE `employer_score` DISABLE KEYS */;
INSERT INTO `employer_score` VALUES ('H_Yi_Lee','2019-06-30 22:23:00','20190101','飒飒','2019-07-01 18:51:22',NULL,'待完成',NULL,NULL,'软件测试咨询！重赏！！！','2019-07-01',NULL,NULL,NULL),('我也不知道','2019-06-25 23:26:49','20190101','飒飒','2019-06-27 10:40:00','2019-06-27 11:03:30','已完成','已完成',NULL,'人像摄影指导','7',NULL,NULL,NULL),('我也不知道','2019-06-26 11:52:28','20190101','飒飒','2019-06-26 20:58:41','2019-06-30 19:12:18','已完成',NULL,'通过','抽象画指导咨询','7',1,'通过',NULL),('我也不知道','2019-06-26 16:09:56','20190101','飒飒','2019-06-27 11:04:23','2019-06-30 21:17:41','已完成',NULL,'通过','素描指导','2019-07-13',1,'通过',NULL),('我也不知道','2019-06-27 01:20:33','20190101','飒飒','2019-06-27 10:32:49',NULL,'待完成',NULL,NULL,'中考问题咨询','2019-07-07',NULL,NULL,NULL),('我也不知道','2019-06-27 11:14:55','20190101','飒飒','2019-06-30 16:35:40',NULL,'待完成',NULL,NULL,'手机购买指导','2019-07-14',NULL,NULL,NULL),('20190101','2019-06-29 00:55:00','20190103','雨木木','2019-06-30 21:45:48','2019-06-30 21:46:07','已完成','7+1','通过','5G手机推荐','2019-07-14',NULL,NULL,NULL),('我也不知道','2019-06-25 23:25:41','369','小小','2019-06-27 01:25:01','2019-06-27 01:27:45','已完成','没有想法','不通过','如何证明哥德巴赫猜想','30',1,'不通过',NULL),('我也不知道','2019-06-27 01:20:33','369','小小','2019-06-27 03:31:57','2019-06-27 03:32:21','已完成','我也不知道',NULL,'中考问题咨询','2019-07-07',NULL,NULL,NULL),('H_Yi_Lee','2019-06-30 22:23:00','m475201314','Z_LiN','2019-06-30 22:24:28','2019-06-30 22:27:40','已完成','1.软件组成\r\n2.软件缺陷产生的原因\r\n3.软件测试的目的和选择\r\n4.软件测试模型\r\n5.测试用例基本概念\r\n6.软件自动化的意义\r\n7.重点 等价类测试 边界值分析 决策表 因果图\r\n8.测试覆盖率\r\n9.单元测试','通过','软件测试咨询！重赏！！！','2019-07-01',NULL,NULL,NULL),('20190101','2019-06-25 23:27:53','我也不知道','我也不知道','2019-06-27 01:18:30','2019-06-27 03:02:14','已完成','已私信完成','通过','就业指导咨询','7',1,'通过',NULL),('20190101','2019-06-25 23:28:32','我也不知道','我也不知道','2019-06-27 01:15:56','2019-06-27 01:19:35','已完成','任务已通过私信完成','通过','高考问题咨询','5',NULL,NULL,NULL);
/*!40000 ALTER TABLE `employer_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job` (
  `employer_id` varchar(20) NOT NULL,
  `employer_name` varchar(20) NOT NULL,
  `job_picture` varchar(500) DEFAULT NULL,
  `employee_name` varchar(20) DEFAULT NULL,
  `job_time` varchar(30) NOT NULL,
  `job_title` varchar(20) NOT NULL,
  `job_content` varchar(200) NOT NULL,
  `job_type` varchar(20) NOT NULL,
  `job_deadline_time` varchar(30) NOT NULL,
  `job_state` varchar(20) NOT NULL,
  `consult_reward` double DEFAULT NULL,
  `guide_reward` double DEFAULT NULL,
  `is_cash_deposit` tinyint(1) NOT NULL,
  `cash_deposit` double DEFAULT NULL,
  `job_accept_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`employer_id`,`job_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES ('20190101','飒飒',NULL,NULL,'2019-06-25 23:27:53','就业指导咨询','专业为计算机方向，熟悉该方向不同工作情况','社科','7','招募中',50,0,0,0,NULL),('20190101','飒飒',NULL,NULL,'2019-06-25 23:28:32','高考问题咨询','无','教育','5','招募中',30,0,0,0,NULL),('20190101','飒飒',NULL,NULL,'2019-06-27 02:44:14','淘宝业务咨询','熟悉淘宝操作','社科','2019-07-28','招募中',30,0,1,10,NULL),('20190101','飒飒','p4.png',NULL,'2019-06-29 00:55:00','5G手机推荐','熟悉目前市场上新型5G手机各方面性能，等等','数码','2019-07-14','招募中',15,5,0,0,NULL),('20190101','飒飒','p7.jpg',NULL,'2019-07-02 09:18:20','限定艺术课程指导','帮忙抢课，要求能抢到','教育','2019-07-07','招募中',0,100,1,50,NULL),('20190101','飒飒','null',NULL,'2019-07-02 12:17:57','摄影指导','无','艺术','2019-07-06','招募中',12,0,0,0,NULL),('20190103','雨木木','null',NULL,'2019-07-01 23:13:06','小学家教','熟悉小学教材','教育','2019-07-31','招募中',100,0,1,100000,NULL),('20190103','雨木木','login.jpg',NULL,'2019-07-02 09:46:18','如何证明哥德巴赫猜想','证明出来','社科','2019-07-31','招募中',100,200,0,0,NULL),('369','小小','p29.png',NULL,'2019-07-02 12:16:54','如何证明费马大定理','无','教育','2019-07-13','招募中',0,0,0,0,NULL),('H_Yi_Lee','H_Yi_Lee','p9.jpg',NULL,'2019-06-30 22:23:00','软件测试咨询！重赏！！！','熟悉软件测试考点','教育','2019-07-01','招募中',100,0,0,0,NULL),('我也不知道','我也不知道',NULL,NULL,'2019-06-25 23:25:41','如何证明哥德巴赫猜想','能证明出来','社科','30','招募中',30000,0,1,100,NULL),('我也不知道','我也不知道',NULL,NULL,'2019-06-25 23:26:49','人像摄影指导','要求为职业摄影师，会PS，有丰富的拍摄经验','艺术','7','招募中',0,300,1,100,NULL),('我也不知道','我也不知道',NULL,NULL,'2019-06-26 11:52:28','抽象画指导咨询','要求有五年以上绘画经验','艺术','7','招募中',30,50,1,100,NULL),('我也不知道','我也不知道',NULL,NULL,'2019-06-26 16:09:56','素描指导','擅长素描绘画,有多年绘画经验','艺术','2019-07-13','招募中',60,120,0,0,NULL),('我也不知道','我也不知道',NULL,NULL,'2019-06-27 01:20:33','中考问题咨询','无','教育','2019-07-07','招募中',100,0,1,40,NULL),('我也不知道','我也不知道',NULL,NULL,'2019-06-27 11:14:55','手机购买指导','熟悉市场是所有新型手机','数码','2019-07-14','招募中',0,20,0,0,NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_accept`
--

DROP TABLE IF EXISTS `job_accept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_accept` (
  `job_accept_time` varchar(255) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `employee_job_content` varchar(255) DEFAULT NULL,
  `employee_job_result` varchar(255) DEFAULT NULL,
  `employee_job_state` varchar(255) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `employer_id` varchar(255) DEFAULT NULL,
  `employer_score` varchar(255) DEFAULT NULL,
  `job_appeal` bit(1) DEFAULT NULL,
  `job_appeal_result` varchar(255) DEFAULT NULL,
  `job_deadline_time` varchar(255) DEFAULT NULL,
  `job_finish_time` varchar(255) DEFAULT NULL,
  `job_time` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_accept_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_accept`
--

LOCK TABLES `job_accept` WRITE;
/*!40000 ALTER TABLE `job_accept` DISABLE KEYS */;
INSERT INTO `job_accept` VALUES ('2019-07-02 08:25:29','20190101','推荐5G手机','不通过','已完成','飒飒','我也不知道',NULL,_binary '','通过','2019-07-14','2019-07-02 08:25:45','2019-06-27 11:14:55','手机购买指导'),('2019-07-02 08:25:55','20190101','私聊',NULL,'已完成','飒飒','20190103',NULL,NULL,NULL,'2019-07-31','2019-07-02 08:26:00','2019-07-01 23:13:06','小学家教'),('2019-07-02 08:26:44','我也不知道',NULL,NULL,'待完成','我也不知道','20190103',NULL,NULL,NULL,'2019-07-31',NULL,'2019-07-01 23:13:06','小学家教'),('2019-07-02 08:27:26','我也不知道','已私信完成','通过','已完成','我也不知道','20190101',NULL,NULL,NULL,'7','2019-07-02 08:27:34','2019-06-25 23:27:53','就业指导咨询'),('2019-07-02 08:29:22','20190101','（——。——）','通过','已完成','飒飒','我也不知道',NULL,_binary '',NULL,'2019-07-13','2019-07-02 08:29:44','2019-06-26 16:09:56','素描指导'),('2019-07-02 08:30:05','20190103','私信','不通过','已完成','雨木木','20190101',NULL,_binary '',NULL,'2019-07-14','2019-07-02 08:30:11','2019-06-29 00:55:00','5G手机推荐'),('2019-07-02 08:30:24','20190103',NULL,NULL,'待完成','雨木木','20190101',NULL,NULL,NULL,'2019-07-28',NULL,'2019-06-27 02:44:14','淘宝业务咨询'),('2019-07-02 08:31:35','20190102','私信','通过','已完成','绒绒','20190101',NULL,NULL,NULL,'2019-07-14','2019-07-02 08:31:40','2019-06-29 00:55:00','5G手机推荐'),('2019-07-02 09:14:57','20190101','私信教你！！！！',NULL,'已完成','飒飒','我也不知道',NULL,NULL,NULL,'7','2019-07-02 09:29:39','2019-06-26 11:52:28','抽象画指导咨询'),('2019-07-02 09:15:20','20190101',NULL,NULL,'待完成','飒飒','H_Yi_Lee',NULL,NULL,NULL,'2019-07-01',NULL,'2019-06-30 22:23:00','软件测试咨询！重赏！！！');
/*!40000 ALTER TABLE `job_accept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_type`
--

DROP TABLE IF EXISTS `job_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_type` (
  `job_type` varchar(45) NOT NULL,
  `job_type_content` varchar(900) DEFAULT NULL,
  `job_type_picture` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`job_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_type`
--

LOCK TABLES `job_type` WRITE;
/*!40000 ALTER TABLE `job_type` DISABLE KEYS */;
INSERT INTO `job_type` VALUES ('体育','体育（physical education，缩写PE或P.E.），是一种复杂的社会文化现象，它以身体与智力活动为基本手段，根据人体生长发育、技能形成和机能提高等规律，达到促进全面发育','p3.jpg'),('影视',NULL,NULL),('教育',NULL,NULL),('数码',NULL,NULL),('文学',NULL,NULL),('社科',NULL,NULL),('艺术',NULL,NULL);
/*!40000 ALTER TABLE `job_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_birthday` varchar(30) DEFAULT NULL,
  `user_phone` varchar(13) DEFAULT NULL,
  `user_money` double DEFAULT NULL,
  `user_money_state` tinyint(1) NOT NULL,
  `user_introduce` varchar(200) DEFAULT NULL,
  `user_state` tinyint(1) NOT NULL,
  `user_bolock_time` varchar(200) DEFAULT NULL,
  `user_picture` varchar(900) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  `user_introduce_picture` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('20190101','飒飒','123','2019-06-02','12345678910',-13,0,'广东药科大学',1,'','p31.jpg','男','p4.jpg'),('20190102','绒绒','123','2019-06-08','13789876787',20,1,'1',1,'','p30.jpg','男',NULL),('20190103','雨木木','123','2019-01-01','13456768765',1423,1,NULL,1,'','p7.jpg','男',NULL),('369','小小','123','2019-06-02','23424',-1,1,NULL,1,NULL,'p25.jpg','女',NULL),('Admin','管理员','123','2019-03-01','123123123123',NULL,1,NULL,1,NULL,NULL,'女',NULL),('H_Yi_Lee','H_Yi_Lee','123','1997-12-31','13719202131',899,1,NULL,1,NULL,'p14.jpg','女',NULL),('m475201314','Z_LiN','123','1997-08-29','12356473656',101,1,NULL,1,NULL,'p21.jpg','男',NULL),('我也不知道','我也不知道','123','2019-06-01','156765678765',262,1,NULL,1,NULL,'p3.jpg','女',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_money`
--

DROP TABLE IF EXISTS `user_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_money` (
  `user_id` varchar(20) NOT NULL,
  `user_get_money` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_money`
--

LOCK TABLES `user_money` WRITE;
/*!40000 ALTER TABLE `user_money` DISABLE KEYS */;
INSERT INTO `user_money` VALUES ('20190101','45%'),('20190102','30%'),('20190103',NULL),('369',NULL),('Admin',NULL),('H_Yi_Lee',NULL),('m475201314',NULL),('我也不知道',NULL);
/*!40000 ALTER TABLE `user_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tags`
--

DROP TABLE IF EXISTS `user_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_tags` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `user_tag` varchar(45) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tags`
--

LOCK TABLES `user_tags` WRITE;
/*!40000 ALTER TABLE `user_tags` DISABLE KEYS */;
INSERT INTO `user_tags` VALUES (1,'20190101','天才'),(2,'20190101','水瓶'),(3,'20190101','90后'),(4,'20190101','二次元世界'),(5,'20190101','唱歌超级好听'),(6,'我也不知道','天才'),(7,'我也不知道','小朋友'),(8,'20190101','可爱(๑• . •๑)'),(9,'20190101','我也不知道'),(10,'20190103','90后');
/*!40000 ALTER TABLE `user_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'reward_system'
--

--
-- Dumping routines for database 'reward_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-02 17:50:04
