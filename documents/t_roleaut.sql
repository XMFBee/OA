/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : ht_oa

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-09 19:38:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_roleaut
-- ----------------------------
DROP TABLE IF EXISTS `t_roleaut`;
CREATE TABLE `t_roleaut` (
  `autrolid` int(11) NOT NULL AUTO_INCREMENT,
  `autid` int(11) DEFAULT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`autrolid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
