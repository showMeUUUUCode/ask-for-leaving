/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50624
Source Host           : 120.78.160.65:3306
Source Database       : zk

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-03-28 11:09:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `module_p`
-- ----------------------------
DROP TABLE IF EXISTS `module_p`;
CREATE TABLE `module_p` (
  `MODULE_ID` varchar(40) NOT NULL,
  `PARENT_ID` varchar(40) DEFAULT NULL COMMENT '父模块ID',
  `NAME` varchar(100) DEFAULT NULL,
  `CTYPE` int(11) DEFAULT NULL COMMENT '1主菜单/2左侧菜单/3按钮',
  `STATE` int(11) DEFAULT NULL COMMENT '1启用0停用',
  `ORDER_NO` int(11) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module_p
-- ----------------------------
INSERT INTO `module_p` VALUES ('143e95ad-a256-4e89-9632-84510834c6a2', '', '用户管理', '1', '1', '2', '对用户权限的分配以及角色的模块分配', null, null, '2017-11-23 17:40:05', null, '2017-03-24 20:46:54');
INSERT INTO `module_p` VALUES ('4da326ea-849c-4e36-976b-96695610d1bb', '', '审批管理', '1', '1', '3', '由拥有审批权限的用户对假条的审批入口', null, null, '2017-11-23 17:39:53', null, '2017-03-24 20:47:13');
INSERT INTO `module_p` VALUES ('b2e715b9-dd3a-436e-9b98-86662f6a68e3', '', '我要请假', '1', '1', '1', '发起请假申请的入口', null, null, '2017-11-23 17:39:29', null, '2017-03-24 20:46:28');

-- ----------------------------
-- Table structure for `role_module_p`
-- ----------------------------
DROP TABLE IF EXISTS `role_module_p`;
CREATE TABLE `role_module_p` (
  `MODULE_ID` varchar(40) DEFAULT NULL,
  `ROLE_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_module_p
-- ----------------------------
INSERT INTO `role_module_p` VALUES ('b2e715b9-dd3a-436e-9b98-86662f6a68e3', 'e5fe6075-0e81-464f-beae-8f5458ad2968');
INSERT INTO `role_module_p` VALUES ('143e95ad-a256-4e89-9632-84510834c6a2', 'e5fe6075-0e81-464f-beae-8f5458ad2968');
INSERT INTO `role_module_p` VALUES ('4da326ea-849c-4e36-976b-96695610d1bb', 'e5fe6075-0e81-464f-beae-8f5458ad2968');
INSERT INTO `role_module_p` VALUES ('b2e715b9-dd3a-436e-9b98-86662f6a68e3', '5f5fc576-d5c4-4805-b5aa-f6614c55cd35');
INSERT INTO `role_module_p` VALUES ('143e95ad-a256-4e89-9632-84510834c6a2', '5f5fc576-d5c4-4805-b5aa-f6614c55cd35');
INSERT INTO `role_module_p` VALUES ('4da326ea-849c-4e36-976b-96695610d1bb', '5f5fc576-d5c4-4805-b5aa-f6614c55cd35');
INSERT INTO `role_module_p` VALUES ('b2e715b9-dd3a-436e-9b98-86662f6a68e3', '5127a60d-8c1b-4bda-b8b9-06096533a400');
INSERT INTO `role_module_p` VALUES ('b2e715b9-dd3a-436e-9b98-86662f6a68e3', '21da7649-4170-42ca-a8da-6eaa62b0f315');
INSERT INTO `role_module_p` VALUES ('143e95ad-a256-4e89-9632-84510834c6a2', '21da7649-4170-42ca-a8da-6eaa62b0f315');
INSERT INTO `role_module_p` VALUES ('4da326ea-849c-4e36-976b-96695610d1bb', '21da7649-4170-42ca-a8da-6eaa62b0f315');
INSERT INTO `role_module_p` VALUES ('b2e715b9-dd3a-436e-9b98-86662f6a68e3', '1ad04d83-2d19-4c47-bafb-59cc5797c63a');
INSERT INTO `role_module_p` VALUES ('4da326ea-849c-4e36-976b-96695610d1bb', '1ad04d83-2d19-4c47-bafb-59cc5797c63a');

-- ----------------------------
-- Table structure for `role_p`
-- ----------------------------
DROP TABLE IF EXISTS `role_p`;
CREATE TABLE `role_p` (
  `ROLE_ID` varchar(40) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `REMARKS` varchar(100) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_p
-- ----------------------------
INSERT INTO `role_p` VALUES ('1ad04d83-2d19-4c47-bafb-59cc5797c63a', '分管班委', '', '2');
INSERT INTO `role_p` VALUES ('21da7649-4170-42ca-a8da-6eaa62b0f315', '主管院长', '', '5');
INSERT INTO `role_p` VALUES ('5127a60d-8c1b-4bda-b8b9-06096533a400', '学生', '', '1');
INSERT INTO `role_p` VALUES ('5f5fc576-d5c4-4805-b5aa-f6614c55cd35', '辅导员', '', '4');
INSERT INTO `role_p` VALUES ('e5fe6075-0e81-464f-beae-8f5458ad2968', '班主任', '', '3');

-- ----------------------------
-- Table structure for `role_user_p`
-- ----------------------------
DROP TABLE IF EXISTS `role_user_p`;
CREATE TABLE `role_user_p` (
  `ROLE_ID` varchar(40) DEFAULT NULL,
  `USER_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user_p
-- ----------------------------
INSERT INTO `role_user_p` VALUES ('21da7649-4170-42ca-a8da-6eaa62b0f315', '1');
INSERT INTO `role_user_p` VALUES ('e5fe6075-0e81-464f-beae-8f5458ad2968', '2');
INSERT INTO `role_user_p` VALUES ('5f5fc576-d5c4-4805-b5aa-f6614c55cd35', '3');
INSERT INTO `role_user_p` VALUES ('1ad04d83-2d19-4c47-bafb-59cc5797c63a', '4');
INSERT INTO `role_user_p` VALUES ('5127a60d-8c1b-4bda-b8b9-06096533a400', '2014082205');

-- ----------------------------
-- Table structure for `tb_leavebill`
-- ----------------------------
DROP TABLE IF EXISTS `tb_leavebill`;
CREATE TABLE `tb_leavebill` (
  `LEAVEBILL_ID` varchar(40) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `DAYS` int(11) DEFAULT NULL,
  `REASON` varchar(600) DEFAULT NULL,
  `REMARK` varchar(600) DEFAULT NULL,
  `out_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATE` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`LEAVEBILL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_leavebill
-- ----------------------------
INSERT INTO `tb_leavebill` VALUES ('0499f18d-e113-4401-ba18-1296b8e2cd27', '2014082205', '0', 'aaaaaaaa', null, '2017-11-30 00:00:00', '0', '1', '0');
INSERT INTO `tb_leavebill` VALUES ('1f794051-9ce3-43a5-a61c-4aa5823abafd', '2014082205', '0', '20171115测试081', null, '2017-11-01 00:00:00', '4', '1', '1');
INSERT INTO `tb_leavebill` VALUES ('2ef41f7a-7386-4180-b79c-ab5bae97f5cc', '2014082205', '0', '20171115测试112', null, '2017-12-01 00:00:00', '0', '1', '0');
INSERT INTO `tb_leavebill` VALUES ('36393d95-ea8e-41db-b03b-6c2387e27d2d', '2014082205', '0', '20171115测试082\r\n', null, '2017-11-10 00:00:00', '0', '1', '0');
INSERT INTO `tb_leavebill` VALUES ('3a73231b-0bc0-4cc1-b388-986105b728d3', '2014082205', '2', 'qqqq', null, '2018-02-28 00:00:00', '2', '2', '1');
INSERT INTO `tb_leavebill` VALUES ('5380ddef-4b01-4a6f-b8b9-2b4fec362646', '2014082205', '5', 'zzzz', null, '2017-11-24 00:00:00', '2', '1', '0');
INSERT INTO `tb_leavebill` VALUES ('716bfa1e-152a-4e5d-8dd1-ce27ff3a5627', '2014082205', '0', '20171115测试110', null, '2017-11-02 00:00:00', '0', '1', '0');
INSERT INTO `tb_leavebill` VALUES ('8b35cddb-d4c7-4bf0-8748-dfffd84edd1b', '2014082205', '5', 'qqqqq', null, '2017-11-15 00:00:00', '0', '3', '0');
INSERT INTO `tb_leavebill` VALUES ('902d6241-0ea7-44ef-af88-9bfd36e2d00e', '2014082205', '0', 'aaaa', null, '2017-11-02 00:00:00', '2', '1', '0');
INSERT INTO `tb_leavebill` VALUES ('a15db920-4026-4d81-9428-0919b5b947f4', '2014082205', '0', '20171115测试090', null, '2017-11-02 00:00:00', '3', '1', '1');
INSERT INTO `tb_leavebill` VALUES ('a1ceb82d-4560-4333-816d-110f9bfdd5d4', '2014082205', '5', '', null, '2017-10-31 00:00:00', '2', '1', '0');
INSERT INTO `tb_leavebill` VALUES ('e25dbb60-094c-4fe4-bdfb-f0f558685f53', '2014082205', '5', 'aaa', null, '2017-11-01 00:00:00', '0', '1', '0');

-- ----------------------------
-- Table structure for `tb_leavebill_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_leavebill_info`;
CREATE TABLE `tb_leavebill_info` (
  `leavebill_info_id` varchar(40) NOT NULL,
  `images` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`leavebill_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_leavebill_info
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info_p`
-- ----------------------------
DROP TABLE IF EXISTS `user_info_p`;
CREATE TABLE `user_info_p` (
  `USER_INFO_ID` int(40) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `MANAGER_ID` varchar(40) DEFAULT NULL,
  `STATION` varchar(20) DEFAULT NULL,
  `TELEPHONE` varchar(100) DEFAULT NULL,
  `USER_LEVEL` int(11) DEFAULT NULL,
  `REMARK` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`USER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info_p
-- ----------------------------
INSERT INTO `user_info_p` VALUES ('1', '院长', '0000', '0', '1111', '4', ' ');
INSERT INTO `user_info_p` VALUES ('2', '班主任', '00000', '0', '111', '2', ' ');
INSERT INTO `user_info_p` VALUES ('3', '辅导员', '111', '0', '0', '3', ' ');
INSERT INTO `user_info_p` VALUES ('4', '班委', '111', '0', '111', '1', ' ');
INSERT INTO `user_info_p` VALUES ('2014082205', '周凯', '2014082205', '0', '111111', '0', ' ');

-- ----------------------------
-- Table structure for `user_p`
-- ----------------------------
DROP TABLE IF EXISTS `user_p`;
CREATE TABLE `user_p` (
  `USER_ID` int(11) NOT NULL,
  `USERNAME` varchar(40) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_p
-- ----------------------------
INSERT INTO `user_p` VALUES ('1', 'yuanzhang', '81f0d27b89a38232ddd4d0af5b4b5125', '0');
INSERT INTO `user_p` VALUES ('2', 'banzhuren', '0103e7d19d0458c92206ff3656aa76e8', '0');
INSERT INTO `user_p` VALUES ('3', 'fudaoyuan', 'aadeb60386457c4ddd748750d44734df', '0');
INSERT INTO `user_p` VALUES ('4', 'banwei', 'eb34789cc8a946d9df96a3249a3d1a2f', '0');
INSERT INTO `user_p` VALUES ('2014082205', 'zhoukai', '871ce1fbf3d5934c54d37ef436fe55e8', '0');
