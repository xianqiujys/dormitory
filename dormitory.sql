/*
Navicat MySQL Data Transfer

Source Server         : maoxian
Source Server Version : 50520
Source Host           : localhost:3307
Source Database       : dormitory

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-11-21 16:38:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminName` varchar(20) COLLATE utf8_bin NOT NULL,
  `adminBId` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `adminTel` varchar(20) COLLATE utf8_bin NOT NULL,
  `adminPassword` varchar(20) COLLATE utf8_bin NOT NULL,
  `adminStatus` int(10) NOT NULL,
  `adminEmail` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`adminName`),
  KEY `admin_楼名称` (`adminBId`),
  CONSTRAINT `admin_楼名称` FOREIGN KEY (`adminBId`) REFERENCES `building` (`buildBId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('111', '旧南研', '1', '123', '0', 'jiangyanshengj@126.com');
INSERT INTO `admin` VALUES ('张大爷1', '六号楼', '123', '231', '1', '312');
INSERT INTO `admin` VALUES ('李大妈', '四号楼', '1', '2', '0', '3');
INSERT INTO `admin` VALUES ('李大爷', '五号楼', '1', '2', '0', '3');
INSERT INTO `admin` VALUES ('黄大爷', '六号楼', '1', '2', '0', '3');

-- ----------------------------
-- Table structure for bad
-- ----------------------------
DROP TABLE IF EXISTS `bad`;
CREATE TABLE `bad` (
  `badId` int(20) NOT NULL AUTO_INCREMENT,
  `badDId` int(20) NOT NULL,
  `badPId` varchar(20) COLLATE utf8_bin NOT NULL,
  `badBId` varchar(40) COLLATE utf8_bin NOT NULL,
  `badScore` int(20) NOT NULL,
  `badRes` varchar(40) COLLATE utf8_bin NOT NULL,
  `badTime` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`badId`),
  KEY `bad_学号` (`badPId`),
  KEY `bad_宿舍编号` (`badDId`),
  KEY `bad_楼名称` (`badBId`),
  CONSTRAINT `bad_学号` FOREIGN KEY (`badPId`) REFERENCES `student` (`stdPId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `bad_宿舍编号` FOREIGN KEY (`badDId`) REFERENCES `dormitory` (`dorId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `bad_楼名称` FOREIGN KEY (`badBId`) REFERENCES `building` (`buildBId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bad
-- ----------------------------
INSERT INTO `bad` VALUES ('15', '9', '16110581051', '旧南研', '10', '1', '2019-11-20');

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `buildBId` varchar(40) COLLATE utf8_bin NOT NULL,
  `buildFloor` int(10) NOT NULL,
  `buildStyle` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`buildBId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('五号楼', '4', '四人间');
INSERT INTO `building` VALUES ('六号楼', '5', '六人间');
INSERT INTO `building` VALUES ('十一号楼', '5', '六人间');
INSERT INTO `building` VALUES ('啊啊', '4', '六人间');
INSERT INTO `building` VALUES ('四号楼', '4', '二人间');
INSERT INTO `building` VALUES ('四大', '3', '四人间');
INSERT INTO `building` VALUES ('旧南研', '3', '四人间');
INSERT INTO `building` VALUES ('楼', '4', '二人间');
INSERT INTO `building` VALUES ('阿达', '2', '二人间');

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory` (
  `dorId` int(20) NOT NULL AUTO_INCREMENT,
  `dorDId` int(20) NOT NULL,
  `dorBId` varchar(40) COLLATE utf8_bin NOT NULL,
  `dorPnum` int(10) NOT NULL,
  `dorAnum` int(10) NOT NULL,
  `dorGrade` int(10) DEFAULT NULL,
  `dorName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dorId`),
  KEY `楼名称` (`dorBId`),
  KEY `dorDId` (`dorDId`),
  CONSTRAINT `楼名称` FOREIGN KEY (`dorBId`) REFERENCES `building` (`buildBId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES ('8', '307', '旧南研', '4', '2', '89', '6');
INSERT INTO `dormitory` VALUES ('9', '306', '旧南研', '4', '0', '79', '63');

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair` (
  `repId` int(10) NOT NULL AUTO_INCREMENT,
  `repPId` varchar(20) COLLATE utf8_bin NOT NULL,
  `repBId` varchar(40) COLLATE utf8_bin NOT NULL,
  `repDId` int(20) NOT NULL,
  `repReason` varchar(40) COLLATE utf8_bin NOT NULL,
  `repStatus` int(10) NOT NULL,
  `repStart` varchar(20) COLLATE utf8_bin NOT NULL,
  `repEnd` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`repId`),
  KEY `repair_学号` (`repPId`),
  KEY `repair_宿舍编号` (`repDId`),
  KEY `repair_楼名称` (`repBId`),
  CONSTRAINT `repair_学号` FOREIGN KEY (`repPId`) REFERENCES `student` (`stdPId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `repair_宿舍编号` FOREIGN KEY (`repDId`) REFERENCES `dormitory` (`dorId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `repair_楼名称` FOREIGN KEY (`repBId`) REFERENCES `building` (`buildBId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES ('1', '16110581051', '旧南研', '8', '1', '0', '2019-11-21', null);

-- ----------------------------
-- Table structure for stay
-- ----------------------------
DROP TABLE IF EXISTS `stay`;
CREATE TABLE `stay` (
  `stayId` int(20) NOT NULL AUTO_INCREMENT,
  `stayDId` int(20) NOT NULL,
  `stayBId` varchar(20) COLLATE utf8_bin NOT NULL,
  `staySt` varchar(30) COLLATE utf8_bin NOT NULL,
  `stayAt` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `stayPId` varchar(20) COLLATE utf8_bin NOT NULL,
  `stayBed` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`stayId`),
  UNIQUE KEY `stay_学号` (`stayPId`) USING BTREE,
  KEY `stay_楼名称` (`stayBId`),
  KEY `stay_宿舍编号` (`stayDId`),
  CONSTRAINT `stay_学号` FOREIGN KEY (`stayPId`) REFERENCES `student` (`stdPId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stay_宿舍编号` FOREIGN KEY (`stayDId`) REFERENCES `dormitory` (`dorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stay_楼名称` FOREIGN KEY (`stayBId`) REFERENCES `building` (`buildBId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of stay
-- ----------------------------
INSERT INTO `stay` VALUES ('19', '8', '旧南研', '2019-11-20', null, '16110581055', '2');
INSERT INTO `stay` VALUES ('20', '8', '旧南研', '2019-11-20', null, '16110581051', '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stdPId` varchar(20) COLLATE utf8_bin NOT NULL,
  `stdTel` varchar(20) COLLATE utf8_bin NOT NULL,
  `stdSex` varchar(10) COLLATE utf8_bin NOT NULL,
  `stdClass` varchar(40) COLLATE utf8_bin NOT NULL,
  `stdEmail` varchar(40) COLLATE utf8_bin NOT NULL,
  `stdDId` int(20) DEFAULT NULL,
  `stdBId` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `stdJob` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `stdStatus` int(10) NOT NULL,
  `stdPassword` varchar(20) COLLATE utf8_bin NOT NULL,
  `stdName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`stdPId`),
  KEY `student_宿舍编号` (`stdDId`),
  KEY `student_楼名称` (`stdBId`),
  CONSTRAINT `student_宿舍编号` FOREIGN KEY (`stdDId`) REFERENCES `dormitory` (`dorId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `student_楼名称` FOREIGN KEY (`stdBId`) REFERENCES `building` (`buildBId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('16110581051', '3', '男', '计科1602', '221', '8', '旧南研', '无', '0', '111', '辣楼');
INSERT INTO `student` VALUES ('16110581055', '4', '女', '计科1602', '554@', '8', '旧南研', '舍长', '0', '244', '垃圾胖');
