CREATE DATABASE  IF NOT EXISTS `ogk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ogk`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ogk
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` char(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(15) NOT NULL,
  `birthday` date NOT NULL,
  `gernder` char(1) NOT NULL,
  `address` varchar(100) NOT NULL DEFAULT '',
  `address1` varchar(45) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `subscribed` tinyint NOT NULL DEFAULT '0',
  `discount` int unsigned NOT NULL DEFAULT '0',
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('A123456789','花咲','asd@gmail.com','123456','1999-03-05','M','臺北市','123路456號14F','0921111111',0,0,1),('A155561086','花咲','a2214@gmail.com','123123','1997-10-22','M','','','',0,0,0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int unsigned NOT NULL,
  `product_id` int NOT NULL,
  `typecolorname` varchar(40) NOT NULL,
  `size` varchar(10) NOT NULL DEFAULT '',
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`,`typecolorname`,`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,41,'','',62,1),(1,46,'','',63,1),(2,11,'黑','M',1800,1),(3,11,'黑','M',1800,1),(4,10,'ikura布偶','',1080,1),(5,10,'ikura布偶','',1080,1),(6,11,'紅','L',1800,1),(7,41,'','',62,1),(8,41,'','',62,1),(9,39,'','',63,1),(10,39,'','',63,1),(11,39,'','',63,1),(12,39,'','',63,1),(13,39,'','',63,1),(14,29,'','',155,1),(15,27,'','',155,1),(16,26,'','',64,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_log`
--

DROP TABLE IF EXISTS `order_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `old_status` int unsigned NOT NULL,
  `new_status` int unsigned NOT NULL,
  `old_payment_note` varchar(100) DEFAULT NULL,
  `new_payment_note` varchar(100) DEFAULT NULL,
  `old_delivery_note` varchar(100) DEFAULT NULL,
  `new_delivery_note` varchar(100) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_log`
--

LOCK TABLES `order_status_log` WRITE;
/*!40000 ALTER TABLE `order_status_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` varchar(10) NOT NULL,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL,
  `recipient_name` varchar(20) NOT NULL,
  `recipient_email` varchar(100) NOT NULL,
  `recipient_phone` varchar(30) NOT NULL,
  `shipping_addres` varchar(110) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `payment_fee` double NOT NULL,
  `payment_note` varchar(100) NOT NULL DEFAULT '',
  `delivery_type` varchar(20) NOT NULL,
  `delivery_fee` double NOT NULL,
  `delivery_note` varchar(100) NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'A123456789','2025-09-04','17:11:10','花咲','asd@gmail.com','0921111111','','SUPERMARKET',30,'','NODELIVERY',0,'',0),(2,'A123456789','2025-09-04','17:18:50','花咲','asd@gmail.com','0921111111','','CREDIT_CARDPAYMENT',0,'','SEVENELEVEN',60,'',0),(3,'A123456789','2025-09-04','17:18:53','花咲','asd@gmail.com','0921111111','','CREDIT_CARDPAYMENT',0,'','SEVENELEVEN',60,'',0),(4,'A123456789','2025-09-04','17:19:55','花咲','asd@gmail.com','0921111111','臺北市123路456號14F','CREDIT_CARDPAYMENT',0,'','BLACKCAT',100,'',0),(5,'A123456789','2025-09-04','17:20:00','花咲','asd@gmail.com','0921111111','臺北市123路456號14F','CREDIT_CARDPAYMENT',0,'','BLACKCAT',100,'',0),(6,'A123456789','2025-09-04','17:34:50','花咲','asd@gmail.com','0921111111','','ATM',0,'','NODELIVERY',0,'',0),(7,'A123456789','2025-09-04','17:41:00','花咲','asd@gmail.com','0921111111','','CREDIT_CARDPAYMENT',0,'','NODELIVERY',0,'',0),(8,'A123456789','2025-09-04','17:50:15','花咲','asd@gmail.com','0921111111','','SUPERMARKET',30,'','NODELIVERY',0,'',0),(9,'A123456789','2025-09-04','18:00:15','花咲','asd@gmail.com','0921111111','','CREDIT_CARDPAYMENT',0,'','NODELIVERY',0,'',0),(10,'A123456789','2025-09-04','18:00:21','花咲','asd@gmail.com','0921111111','','SUPERMARKET',30,'','NODELIVERY',0,'',0),(11,'A123456789','2025-09-04','18:00:40','花咲','asd@gmail.com','0921111111','','CREDIT_CARDPAYMENT',0,'','NODELIVERY',0,'',0),(12,'A123456789','2025-09-04','18:00:41','花咲','asd@gmail.com','0921111111','','CREDIT_CARDPAYMENT',0,'','NODELIVERY',0,'',0),(13,'A123456789','2025-09-04','18:00:45','花咲','asd@gmail.com','0921111111','','SUPERMARKET',30,'','NODELIVERY',0,'',0),(14,'A123456789','2025-09-04','18:41:17','花咲','asd@gmail.com','0921111111','','ATM',0,'銀行:1236,帳號後5碼:1326,金額:155.0,2025-09-04 1:30完成轉帳','NODELIVERY',0,'',1),(15,'A123456789','2025-09-04','20:10:37','花咲','asd@gmail.com','0921111111','','SUPERMARKET',30,'','NODELIVERY',0,'',0),(16,'A123456789','2025-09-04','23:08:27','花咲','asd@gmail.com','0921111111','','CREDIT_CARDPAYMENT',0,'','NODELIVERY',0,'',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_merch`
--

DROP TABLE IF EXISTS `product_merch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_merch` (
  `product_id` int NOT NULL,
  `typecolorname` varchar(50) NOT NULL,
  `colorphotourl` varchar(200) NOT NULL,
  `iconUrl` varchar(200) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`,`typecolorname`),
  CONSTRAINT `fk_product_merch_TO_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_merch`
--

LOCK TABLES `product_merch` WRITE;
/*!40000 ALTER TABLE `product_merch` DISABLE KEYS */;
INSERT INTO `product_merch` VALUES (10,'Ayase布偶','images/surrounding/Ayase.jpg','images/surrounding/Ayase.jpg',0),(10,'ikura布偶','images/surrounding/ikura.jpg','images/surrounding/ikura.jpg',0),(11,'灰','images/surrounding/YOASOBIHoodieGRAY.jpg','images/surrounding/YOASOBIHoodieGRAY.jpg',2),(11,'紅','images/surrounding/YOASOBIHoodieRED.jpg','images/surrounding/YOASOBIHoodieRED.jpg',3),(11,'綠','images/surrounding/YOASOBIHoodieGREEN.jpg','images/surrounding/YOASOBIHoodieGREEN.jpg',1),(11,'黑','images/surrounding/YOASOBIHoodieBLACK.jpg','images/surrounding/YOASOBIHoodieBLACK.jpg',4),(54,'兔子','images/music/POP SONG.jpg','images/music/POP SONG.jpg',0),(54,'小八','images/music/POP SONG.jpg','images/music/POP SONG.jpg',0);
/*!40000 ALTER TABLE `product_merch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_merch_sizes`
--

DROP TABLE IF EXISTS `product_merch_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_merch_sizes` (
  `product_id` int NOT NULL,
  `typecolorname` varchar(45) NOT NULL DEFAULT '',
  `size` varchar(45) NOT NULL,
  `stock` int NOT NULL,
  `unitprice` double NOT NULL,
  `ordinal` int NOT NULL,
  PRIMARY KEY (`product_id`,`size`,`typecolorname`),
  CONSTRAINT `fk_product_merch_sizes_TO_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_merch_sizes`
--

LOCK TABLES `product_merch_sizes` WRITE;
/*!40000 ALTER TABLE `product_merch_sizes` DISABLE KEYS */;
INSERT INTO `product_merch_sizes` VALUES (11,'灰','L',2,1800,1),(11,'紅','L',1,1800,1),(11,'綠','L',0,1800,1),(11,'黑','L',2,1800,1),(11,'灰','M',0,1800,0),(11,'紅','M',2,1700,0),(11,'綠','M',0,1800,0),(11,'黑','M',0,1800,0),(24,'','L',3,1205,2),(24,'','M',4,1205,1),(24,'','S',3,1205,0),(24,'','XL',1,1205,3),(54,'兔子','L',5,500,1),(54,'小八','L',4,500,1),(54,'兔子','S',5,500,0),(54,'小八','S',5,500,0);
/*!40000 ALTER TABLE `product_merch_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_real_time_stock`
--

DROP TABLE IF EXISTS `product_real_time_stock`;
/*!50001 DROP VIEW IF EXISTS `product_real_time_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_real_time_stock` AS SELECT 
 1 AS `id`,
 1 AS `category`,
 1 AS `the_typecolor_name`,
 1 AS `size_name`,
 1 AS `real_time_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `singer` varchar(100) NOT NULL DEFAULT '',
  `category` varchar(45) NOT NULL DEFAULT '',
  `unitPrice` double NOT NULL,
  `photoUrl` varchar(500) DEFAULT 'images/music/',
  `description` varchar(500) NOT NULL DEFAULT '',
  `shelfDate` date NOT NULL DEFAULT (curdate()),
  `discount` int DEFAULT '0',
  `stock` int NOT NULL DEFAULT '1',
  `Sales` int unsigned NOT NULL DEFAULT '0',
  `musicUrl` varchar(500) DEFAULT 'music/',
  `auditionUrl` varchar(500) DEFAULT 'audiovisual/',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'うっせぇわ','Ado','JPOP',65,'images/music/うっせぇわ.jpg','YouTube 已播放 1 億次，Nico Nico Douga 已播放 500 萬次。數字銷量累計達到30萬DL，流媒體播放量突破2億。','2020-10-23',0,1,1,'music/うっせぇわ.mp4','audiovisual/うっせぇわ.mp4'),(2,'三原色','YOASOBI','JPOP',155,'images/music/三原色.jpg','音樂組合YOASOBI的第10首數位發行單曲，於2021年7月2日發行','2021-07-02',0,1,2,'music/三原色.mp4','audiovisual/三原色.mp4'),(3,'Monster','YOASOBI','ANIME',155,'images/music/Monster.jpg','','2021-07-30',0,1,0,'music/怪物.mp4','audiovisual/怪物.mp4'),(4,'神っぽいな','ピノキオピー','VOCALOID',62,'images/music/神っぽいな.jpg','本曲相較於匹諾曹P之前的作品，風格變化極大，加之其具有諷刺意味的歌詞，被認為是在諷刺當今VOCALOID圈子中的一些“潮流”。','2021-09-19',0,1,0,'music/神っぽいな.mp4','audiovisual/神っぽいな.mp4'),(5,'踊','Ado','JPOP',127,'images/music/踊.jpg','','2021-10-13',0,1,1,'music/踊.mp4','audiovisual/踊.mp4'),(6,'天使のagape','天音かなた','VTuber',155,'images/music/天使のagape.jpg','','2021-12-27',0,1,0,'music/天使のagape.mp4','audiovisual/天使のagape.mp4'),(7,'マイネームイズエリート☆','さくらみこ','VTuber',155,'images/music/マイネームイズエリート☆.jpg','','2021-12-27',0,1,0,'music/マイネームイズエリート☆.mp4','audiovisual/マイネームイズエリート☆.mp4'),(8,'みっころね×しょうたいむ!!','さくらみこ,戌神ころね','VTuber',155,'images/music/みっころね×しょうたいむ!!.jpg','','2022-01-03',0,1,0,'music/みっころね×しょうたいむ.mp4','audiovisual/みっころね×しょうたいむ.mp4'),(9,'天球彗星は夜を跨いで','星街すいせい','VTuber',155,'images/music/天球彗星は夜を跨いで.jpg','','2021-07-09',0,1,0,'music/天球彗星は夜を跨いで.mp4','audiovisual/天球彗星は夜を跨いで.mp4'),(10,'YOASOBI×BEASTARS ぬいぐるみセット','YOASOBI','merch',1200,'images/surrounding/YOASOBI×BEASTARS ぬいぐるみセット.jpg','Ayase：W120 x H200 x D135mm <br>ikura：W135 x H200 x D115mm','2021-03-20',10,0,0,'',''),(11,'YOASOBIHoodie','YOASOBI','merch',1800,'images/surrounding/YOASOBIHoodie.jpg','[尺碼]<br>[M] 衣長 67 / 衣寬 65 / 肩寬 60 / 袖長 55 / 袖寬 50 (cm)<br>[L] 衣長 76 / 衣寬 71 / 肩寬 66 / 袖長 57 / 袖寬 56 (cm)','2021-02-12',0,0,0,'',''),(12,'Anarchy','Official髭男dism','JPOP',63,'images/music/Anarchy.jpg','','2022-01-07',0,1,0,'music/Anarchy.mp4','audiovisual/Anarchy.mp4'),(13,'千本桜','Ado','VOCALOID',63,'images/music/千本桜Ado.jpg','','2022-01-07',0,1,0,'music/千本桜Ado.mp4','audiovisual/千本桜Ado.mp4'),(14,'千本桜','黒うさP','VOCALOID',38,'images/music/千本桜.jpg','','2012-02-29',0,1,0,'music/千本桜.mp4','audiovisual/千本桜.mp4'),(15,'KING','Kanaria','VOCALOID',49,'images/music/KING.jpg','','2020-08-08',0,1,0,'music/KING.mp4','audiovisual/KING.mp4'),(16,'MIRA','Kanaria','VOCALOID',49,'images/music/MIRA.jpg','','2021-03-24',0,1,0,'music/MIRA.mp4','audiovisual/MIRA.mp4'),(17,'Cry Baby','Official髭男dism','ANIME',106,'images/music/CryBaby.jpg','','2021-05-07',0,1,0,'music/Cry Baby.mp4','audiovisual/Cry Baby.mp4'),(18,'群青','YOASOBI','JPOP',155,'images/music/Blue.jpg','','2021-10-29',0,1,0,'music/群青.mp4','audiovisual/群青.mp4'),(19,'朝が来る','Aimer','ANIME',155,'images/music/朝が来る.jpg','','2022-01-10',0,1,0,'music/朝が来る.mp4','audiovisual/朝が来る.mp4'),(20,'Clover\'s Cry ～神と神降ろしの少女～','横山奈緒 (CV.渡部優衣)、馬場このみ (CV.髙橋ミナミ)、秋月律子 (CV.若林直美)、大神 環 (CV.稲川英里)、木下ひなた (CV.田村奈央)','ANIME',155,'images/music/Clover\'s Cry 神と神降ろしの少女.jpg','','2022-01-11',0,1,0,'music/Clover\'s Cry ～神と神降ろしの少女～','audiovisual/Clover\'s Cry ～神と神降ろしの少女～'),(21,'裸の勇者','Vaundy','ANIME',155,'images/music/裸の勇者.jpg','','2022-01-07',0,1,0,'music/裸の勇者.mp4','audiovisual/裸の勇者.mp4'),(22,'FACT','常闇トワ','VTuber',155,'images/music/FACT.jpg','「こんやっぴ～！」<br>1人前の悪魔になる為の社会勉強として人間界にやってきた小悪魔。本来勉強をしなきゃいけないところ、ゲームに出会ってしまい、夢中になる。配信という人間達とのコミュニケーションツールを見つけそこで勉強を試みる。','2022-01-04',0,1,0,'music/FACT.mp4','audiovisual/FACT.mp4'),(23,'ラブカ？ (feat. Ado)','柊キライ','JPOP',49,'images/music/ラブカ.jpg','','2020-12-12',0,1,0,'music/ラブカ？ (feat. Ado).mp4','audiovisual/ラブカ？ (feat. Ado).mp4'),(24,'星街すいせい 今日もかわいいパーカー','星街すいせい','merch',1205,'images/surrounding/星街すいせい 今日もかわいいパーカー.png','連帽衫 S 黑色<br>連帽衫 M 黑色<br>連帽衫 L黑色<br>連帽衫 XL 黑色','2020-03-20',0,1,0,'',''),(25,'YOASOBI×BEASTARS 橡膠鑰匙扣','YOASOBI','merch',290,'images/surrounding/YOASOBI×BEASTARS Rubber Key chain.jpg','[尺寸]<br>W70 x H70 (mm)<br>[材質]<br>PVC','2021-03-20',0,1,0,'',''),(26,'心という名の不可解','Ado','JPOP',64,'images/music/心という名の不可解.jpg','','2022-01-18',0,1,2,'music/心という名の不可解.mp4','audiovisual/心という名の不可解.mp4'),(27,'あいわな','湊あくあ','VTuber',155,'images/music/あいわな.jpg','','2022-01-29',0,1,2,'music/あいわな.mp4','audiovisual/あいわな.mp4'),(28,'思ひ恋ふ','潤羽るしあ','VTuber',155,'images/music/思ひ恋ふ.jpg','','2022-01-23',0,1,1,'music/思ひ恋ふ.mp4','audiovisual/思ひ恋ふ.mp4'),(29,'絶対忠誠♡なのなのら！','姫森ルーナ','VTuber',155,'images/music/絶対忠誠♡なのなのら！.jpg','','2022-01-30',0,1,2,'music/絶対忠誠♡なのなのら！.mp4','audiovisual/絶対忠誠♡なのなのら！.mp4'),(30,'いいわけバニー','兎田ぺこら','VTuber',155,'images/music/いいわけバニー.jpg','','2022-01-13',0,1,0,'music/いいわけバニー.mp4','audiovisual/いいわけバニー.mp4'),(31,'Unison','宝鐘マリン,Yunomi','VTuber',155,'images/music/Unison.jpg','','2021-08-12',0,1,0,'music/Unison.mp4','audiovisual/Unison.mp4'),(32,'ほめのび','白銀ノエル','VTuber',155,'images/music/ほめのび.jpg','','2021-09-27',0,1,0,'music/ほめのび.mp4','audiovisual/ほめのび.mp4'),(33,'暗く黒く','ずっと真夜中でいいのに。','JPOP',63,'images/music/暗く黒く.jpg','','2020-11-03',0,1,0,'music/暗く黒く.mp4','audiovisual/暗く黒く.mp4'),(34,'猫リセット','ずっと真夜中でいいのに。','JPOP',63,'images/music/猫リセット.jpg','','2021-12-02',0,1,0,'music/猫リセット.mp4','audiovisual/猫リセット.mp4'),(35,'お勉強しといてよ','ずっと真夜中でいいのに。','JPOP',63,'images/music/お勉強しといてよ.jpg','','2020-05-15',0,1,0,'music/お勉強しといてよ.mp4','audiovisual/お勉強しといてよ.mp4'),(36,'ばかじゃないのに','ずっと真夜中でいいのに。','JPOP',63,'images/music/ばかじゃないのに.jpg','','2021-07-04',0,1,0,'music/ばかじゃないのに.mp4','audiovisual/ばかじゃないのに.mp4'),(37,'ツバメ ( feat. ミドリーズ )','YOASOBI','JPOP',155,'images/music/ツバメ ( feat. ミドリーズ ).jpg','','2021-10-25',0,1,0,'music/ツバメ ( feat. ミドリーズ ).mp4','audiovisual/ツバメ ( feat. ミドリーズ ).mp4'),(38,'大正浪漫','YOASOBI','JPOP',155,'images/music/大正浪漫.jpg','','2021-09-15',0,1,0,'music/大正浪漫.mp4','audiovisual/大正浪漫.mp4'),(39,'POP SONG','米津玄師','JPOP',63,'images/music/POP SONG.jpg','','2022-02-07',0,1,5,'music/POP SONG.mp4','audiovisual/POP SONG.mp4'),(40,'Lemon','米津玄師','JPOP',63,'images/music/Lemon.jpg','','2018-03-14',0,1,0,'music/Lemon.mp4','audiovisual/Lemon.mp4'),(41,'パラサイト','DECO*27','VOCALOID',62,'images/music/パラサイト.jpg','','2022-02-07',0,1,5,'music/パラサイト.mp4','audiovisual/パラサイト.mp4'),(42,'アニマル','DECO*27','VOCALOID',62,'images/music/アニマル.jpg','','2021-12-16',0,1,0,'music/アニマル.mp4','audiovisual/アニマル.mp4'),(43,'ヴァンパイア','DECO*27','VOCALOID',62,'images/music/ヴァンパイア.jpg','','2021-03-09',0,1,0,'musicヴァンパイア.mp4','audiovisual/ヴァンパイア.mp4'),(44,'エンヴィーベイビー','Kanaria','VOCALOID',49,'images/music/エンヴィーベイビー.jpg','','2021-03-01',0,1,0,'music/エンヴィーベイビー.mp4','audiovisual/エンヴィーベイビー.mp4'),(45,'ONE AND LAST','Aimer','JPOP',155,'images/music/ONE AND LAST.jpg','','2021-12-10',0,1,0,'music/ONE AND LAST.mp4','audiovisual/ONE AND LAST.mp4'),(46,'The Rumbling','SiM','ANIME',63,'images/music/The Rumbling.jpg','','2022-02-07',0,1,1,'music/The Rumbling.mp4','audiovisual/The Rumbling.mp4'),(47,'Smile & Go!!','不知火フレア','VTuber',155,'images/music/Smile & Go!!.jpg','','2021-04-03',0,1,0,'music/Smile & Go!!.mp4','audiovisual/Smile & Go!!.mp4'),(48,'モモノネ','桃鈴ねね','VTuber',155,'images/music/モモノネ.jpg','','2021-08-14',0,1,0,'music/モモノネ.mp4','audiovisual/モモノネ.mp4'),(49,'ぷ・れ・あ・で・す！','大空スバル','VTuber',155,'images/music/ぷ・れ・あ・で・す！.jpg','','2021-10-08',0,1,0,'music/ぷ・れ・あ・で・す！.mp4','audiovisual/ぷ・れ・あ・で・す！.mp4'),(50,'Howling','大神ミオ','VTuber',155,'images/music/Howling.jpg','','2021-08-21',0,1,0,'music/Howling.mp4','audiovisual/Howling.mp4'),(51,'OKP Cipher','Avantgardey','JPOP',155,'images/music/OKP Cipher.jpg','','2025-10-02',0,1,0,'music/OKP Cipher.mp4','audiovisual/OKP Cipher.mp4'),(52,'CAT\'S EYE','Ado','JPOP',155,'images/music/CAT\'S EYE.jpg','','2025-10-02',0,1,0,'music/CAT\'S EYE.mp4','audiovisual/CAT\'S EYE.mp4'),(53,'IRIS OUT','米津玄師','JPOP',155,'images/music/IRIS OUT.jpg','','2025-10-02',0,1,0,'music/IRIS OUT.mp4','audiovisual/IRIS OUT.mp4'),(54,'AA','AA','merch',0,NULL,'AA','2025-10-13',0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `product_real_time_stock`
--

/*!50001 DROP VIEW IF EXISTS `product_real_time_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_real_time_stock` AS select `products`.`id` AS `id`,`products`.`category` AS `category`,ifnull(ifnull(`product_merch`.`typecolorname`,`product_merch_sizes`.`typecolorname`),'') AS `the_typecolor_name`,ifnull(`product_merch_sizes`.`size`,'') AS `size_name`,ifnull(ifnull(`product_merch_sizes`.`stock`,`product_merch`.`stock`),`products`.`stock`) AS `real_time_stock` from ((`products` left join `product_merch` on((`products`.`id` = `product_merch`.`product_id`))) left join `product_merch_sizes` on(((`products`.`id` = `product_merch_sizes`.`product_id`) and ((`product_merch`.`typecolorname` = `product_merch_sizes`.`typecolorname`) or ((`product_merch`.`typecolorname` is null) and (`product_merch_sizes`.`typecolorname` = '')))))) */;
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

-- Dump completed on 2025-11-09 18:31:06
