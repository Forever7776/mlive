/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : wxb

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-11-01 10:37:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `size` int(11) DEFAULT NULL COMMENT '大小',
  `key` varchar(100) DEFAULT NULL COMMENT '七牛KEY名',
  `hash` varchar(50) DEFAULT NULL,
  `suffix` varchar(50) DEFAULT NULL COMMENT '后缀',
  `type` int(11) DEFAULT NULL COMMENT '1.图片',
  `path` varchar(50) DEFAULT NULL COMMENT '路径',
  `media_id` varchar(50) DEFAULT NULL COMMENT '微信素材ID',
  `status` int(11) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件系统表';

-- ----------------------------
-- Table structure for sys_file_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_log`;
CREATE TABLE `sys_file_log` (
  `id` varchar(32) NOT NULL,
  `file_id` varchar(32) DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传日志表';
