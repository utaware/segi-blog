/*
Navicat MySQL Data Transfer

Source Server         : utaware
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : dev

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2018-12-04 21:10:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(12) NOT NULL COMMENT '用户id',
  `alias` char(24) NOT NULL COMMENT '用户昵称',
  `birthday` date DEFAULT NULL COMMENT '用户年龄',
  `adress` varchar(32) DEFAULT NULL COMMENT '用户地址',
  `privilege` enum('4','3','2','1','0') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '0-普通成员 1-主负责人 2-模块负责人 3-总负责人 4-root',
  `avatar` varchar(64) DEFAULT NULL COMMENT '用户头像',
  `role` enum('4','3','2','1','0') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '0-待分配 1-前端 2-测试 3-UI 4-后台',
  `phone` char(12) DEFAULT NULL COMMENT '手机号码',
  `create_time` datetime NOT NULL COMMENT '账号创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('6', 'akane', null, null, null, null, null, null, '2018-12-03 15:42:34', null);

-- ----------------------------
-- Table structure for user_list
-- ----------------------------
DROP TABLE IF EXISTS `user_list`;
CREATE TABLE `user_list` (
  `user_id` int(12) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `create_time` datetime NOT NULL COMMENT '账号创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '用户信息修改时间',
  `hash` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'bcrypt加密后的hash值',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_list
-- ----------------------------
INSERT INTO `user_list` VALUES ('6', 'akane', null, '2018-12-03 15:42:34', null, '$2b$10$r1dByTJLCWEo5tvMKqzjKOlqbUuMcoEIZf.zAr8YUrXmCsBPovXq6');
DROP TRIGGER IF EXISTS `increaseUserInfo`;
DELIMITER ;;
CREATE TRIGGER `increaseUserInfo` AFTER INSERT ON `user_list` FOR EACH ROW BEGIN
SET @user_id = new.user_id;
SET @user_name = new.username;
SET @create_time = new.create_time;
INSERT user_info (
    `user_id`, `alias`, `birthday`, `adress`, `privilege`, `avatar`, `role`, `phone`, `create_time`, `update_time`
) VALUES(
    @user_id, @user_name, NULL, NULL, NULL, NULL, NULL, NULL, @create_time, NULL
);
END
;;
DELIMITER ;
