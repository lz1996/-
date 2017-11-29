/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : hellozhu

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-11-29 21:53:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `coverpath` varchar(255) DEFAULT NULL,
  `newDate` date DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('18', '/2017-06-17/201706170806848.html', '2313', '技术问题', '2131', '这里只是一些简单的测试，无关紧要，测试链接<a href=\"http://localhost/hellozhu/admin/\" target=\"_self\">我的后台，测试Java代码\r\npackage com.hellozhu.action;\r\n\r\nimport java.io.File;\r\nim', null, '2017-11-28', null, '0');
INSERT INTO `article` VALUES ('19', '/2017-06-17/201706170806404.html', '测试文章2', '技术问题', '212', '这里只是一些简单的测试，无关紧要，测试链接<a href=\"http://localhost/hellozhu/admin/\" target=\"_self\">我的后台，测试Java代码\r\npackage com.hellozhu.action;\r\n\r\nimport java.io.File;\r\nimport java.io.FileOutputStream;', null, '2017-11-23', null, '0');
INSERT INTO `article` VALUES ('20', '/2017-06-17/201706170806327.html', '这里只是一些简单的测试，无关紧要', '技术问题', '这里只是一些简单的测试，无关紧要', '这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单', null, '2017-11-02', null, '2');
INSERT INTO `article` VALUES ('21', '/2017-06-17/201706170806352.html', '这里只是一些简单的测试，无关紧要', '技术问题', '这里只是一些简单的测试，无关紧要', '这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些简单的测试，无关紧要这里只是一些', null, '2017-11-23', null, '0');
INSERT INTO `article` VALUES ('29', '/2017-06-18/201706180406762.html', '????', '????', '????', '??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', '2017-06-18\\2017-06-18.jpg', '2017-11-29', '2017-11-29', '1');
INSERT INTO `article` VALUES ('30', '/2017-11-28/201711280911199.html', '201711282054', '????', 'test', '121212\r\n', '2017-11-28\\2017-11-28.jpg', '2017-11-01', null, '0');
INSERT INTO `article` VALUES ('31', '/2017-11-29/201711290811503.html', '201711290856', '????', 'test?test2', '???????????????\r\n', null, '2017-11-29', '2017-11-29', '3');

-- ----------------------------
-- Table structure for `gust`
-- ----------------------------
DROP TABLE IF EXISTS `gust`;
CREATE TABLE `gust` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `ischeck` bit(1) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `selection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gust
-- ----------------------------
INSERT INTO `gust` VALUES ('14', '12@21', '', '1', '1', '0');
INSERT INTO `gust` VALUES ('15', '1129226860@qq.com', '', '1', '1', '0');
INSERT INTO `gust` VALUES ('16', '1129226860@qq.com', '', '1', '1', '0');
INSERT INTO `gust` VALUES ('17', '1129226860@qq.com', '', '1', '1', '0');
INSERT INTO `gust` VALUES ('18', '1129226860@qq.com', '', '122', '1', '0');
INSERT INTO `gust` VALUES ('19', '1129226860@qq.com', '', '122', '1', '0');
INSERT INTO `gust` VALUES ('20', '1129226860@qq.com', '', '哈哈哈哈终于把百度的ueditor弄好了', 'hello铸', '0');
INSERT INTO `gust` VALUES ('21', '1129226860@qq.com', '', '欢迎大家给我留言，提出意见和建议，谢谢大家', 'hellozhu', '1');
INSERT INTO `gust` VALUES ('22', '111@112', '', '12额2', '李铸', '0');

-- ----------------------------
-- Table structure for `mood`
-- ----------------------------
DROP TABLE IF EXISTS `mood`;
CREATE TABLE `mood` (
  `moodId` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `posttime` varchar(255) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`moodId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mood
-- ----------------------------
INSERT INTO `mood` VALUES ('1', 'test', '05/01/2017', '05/01/2017');
INSERT INTO `mood` VALUES ('2', '之前笔记本坏了，把数据库给丢了，重点是还没部署在云服务器上，gg', '05/01/2017', '05/01/2017');
INSERT INTO `mood` VALUES ('7', '之前的一条测试例子，这里随便改下。现在留言板和心情都是完成的了', '05/14/2017', '05/23/2017');
INSERT INTO `mood` VALUES ('8', '这个也是之前一个占坑位，现在已经把百度的编辑器ueditor弄在后台，可以直接写文章了', '05/14/2017', '05/23/2017');
INSERT INTO `mood` VALUES ('13', '绝望到底，主机中毒了，之前数据库又没有备份', '05/23/2017', '05/23/2017');
INSERT INTO `mood` VALUES ('14', '接下来要做的就是，把文章的一些内容展示在网页上', '05/23/2017', '05/23/2017');
INSERT INTO `mood` VALUES ('15', '测试留言板时间倒序', '06/18/2017', '06/18/2017');
INSERT INTO `mood` VALUES ('16', '201711282054重新开启并重测试项目', '11/28/2017', '11/28/2017');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) DEFAULT NULL,
  `student_birth` date DEFAULT NULL,
  `student_point` decimal(10,2) DEFAULT NULL,
  `student_sex` varchar(255) DEFAULT NULL,
  `student_profession` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '李铸', '2017-06-01', '4.30', 'women', 'automation');
INSERT INTO `student` VALUES ('2', '哈', '2010-10-10', '4.30', 'men', 'math');
INSERT INTO `student` VALUES ('4', '哈发生的发生的水电费', '2010-10-10', '4.30', 'men', 'math');
