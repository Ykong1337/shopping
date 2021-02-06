/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : shoppingmall

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 06/02/2021 18:32:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `item_id` bigint(20) NOT NULL COMMENT '商品id',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '花费金额',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品标题',
  `img` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品图片',
  `num` int(10) NULL DEFAULT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`, `item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for iorder
-- ----------------------------
DROP TABLE IF EXISTS `iorder`;
CREATE TABLE `iorder`  (
  `id` bigint(20) NOT NULL COMMENT '订单id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `buyer_nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '买家昵称',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `payment` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '订单更新时间',
  `deleted` int(1) UNSIGNED NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iorder
-- ----------------------------
INSERT INTO `iorder` VALUES (1357563474874077185, 1, 'admin', '北京市', 7398.00, NULL, NULL, 0);
INSERT INTO `iorder` VALUES (1357569122378584066, 1, 'admin', '北京市', 1299.00, NULL, NULL, 0);
INSERT INTO `iorder` VALUES (1357569678417580034, 1, 'admin', '北京市', 1299.00, NULL, NULL, 0);
INSERT INTO `iorder` VALUES (1357642883777875970, 1, 'admin', '北京市', 8399.00, NULL, NULL, 0);
INSERT INTO `iorder` VALUES (1357699048016633858, 2, '奔跑的野猪', '上海市', 13999.00, NULL, NULL, 0);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` bigint(20) NOT NULL COMMENT '商品ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `sell_point` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖点',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `num` int(11) NULL DEFAULT 999 COMMENT '库存',
  `limit_num` int(11) NULL DEFAULT NULL COMMENT '售卖数量限制',
  `image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `cid` bigint(20) NULL DEFAULT NULL COMMENT '分类ID',
  `status` int(1) NULL DEFAULT 1 COMMENT '商品状态 1正常 0下架',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_fk`(`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, 'iPhone 12 Pro', 'iPhone年度旗舰', 8499.00, 977, 99, '2021-02/579D1B469A594B3991E793CAE05E497F.jpg', 1, 1, '2021-01-16 21:18:33', '2021-02-05 13:13:03');
INSERT INTO `item` VALUES (2, '小米11', '小米11 5G 骁龙888 /2K AMOLED四曲面柔性屏/ 1亿像素/ 55W有线闪充/ 50W无线闪充 /8GB+256GB /蓝色 /游戏手机', 3999.00, 834, 100, '2021-02/6D2C8C68B81243F08B18C436541B24EE.webp', 1, 1, '2021-01-16 21:18:33', '2021-02-05 13:35:22');
INSERT INTO `item` VALUES (3, 'Redmi note9', '液冷游戏芯，骁龙 750G一亿像素 夜景相机120Hz 六档变速高刷屏立体声双扬声器 + 线性马达4820mAh 充电宝级大电量 + 33W 闪充多功能 NFC + 双精准定位依然金刚品质', 1299.00, 989, 100, '2021-02/000A8D9C7E164CDF8BB5FABC29ECD584.webp', 1, 1, '2021-01-16 21:18:33', '2021-02-05 14:00:03');
INSERT INTO `item` VALUES (4, '小米10', '骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC', 3399.00, 995, 100, '2021-02/443F678B4C1A43E08C19A20E96AD77DB.webp', 1, 1, '2021-01-16 21:18:33', '2021-02-05 13:17:42');
INSERT INTO `item` VALUES (1350432252611985409, '小米10青春版', '向往的生活同款/ 50倍潜望式超远变焦 / 双模5G / 骁龙765G处理器 / 三星AMOLED原色屏 / 180Hz采样率 / 4160mAh大电池 / 多功能NFC / 红外遥控器', 2099.00, 998, 100, '2021-02/464AF2015421406D8BF95473FB82A2F8.jpg', 1, 1, '2021-01-16 21:18:33', '2021-02-04 16:15:53');
INSERT INTO `item` VALUES (1350434858730254338, 'Redmi智能电视A55', '超高清画质/立体声澎湃音效/海量影音资源/64位四核处理器/超窄边框', 1999.00, 996, 100, '2021-02/05E233DA2C1C428FB66340EA96510AC5.webp', 4, 1, '2021-01-16 21:28:55', '2021-02-04 21:35:54');
INSERT INTO `item` VALUES (1351166477522927618, 'iPhone 11', 'Apple iPhone 11 (A2223) 128GB 黑色 移动联通电信4G手机 双卡双待', 4869.00, 997, 100, '2021-02/F6134A83062D4957BB14D8A64A8FBF5E.jpg', 1, 1, '2021-01-18 21:56:06', '2021-02-05 13:12:57');
INSERT INTO `item` VALUES (1351199794234359810, '小米Mix α', '创新环绕屏，极具未来感的智能交互体验 / 1亿像素超高清相机，超大感光元件 / 5G双卡全网通超高速网络 / 骁龙855Plus旗舰处理器 / 纳米硅基锂离子4050mAh电池，40W超级快充 / 钛合金+精密陶瓷+蓝宝石镜片前沿工艺', 19999.00, 998, 1, '2021-02/5F5A18A263184184B8306E30981397F7.webp', 1, 1, '2021-01-19 00:08:30', '2021-02-05 16:56:34');
INSERT INTO `item` VALUES (1356121046824734722, 'Redmi Book', 'Redmi Book', 4999.00, 997, 999, '2021-02/B7C943FF1A9E46FF9CCCAE1860C79228.webp', 2, 1, '2021-02-01 14:03:48', '2021-02-04 16:18:12');
INSERT INTO `item` VALUES (1357269045126762498, 'Redmi K30s', '骁龙865 / 144Hz[7档]变速高刷屏 / 专业原色显示+全局护眼 / 5000mAh大电量+33W快充 / 6400万AI三摄 / 立体声双扬声器+X轴马达 / LPDDR5+UFS3.1+WiFi6', 2999.00, 998, 99, '2021-02/2E600A4B355A4F47907FD188F663291C.webp', 1, 1, '2021-02-04 18:05:32', '2021-02-05 12:10:02');
INSERT INTO `item` VALUES (1357609345493946369, '佳能PowerShot G7 X Mark II G7X2', '佳能（Canon）PowerShot G7 X Mark II G7X2 数码相机 Vlog相机 视频拍摄---下单即送，延保服务 【Vlog视频拍摄神器】机内防抖、边走边拍', 3999.00, 999, 999, '2021-02/14609E58AC8D403E9416BD13833064DA.jpg', 3, 1, '2021-02-05 16:37:46', '2021-02-05 16:37:46');
INSERT INTO `item` VALUES (1357610485329612801, '索尼 Alpha 7 III ', '索尼（SONY）Alpha 7 III 28-60mm全画幅微单数码相机 便携镜头套装（约2420万有效像素 5轴防抖 a7M3/A73/a7m3）【微单相机TOP明星机型，A7M3系列京东销量4万+】新款28-60mm镜头套装，体积进一步缩小，更加便携！实时眼部对焦，支持4K-HDR专业视频格式录制！', 13999.00, 998, 999, '2021-02/C6D245C1C8134C728DF8E1EB4323AC91.jpg', 3, 1, '2021-02-05 16:42:18', '2021-02-05 22:34:07');
INSERT INTO `item` VALUES (1357611052827332609, '索尼（SONY）KD-65X9500H ', '索尼（SONY）KD-65X9500H 65英寸 4K超高清 HDR 液晶平板电视 全面屏 X1旗舰版图像芯片，全阵列背光LED精细控光，强悍X1图像芯片，侧面观看色彩依然出色！声音如屏幕发出，远场语音解放双手', 8399.00, 998, 999, '2021-02/DB22EC7942944090AE95ECD68422AB07.jpg', 4, 1, '2021-02-05 16:44:33', '2021-02-05 18:50:57');

-- ----------------------------
-- Table structure for item_cat
-- ----------------------------
DROP TABLE IF EXISTS `item_cat`;
CREATE TABLE `item_cat`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '父分类ID=0时代表一级根分类',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1启用 0禁用',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排列序号',
  `is_parent` tinyint(1) NULL DEFAULT 1 COMMENT '是否为父分类 1为true 0为false',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `status`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1186 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_cat
-- ----------------------------
INSERT INTO `item_cat` VALUES (1, 0000000000, '手机', 1, 1, 1, NULL, '各类手机', NULL, NULL);
INSERT INTO `item_cat` VALUES (2, 0000000000, '电脑', 1, 2, 1, NULL, '各类电脑', NULL, NULL);
INSERT INTO `item_cat` VALUES (3, 0000000000, '相机', 1, 3, 1, NULL, '各类相机', NULL, NULL);
INSERT INTO `item_cat` VALUES (4, 0000000000, '电视', 1, 4, 1, NULL, '各类电视', NULL, NULL);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单主键',
  `item_id` bigint(20) NOT NULL COMMENT '商品主键',
  `quantity` int(10) NOT NULL COMMENT '数量',
  `cost` decimal(10, 0) NOT NULL COMMENT '消费',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___66E1BD8E2F10007B`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (109, 1357563474874077185, 4, 1, 3399, 0);
INSERT INTO `order_detail` VALUES (110, 1357563474874077185, 2, 1, 3999, 0);
INSERT INTO `order_detail` VALUES (111, 1357569122378584066, 3, 1, 1299, 0);
INSERT INTO `order_detail` VALUES (112, 1357569678417580034, 3, 1, 1299, 0);
INSERT INTO `order_detail` VALUES (113, 1357642883777875970, 1357611052827332609, 1, 8399, 0);
INSERT INTO `order_detail` VALUES (114, 1357699048016633858, 1357610485329612801, 1, 13999, 0);

-- ----------------------------
-- Table structure for order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `order_shipping`;
CREATE TABLE `order_shipping`  (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人全名',
  `receiver_mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_shipping
-- ----------------------------
INSERT INTO `order_shipping` VALUES (1, 2, '奔跑的野猪', '1314520', '上海市', '10000', NULL, NULL);
INSERT INTO `order_shipping` VALUES (2, 1, 'admin', '13570926543', '北京市', '10000', NULL, NULL);
INSERT INTO `order_shipping` VALUES (10, 3, 'gee', '123456', '南昌市', '', NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `identity` bigint(20) NULL DEFAULT NULL COMMENT '用户身份',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `adress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(1) UNSIGNED NULL DEFAULT 0 COMMENT '登录状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin', 1, '123456@qq.com', '123456', '北京市', NULL, '2021-02-05 22:28:57', 0);
INSERT INTO `user` VALUES (2, 'test', '123456', '奔跑的野猪', 2, 'test@qq.com', '1314520', '上海市', NULL, '2021-02-05 22:31:11', 1);
INSERT INTO `user` VALUES (3, 'gee', '123456', 'gee', 3, 'gee@qq.com', '111111', '南昌市', NULL, '2021-01-31 17:57:07', 0);
INSERT INTO `user` VALUES (5, 'test1', '123456', 'test1', 3, 'test1@qq.com', '111111', '深圳市', '2021-01-31 17:54:53', '2021-01-31 17:54:53', 0);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 2);

SET FOREIGN_KEY_CHECKS = 1;
