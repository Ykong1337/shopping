/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : shoppingmall

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 28/04/2022 20:20:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `item_id` bigint NOT NULL COMMENT '商品id',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '花费金额',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品标题',
  `img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品图片',
  `num` int NULL DEFAULT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`, `item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (88, 2, 2, 3999.00, '2021-04-25 17:13:15', '2022-03-25 17:13:16', '小米11', 'redmi note9.webp', 1);

-- ----------------------------
-- Table structure for iorder
-- ----------------------------
DROP TABLE IF EXISTS `iorder`;
CREATE TABLE `iorder`  (
  `id` bigint NOT NULL COMMENT '订单id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `buyer_nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '买家昵称',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `payment` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单更新时间',
  `deleted` int UNSIGNED NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iorder
-- ----------------------------
INSERT INTO `iorder` VALUES (1357563474874077185, 1, 'admin', '北京市', 7398.00, '2022-03-25 17:12:49', '2022-04-02 17:12:54', 1);
INSERT INTO `iorder` VALUES (1357569122378584066, 1, 'admin', '北京市', 1299.00, '2022-03-25 17:12:56', '2022-04-02 17:12:58', 0);
INSERT INTO `iorder` VALUES (1357569678417580034, 1, 'admin', '北京市', 1299.00, '2022-03-25 17:12:59', '2022-04-02 17:13:00', 1);
INSERT INTO `iorder` VALUES (1357642883777875970, 1, 'admin', '北京市', 8399.00, '2022-03-25 17:13:01', '2022-04-02 17:13:01', 1);
INSERT INTO `iorder` VALUES (1357699048016633858, 2, '奔跑的野猪', '上海市', 13999.00, '2022-03-25 17:13:02', '2022-04-02 17:13:03', 0);
INSERT INTO `iorder` VALUES (1386249137534418945, 1, 'admin', '北京市', 23398.00, '2022-03-25 17:22:04', '2022-04-02 17:22:04', 1);
INSERT INTO `iorder` VALUES (1386252423222210562, 1, 'admin', '北京市', 3399.00, '2022-03-25 17:35:07', '2022-04-02 17:35:07', 1);
INSERT INTO `iorder` VALUES (1386252968628527106, 1, 'admin', '北京市', 4999.00, '2022-03-25 17:37:17', '2022-04-02 17:37:17', 1);
INSERT INTO `iorder` VALUES (1495681521810235394, 1, 'admin', '北京市', 8499.00, '2022-03-30 16:47:17', '2022-04-02 16:47:17', 1);
INSERT INTO `iorder` VALUES (1495686475585179650, 1, 'admin', '北京市', 19999.00, '2022-03-27 17:06:58', '2022-04-02 17:06:58', 0);
INSERT INTO `iorder` VALUES (1495687228974452738, 1, 'admin', '北京市', 1299.00, '2022-03-27 17:09:58', '2022-04-02 17:09:58', 0);
INSERT INTO `iorder` VALUES (1514874983393533953, 1, 'admin', '北京市', 8499.00, '2022-04-15 15:55:15', '2022-04-15 15:55:15', 0);
INSERT INTO `iorder` VALUES (1518142787220729858, 6, 'me', '哈尔滨市', 8499.00, '2022-04-24 16:20:20', '2022-04-24 16:20:20', 0);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` bigint NOT NULL COMMENT '商品ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `sell_point` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖点',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `num` int NULL DEFAULT 999 COMMENT '库存',
  `limit_num` int NULL DEFAULT NULL COMMENT '售卖数量限制',
  `image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `cid` bigint NULL DEFAULT NULL COMMENT '分类ID',
  `status` int NULL DEFAULT 1 COMMENT '商品状态 1正常 0下架',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_fk`(`cid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, 'iPhone 12 Pro', 'iPhone年度旗舰', 8499.00, 974, 99, 'iphone-12-pro.jpg', 1, 1, '2022-01-16 21:18:33', '2022-04-02 13:13:03');
INSERT INTO `item` VALUES (2, '小米11', '小米11 5G 骁龙888 /2K AMOLED四曲面柔性屏/ 1亿像素/ 55W有线闪充/ 50W无线闪充 /8GB+256GB /蓝色 /游戏手机', 3999.00, 833, 100, 'mi11.webp', 1, 1, '2022-01-16 21:18:33', '2022-04-02 16:31:15');
INSERT INTO `item` VALUES (3, 'Redmi note9', '液冷游戏芯，骁龙 750G一亿像素 夜景相机120Hz 六档变速高刷屏立体声双扬声器 + 线性马达4820mAh 充电宝级大电量 + 33W 闪充多功能 NFC + 双精准定位依然金刚品质', 1299.00, 988, 100, 'redmi note9.webp', 1, 1, '2022-01-16 21:18:33', '2022-04-02 14:00:03');
INSERT INTO `item` VALUES (4, '小米10', '骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC', 3399.00, 993, 100, 'redmi note9.webp', 1, 1, '2022-01-16 21:18:33', '2022-04-02 16:01:55');
INSERT INTO `item` VALUES (5, '小米10青春版', '向往的生活同款/ 50倍潜望式超远变焦 / 双模5G / 骁龙765G处理器 / 三星AMOLED原色屏 / 180Hz采样率 / 4160mAh大电池 / 多功能NFC / 红外遥控器', 2099.00, 998, 100, 'redmi note9.webp', 1, 1, '2022-01-16 21:18:33', '2022-04-02 16:15:53');
INSERT INTO `item` VALUES (6, 'Redmi智能电视A55', '超高清画质/立体声澎湃音效/海量影音资源/64位四核处理器/超窄边框', 1999.00, 996, 100, 'redmi note9.webp', 4, 1, '2022-01-16 21:28:55', '2022-04-02 21:35:54');
INSERT INTO `item` VALUES (7, 'iPhone 11', 'Apple iPhone 11 (A2223) 128GB 黑色 移动联通电信4G手机 双卡双待', 4869.00, 997, 100, 'redmi note9.webp', 1, 1, '2022-01-18 21:56:06', '2022-04-02 13:12:57');
INSERT INTO `item` VALUES (8, '小米Mix α', '创新环绕屏，极具未来感的智能交互体验 / 1亿像素超高清相机，超大感光元件 / 5G双卡全网通超高速网络 / 骁龙855Plus旗舰处理器 / 纳米硅基锂离子4050mAh电池，40W超级快充 / 钛合金+精密陶瓷+蓝宝石镜片前沿工艺', 19999.00, 996, 1, 'redmi note9.webp', 1, 1, '2022-01-19 00:08:30', '2022-04-02 16:56:34');
INSERT INTO `item` VALUES (9, 'Redmi Book', 'Redmi Book', 4999.00, 996, 999, 'redmi note9.webp', 2, 1, '2022-02-01 14:03:48', '2022-04-02 16:18:12');
INSERT INTO `item` VALUES (10, 'Redmi K30s', '骁龙865 / 144Hz[7档]变速高刷屏 / 专业原色显示+全局护眼 / 5000mAh大电量+33W快充 / 6400万AI三摄 / 立体声双扬声器+X轴马达 / LPDDR5+UFS3.1+WiFi6', 2999.00, 998, 99, 'redmi note9.webp', 1, 1, '2022-02-04 18:05:32', '2022-04-02 16:54:46');
INSERT INTO `item` VALUES (11, '佳能PowerShot G7 X Mark II G7X2', '佳能（Canon）PowerShot G7 X Mark II G7X2 数码相机 Vlog相机 视频拍摄---下单即送，延保服务 【Vlog视频拍摄神器】机内防抖、边走边拍', 3999.00, 999, 999, 'redmi note9.webp', 3, 1, '2022-02-05 16:37:46', '2022-04-02 16:37:46');
INSERT INTO `item` VALUES (12, '索尼 Alpha 7 III ', '索尼（SONY）Alpha 7 III 28-60mm全画幅微单数码相机 便携镜头套装（约2420万有效像素 5轴防抖 a7M3/A73/a7m3）【微单相机TOP明星机型，A7M3系列京东销量4万+】新款28-60mm镜头套装，体积进一步缩小，更加便携！实时眼部对焦，支持4K-HDR专业视频格式录制！', 13999.00, 998, 999, 'redmi note9.webp', 3, 1, '2022-02-05 16:42:18', '2022-04-02 22:34:07');
INSERT INTO `item` VALUES (13, '索尼（SONY）KD-65X9500H ', '索尼（SONY）KD-65X9500H 65英寸 4K超高清 HDR 液晶平板电视 全面屏 X1旗舰版图像芯片，全阵列背光LED精细控光，强悍X1图像芯片，侧面观看色彩依然出色！声音如屏幕发出，远场语音解放双手', 8399.00, 998, 999, 'redmi note9.webp', 4, 1, '2022-02-05 16:44:33', '2022-04-02 16:53:51');
INSERT INTO `item` VALUES (14, 'iPhone XR', 'iPhone XR', 3999.00, 11, 1, 'redmi note9.webp', 1, 1, '2022-03-21 09:55:17', '2022-04-02 10:33:01');
INSERT INTO `item` VALUES (1514883674226393090, '123', '123', 123.00, 123, 123, 'iphone-12-pro.jpg', 1, 1, '2022-04-15 16:29:47', '2022-04-15 16:29:47');

-- ----------------------------
-- Table structure for item_cat
-- ----------------------------
DROP TABLE IF EXISTS `item_cat`;
CREATE TABLE `item_cat`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '父分类ID=0时代表一级根分类',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` int NULL DEFAULT 1 COMMENT '状态 1启用 0禁用',
  `sort_order` int NULL DEFAULT NULL COMMENT '排列序号',
  `is_parent` tinyint(1) NULL DEFAULT 1 COMMENT '是否为父分类 1为true 0为false',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id` ASC, `status` ASC) USING BTREE,
  INDEX `sort_order`(`sort_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类目' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of item_cat
-- ----------------------------
INSERT INTO `item_cat` VALUES (1, 0000000000, '手机', 1, 1, 1, NULL, '各类手机', '2022-03-01 17:13:48', '2022-01-12 17:13:49');
INSERT INTO `item_cat` VALUES (2, 0000000000, '电脑', 1, 2, 1, NULL, '各类电脑', '2022-03-01 17:13:49', '2022-01-12 17:13:50');
INSERT INTO `item_cat` VALUES (3, 0000000000, '相机', 1, 3, 1, NULL, '各类相机', '2022-03-01 17:13:51', '2022-01-12 17:13:51');
INSERT INTO `item_cat` VALUES (4, 0000000000, '电视', 1, 4, 1, NULL, '各类电视', '2022-03-01 17:13:52', '2022-01-12 17:13:52');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录者',
  `status` int NULL DEFAULT NULL COMMENT '登录状态',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录IP',
  `browser` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录浏览器',
  `os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:11:15');
INSERT INTO `log` VALUES (2, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:13:31');
INSERT INTO `log` VALUES (3, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:15:19');
INSERT INTO `log` VALUES (4, 'admin', 0, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 1010.0', '2021-12-25 15:16:32');
INSERT INTO `log` VALUES (5, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:16:41');
INSERT INTO `log` VALUES (7, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:19:52');
INSERT INTO `log` VALUES (8, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:22:02');
INSERT INTO `log` VALUES (9, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:44:55');
INSERT INTO `log` VALUES (10, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:48:50');
INSERT INTO `log` VALUES (11, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 15:49:33');
INSERT INTO `log` VALUES (12, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 16:01:33');
INSERT INTO `log` VALUES (13, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 16:24:31');
INSERT INTO `log` VALUES (14, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 16:33:38');
INSERT INTO `log` VALUES (15, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 16:36:00');
INSERT INTO `log` VALUES (17, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-12-25 16:56:55');
INSERT INTO `log` VALUES (18, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2022-01-01 17:00:07');
INSERT INTO `log` VALUES (19, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2022-01-28 17:16:40');
INSERT INTO `log` VALUES (20, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2022-02-01 17:34:53');
INSERT INTO `log` VALUES (21, 'admin', 1, '10.78.12.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2022-02-01 17:37:08');
INSERT INTO `log` VALUES (22, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 13:59:02');
INSERT INTO `log` VALUES (23, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 14:31:48');
INSERT INTO `log` VALUES (24, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 14:37:14');
INSERT INTO `log` VALUES (25, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 14:54:15');
INSERT INTO `log` VALUES (26, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 14:56:32');
INSERT INTO `log` VALUES (27, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 14:57:03');
INSERT INTO `log` VALUES (28, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 15:00:32');
INSERT INTO `log` VALUES (29, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 15:06:27');
INSERT INTO `log` VALUES (30, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-03 15:26:52');
INSERT INTO `log` VALUES (31, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-07 10:00:30');
INSERT INTO `log` VALUES (32, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-21 16:44:10');
INSERT INTO `log` VALUES (33, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-21 16:56:47');
INSERT INTO `log` VALUES (34, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-21 17:06:48');
INSERT INTO `log` VALUES (35, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-02-21 17:09:48');
INSERT INTO `log` VALUES (36, 'admin', 0, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 1010.0', '2022-03-15 15:43:01');
INSERT INTO `log` VALUES (37, 'admin', 0, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 1010.0', '2022-03-15 15:43:05');
INSERT INTO `log` VALUES (38, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-03-15 15:43:11');
INSERT INTO `log` VALUES (39, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-03-17 08:55:19');
INSERT INTO `log` VALUES (40, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-03-17 09:03:22');
INSERT INTO `log` VALUES (41, 'admin', 0, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 1010.0', '2022-04-02 16:10:29');
INSERT INTO `log` VALUES (42, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-04-02 16:10:33');
INSERT INTO `log` VALUES (43, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-04-02 16:23:46');
INSERT INTO `log` VALUES (44, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-04-02 16:26:36');
INSERT INTO `log` VALUES (45, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-04-02 16:27:09');
INSERT INTO `log` VALUES (46, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-04-02 16:41:07');
INSERT INTO `log` VALUES (47, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-04-02 16:48:44');
INSERT INTO `log` VALUES (48, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome9', 'Windows 10', '2022-04-02 16:50:51');
INSERT INTO `log` VALUES (49, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome10', 'Windows 10', '2022-04-15 15:54:55');
INSERT INTO `log` VALUES (50, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome10', 'Windows 10', '2022-04-15 16:16:21');
INSERT INTO `log` VALUES (51, 'admin', 1, '0:0:0:0:0:0:0:1', 'chrome10', 'Windows 10', '2022-04-15 16:29:24');
INSERT INTO `log` VALUES (52, 'admin', 1, '127.0.0.1', 'chrome10', 'Windows 10', '2022-04-21 15:19:10');
INSERT INTO `log` VALUES (53, 'admin', 1, '127.0.0.1', 'chrome10', 'Windows 10', '2022-04-21 15:19:34');
INSERT INTO `log` VALUES (54, '17161783441', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:20:58');
INSERT INTO `log` VALUES (55, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:21:00');
INSERT INTO `log` VALUES (56, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:21:00');
INSERT INTO `log` VALUES (57, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:21:00');
INSERT INTO `log` VALUES (58, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:21:01');
INSERT INTO `log` VALUES (59, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:21:01');
INSERT INTO `log` VALUES (60, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:21:02');
INSERT INTO `log` VALUES (61, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:21:02');
INSERT INTO `log` VALUES (62, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:21:03');
INSERT INTO `log` VALUES (63, '', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:22:30');
INSERT INTO `log` VALUES (64, '17161783441', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:23:43');
INSERT INTO `log` VALUES (65, '17161783441', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:23:49');
INSERT INTO `log` VALUES (66, '17161783441', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:23:54');
INSERT INTO `log` VALUES (67, 'admin', 1, '127.0.0.1', 'chrome10', 'Windows 10', '2022-04-21 15:23:58');
INSERT INTO `log` VALUES (68, '17161783441', 1, '127.0.0.1', 'chrome10', 'Windows 10', '2022-04-21 15:25:24');
INSERT INTO `log` VALUES (69, '17161783441', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-21 15:25:40');
INSERT INTO `log` VALUES (70, '17161783441', 1, '127.0.0.1', 'chrome10', 'Windows 10', '2022-04-21 15:25:45');
INSERT INTO `log` VALUES (71, 'admin', 1, '127.0.0.1', 'chrome10', 'Windows 10', '2022-04-24 16:18:29');
INSERT INTO `log` VALUES (72, '17161783441', 1, '127.0.0.1', 'chrome10', 'Windows 10', '2022-04-24 16:20:00');
INSERT INTO `log` VALUES (73, 'admin', 0, '127.0.0.1', 'chrome10', 'Windows 1010.0', '2022-04-24 16:20:38');
INSERT INTO `log` VALUES (74, 'admin', 1, '127.0.0.1', 'chrome10', 'Windows 10', '2022-04-24 16:20:41');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录ip',
  `op_status` int NULL DEFAULT NULL COMMENT '操作状态',
  `op_event` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作事件',
  `op_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES (18, '0:0:0:0:0:0:0:1', 1, '修改用户数据', 'admin', '2022-02-03 13:59:56');
INSERT INTO `oplog` VALUES (19, '0:0:0:0:0:0:0:1', 1, '更新地址信息', 'admin', '2022-02-03 14:00:06');
INSERT INTO `oplog` VALUES (20, '0:0:0:0:0:0:0:1', 1, '将商品:iPhone 12 Pro加入到购物车', 'admin', '2022-02-21 16:47:13');
INSERT INTO `oplog` VALUES (21, '0:0:0:0:0:0:0:1', 1, '更新地址信息', 'admin', '2022-02-21 16:47:15');
INSERT INTO `oplog` VALUES (22, '0:0:0:0:0:0:0:1', 1, '购买了iPhone 12 Pro,数量为：1', 'admin', '2022-02-21 16:47:17');
INSERT INTO `oplog` VALUES (23, '0:0:0:0:0:0:0:1', 1, '删除订单号为：1495681521810235394的所有数据(包括订单表和订单详情表)', 'admin', '2022-02-21 16:47:28');
INSERT INTO `oplog` VALUES (24, '0:0:0:0:0:0:0:1', 1, '删除订单号为：1386252968628527106的所有数据(包括订单表和订单详情表)', 'admin', '2022-02-21 16:47:29');
INSERT INTO `oplog` VALUES (25, '0:0:0:0:0:0:0:1', 1, '删除订单号为：1386252423222210562的所有数据(包括订单表和订单详情表)', 'admin', '2022-02-21 16:47:30');
INSERT INTO `oplog` VALUES (26, '0:0:0:0:0:0:0:1', 1, '删除订单号为：1386249137534418945的所有数据(包括订单表和订单详情表)', 'admin', '2022-02-21 16:47:30');
INSERT INTO `oplog` VALUES (27, '0:0:0:0:0:0:0:1', 1, '删除订单号为：1357569678417580034的所有数据(包括订单表和订单详情表)', 'admin', '2022-02-21 16:47:31');
INSERT INTO `oplog` VALUES (28, '0:0:0:0:0:0:0:1', 1, '将商品:小米Mix α加入到购物车', 'admin', '2022-02-21 17:06:51');
INSERT INTO `oplog` VALUES (29, '0:0:0:0:0:0:0:1', 1, '更新地址信息', 'admin', '2022-02-21 17:06:56');
INSERT INTO `oplog` VALUES (30, '0:0:0:0:0:0:0:1', 1, '购买了小米Mix α,数量为：1', 'admin', '2022-02-21 17:06:59');
INSERT INTO `oplog` VALUES (31, '0:0:0:0:0:0:0:1', 1, '将商品:Redmi note9加入到购物车', 'admin', '2022-02-21 17:09:53');
INSERT INTO `oplog` VALUES (32, '0:0:0:0:0:0:0:1', 1, '更新地址信息', 'admin', '2022-02-21 17:09:56');
INSERT INTO `oplog` VALUES (33, '0:0:0:0:0:0:0:1', 1, '购买了Redmi note9,数量为：1', 'admin', '2022-02-21 17:09:58');
INSERT INTO `oplog` VALUES (34, '0:0:0:0:0:0:0:1', 1, '将商品:iPhone 12 Pro加入到购物车', 'admin', '2022-04-02 16:26:15');
INSERT INTO `oplog` VALUES (35, '0:0:0:0:0:0:0:1', 1, '将商品:iPhone 12 Pro加入到购物车', 'admin', '2022-04-15 15:55:00');
INSERT INTO `oplog` VALUES (36, '0:0:0:0:0:0:0:1', 1, '删除了购物车中第98条数据，商品名称为：iPhone 12 Pro', 'admin', '2022-04-15 15:55:04');
INSERT INTO `oplog` VALUES (37, '0:0:0:0:0:0:0:1', 1, '更新地址信息', 'admin', '2022-04-15 15:55:13');
INSERT INTO `oplog` VALUES (38, '0:0:0:0:0:0:0:1', 1, '购买了iPhone 12 Pro,数量为：1', 'admin', '2022-04-15 15:55:15');
INSERT INTO `oplog` VALUES (39, '0:0:0:0:0:0:0:1', 1, '新增商品数据', 'admin', '2022-04-15 15:56:36');
INSERT INTO `oplog` VALUES (40, '0:0:0:0:0:0:0:1', 1, '删除ID为：1514875322914054145的商品数据', 'admin', '2022-04-15 16:23:51');
INSERT INTO `oplog` VALUES (41, '0:0:0:0:0:0:0:1', 1, '新增商品数据', 'admin', '2022-04-15 16:24:14');
INSERT INTO `oplog` VALUES (42, '0:0:0:0:0:0:0:1', 1, '删除ID为：1514882278408167425的商品数据', 'admin', '2022-04-15 16:29:32');
INSERT INTO `oplog` VALUES (43, '0:0:0:0:0:0:0:1', 1, '新增商品数据', 'admin', '2022-04-15 16:29:47');
INSERT INTO `oplog` VALUES (44, '127.0.0.1', 1, '新增用户数据', 'admin', '2022-04-21 15:20:46');
INSERT INTO `oplog` VALUES (45, '127.0.0.1', 1, '修改用户数据', '17161783441', '2022-04-21 15:25:30');
INSERT INTO `oplog` VALUES (46, '127.0.0.1', 1, '将商品:iPhone 12 Pro加入到购物车', '17161783441', '2022-04-24 16:20:11');
INSERT INTO `oplog` VALUES (47, '127.0.0.1', 1, '新增地址信息', '17161783441', '2022-04-24 16:20:18');
INSERT INTO `oplog` VALUES (48, '127.0.0.1', 1, '购买了iPhone 12 Pro,数量为：1', '17161783441', '2022-04-24 16:20:20');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NOT NULL COMMENT '订单主键',
  `item_id` bigint NOT NULL COMMENT '商品主键',
  `quantity` int NOT NULL COMMENT '数量',
  `cost` decimal(10, 0) NOT NULL COMMENT '消费',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___66E1BD8E2F10007B`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (109, 1357563474874077185, 4, 1, 3399, 1);
INSERT INTO `order_detail` VALUES (110, 1357563474874077185, 2, 1, 3999, 1);
INSERT INTO `order_detail` VALUES (111, 1357569122378584066, 3, 1, 1299, 0);
INSERT INTO `order_detail` VALUES (112, 1357569678417580034, 3, 1, 1299, 1);
INSERT INTO `order_detail` VALUES (113, 1357642883777875970, 1357611052827332609, 1, 8399, 1);
INSERT INTO `order_detail` VALUES (114, 1357699048016633858, 1357610485329612801, 1, 13999, 0);
INSERT INTO `order_detail` VALUES (115, 1386249137534418945, 4, 1, 3399, 1);
INSERT INTO `order_detail` VALUES (116, 1386249137534418945, 1351199794234359810, 1, 19999, 1);
INSERT INTO `order_detail` VALUES (117, 1386252423222210562, 4, 1, 3399, 1);
INSERT INTO `order_detail` VALUES (118, 1386252968628527106, 1356121046824734722, 1, 4999, 1);
INSERT INTO `order_detail` VALUES (119, 1495681521810235394, 1, 1, 8499, 1);
INSERT INTO `order_detail` VALUES (120, 1495686475585179650, 8, 1, 19999, 0);
INSERT INTO `order_detail` VALUES (121, 1495687228974452738, 3, 1, 1299, 0);
INSERT INTO `order_detail` VALUES (122, 1514874983393533953, 1, 1, 8499, 0);
INSERT INTO `order_detail` VALUES (123, 1518142787220729858, 1, 1, 8499, 0);

-- ----------------------------
-- Table structure for order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `order_shipping`;
CREATE TABLE `order_shipping`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人全名',
  `receiver_mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_shipping
-- ----------------------------
INSERT INTO `order_shipping` VALUES (1, 2, '123123', '1314520', '上海市', '10000', '2022-01-25 17:14:09', '2022-04-02 17:14:09');
INSERT INTO `order_shipping` VALUES (2, 1, 'admin', '13570926543', '北京市', '10000', '2022-01-25 17:14:10', '2022-04-02 17:14:11');
INSERT INTO `order_shipping` VALUES (10, 3, 'gee', '123456', '南昌市', '', '2022-01-25 17:14:11', '2022-04-02 17:14:12');
INSERT INTO `order_shipping` VALUES (11, 6, 'me', '+8617161783441', '哈尔滨市', '100000', '2022-04-24 16:20:18', '2022-04-24 16:20:18');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '所有权限');
INSERT INTO `role` VALUES (2, '管理员', NULL);
INSERT INTO `role` VALUES (3, '普通用户', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `identity` bigint NULL DEFAULT NULL COMMENT '用户身份',
  `status` int UNSIGNED NULL DEFAULT 0 COMMENT '登录状态',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `adress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin', 1, 1, '123456@qq.com', '123456', '北京市', '2022-01-25 17:14:22', '2022-04-02 18:00:08');
INSERT INTO `user` VALUES (2, 'test', '123123', '123123', 2, 0, 'test@qq.com', '1314520', '上海市', '2022-01-25 17:14:27', '2022-04-02 17:25:21');
INSERT INTO `user` VALUES (3, 'gee', '123456', 'gee', 3, 0, 'gee@qq.com', '111111', '南昌市', '2022-01-25 17:14:30', '2022-04-02 17:57:07');
INSERT INTO `user` VALUES (5, 'test1', '123456', 'test1', 3, 0, 'test1@qq.com', '111111', '深圳市', '2022-01-31 17:54:53', '2022-04-02 17:54:53');
INSERT INTO `user` VALUES (6, '17161783441', 'menyuhao', 'me', 3, 0, 'ykonghao@icloud.com', '17161783441', '哈尔滨市', '2022-04-21 15:20:46', '2022-04-21 15:20:46');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint NOT NULL,
  `ROLE_ID` bigint NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 2);

SET FOREIGN_KEY_CHECKS = 1;
