/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : eospd

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2015-11-03 11:45:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for circuitinfo
-- ----------------------------
DROP TABLE IF EXISTS `circuitinfo`;
CREATE TABLE `circuitinfo` (
  `circuitId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `circuitUrl` varchar(200) DEFAULT NULL COMMENT '电支路URL',
  `circuitName` varchar(200) DEFAULT NULL COMMENT '电支路名称',
  `location` varchar(200) DEFAULT NULL COMMENT '所在位置',
  `switchRatedC` int(11) DEFAULT NULL COMMENT '开关额定电流，单位：A',
  `levelV` int(11) DEFAULT NULL COMMENT '电压等级，单位：V',
  `designPower` decimal(18,4) DEFAULT NULL COMMENT '设计功率，单位：kw',
  `powerPhase` int(11) DEFAULT NULL COMMENT '电源相数，1 or 3',
  `parentId` int(11) DEFAULT NULL COMMENT '上级电支路，0-动态，-1-没有，>0-静态',
  `dynamicParent1Id` int(11) DEFAULT NULL COMMENT '动态上级1',
  `dynamicParent2Id` int(11) DEFAULT NULL COMMENT '动态上级2',
  `deviceId` int(11) DEFAULT NULL COMMENT '仪表ID',
  PRIMARY KEY (`circuitId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='3 电支路信息';

-- ----------------------------
-- Records of circuitinfo
-- ----------------------------
INSERT INTO `circuitinfo` VALUES ('1', '/pd/t2/eng_station/total', '浦东T2能源站总进线', null, '1000', '380', '300.0000', '3', '-1', null, null, '1');
INSERT INTO `circuitinfo` VALUES ('2', '/pd/t2/eng_station/cooler/1', '浦东T2能源站1号冷机支路', null, '150', '380', '30.0000', '3', '1', null, null, '2');
INSERT INTO `circuitinfo` VALUES ('3', '/pd/t2/eng_station/cooler/2', '浦东T2能源站2号冷机支路', null, '150', '380', '30.0000', '3', '1', null, null, '3');
INSERT INTO `circuitinfo` VALUES ('4', '/pd/t2/eng_station/chwp/1', '浦东T2能源站1号冷冻泵支路', null, '100', '380', '25.0000', '3', '1', null, null, '4');
INSERT INTO `circuitinfo` VALUES ('5', '/pd/t2/eng_station/chwp/2', '浦东T2能源站2号冷冻泵支路', null, '100', '380', '25.0000', '3', '1', null, null, '5');
INSERT INTO `circuitinfo` VALUES ('6', '/pd/t2/eng_station/cwp/1', '浦东T2能源站1号冷却泵支路', null, '100', '380', '25.0000', '3', '1', null, null, '6');
INSERT INTO `circuitinfo` VALUES ('7', '/pd/t2/eng_station/cwp/2', '浦东T2能源站2号冷却泵支路', null, '100', '380', '25.0000', '3', '1', null, null, '7');

-- ----------------------------
-- Table structure for collectindexday
-- ----------------------------
DROP TABLE IF EXISTS `collectindexday`;
CREATE TABLE `collectindexday` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `indexTime` datetime DEFAULT NULL COMMENT '采集指标时间，年月日有效',
  `deviceId` int(11) DEFAULT NULL COMMENT '仪表ID，=0指系统采集指标；>0指某仪表采集指标 meter表的deviceId列',
  `dataEffRate` decimal(5,2) DEFAULT NULL COMMENT '数据有效率',
  `meterOnlineRate` decimal(5,2) DEFAULT NULL COMMENT '仪表在线率',
  `realCollectRate` decimal(5,2) DEFAULT NULL COMMENT '实时采集率',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='1 数据采集指标日表';

-- ----------------------------
-- Records of collectindexday
-- ----------------------------
INSERT INTO `collectindexday` VALUES ('1', '2015-11-01 00:00:00', '0', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('2', '2015-11-02 00:00:00', '0', '97.00', '91.00', '86.00');
INSERT INTO `collectindexday` VALUES ('3', '2015-11-03 00:00:00', '0', '100.00', '95.00', '90.00');
INSERT INTO `collectindexday` VALUES ('4', '2015-11-01 00:00:00', '1', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('5', '2015-11-02 00:00:00', '1', '97.00', '91.00', '86.00');
INSERT INTO `collectindexday` VALUES ('6', '2015-11-03 00:00:00', '1', '100.00', '95.00', '90.00');
INSERT INTO `collectindexday` VALUES ('7', '2015-11-01 00:00:00', '2', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('8', '2015-11-02 00:00:00', '2', '97.00', '91.00', '86.00');
INSERT INTO `collectindexday` VALUES ('9', '2015-11-03 00:00:00', '2', '100.00', '95.00', '90.00');
INSERT INTO `collectindexday` VALUES ('10', '2015-11-01 00:00:00', '3', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('11', '2015-11-02 00:00:00', '3', '97.00', '91.00', '86.00');
INSERT INTO `collectindexday` VALUES ('12', '2015-11-03 00:00:00', '3', '100.00', '95.00', '90.00');
INSERT INTO `collectindexday` VALUES ('13', '2015-11-01 00:00:00', '4', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('14', '2015-11-02 00:00:00', '4', '97.00', '91.00', '86.00');
INSERT INTO `collectindexday` VALUES ('15', '2015-11-03 00:00:00', '4', '100.00', '95.00', '90.00');
INSERT INTO `collectindexday` VALUES ('16', '2015-11-01 00:00:00', '5', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('17', '2015-11-02 00:00:00', '5', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('18', '2015-11-03 00:00:00', '5', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('19', '2015-11-01 00:00:00', '6', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('20', '2015-11-02 00:00:00', '6', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('21', '2015-11-03 00:00:00', '6', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('22', '2015-11-01 00:00:00', '7', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('23', '2015-11-02 00:00:00', '7', '98.00', '90.00', '85.00');
INSERT INTO `collectindexday` VALUES ('24', '2015-11-03 00:00:00', '7', '98.00', '90.00', '85.00');

-- ----------------------------
-- Table structure for dataontime
-- ----------------------------
DROP TABLE IF EXISTS `dataontime`;
CREATE TABLE `dataontime` (
  `doId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `dataLayer` int(11) NOT NULL COMMENT '数据层级，1-仪表，2-能源',
  `dcId` int(11) DEFAULT NULL COMMENT '数据采集器ID，关联数据采集器表',
  `currentTime` datetime NOT NULL COMMENT '帧当前时间',
  `receTime` datetime DEFAULT NULL COMMENT '系统接收时间',
  `timeInterval` int(11) DEFAULT NULL COMMENT '帧时间间隔，单位：秒',
  `bpSign` int(11) DEFAULT NULL COMMENT '断点标识，0-正常，1-重传',
  `dataId` int(11) NOT NULL COMMENT '能源ID或仪表ID，原始信息',
  `dataTypeId` int(11) NOT NULL COMMENT '能源或仪表类型ID，关联能源类型表或仪表类型表',
  `ivSign` int(11) DEFAULT NULL COMMENT '插值标志，0-正常；1-插值',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间',
  `p1Pv` decimal(18,4) DEFAULT NULL COMMENT '属性1当前值总电量',
  `p1Err` int(11) DEFAULT NULL COMMENT '属性1错误标志，0-正常',
  `p1Dv` decimal(18,4) DEFAULT NULL COMMENT '属性1差值',
  `p1Rsz` int(11) DEFAULT NULL COMMENT '属性1数据满刻度归0标志,0-正常，1-归0',
  `p2Pv` decimal(18,4) DEFAULT NULL COMMENT '总功率',
  `p2Err` int(11) DEFAULT NULL,
  `p2Dv` decimal(18,4) DEFAULT NULL,
  `p2Rsz` int(11) DEFAULT NULL,
  `p3Pv` decimal(18,4) DEFAULT NULL COMMENT '总功率因数',
  `p3Err` int(11) DEFAULT NULL,
  `p3Dv` decimal(18,4) DEFAULT NULL,
  `p3Rsz` int(11) DEFAULT NULL,
  `p4Pv` decimal(18,4) DEFAULT NULL COMMENT 'A相电流',
  `p4Err` int(11) DEFAULT NULL,
  `p4Dv` decimal(18,4) DEFAULT NULL,
  `p4Rsz` int(11) DEFAULT NULL,
  `p5Pv` decimal(18,4) DEFAULT NULL COMMENT 'B相电流',
  `p5Err` int(11) DEFAULT NULL,
  `p5Dv` decimal(18,4) DEFAULT NULL,
  `p5Rsz` int(11) DEFAULT NULL,
  `p6Pv` decimal(18,4) DEFAULT NULL COMMENT 'C相电流',
  `p6Err` int(11) DEFAULT NULL,
  `p6Dv` decimal(18,4) DEFAULT NULL,
  `p6Rsz` int(11) DEFAULT NULL,
  `p7Pv` decimal(18,4) DEFAULT NULL COMMENT 'A相电压',
  `p7Err` int(11) DEFAULT NULL,
  `p7Dv` decimal(18,4) DEFAULT NULL,
  `p7Rsz` int(11) DEFAULT NULL,
  `p8Pv` decimal(18,4) DEFAULT NULL COMMENT 'B相电压',
  `p8Err` int(11) DEFAULT NULL,
  `p8Dv` decimal(18,4) DEFAULT NULL,
  `p8Rsz` int(11) DEFAULT NULL,
  `p9Pv` decimal(18,4) DEFAULT NULL COMMENT 'C相电压',
  `p9Err` int(11) DEFAULT NULL,
  `p9Dv` decimal(18,4) DEFAULT NULL,
  `p9Rsz` int(11) DEFAULT NULL,
  PRIMARY KEY (`doId`),
  KEY `ctIndex` (`currentTime`) USING BTREE,
  KEY `dlIndex` (`dataLayer`) USING BTREE,
  KEY `didIndex` (`dataId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='2 数据历史记录';

-- ----------------------------
-- Records of dataontime
-- ----------------------------
INSERT INTO `dataontime` VALUES ('1', '2', '1', '2015-11-01 00:00:00', '2015-11-01 00:00:02', '60', '0', '1', '1', '0', '2015-11-01 00:00:10', '2015-11-01 00:00:10', '23456.0000', '0', '30.0000', '0', '30.0000', null, null, null, '0.9000', null, null, null, '100.0000', null, null, null, '110.0000', null, null, null, '110.0000', null, null, null, '230.0000', null, null, null, '231.0000', null, null, null, '232.0000', null, null, null);
INSERT INTO `dataontime` VALUES ('2', '2', '1', '2015-11-01 00:01:00', '2015-11-01 00:01:02', '60', '0', '1', '1', '0', '2015-11-01 00:01:10', '2015-11-01 00:01:10', '23468.0000', '0', '30.0000', '0', '30.0000', null, null, null, '0.9000', null, null, null, '100.0000', null, null, null, '110.0000', null, null, null, '110.0000', null, null, null, '230.0000', null, null, null, '231.0000', null, null, null, '232.0000', null, null, null);
INSERT INTO `dataontime` VALUES ('3', '2', '1', '2015-11-01 00:02:00', '2015-11-01 00:02:02', '60', '0', '1', '1', '0', '2015-11-01 00:02:10', '2015-11-01 00:02:10', '23473.0000', '0', '30.0000', '0', '30.0000', null, null, null, '0.9000', null, null, null, '100.0000', null, null, null, '110.0000', null, null, null, '110.0000', null, null, null, '230.0000', null, null, null, '231.0000', null, null, null, '232.0000', null, null, null);
INSERT INTO `dataontime` VALUES ('4', '2', '1', '2015-11-01 00:03:00', '2015-11-01 00:03:02', '60', '0', '1', '1', '0', '2015-11-01 00:03:10', '2015-11-01 00:03:10', '23482.0000', '0', '30.0000', '0', '30.0000', null, null, null, '0.9000', null, null, null, '100.0000', null, null, null, '110.0000', null, null, null, '110.0000', null, null, null, '230.0000', null, null, null, '231.0000', null, null, null, '232.0000', null, null, null);
INSERT INTO `dataontime` VALUES ('5', '2', '1', '2015-11-01 00:04:00', '2015-11-01 00:04:02', '60', '0', '1', '1', '0', '2015-11-01 00:04:10', '2015-11-01 00:04:10', '23491.0000', '0', '30.0000', '0', '30.0000', null, null, null, '0.9000', null, null, null, '100.0000', null, null, null, '110.0000', null, null, null, '110.0000', null, null, null, '230.0000', null, null, null, '231.0000', null, null, null, '232.0000', null, null, null);

-- ----------------------------
-- Table structure for dataontimebp
-- ----------------------------
DROP TABLE IF EXISTS `dataontimebp`;
CREATE TABLE `dataontimebp` (
  `dobpId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `restServerId` int(11) NOT NULL,
  `dataLayer` int(11) NOT NULL COMMENT '数据层级，1-仪表，2-能源',
  `dcId` int(11) NOT NULL COMMENT '数据采集器ID，关联数据采集器表',
  `currentTime` datetime NOT NULL COMMENT '帧当前时间',
  `dataId` int(11) NOT NULL COMMENT '能源ID或仪表ID，原始信息',
  `firstSendTime` datetime DEFAULT NULL COMMENT '首次发送时间',
  `lastSendTime` datetime DEFAULT NULL COMMENT '最后一次发送时间',
  `sendCount` int(11) DEFAULT NULL COMMENT '发送次数',
  PRIMARY KEY (`dobpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dataontimebp
-- ----------------------------

-- ----------------------------
-- Table structure for dataurl
-- ----------------------------
DROP TABLE IF EXISTS `dataurl`;
CREATE TABLE `dataurl` (
  `dataId` int(11) NOT NULL AUTO_INCREMENT,
  `dataUrl` varchar(500) NOT NULL,
  PRIMARY KEY (`dataId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='9 dataontime关联dataId';

-- ----------------------------
-- Records of dataurl
-- ----------------------------
INSERT INTO `dataurl` VALUES ('1', '/pd/t2/eng_station/total');
INSERT INTO `dataurl` VALUES ('2', '/pd/t2/eng_station/cooler/1');
INSERT INTO `dataurl` VALUES ('3', '/pd/t2/eng_station/cooler/2');
INSERT INTO `dataurl` VALUES ('4', '/pd/t2/eng_station/chwp/1');
INSERT INTO `dataurl` VALUES ('5', '/pd/t2/eng_station/chwp/2');
INSERT INTO `dataurl` VALUES ('6', '/pd/t2/eng_station/cwp/1');
INSERT INTO `dataurl` VALUES ('7', '/pd/t2/eng_station/cwp/2');

-- ----------------------------
-- Table structure for dc
-- ----------------------------
DROP TABLE IF EXISTS `dc`;
CREATE TABLE `dc` (
  `dcId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长',
  `dcUrl` varchar(200) NOT NULL COMMENT '数据采集器Url',
  `dcName` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL COMMENT '位置',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `channelCount` int(11) DEFAULT NULL COMMENT '通道数量',
  `dcIP` varchar(20) DEFAULT NULL COMMENT '数据采集器IP地址',
  `autoSign` int(11) NOT NULL COMMENT '自动添加标志，1-自动添加，0-手工添加',
  `installTime` datetime DEFAULT NULL COMMENT '安装时间',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`dcId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='4 数据采集器信息表';

-- ----------------------------
-- Records of dc
-- ----------------------------
INSERT INTO `dc` VALUES ('1', '/pd/dc/1', null, null, null, '1', '192.168.1.10', '0', '2015-11-03 10:05:47', '2015-11-03 10:05:52');
INSERT INTO `dc` VALUES ('2', '/pd/dc/2', null, null, null, '2', '192.168.1.11', '0', '2015-11-03 10:06:33', '2015-11-03 10:06:39');

-- ----------------------------
-- Table structure for devonline
-- ----------------------------
DROP TABLE IF EXISTS `devonline`;
CREATE TABLE `devonline` (
  `devolId` int(11) NOT NULL AUTO_INCREMENT,
  `dcId` int(11) NOT NULL COMMENT '数据采集器ID，关联数据采集器表',
  `deviceType` int(11) NOT NULL COMMENT '设备类型。1：数据采集器；2-仪表；',
  `deviceId` int(11) NOT NULL COMMENT '设备标识，关联数据采集器表或仪表表',
  `currentTime` datetime NOT NULL COMMENT '帧当前时间',
  `deviceStatus` int(11) NOT NULL COMMENT '设备状态，0：离线；1：在线；2：重启',
  `bpSign` int(11) DEFAULT NULL COMMENT '断点标识，0-正常，1-重传',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`devolId`),
  KEY `dtIndex` (`deviceType`),
  KEY `didIndex` (`deviceId`),
  KEY `ctIndex` (`currentTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='6 设备在线状态历史记录表';

-- ----------------------------
-- Records of devonline
-- ----------------------------
INSERT INTO `devonline` VALUES ('1', '1', '1', '1', '2015-11-03 10:57:34', '2', '0', '2015-11-03 10:57:53');
INSERT INTO `devonline` VALUES ('2', '1', '2', '1', '2015-11-03 10:58:12', '1', '0', '2015-11-03 10:58:21');

-- ----------------------------
-- Table structure for devonlinebp
-- ----------------------------
DROP TABLE IF EXISTS `devonlinebp`;
CREATE TABLE `devonlinebp` (
  `devolbpId` int(11) NOT NULL AUTO_INCREMENT,
  `restServerId` int(11) NOT NULL,
  `dcId` int(11) NOT NULL COMMENT '数据采集器ID，关联数据采集器表',
  `deviceType` int(11) NOT NULL COMMENT '设备类型。1：数据采集器；2-仪表；',
  `deviceId` int(11) NOT NULL COMMENT '设备标识，关联数据采集器表或仪表表',
  `currentTime` datetime NOT NULL COMMENT '帧当前时间',
  `firstSendTime` datetime DEFAULT NULL COMMENT '首次发送时间',
  `lastSendTime` datetime DEFAULT NULL COMMENT '最后一次发送时间',
  `sendCount` int(11) DEFAULT NULL COMMENT '发送次数',
  PRIMARY KEY (`devolbpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of devonlinebp
-- ----------------------------

-- ----------------------------
-- Table structure for energytype
-- ----------------------------
DROP TABLE IF EXISTS `energytype`;
CREATE TABLE `energytype` (
  `dataTypeId` int(11) NOT NULL COMMENT '能源类型ID，=typeUrl',
  `typeUrl` varchar(10) NOT NULL COMMENT '类型Url',
  `typeName` varchar(20) NOT NULL COMMENT '名称',
  `autoSign` int(11) NOT NULL COMMENT '自动添加标志，1-自动添加，0-手工添加',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`dataTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of energytype
-- ----------------------------

-- ----------------------------
-- Table structure for meter
-- ----------------------------
DROP TABLE IF EXISTS `meter`;
CREATE TABLE `meter` (
  `deviceId` int(11) NOT NULL AUTO_INCREMENT COMMENT '仪表ID',
  `deviceUrl` varchar(200) NOT NULL,
  `dataTypeId` int(11) DEFAULT NULL COMMENT '仪表类型ID，关联到仪表类型表',
  `deviceCommAddr` varchar(255) DEFAULT NULL COMMENT '仪表通讯地址，一般为modbus地址（1-254有效）',
  `location` varchar(200) DEFAULT NULL COMMENT '位置',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `dcId` int(11) DEFAULT NULL COMMENT '数据采集器ID，关联到表 dc',
  `dcChannelSn` int(11) DEFAULT NULL COMMENT '数据采集器通道编号，从1开始',
  `autoSign` int(11) NOT NULL COMMENT '自动添加标志，1-自动添加，0-手工添加',
  `installTime` datetime DEFAULT NULL COMMENT '安装时间',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`deviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='5 仪表信息表';

-- ----------------------------
-- Records of meter
-- ----------------------------
INSERT INTO `meter` VALUES ('1', '/pd/meter/e/1', '1', '1', null, null, '1', '1', '0', '2015-11-03 10:24:03', '2015-11-03 10:24:06', '2015-11-03 10:24:09');
INSERT INTO `meter` VALUES ('2', '/pd/meter/e/2', '2', '2', null, null, '1', '1', '0', '2015-11-03 10:24:50', '2015-11-03 10:24:53', '2015-11-03 10:24:56');
INSERT INTO `meter` VALUES ('3', '/pd/meter/e/3', '1', '3', null, null, '2', '1', '0', '2015-11-03 10:36:24', '2015-11-03 10:36:27', '2015-11-03 10:36:29');
INSERT INTO `meter` VALUES ('4', '/pd/meter/e/4', '2', '4', null, null, '2', '1', '0', '2015-11-03 10:37:02', '2015-11-03 10:37:04', '2015-11-03 10:37:07');
INSERT INTO `meter` VALUES ('5', '/pd/meter/e/5', '3', '5', null, null, '2', '2', '0', '2015-11-03 10:37:38', '2015-11-03 10:37:41', '2015-11-03 10:37:44');
INSERT INTO `meter` VALUES ('6', '/pd/meter/e/6', '3', '6', null, null, '2', '2', '0', '2015-11-03 10:38:06', '2015-11-03 10:38:08', '2015-11-03 10:38:10');
INSERT INTO `meter` VALUES ('7', '/pd/meter/e/7', '3', '7', null, null, '2', '2', '0', '2015-11-03 10:38:30', '2015-11-03 10:38:33', '2015-11-03 10:38:35');

-- ----------------------------
-- Table structure for metertype
-- ----------------------------
DROP TABLE IF EXISTS `metertype`;
CREATE TABLE `metertype` (
  `dataTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeUrl` varchar(200) NOT NULL COMMENT '类型Url',
  `typeName` varchar(50) NOT NULL COMMENT '类型名称',
  `desc` varchar(400) DEFAULT NULL,
  `venderId` int(11) DEFAULT '0' COMMENT '厂家ID',
  `autoSign` int(11) NOT NULL COMMENT '自动添加标志，1-自动添加，0-手工添加',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`dataTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='8 仪表型号信息表';

-- ----------------------------
-- Records of metertype
-- ----------------------------
INSERT INTO `metertype` VALUES ('1', '/e/dae/smb350_8', 'SMB350-8路多回路电表', null, '2', '0', '2015-11-03 10:19:07', '2015-11-03 10:19:11');
INSERT INTO `metertype` VALUES ('2', '/e/dae/smb350_4', 'SMB350-4路多回路电表', null, '2', '0', '2015-11-03 10:20:02', '2015-11-03 10:20:05');
INSERT INTO `metertype` VALUES ('3', '/e/lckj/ex8', 'EX8综合电力监控仪表', null, '1', '0', '2015-11-03 10:22:36', '2015-11-03 10:22:39');

-- ----------------------------
-- Table structure for metervender
-- ----------------------------
DROP TABLE IF EXISTS `metervender`;
CREATE TABLE `metervender` (
  `venderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '厂家ID',
  `venderName` varchar(100) NOT NULL COMMENT '厂家名称',
  `venderAddr` varchar(100) DEFAULT NULL,
  `contactPhone` varchar(40) DEFAULT NULL,
  `contactPerson` varchar(10) DEFAULT NULL,
  `insertTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`venderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='7 仪表厂家信息表';

-- ----------------------------
-- Records of metervender
-- ----------------------------
INSERT INTO `metervender` VALUES ('1', '山东力创科技有限公司', '山东省莱芜高新区凤凰路9号', '0634-6257809', '赵一', '2015-11-03 10:12:08', '2015-11-03 10:12:11');
INSERT INTO `metervender` VALUES ('2', '台科电科技股份有限公司', '台北市内湖区新湖一路157号5楼', '02-27936123', '赵二', '2015-11-03 10:15:24', '2015-11-03 10:15:27');

-- ----------------------------
-- Table structure for restserver
-- ----------------------------
DROP TABLE IF EXISTS `restserver`;
CREATE TABLE `restserver` (
  `restServerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '接收服务器ID',
  `hostUrl` varchar(100) NOT NULL,
  `insertTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`restServerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of restserver
-- ----------------------------
