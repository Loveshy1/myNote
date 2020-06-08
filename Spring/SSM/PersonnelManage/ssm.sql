/*
Navicat MySQL Data Transfer

Source Server         : cai
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2020-05-13 21:32:55
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `money` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO account VALUES ('1', 'asd', '242.2');
INSERT INTO account VALUES ('2', '蔡碧霞', '9999.9');
INSERT INTO account VALUES ('3', '蔡大娇', '23.5');
INSERT INTO account VALUES ('4', 'aa', '342');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(30) NOT NULL,
  `leader` varchar(30) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `isdelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departmentName` (`departmentName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO department VALUES ('1', '技术', '张三', null, '0');
INSERT INTO department VALUES ('2', '客服', '李四', null, '0');
INSERT INTO department VALUES ('3', '市场', '王五', null, '0');
INSERT INTO department VALUES ('4', '营销', '钱六', null, '0');
INSERT INTO department VALUES ('5', '人事', '赵七', null, '0');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `departmentName` varchar(30) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `indate` date DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  `outdate` date DEFAULT NULL,
  `isdelete` int(11) DEFAULT NULL,
  `del_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO employee VALUES ('1001', 'A', '0', '123@qq.com', '技术', '13290718551', '2020-04-16', '', null, '0', null);
INSERT INTO employee VALUES ('1002', 'Bi', '1', '456@qq.com', '客服', '13290718551', '2020-04-16', '', null, '0', null);
INSERT INTO employee VALUES ('1003', 'C', '0', '789@qq.com', '市场', '13290718551', '2020-04-16', '', null, '0', null);
INSERT INTO employee VALUES ('1004', 'Dd', '1', 'abc@qq.com', '人事', '13290718551', '2020-04-16', '', null, '0', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'admin', '123456');
