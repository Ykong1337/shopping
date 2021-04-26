-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: shoppingmall
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `item_id` bigint NOT NULL COMMENT '商品id',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '花费金额',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片',
  `num` int DEFAULT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`,`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (88,2,2,3999.00,'2021-04-25 09:13:15','2021-04-25 09:13:16','小米11','2021-02/6D2C8C68B81243F08B18C436541B24EE.webp',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iorder`
--

DROP TABLE IF EXISTS `iorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iorder` (
  `id` bigint NOT NULL COMMENT '订单id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `buyer_nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL COMMENT '实付金额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单更新时间',
  `deleted` int unsigned DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iorder`
--

LOCK TABLES `iorder` WRITE;
/*!40000 ALTER TABLE `iorder` DISABLE KEYS */;
INSERT INTO `iorder` VALUES (1357563474874077185,1,'admin','北京市',7398.00,'2021-04-25 09:12:49','2021-04-25 09:12:54',1),(1357569122378584066,1,'admin','北京市',1299.00,'2021-04-25 09:12:56','2021-04-25 09:12:58',0),(1357569678417580034,1,'admin','北京市',1299.00,'2021-04-25 09:12:59','2021-04-25 09:13:00',0),(1357642883777875970,1,'admin','北京市',8399.00,'2021-04-25 09:13:01','2021-04-25 09:13:01',1),(1357699048016633858,2,'奔跑的野猪','上海市',13999.00,'2021-04-25 09:13:02','2021-04-25 09:13:03',0),(1386249137534418945,1,'admin','北京市',23398.00,'2021-04-25 09:22:04','2021-04-25 09:22:04',0),(1386252423222210562,1,'admin','北京市',3399.00,'2021-04-25 09:35:07','2021-04-25 09:35:07',0),(1386252968628527106,1,'admin','北京市',4999.00,'2021-04-25 09:37:17','2021-04-25 09:37:17',0);
/*!40000 ALTER TABLE `iorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` bigint NOT NULL COMMENT '商品ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品标题',
  `sell_point` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '卖点',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `num` int DEFAULT '999' COMMENT '库存',
  `limit_num` int DEFAULT NULL COMMENT '售卖数量限制',
  `image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `cid` bigint DEFAULT NULL COMMENT '分类ID',
  `status` int DEFAULT '1' COMMENT '商品状态 1正常 0下架',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `item_fk` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'iPhone 12 Pro','iPhone年度旗舰',8499.00,977,99,'2021-02/579D1B469A594B3991E793CAE05E497F.jpg',1,1,'2021-01-16 13:18:33','2021-02-05 05:13:03'),(2,'小米11','小米11 5G 骁龙888 /2K AMOLED四曲面柔性屏/ 1亿像素/ 55W有线闪充/ 50W无线闪充 /8GB+256GB /蓝色 /游戏手机',3999.00,833,100,'2021-02/6D2C8C68B81243F08B18C436541B24EE.webp',1,1,'2021-01-16 13:18:33','2021-04-22 08:31:15'),(3,'Redmi note9','液冷游戏芯，骁龙 750G一亿像素 夜景相机120Hz 六档变速高刷屏立体声双扬声器 + 线性马达4820mAh 充电宝级大电量 + 33W 闪充多功能 NFC + 双精准定位依然金刚品质',1299.00,989,100,'2021-02/000A8D9C7E164CDF8BB5FABC29ECD584.webp',1,1,'2021-01-16 13:18:33','2021-02-05 06:00:03'),(4,'小米10','骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC',3399.00,993,100,'2021-02/443F678B4C1A43E08C19A20E96AD77DB.webp',1,1,'2021-01-16 13:18:33','2021-04-25 08:01:55'),(1350432252611985409,'小米10青春版','向往的生活同款/ 50倍潜望式超远变焦 / 双模5G / 骁龙765G处理器 / 三星AMOLED原色屏 / 180Hz采样率 / 4160mAh大电池 / 多功能NFC / 红外遥控器',2099.00,998,100,'2021-02/464AF2015421406D8BF95473FB82A2F8.jpg',1,1,'2021-01-16 13:18:33','2021-02-04 08:15:53'),(1350434858730254338,'Redmi智能电视A55','超高清画质/立体声澎湃音效/海量影音资源/64位四核处理器/超窄边框',1999.00,996,100,'2021-02/05E233DA2C1C428FB66340EA96510AC5.webp',4,1,'2021-01-16 13:28:55','2021-02-04 13:35:54'),(1351166477522927618,'iPhone 11','Apple iPhone 11 (A2223) 128GB 黑色 移动联通电信4G手机 双卡双待',4869.00,997,100,'2021-02/F6134A83062D4957BB14D8A64A8FBF5E.jpg',1,1,'2021-01-18 13:56:06','2021-02-05 05:12:57'),(1351199794234359810,'小米Mix α','创新环绕屏，极具未来感的智能交互体验 / 1亿像素超高清相机，超大感光元件 / 5G双卡全网通超高速网络 / 骁龙855Plus旗舰处理器 / 纳米硅基锂离子4050mAh电池，40W超级快充 / 钛合金+精密陶瓷+蓝宝石镜片前沿工艺',19999.00,997,1,'2021-02/5F5A18A263184184B8306E30981397F7.webp',1,1,'2021-01-18 16:08:30','2021-02-05 08:56:34'),(1356121046824734722,'Redmi Book','Redmi Book',4999.00,996,999,'2021-02/B7C943FF1A9E46FF9CCCAE1860C79228.webp',2,1,'2021-02-01 06:03:48','2021-02-04 08:18:12'),(1357269045126762498,'Redmi K30s','骁龙865 / 144Hz[7档]变速高刷屏 / 专业原色显示+全局护眼 / 5000mAh大电量+33W快充 / 6400万AI三摄 / 立体声双扬声器+X轴马达 / LPDDR5+UFS3.1+WiFi6',2999.00,998,99,'2021-02/2E600A4B355A4F47907FD188F663291C.webp',1,1,'2021-02-04 10:05:32','2021-04-21 08:54:46'),(1357609345493946369,'佳能PowerShot G7 X Mark II G7X2','佳能（Canon）PowerShot G7 X Mark II G7X2 数码相机 Vlog相机 视频拍摄---下单即送，延保服务 【Vlog视频拍摄神器】机内防抖、边走边拍',3999.00,999,999,'2021-02/14609E58AC8D403E9416BD13833064DA.jpg',3,1,'2021-02-05 08:37:46','2021-02-05 08:37:46'),(1357610485329612801,'索尼 Alpha 7 III ','索尼（SONY）Alpha 7 III 28-60mm全画幅微单数码相机 便携镜头套装（约2420万有效像素 5轴防抖 a7M3/A73/a7m3）【微单相机TOP明星机型，A7M3系列京东销量4万+】新款28-60mm镜头套装，体积进一步缩小，更加便携！实时眼部对焦，支持4K-HDR专业视频格式录制！',13999.00,998,999,'2021-02/C6D245C1C8134C728DF8E1EB4323AC91.jpg',3,1,'2021-02-05 08:42:18','2021-02-05 14:34:07'),(1357611052827332609,'索尼（SONY）KD-65X9500H ','索尼（SONY）KD-65X9500H 65英寸 4K超高清 HDR 液晶平板电视 全面屏 X1旗舰版图像芯片，全阵列背光LED精细控光，强悍X1图像芯片，侧面观看色彩依然出色！声音如屏幕发出，远场语音解放双手',8399.00,998,999,'2021-02/DB22EC7942944090AE95ECD68422AB07.jpg',4,1,'2021-02-05 08:44:33','2021-04-21 08:53:51'),(1385411925309845505,'iPhone XR','iPhone XR',3999.00,11,1,'2021-04/A4BBBF92F33B43DB8E5B8CB52136B5FC.jpg',1,1,'2021-04-23 01:55:17','2021-04-23 02:33:01');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cat`
--

DROP TABLE IF EXISTS `item_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_cat` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(10) unsigned zerofill DEFAULT NULL COMMENT '父分类ID=0时代表一级根分类',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类名称',
  `status` int DEFAULT '1' COMMENT '状态 1启用 0禁用',
  `sort_order` int DEFAULT NULL COMMENT '排列序号',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '是否为父分类 1为true 0为false',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1188 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品类目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cat`
--

LOCK TABLES `item_cat` WRITE;
/*!40000 ALTER TABLE `item_cat` DISABLE KEYS */;
INSERT INTO `item_cat` VALUES (1,0000000000,'手机',1,1,1,NULL,'各类手机','2021-04-25 09:13:48','2021-04-25 09:13:49'),(2,0000000000,'电脑',1,2,1,NULL,'各类电脑','2021-04-25 09:13:49','2021-04-25 09:13:50'),(3,0000000000,'相机',1,3,1,NULL,'各类相机','2021-04-25 09:13:51','2021-04-25 09:13:51'),(4,0000000000,'电视',1,4,1,NULL,'各类电视','2021-04-25 09:13:52','2021-04-25 09:13:52');
/*!40000 ALTER TABLE `item_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) DEFAULT NULL COMMENT '登录者',
  `status` int DEFAULT NULL COMMENT '登录状态',
  `ip` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `browser` varchar(1000) DEFAULT NULL COMMENT '登录浏览器',
  `os` varchar(20) DEFAULT NULL COMMENT '操作系统',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:11:15'),(2,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:13:31'),(3,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:15:19'),(4,'admin',0,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 1010.0','2021-04-25 07:16:32'),(5,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:16:41'),(7,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:19:52'),(8,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:22:02'),(9,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:44:55'),(10,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:48:50'),(11,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 07:49:33'),(12,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 08:01:33'),(13,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 08:24:31'),(14,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 08:33:38'),(15,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 08:36:00'),(17,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 08:56:55'),(18,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 09:00:07'),(19,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 09:16:40'),(20,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 09:34:53'),(21,'admin',1,'10.78.12.243','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0','Windows 10','2021-04-25 09:37:08');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oplog`
--

DROP TABLE IF EXISTS `oplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oplog` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip` varchar(20) DEFAULT NULL COMMENT '登录ip',
  `op_status` int DEFAULT NULL COMMENT '操作状态',
  `op_event` varchar(1000) DEFAULT NULL COMMENT '操作事件',
  `op_user` varchar(20) DEFAULT NULL COMMENT '操作人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oplog`
--

LOCK TABLES `oplog` WRITE;
/*!40000 ALTER TABLE `oplog` DISABLE KEYS */;
INSERT INTO `oplog` VALUES (1,'10.78.12.243',1,'删除登录日志中第6条数据','admin','2021-04-25 07:45:05'),(2,'10.78.12.243',1,'将商品:小米10加入到购物车','admin','2021-04-25 08:01:55'),(3,'10.78.12.243',1,'删除订单号为：1357563474874077185的所有数据(包括订单表和订单详情表)','admin','2021-04-25 08:33:46'),(4,'10.78.12.243',1,'删除登录日志中第16条数据','admin','2021-04-25 08:53:59'),(5,'10.78.12.243',1,'新增商品数据','admin','2021-04-25 09:00:44'),(6,'10.78.12.243',1,'删除ID为：1386243767609008130的商品数据','admin','2021-04-25 09:01:09'),(7,'10.78.12.243',1,'将商品:小米Mix α加入到购物车','admin','2021-04-25 09:21:49'),(8,'10.78.12.243',1,'删除了购物车中第89条数据，商品名称为：iPhone XR','admin','2021-04-25 09:21:55'),(9,'10.78.12.243',1,'更新地址信息','admin','2021-04-25 09:21:59'),(10,'10.78.12.243',1,'购买了小米10,数量为：1','admin','2021-04-25 09:22:04'),(11,'10.78.12.243',1,'购买了小米Mix α,数量为：1','admin','2021-04-25 09:22:04'),(12,'10.78.12.243',1,'将商品:小米10加入到购物车','admin','2021-04-25 09:35:02'),(13,'10.78.12.243',1,'更新地址信息','admin','2021-04-25 09:35:04'),(14,'10.78.12.243',1,'购买了小米10,数量为：1','admin','2021-04-25 09:35:07'),(15,'10.78.12.243',1,'将商品:Redmi Book加入到购物车','admin','2021-04-25 09:37:12'),(16,'10.78.12.243',1,'更新地址信息','admin','2021-04-25 09:37:15'),(17,'10.78.12.243',1,'购买了Redmi Book,数量为：1','admin','2021-04-25 09:37:17');
/*!40000 ALTER TABLE `oplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NOT NULL COMMENT '订单主键',
  `item_id` bigint NOT NULL COMMENT '商品主键',
  `quantity` int NOT NULL COMMENT '数量',
  `cost` decimal(10,0) NOT NULL COMMENT '消费',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `PK__EASYBUY___66E1BD8E2F10007B` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (109,1357563474874077185,4,1,3399,1),(110,1357563474874077185,2,1,3999,1),(111,1357569122378584066,3,1,1299,0),(112,1357569678417580034,3,1,1299,0),(113,1357642883777875970,1357611052827332609,1,8399,1),(114,1357699048016633858,1357610485329612801,1,13999,0),(115,1386249137534418945,4,1,3399,0),(116,1386249137534418945,1351199794234359810,1,19999,0),(117,1386252423222210562,4,1,3399,0),(118,1386252968628527106,1356121046824734722,1,4999,0);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shipping`
--

DROP TABLE IF EXISTS `order_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shipping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人全名',
  `receiver_mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '移动电话',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shipping`
--

LOCK TABLES `order_shipping` WRITE;
/*!40000 ALTER TABLE `order_shipping` DISABLE KEYS */;
INSERT INTO `order_shipping` VALUES (1,2,'奔跑的野猪','1314520','上海市','10000','2021-04-25 09:14:09','2021-04-25 09:14:09'),(2,1,'admin','13570926543','北京市','10000','2021-04-25 09:14:10','2021-04-25 09:14:11'),(10,3,'gee','123456','南昌市','','2021-04-25 09:14:11','2021-04-25 09:14:12');
/*!40000 ALTER TABLE `order_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员','所有权限'),(2,'管理员',NULL),(3,'普通用户',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户账号',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `identity` bigint DEFAULT NULL COMMENT '用户身份',
  `status` int unsigned DEFAULT '0' COMMENT '登录状态',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `adress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123456','admin',1,1,'123456@qq.com','123456','北京市','2021-04-25 09:14:22','2021-04-25 10:00:08'),(2,'test','123456','奔跑的野猪',2,0,'test@qq.com','1314520','上海市','2021-04-25 09:14:27','2021-04-25 09:25:21'),(3,'gee','123456','gee',3,0,'gee@qq.com','111111','南昌市','2021-04-25 09:14:30','2021-01-31 09:57:07'),(5,'test1','123456','test1',3,0,'test1@qq.com','111111','深圳市','2021-01-31 09:54:53','2021-01-31 09:54:53');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint NOT NULL,
  `ROLE_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shoppingmall'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 17:42:39
