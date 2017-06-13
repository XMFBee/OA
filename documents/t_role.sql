/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : ht_oa

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-09 15:38:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleid` varchar(32) NOT NULL COMMENT '角色编号',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('402880a05980c08f015980ce4a200000', '学生', '学生描述', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa015925803c1bac21', '辅导老师', '辅导', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa015925803c1faa21', '任课老师', '专业', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa0159258aaa1f3221', '班主任', '班主任', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e786590002', '后勤部主任', '管理东西', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e81bf90003', '财务部主任', '管理钱', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e8f3c70004', '行政部主任', '管理层', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e992840005', '总经理', '老大', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e9f58e0006', '招生老师', '招生', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976ea96bf0007', '教务部主任', '教课', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976edf2770008', '招生部主任', '招生', '1');
