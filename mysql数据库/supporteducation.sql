/*
Navicat MySQL Data Transfer

Source Server         : 139.196.98.33
Source Server Version : 50528
Source Host           : 139.196.98.33:3306
Source Database       : supporteducation

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2020-03-25 08:52:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sqr` int(11) DEFAULT NULL,
  `sqTime` datetime DEFAULT NULL,
  `releaseId` int(11) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('6', '38', '2020-01-24 00:00:00', '1', '1');
INSERT INTO `apply` VALUES ('15', '39', '2020-02-01 00:00:00', '1', '1');
INSERT INTO `apply` VALUES ('16', '39', '2020-02-01 14:42:47', '2', '0');
INSERT INTO `apply` VALUES ('17', '37', '2020-02-15 11:51:05', '3', '0');
INSERT INTO `apply` VALUES ('18', '47', '2020-03-22 00:00:00', '4', '1');
INSERT INTO `apply` VALUES ('19', '67', '2020-03-22 00:00:00', '3', '1');

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nr` varchar(255) DEFAULT NULL,
  `pjr` int(11) DEFAULT NULL,
  `usersId` int(11) DEFAULT NULL,
  `pjTime` datetime DEFAULT NULL,
  `releaseId` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `bpj` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('7', 'sdf', '38', '38', '2020-02-01 10:56:15', '1', 'sdf', '39');
INSERT INTO `evaluate` VALUES ('8', '教师评论教师评论教师评论', '39', '38', '2020-02-01 11:04:18', '1', '教师评论', '38');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `nr` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('2', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');
INSERT INTO `message` VALUES ('3', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('4', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('7', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');
INSERT INTO `message` VALUES ('8', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('9', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');
INSERT INTO `message` VALUES ('10', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('11', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');
INSERT INTO `message` VALUES ('12', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('13', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');
INSERT INTO `message` VALUES ('14', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('15', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');
INSERT INTO `message` VALUES ('17', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');
INSERT INTO `message` VALUES ('18', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('19', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');
INSERT INTO `message` VALUES ('20', '2020-01-28 13:45:43', '撒旦撒旦发生的', '适当放松的水水水水水水', '1');
INSERT INTO `message` VALUES ('21', '2020-02-19 10:31:40', 'sdf', 'sdfsf', '38');

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('2', '/resource/upload/1944d03522d5527cc70033730debcbd95.jpg');
INSERT INTO `photo` VALUES ('3', '/resource/upload/f233f6221647a3dd41eea54e3637e6bf2.jpg');
INSERT INTO `photo` VALUES ('4', '/resource/upload/3aa7c0b28d65c84fb692d580475b40dftimg.jpg');
INSERT INTO `photo` VALUES ('5', '/resource/upload/a93e214041d6e2d86e83e86d90644f584.jpg');
INSERT INTO `photo` VALUES ('6', '/resource/upload/d086c0e775d58f54f3fa072517401179timg.jpg');
INSERT INTO `photo` VALUES ('7', '/resource/upload/54cd4dce7612bb9269962f85e382bcbc5.jpg');

-- ----------------------------
-- Table structure for releases
-- ----------------------------
DROP TABLE IF EXISTS `releases`;
CREATE TABLE `releases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) DEFAULT NULL,
  `rs` int(255) DEFAULT NULL,
  `zjTime` datetime DEFAULT NULL,
  `fwTime` datetime DEFAULT NULL,
  `lxr` varchar(255) DEFAULT NULL,
  `lxfs` varchar(255) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  `isFb` int(11) DEFAULT NULL,
  `fbTime` datetime DEFAULT NULL,
  `usersId` int(11) DEFAULT NULL,
  `syrs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of releases
-- ----------------------------
INSERT INTO `releases` VALUES ('1', '1', '10', '2020-01-23 00:00:00', '2020-01-31 00:00:00', '张三', '13812407739', '招聘职位招聘职位招聘职位招聘职位', '1', '2020-01-23 00:00:00', '38', '7');
INSERT INTO `releases` VALUES ('2', '2', '1', '2020-02-28 00:00:00', '2020-03-27 00:00:00', '发布测试', '13812407739', '11111', '1', null, '38', '0');
INSERT INTO `releases` VALUES ('3', '5', '33', '2020-02-12 00:00:00', '2020-03-21 00:00:00', '是是是', '18761424856', '3333', '0', null, '37', '31');
INSERT INTO `releases` VALUES ('4', '6', '3453', '2020-02-23 00:00:00', '2020-02-28 00:00:00', '34535', '13812407739', '345', '0', null, '38', '3451');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `idDelete` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '新闻资讯', null);
INSERT INTO `type` VALUES ('2', '法律资讯', null);
INSERT INTO `type` VALUES ('5', '十分舒服', null);
INSERT INTO `type` VALUES ('6', '职位', null);
INSERT INTO `type` VALUES ('9', '计算机', null);
INSERT INTO `type` VALUES ('10', '洪文', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `isDelete` int(11) DEFAULT '0',
  `role` int(11) DEFAULT '0',
  `Phone` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sfz` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `schoolJs` varchar(255) DEFAULT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `isSh` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'administrators', '0', '0', '13812407739', '111111', '/resource/upload/2044353191333.jpg', '1111111', '1111', '1111', '', '1');
INSERT INTO `users` VALUES ('37', '1', '南京大学', '0', '2', '13812407739', '1', '/resource/upload/9278552265.jpg', '1', '江苏省南京市鼓楼区汉口路22号', '南京大学南京大学南京大学', '南京大学', '1');
INSERT INTO `users` VALUES ('38', 'admin2', '中国传媒大学南广学院1', '0', '2', '13812407739', '1', '/resource/upload/-18257322743.jpg', '32030456445647879', '江苏省南京市江宁区弘景大道3666号', '江苏省南京市江宁区弘景大道3666号江苏省南京市江宁区弘景大道3666号1', '中国传媒大学南广学院1', '1');
INSERT INTO `users` VALUES ('39', '22', '22', '0', '3', '13812407793', '22', '/resource/upload/-1479801525test.jpg', '22', '22', '真的VB', null, '1');
INSERT INTO `users` VALUES ('40', '33', '江苏省南京工程高等职业学校', '0', '2', '13812407739', '44', '/resource/upload/20328216783.jpg', '44', '南京市中山门外麒西路68号', '江苏省南京工程高等职业学校江苏省南京工程高等职业学校', '江苏省南京工程高等职业学校', '1');
INSERT INTO `users` VALUES ('41', '5', '金陵科技学院22', '0', '2', '13812407793', '6', '/resource/upload/20328302203.jpg', '6', ':南京市江宁区弘景大道99号 ', ':南京市江宁区弘景大道99号 :南京市江宁区弘景大道99号 ', '金陵科技学院', '1');
INSERT INTO `users` VALUES ('46', '1111', '2222', '0', '1', '11111111111', '1', '/resource/upload/-273310999timg3.jpg', '66666', '7777', '88888', '9999', '1');
INSERT INTO `users` VALUES ('47', 'aaa', 'aaa', '0', '3', '13812407739', 'aaa', '/resource/upload/5806867615499592841.jpg', '22', 'aaaa', 'aaaaa', 'aa', '1');
INSERT INTO `users` VALUES ('54', '111wwwww', '1111', '0', '0', '11111111111', '111111', '/resource/upload/204412319900c163b0323c11e720ede353dd7395b1timg8.jpeg', '111', 'www', '', null, '1');
INSERT INTO `users` VALUES ('55', '11111232', '1111123423424', '0', '0', '13812407739', '111111', '/resource/upload/20443805154.jpg', 'admin', '1111111', '111', null, '1');
INSERT INTO `users` VALUES ('56', '2535345', '333333', '0', '0', '13812407739', '111111', '/resource/upload/20445380205.jpg', 'admin', '111', '1111', null, '1');
INSERT INTO `users` VALUES ('64', '4444', '4444', '0', '1', '11111111111', '4444', '/resource/upload/', '4444', '4444', '4444', null, '1');
INSERT INTO `users` VALUES ('65', '5555', '5555', '0', '2', '12345678900', '555', '/resource/upload/20468069730ec695e0277211e7f22208d5914928c12017-04-09_200106.png', '555', '5555', '5555', null, '1');
INSERT INTO `users` VALUES ('66', '23424', '234234', '0', '2', '13815212311', '111111', '/resource/upload/-1707724169333.jpg', '1423424', '234', '234234', '234', '1');
INSERT INTO `users` VALUES ('67', '111', '111', '0', '3', '13812407739', '111', '/resource/upload/-155092705955.jpg', '13232233323232', '111', '1111', '11', '1');
