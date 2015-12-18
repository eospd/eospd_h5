/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : eospd

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2015-12-18 11:48:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for areainfo
-- ----------------------------
DROP TABLE IF EXISTS `areainfo`;
CREATE TABLE `areainfo` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域ID',
  `areaName` varchar(200) NOT NULL COMMENT '区域名称',
  `parentId` int(11) NOT NULL COMMENT '区域父ID，0代表为顶级ID',
  PRIMARY KEY (`areaId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='10 区域信息';

-- ----------------------------
-- Records of areainfo
-- ----------------------------
INSERT INTO `areainfo` VALUES ('1', '浦东机场', '0');
INSERT INTO `areainfo` VALUES ('2', 'T1', '1');
INSERT INTO `areainfo` VALUES ('3', 'T1航站楼', '2');
INSERT INTO `areainfo` VALUES ('4', 'T1能源站', '2');
INSERT INTO `areainfo` VALUES ('5', 'T2停车场', '2');
INSERT INTO `areainfo` VALUES ('6', 'T2', '1');
INSERT INTO `areainfo` VALUES ('7', 'T2航站楼', '6');
INSERT INTO `areainfo` VALUES ('8', 'T2能源站', '6');
INSERT INTO `areainfo` VALUES ('9', 'T2停车场', '6');

-- ----------------------------
-- Table structure for circuitinfo
-- ----------------------------
DROP TABLE IF EXISTS `circuitinfo`;
CREATE TABLE `circuitinfo` (
  `circuitId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `circuitUrl` varchar(200) DEFAULT NULL COMMENT '电支路URL',
  `circuitName` varchar(200) DEFAULT NULL COMMENT '电支路名称',
  `location` varchar(200) DEFAULT NULL COMMENT '所在位置',
  `terminalDesc` varchar(200) DEFAULT NULL COMMENT '终端描述',
  `switchRatedC` int(11) DEFAULT NULL COMMENT '开关额定电流，单位：A',
  `levelV` int(11) DEFAULT NULL COMMENT '电压等级，单位：V',
  `designPower` decimal(18,4) DEFAULT NULL COMMENT '设计功率，单位：kw',
  `powerPhase` int(11) DEFAULT NULL COMMENT '电源相数，1 or 3',
  `parentId` int(11) DEFAULT NULL COMMENT '上级电支路，0-动态，-1-没有，>0-静态',
  `dynamicParent1Id` int(11) DEFAULT NULL COMMENT '动态上级1',
  `dynamicParent2Id` int(11) DEFAULT NULL COMMENT '动态上级2',
  `deviceId` int(11) DEFAULT NULL COMMENT '仪表ID',
  PRIMARY KEY (`circuitId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='03 电支路信息';

-- ----------------------------
-- Records of circuitinfo
-- ----------------------------
INSERT INTO `circuitinfo` VALUES ('1', '/pd/t2/es/1t1', 'T2能源站1T1受电柜', null, null, '0', '400', '0.0000', '3', '0', null, null, '1');
INSERT INTO `circuitinfo` VALUES ('2', '/pd/t2/es/1t201', 'T2能源站1T201', null, '备用', '0', '400', '0.0000', '3', '1', null, null, '2');
INSERT INTO `circuitinfo` VALUES ('3', '/pd/t2/es/1t202', 'T2能源站1T202', null, '1号供冷泵', '0', '400', '335.0000', '3', '1', null, null, '3');
INSERT INTO `circuitinfo` VALUES ('4', '/pd/t2/es/1t301', 'T2能源站1T301', null, '1号冷却塔风机', '0', '400', '55.0000', '3', '1', null, null, '4');
INSERT INTO `circuitinfo` VALUES ('5', '/pd/t2/es/1t302', 'T2能源站1T302', null, '备用', '0', '400', '0.0000', '3', '1', null, null, '5');
INSERT INTO `circuitinfo` VALUES ('6', '/pd/t2/es/1t303', 'T2能源站1T303', null, '1号冷冻泵', '0', '400', '75.0000', '3', '1', null, null, '6');
INSERT INTO `circuitinfo` VALUES ('7', '/pd/t2/es/1t304', 'T2能源站1T304', null, '备用', '0', '400', '0.0000', '3', '1', null, null, '7');
INSERT INTO `circuitinfo` VALUES ('8', '/pd/t2/es/1t305', 'T2能源站1T305', null, '1号冷却泵', '0', '400', '160.0000', '3', '1', null, null, '8');
INSERT INTO `circuitinfo` VALUES ('9', '/pd/t2/es/1t401', 'T2能源站1T401', null, '2号冷却塔风机', '0', '400', '55.0000', '3', '1', null, null, '9');
INSERT INTO `circuitinfo` VALUES ('10', '/pd/t2/es/1t402', 'T2能源站1T402', null, '备用', '0', '400', '0.0000', '3', '1', null, null, '10');
INSERT INTO `circuitinfo` VALUES ('11', '/pd/t2/es/1t403', 'T2能源站1T403', '', '2号冷冻泵', '0', '400', '75.0000', '3', '1', null, null, '11');
INSERT INTO `circuitinfo` VALUES ('12', '/pd/t2/es/1t404', 'T2能源站1T404', '', '备用', '0', '400', '0.0000', '3', '1', null, null, '12');
INSERT INTO `circuitinfo` VALUES ('13', '/pd/t2/es/1t405', 'T2能源站1T405', '', '共同沟检修电汇', '0', '400', '138.0000', '3', '1', null, null, '13');
INSERT INTO `circuitinfo` VALUES ('14', '/pd/t2/es/1t406', 'T2能源站1T406', '', '2号冷却泵', '0', '400', '169.0000', '3', '1', null, null, '14');
INSERT INTO `circuitinfo` VALUES ('15', '/pd/t2/es/1t501', 'T2能源站1T501', '', '电动头电汇1、2', '0', '400', '37.0000', '3', '1', null, null, '15');
INSERT INTO `circuitinfo` VALUES ('16', '/pd/t2/es/1t502', 'T2能源站1T502', '', '屋顶检修电汇1、2', '0', '400', '10.0000', '3', '1', null, null, '16');
INSERT INTO `circuitinfo` VALUES ('17', '/pd/t2/es/1t503', 'T2能源站1T503', '', '冷机检修电汇1 ', '0', '400', '100.0000', '3', '1', null, null, '17');
INSERT INTO `circuitinfo` VALUES ('18', '/pd/t2/es/1t504', 'T2能源站1T504', '', '备用', '0', '400', '0.0000', '3', '1', null, null, '18');
INSERT INTO `circuitinfo` VALUES ('19', '/pd/t2/es/1t505', 'T2能源站1T505', '', '冷机检修电汇2', '0', '400', '100.0000', '3', '1', null, null, '19');
INSERT INTO `circuitinfo` VALUES ('20', '/pd/t2/es/1t506', 'T2能源站1T506', '', '备用', '0', '400', '0.0000', '3', '1', null, null, '20');
INSERT INTO `circuitinfo` VALUES ('21', '/pd/t2/es/1t507', 'T2能源站1T507', '', 'UMC照明电汇', '0', '400', '154.1000', '3', '1', null, null, '21');
INSERT INTO `circuitinfo` VALUES ('22', '/pd/t2/es/1t601', 'T2能源站1T601', '', '应急照明电汇', '0', '400', '4.0000', '3', '1', null, null, '22');
INSERT INTO `circuitinfo` VALUES ('23', '/pd/t2/es/1t602', 'T2能源站1T602', '', '备用', '0', '400', '0.0000', '3', '1', null, null, '23');
INSERT INTO `circuitinfo` VALUES ('24', '/pd/t2/es/1t603', 'T2能源站1T603', '', '消防控制电汇', '0', '400', '30.0000', '3', '1', null, null, '24');
INSERT INTO `circuitinfo` VALUES ('25', '/pd/t2/es/1t604', 'T2能源站1T604', '', '机1/2辅助电源', '0', '400', '0.0000', '3', '1', null, null, '25');
INSERT INTO `circuitinfo` VALUES ('26', '/pd/t2/es/1t605', 'T2能源站1T605', '', '变电所电汇', '0', '400', '40.0000', '3', '1', null, null, '26');
INSERT INTO `circuitinfo` VALUES ('27', '/pd/t2/es/1t606', 'T2能源站1T606', '', '消防泵电汇', '0', '400', '61.5000', '3', '1', null, null, '27');
INSERT INTO `circuitinfo` VALUES ('28', '/pd/t2/es/1t607', 'T2能源站1T607', '', '备用', '0', '400', '0.0000', '3', '1', null, null, '28');
INSERT INTO `circuitinfo` VALUES ('29', '/pd/t2/es/1t608', 'T2能源站1T608', '', '变电所通风电汇', '0', '400', '101.0000', '3', '1', null, null, '29');

-- ----------------------------
-- Table structure for commmanage
-- ----------------------------
DROP TABLE IF EXISTS `commmanage`;
CREATE TABLE `commmanage` (
  `deviceId` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `deviceType` int(11) NOT NULL COMMENT '设备类型 1-DC 2-网关 3-仪表',
  `deviceName` varchar(200) NOT NULL COMMENT '设备名称，用于显示',
  `deviceUrl` varchar(200) DEFAULT NULL COMMENT '设备Url，用于查询状态，不用于显示，可选',
  `commType` int(11) NOT NULL COMMENT '通讯类型 1-gprs 2-以太网 3-RS485 255-未知',
  `firstShow` int(11) NOT NULL COMMENT '首界面是否显示 1-显示 0-不显示',
  `parentId` int(11) NOT NULL COMMENT '父设备ID 0-顶级设备',
  `parentChannelSn` int(11) DEFAULT NULL COMMENT '父设备通道编号，可选',
  `canQuery` int(11) NOT NULL COMMENT '在线状态可查询 1-可查询 0-不可查询',
  PRIMARY KEY (`deviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='14 通讯管理';

-- ----------------------------
-- Records of commmanage
-- ----------------------------
INSERT INTO `commmanage` VALUES ('1', '1', 'DC-1', null, '2', '1', '0', null, '1');
INSERT INTO `commmanage` VALUES ('2', '2', 'MOXA-1', null, '2', '1', '1', null, '1');
INSERT INTO `commmanage` VALUES ('3', '3', 'EPM 5500P-1', null, '3', '1', '2', '1', '0');
INSERT INTO `commmanage` VALUES ('4', '3', 'EPM 5500P-2', null, '3', '1', '2', '2', '0');
INSERT INTO `commmanage` VALUES ('5', '3', 'EPM 5500P-3', null, '3', '1', '2', '2', '0');
INSERT INTO `commmanage` VALUES ('6', '3', 'PMAC600B-4', null, '3', '1', '2', '3', '0');
INSERT INTO `commmanage` VALUES ('7', '3', 'PMAC600B-5', null, '3', '0', '2', '3', '0');
INSERT INTO `commmanage` VALUES ('8', '3', 'PMAC600B-6', null, '3', '0', '2', '3', '0');
INSERT INTO `commmanage` VALUES ('9', '3', 'PMAC600B-7', null, '3', '0', '2', '3', '0');
INSERT INTO `commmanage` VALUES ('10', '3', 'PMAC600B-8', null, '3', '1', '2', '3', '0');
INSERT INTO `commmanage` VALUES ('11', '3', 'PMAC600B-1', null, '3', '1', '2', '4', '0');
INSERT INTO `commmanage` VALUES ('12', '3', 'PMAC600B-2', '', '3', '0', '2', '4', '0');
INSERT INTO `commmanage` VALUES ('13', '3', 'PMAC600B-3', '', '3', '0', '2', '4', '0');
INSERT INTO `commmanage` VALUES ('14', '3', 'PMAC600B-4', '', '3', '0', '2', '4', '0');
INSERT INTO `commmanage` VALUES ('15', '3', 'PMAC600B-5', '', '3', '0', '2', '4', '0');
INSERT INTO `commmanage` VALUES ('16', '3', 'PMAC600B-6', '', '3', '1', '2', '4', '0');
INSERT INTO `commmanage` VALUES ('17', '3', 'PMAC600B-1', '', '3', '1', '2', '5', '0');
INSERT INTO `commmanage` VALUES ('18', '3', 'PMAC600B-2', '', '3', '0', '2', '5', '0');
INSERT INTO `commmanage` VALUES ('19', '3', 'PMAC600B-3', '', '3', '0', '2', '5', '0');
INSERT INTO `commmanage` VALUES ('20', '3', 'PMAC600B-4', '', '3', '0', '2', '5', '0');
INSERT INTO `commmanage` VALUES ('21', '3', 'PMAC600B-5', '', '3', '0', '2', '5', '0');
INSERT INTO `commmanage` VALUES ('22', '3', 'PMAC600B-7', '', '3', '0', '2', '5', '0');
INSERT INTO `commmanage` VALUES ('23', '3', 'PMAC600B-8', '', '3', '1', '2', '5', '0');
INSERT INTO `commmanage` VALUES ('24', '3', 'PMAC600B-1', '', '3', '1', '2', '6', '0');
INSERT INTO `commmanage` VALUES ('25', '3', 'PMAC600B-2', '', '3', '0', '2', '6', '0');
INSERT INTO `commmanage` VALUES ('26', '3', 'PMAC600B-3', '', '3', '0', '2', '6', '0');
INSERT INTO `commmanage` VALUES ('27', '3', 'PMAC600B-4', '', '3', '0', '2', '6', '0');
INSERT INTO `commmanage` VALUES ('28', '3', 'PMAC600B-5', '', '3', '0', '2', '6', '0');
INSERT INTO `commmanage` VALUES ('29', '3', 'PMAC600B-6', '', '3', '0', '2', '6', '0');
INSERT INTO `commmanage` VALUES ('30', '3', 'PMAC600B-7', '', '3', '0', '2', '6', '0');
INSERT INTO `commmanage` VALUES ('31', '3', 'PMAC600B-8', '', '3', '1', '2', '6', '0');

-- ----------------------------
-- Table structure for datamanage
-- ----------------------------
DROP TABLE IF EXISTS `datamanage`;
CREATE TABLE `datamanage` (
  `datamanageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据管理ID',
  `areaId` int(11) NOT NULL COMMENT '区域ID，关联到表10 areainfo',
  `subsysId` int(11) NOT NULL COMMENT '子系统ID，关联到表11 subsysinfo',
  `enconCollection` int(11) DEFAULT NULL COMMENT '能耗采集间隔，单位：秒',
  `enconLocal` int(11) DEFAULT NULL COMMENT '能耗本地上传间隔，单位：秒',
  `enconRemote` int(11) DEFAULT NULL COMMENT '能耗远程上传间隔，单位：秒',
  `enconDecimal` int(11) DEFAULT NULL COMMENT '能耗小数点位数',
  `enCollection` int(11) DEFAULT NULL COMMENT '能量采集间隔，单位：秒',
  `enLocal` int(11) DEFAULT NULL COMMENT '能量本地上传间隔，单位：秒',
  `enRemote` int(11) DEFAULT NULL COMMENT '能量远程上传间隔，单位：秒',
  `enDecimal` int(11) DEFAULT NULL COMMENT '能量小数点位数',
  `envCollection` int(11) DEFAULT NULL COMMENT '环境采集间隔，单位：秒',
  `envLocal` int(11) DEFAULT NULL COMMENT '环境本地上传间隔，单位：秒',
  `envRemote` int(11) DEFAULT NULL COMMENT '环境远程上传间隔，单位：秒',
  `envDecimal` int(11) DEFAULT NULL COMMENT '环境小数点位数',
  PRIMARY KEY (`datamanageId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='13 数据管理';

-- ----------------------------
-- Records of datamanage
-- ----------------------------
INSERT INTO `datamanage` VALUES ('1', '1', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');
INSERT INTO `datamanage` VALUES ('2', '2', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');
INSERT INTO `datamanage` VALUES ('3', '3', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');
INSERT INTO `datamanage` VALUES ('4', '4', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');
INSERT INTO `datamanage` VALUES ('5', '5', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');
INSERT INTO `datamanage` VALUES ('6', '6', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');
INSERT INTO `datamanage` VALUES ('7', '7', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');
INSERT INTO `datamanage` VALUES ('8', '8', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');
INSERT INTO `datamanage` VALUES ('9', '9', '3', '60', '900', '900', '2', '60', '900', '900', '2', '60', '900', '900', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='02 数据历史记录';

-- ----------------------------
-- Records of dataontime
-- ----------------------------
INSERT INTO `dataontime` VALUES ('1', '2', '1', '2015-12-16 09:00:00', '2015-12-16 09:01:26', '900', '0', '1', '1', '0', '2015-12-16 09:01:54', '2015-12-16 09:01:54', '1000.1000', null, '20.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dataontime` VALUES ('2', '2', '1', '2015-12-16 09:15:00', '2015-12-16 09:15:35', '900', '0', '1', '1', '0', '2015-12-16 09:15:50', '2015-12-16 09:15:50', '1030.1000', null, '30.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dataontime` VALUES ('3', '2', '1', '2015-12-16 09:30:00', '2015-12-16 09:30:47', '900', '0', '1', '1', '0', '2015-12-16 09:31:14', '2015-12-16 09:31:14', '1049.1000', null, '19.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dataontime` VALUES ('4', '2', '1', '2015-12-16 09:45:00', '2015-12-16 09:45:03', '900', '0', '1', '1', '0', '2015-12-16 09:45:15', '2015-12-16 09:45:15', '1080.0000', null, '30.9000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dataontime` VALUES ('5', '2', '1', '2015-12-16 10:00:00', '2015-12-16 10:15:20', '900', '1', '1', '1', '0', '2015-12-16 10:15:40', '2015-12-16 10:15:40', '1140.0000', null, '60.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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
-- Table structure for dataquality
-- ----------------------------
DROP TABLE IF EXISTS `dataquality`;
CREATE TABLE `dataquality` (
  `qualityId` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据质量自增长ID',
  `qualityTime` datetime NOT NULL COMMENT '数据质量时间，年月日时分，均为15分钟的整数倍，代表开始时间',
  `dataLayer` int(11) NOT NULL COMMENT '数据层级，1-仪表，2-能源',
  `dataTypeId` int(11) NOT NULL COMMENT '能源或仪表类型ID，关联能源类型表或仪表类型表',
  `dataId` int(11) NOT NULL COMMENT '能源ID或仪表ID，对应能源表或仪表表',
  `planCollectCnt` int(11) DEFAULT '0' COMMENT '应采集个数',
  `realCollectCnt` int(11) DEFAULT '0' COMMENT '实时采集个数',
  `realNormalCnt` int(11) DEFAULT '0' COMMENT '实时采集正常个数',
  `retranNormalCnt` int(11) DEFAULT '0' COMMENT '重传正常个数',
  `dataRepairCnt` int(11) DEFAULT '0' COMMENT '数据修复个数',
  `dataErrCnt` int(11) DEFAULT '0' COMMENT '数据错误个数',
  `dataLoseCnt` int(11) DEFAULT '0' COMMENT '数据丢失个数',
  PRIMARY KEY (`qualityId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='01 数据质量';

-- ----------------------------
-- Records of dataquality
-- ----------------------------
INSERT INTO `dataquality` VALUES ('1', '2015-11-01 00:00:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('2', '2015-11-01 00:15:00', '2', '1', '1', '1', '1', '0', '1', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('3', '2015-11-01 00:30:00', '2', '1', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `dataquality` VALUES ('4', '2015-11-01 00:45:00', '2', '1', '1', '1', '1', '0', '0', '0', '1', '0');
INSERT INTO `dataquality` VALUES ('5', '2015-11-01 01:00:00', '2', '1', '1', '1', '0', '0', '0', '0', '0', '1');
INSERT INTO `dataquality` VALUES ('6', '2015-11-01 01:15:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('7', '2015-11-01 01:30:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('8', '2015-11-01 01:45:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('9', '2015-11-01 02:00:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('10', '2015-11-01 02:15:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('11', '2015-11-01 02:30:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('12', '2015-11-01 02:45:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('13', '2015-11-01 03:00:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('14', '2015-11-01 03:15:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('15', '2015-11-01 03:30:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('16', '2015-11-01 03:45:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('17', '2015-11-01 04:00:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('18', '2015-11-01 04:15:00', '2', '1', '1', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('19', '2015-11-01 00:00:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('20', '2015-11-01 00:15:00', '2', '1', '2', '1', '1', '0', '1', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('21', '2015-11-01 00:30:00', '2', '1', '2', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `dataquality` VALUES ('22', '2015-11-01 00:45:00', '2', '1', '2', '1', '1', '0', '0', '0', '1', '0');
INSERT INTO `dataquality` VALUES ('23', '2015-11-01 01:00:00', '2', '1', '2', '1', '0', '0', '0', '0', '0', '1');
INSERT INTO `dataquality` VALUES ('24', '2015-11-01 01:15:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('25', '2015-11-01 01:30:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('26', '2015-11-01 01:45:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('27', '2015-11-01 02:00:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('28', '2015-11-01 02:15:00', '2', '1', '2', '1', '1', '0', '1', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('29', '2015-11-01 02:30:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('30', '2015-11-01 02:45:00', '2', '1', '2', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `dataquality` VALUES ('31', '2015-11-01 03:00:00', '2', '1', '2', '1', '1', '0', '0', '0', '1', '0');
INSERT INTO `dataquality` VALUES ('32', '2015-11-01 03:15:00', '2', '1', '2', '1', '0', '0', '0', '0', '0', '1');
INSERT INTO `dataquality` VALUES ('33', '2015-11-01 03:30:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('34', '2015-11-01 03:45:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('35', '2015-11-01 04:00:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `dataquality` VALUES ('36', '2015-11-01 04:15:00', '2', '1', '2', '1', '1', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for datarelation
-- ----------------------------
DROP TABLE IF EXISTS `datarelation`;
CREATE TABLE `datarelation` (
  `dataRelationId` int(11) NOT NULL AUTO_INCREMENT,
  `dataUrl` varchar(200) NOT NULL COMMENT '数据url，仪表或能源',
  `areaId` int(11) NOT NULL COMMENT '区域ID，最后一级，关联到表10 areainfo',
  `subsysId` int(11) NOT NULL COMMENT '子系统ID，关联到表11 subsysinfo',
  PRIMARY KEY (`dataRelationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='12 数据从属关联表';

-- ----------------------------
-- Records of datarelation
-- ----------------------------

-- ----------------------------
-- Table structure for dataurl
-- ----------------------------
DROP TABLE IF EXISTS `dataurl`;
CREATE TABLE `dataurl` (
  `dataId` int(11) NOT NULL AUTO_INCREMENT,
  `dataUrl` varchar(500) NOT NULL,
  PRIMARY KEY (`dataId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='09 dataontime关联dataId';

-- ----------------------------
-- Records of dataurl
-- ----------------------------
INSERT INTO `dataurl` VALUES ('1', '/pd/t2/es/1t1');
INSERT INTO `dataurl` VALUES ('2', '/pd/t2/es/1t201');
INSERT INTO `dataurl` VALUES ('3', '/pd/t2/es/1t202');
INSERT INTO `dataurl` VALUES ('4', '/pd/t2/es/1t301');
INSERT INTO `dataurl` VALUES ('5', '/pd/t2/es/1t302');
INSERT INTO `dataurl` VALUES ('6', '/pd/t2/es/1t303');
INSERT INTO `dataurl` VALUES ('7', '/pd/t2/es/1t304');
INSERT INTO `dataurl` VALUES ('10', '/pd/t2/es/1t305');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='04 数据采集器信息表';

-- ----------------------------
-- Records of dc
-- ----------------------------
INSERT INTO `dc` VALUES ('1', '/pd/dc/1', null, null, null, '1', '192.168.1.10', '0', '2015-11-03 10:05:47', '2015-11-03 10:05:52');
INSERT INTO `dc` VALUES ('2', '/pd/dc/2', null, null, null, '2', '192.168.1.11', '0', '2015-11-03 10:06:33', '2015-11-03 10:06:39');
INSERT INTO `dc` VALUES ('3', '/jj2/dc/3', null, null, null, null, null, '1', null, '2015-11-17 11:43:40');
INSERT INTO `dc` VALUES ('4', '/test/dc/2', null, null, null, null, null, '1', null, '2015-11-17 15:01:48');
INSERT INTO `dc` VALUES ('5', '/test/dc/4', null, null, null, null, null, '1', null, '2015-12-16 09:47:10');

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
  `receTime` datetime DEFAULT NULL COMMENT '接收时间',
  `deviceStatus` int(11) NOT NULL COMMENT '设备状态，0：离线；1：在线；2：重启',
  `bpSign` int(11) DEFAULT NULL COMMENT '断点标识，0-正常，1-重传',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`devolId`),
  KEY `dtIndex` (`deviceType`),
  KEY `didIndex` (`deviceId`),
  KEY `ctIndex` (`currentTime`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COMMENT='06 设备在线状态历史记录表';

-- ----------------------------
-- Records of devonline
-- ----------------------------
INSERT INTO `devonline` VALUES ('1', '1', '1', '1', '2015-11-03 10:57:34', null, '2', '0', '2015-11-03 10:57:53');
INSERT INTO `devonline` VALUES ('2', '1', '2', '1', '2015-11-03 10:58:12', null, '1', '0', '2015-11-03 10:58:21');
INSERT INTO `devonline` VALUES ('3', '3', '2', '8', '2015-11-17 12:03:00', '2015-11-17 12:03:00', '1', null, '2015-11-17 12:03:17');
INSERT INTO `devonline` VALUES ('4', '3', '2', '8', '2015-11-17 12:03:20', '2015-11-17 12:03:20', '1', null, '2015-11-17 12:03:20');
INSERT INTO `devonline` VALUES ('5', '3', '2', '8', '2015-11-17 12:03:40', '2015-11-17 12:03:40', '1', null, '2015-11-17 12:03:40');
INSERT INTO `devonline` VALUES ('6', '3', '2', '8', '2015-11-17 12:04:00', '2015-11-17 12:04:00', '1', null, '2015-11-17 12:04:00');
INSERT INTO `devonline` VALUES ('7', '3', '2', '8', '2015-11-17 12:04:20', '2015-11-17 12:04:20', '1', null, '2015-11-17 12:04:20');
INSERT INTO `devonline` VALUES ('8', '3', '2', '8', '2015-11-17 12:04:40', '2015-11-17 12:04:40', '1', null, '2015-11-17 12:04:40');
INSERT INTO `devonline` VALUES ('9', '3', '2', '8', '2015-11-17 12:05:00', '2015-11-17 12:05:00', '1', null, '2015-11-17 12:05:00');
INSERT INTO `devonline` VALUES ('10', '3', '2', '8', '2015-11-17 12:05:20', '2015-11-17 12:05:20', '1', null, '2015-11-17 12:05:20');
INSERT INTO `devonline` VALUES ('11', '3', '2', '8', '2015-11-17 12:05:40', '2015-11-17 12:05:40', '1', null, '2015-11-17 12:05:40');
INSERT INTO `devonline` VALUES ('12', '3', '2', '8', '2015-11-17 12:06:00', '2015-11-17 12:06:00', '1', null, '2015-11-17 12:06:00');
INSERT INTO `devonline` VALUES ('13', '3', '2', '8', '2015-11-17 12:06:20', '2015-11-17 12:06:20', '1', null, '2015-11-17 12:06:20');
INSERT INTO `devonline` VALUES ('14', '3', '2', '8', '2015-11-17 12:06:40', '2015-11-17 12:06:40', '1', null, '2015-11-17 12:06:40');
INSERT INTO `devonline` VALUES ('15', '3', '2', '8', '2015-11-17 12:07:00', '2015-11-17 12:07:00', '1', null, '2015-11-17 12:07:00');
INSERT INTO `devonline` VALUES ('16', '3', '2', '8', '2015-11-17 12:07:20', '2015-11-17 12:07:20', '1', null, '2015-11-17 12:07:20');
INSERT INTO `devonline` VALUES ('17', '3', '2', '8', '2015-11-17 12:07:40', '2015-11-17 12:07:40', '1', null, '2015-11-17 12:07:40');
INSERT INTO `devonline` VALUES ('18', '3', '2', '8', '2015-11-17 12:08:00', '2015-11-17 12:08:00', '1', null, '2015-11-17 12:08:00');
INSERT INTO `devonline` VALUES ('19', '3', '2', '8', '2015-11-17 12:08:20', '2015-11-17 12:08:20', '1', null, '2015-11-17 12:08:20');
INSERT INTO `devonline` VALUES ('20', '3', '2', '8', '2015-11-17 12:08:40', '2015-11-17 12:08:40', '1', null, '2015-11-17 12:08:40');
INSERT INTO `devonline` VALUES ('21', '3', '2', '8', '2015-11-17 12:09:00', '2015-11-17 12:09:00', '1', null, '2015-11-17 12:09:00');
INSERT INTO `devonline` VALUES ('22', '3', '2', '8', '2015-11-17 12:09:20', '2015-11-17 12:09:20', '1', null, '2015-11-17 12:09:20');
INSERT INTO `devonline` VALUES ('23', '3', '2', '8', '2015-11-17 12:09:40', '2015-11-17 12:09:40', '1', null, '2015-11-17 12:09:40');
INSERT INTO `devonline` VALUES ('24', '3', '2', '8', '2015-11-17 12:10:00', '2015-11-17 12:10:00', '1', null, '2015-11-17 12:10:00');
INSERT INTO `devonline` VALUES ('25', '3', '2', '8', '2015-11-17 12:10:20', '2015-11-17 12:10:20', '1', null, '2015-11-17 12:10:20');
INSERT INTO `devonline` VALUES ('26', '3', '2', '8', '2015-11-17 12:10:40', '2015-11-17 12:10:40', '1', null, '2015-11-17 12:10:40');
INSERT INTO `devonline` VALUES ('27', '3', '2', '8', '2015-11-17 12:11:00', '2015-11-17 12:11:00', '1', null, '2015-11-17 12:11:00');
INSERT INTO `devonline` VALUES ('28', '3', '2', '8', '2015-11-17 12:11:20', '2015-11-17 12:11:20', '1', null, '2015-11-17 12:11:20');
INSERT INTO `devonline` VALUES ('29', '3', '2', '8', '2015-11-17 12:11:40', '2015-11-17 12:11:40', '1', null, '2015-11-17 12:11:40');
INSERT INTO `devonline` VALUES ('30', '3', '2', '8', '2015-11-17 12:12:00', '2015-11-17 12:12:00', '1', null, '2015-11-17 12:12:00');
INSERT INTO `devonline` VALUES ('31', '3', '2', '8', '2015-11-17 12:12:20', '2015-11-17 12:12:20', '1', null, '2015-11-17 12:12:20');
INSERT INTO `devonline` VALUES ('32', '3', '2', '8', '2015-11-17 12:12:40', '2015-11-17 12:12:40', '1', null, '2015-11-17 12:12:40');
INSERT INTO `devonline` VALUES ('33', '3', '2', '8', '2015-11-17 12:13:00', '2015-11-17 12:13:00', '1', null, '2015-11-17 12:13:00');
INSERT INTO `devonline` VALUES ('34', '3', '2', '8', '2015-11-17 12:13:20', '2015-11-17 12:13:20', '1', null, '2015-11-17 12:13:20');
INSERT INTO `devonline` VALUES ('35', '3', '2', '8', '2015-11-17 12:13:40', '2015-11-17 12:13:40', '1', null, '2015-11-17 12:13:40');
INSERT INTO `devonline` VALUES ('36', '3', '2', '8', '2015-11-17 12:14:00', '2015-11-17 12:14:00', '1', null, '2015-11-17 12:14:00');
INSERT INTO `devonline` VALUES ('37', '3', '2', '8', '2015-11-17 12:14:20', '2015-11-17 12:14:20', '1', null, '2015-11-17 12:14:20');
INSERT INTO `devonline` VALUES ('38', '3', '2', '8', '2015-11-17 12:14:40', '2015-11-17 12:14:40', '1', null, '2015-11-17 12:14:40');
INSERT INTO `devonline` VALUES ('39', '3', '2', '8', '2015-11-17 12:15:00', '2015-11-17 12:15:00', '1', null, '2015-11-17 12:15:00');
INSERT INTO `devonline` VALUES ('40', '3', '2', '8', '2015-11-17 12:15:20', '2015-11-17 12:15:20', '1', null, '2015-11-17 12:15:20');
INSERT INTO `devonline` VALUES ('41', '3', '2', '8', '2015-11-17 12:15:40', '2015-11-17 12:15:40', '1', null, '2015-11-17 12:15:40');
INSERT INTO `devonline` VALUES ('42', '3', '2', '8', '2015-11-17 12:16:00', '2015-11-17 12:16:00', '1', null, '2015-11-17 12:16:00');
INSERT INTO `devonline` VALUES ('43', '3', '2', '8', '2015-11-17 12:16:20', '2015-11-17 12:16:20', '1', null, '2015-11-17 12:16:20');
INSERT INTO `devonline` VALUES ('44', '3', '2', '8', '2015-11-17 12:16:40', '2015-11-17 12:16:40', '1', null, '2015-11-17 12:16:40');
INSERT INTO `devonline` VALUES ('45', '3', '2', '8', '2015-11-17 12:17:00', '2015-11-17 12:17:00', '1', null, '2015-11-17 12:17:00');
INSERT INTO `devonline` VALUES ('46', '3', '2', '8', '2015-11-17 12:17:20', '2015-11-17 12:17:20', '1', null, '2015-11-17 12:17:20');
INSERT INTO `devonline` VALUES ('47', '3', '2', '8', '2015-11-17 12:17:40', '2015-11-17 12:17:40', '1', null, '2015-11-17 12:17:40');
INSERT INTO `devonline` VALUES ('48', '3', '2', '8', '2015-11-17 12:18:00', '2015-11-17 12:18:00', '1', null, '2015-11-17 12:18:00');
INSERT INTO `devonline` VALUES ('49', '3', '2', '8', '2015-11-17 12:18:20', '2015-11-17 12:18:20', '1', null, '2015-11-17 12:18:20');
INSERT INTO `devonline` VALUES ('50', '3', '2', '8', '2015-11-17 12:18:40', '2015-11-17 12:18:40', '1', null, '2015-11-17 12:18:40');
INSERT INTO `devonline` VALUES ('51', '3', '2', '8', '2015-11-17 12:19:00', '2015-11-17 12:19:00', '1', null, '2015-11-17 12:19:00');
INSERT INTO `devonline` VALUES ('52', '3', '2', '8', '2015-11-17 12:19:20', '2015-11-17 12:19:20', '1', null, '2015-11-17 12:19:20');
INSERT INTO `devonline` VALUES ('53', '3', '2', '8', '2015-11-17 12:19:40', '2015-11-17 12:19:40', '1', null, '2015-11-17 12:19:40');
INSERT INTO `devonline` VALUES ('54', '3', '2', '8', '2015-11-17 12:20:00', '2015-11-17 12:20:00', '1', null, '2015-11-17 12:20:00');
INSERT INTO `devonline` VALUES ('55', '3', '2', '8', '2015-11-17 12:20:20', '2015-11-17 12:20:20', '1', null, '2015-11-17 12:20:20');
INSERT INTO `devonline` VALUES ('56', '3', '2', '8', '2015-11-17 12:20:40', '2015-11-17 12:20:40', '1', null, '2015-11-17 12:20:40');
INSERT INTO `devonline` VALUES ('57', '3', '2', '8', '2015-11-17 12:21:00', '2015-11-17 12:21:00', '1', null, '2015-11-17 12:21:00');
INSERT INTO `devonline` VALUES ('58', '3', '2', '8', '2015-11-17 12:21:20', '2015-11-17 12:21:20', '1', null, '2015-11-17 12:21:20');
INSERT INTO `devonline` VALUES ('59', '3', '2', '8', '2015-11-17 12:21:40', '2015-11-17 12:21:40', '1', null, '2015-11-17 12:21:40');
INSERT INTO `devonline` VALUES ('60', '3', '2', '8', '2015-11-17 12:22:00', '2015-11-17 12:22:00', '1', null, '2015-11-17 12:22:00');
INSERT INTO `devonline` VALUES ('61', '3', '2', '8', '2015-11-17 12:22:20', '2015-11-17 12:22:20', '1', null, '2015-11-17 12:22:20');
INSERT INTO `devonline` VALUES ('62', '3', '2', '8', '2015-11-17 12:22:40', '2015-11-17 12:22:40', '1', null, '2015-11-17 12:22:40');
INSERT INTO `devonline` VALUES ('63', '3', '2', '8', '2015-11-17 12:23:00', '2015-11-17 12:23:00', '1', null, '2015-11-17 12:23:00');
INSERT INTO `devonline` VALUES ('64', '3', '2', '8', '2015-11-17 12:23:20', '2015-11-17 12:23:20', '1', null, '2015-11-17 12:23:20');
INSERT INTO `devonline` VALUES ('65', '3', '2', '8', '2015-11-17 12:23:40', '2015-11-17 12:23:40', '1', null, '2015-11-17 12:23:40');
INSERT INTO `devonline` VALUES ('66', '3', '2', '8', '2015-11-17 12:24:00', '2015-11-17 12:24:00', '1', null, '2015-11-17 12:24:00');
INSERT INTO `devonline` VALUES ('67', '3', '2', '8', '2015-11-17 12:24:20', '2015-11-17 12:24:20', '1', null, '2015-11-17 12:24:20');
INSERT INTO `devonline` VALUES ('68', '3', '2', '8', '2015-11-17 12:24:40', '2015-11-17 12:24:40', '1', null, '2015-11-17 12:24:40');
INSERT INTO `devonline` VALUES ('69', '3', '2', '8', '2015-11-17 12:25:00', '2015-11-17 12:25:00', '1', null, '2015-11-17 12:25:00');
INSERT INTO `devonline` VALUES ('70', '3', '2', '8', '2015-11-17 12:25:20', '2015-11-17 12:25:20', '1', null, '2015-11-17 12:25:20');
INSERT INTO `devonline` VALUES ('71', '3', '2', '8', '2015-11-17 12:25:40', '2015-11-17 12:25:40', '1', null, '2015-11-17 12:25:40');
INSERT INTO `devonline` VALUES ('72', '3', '2', '8', '2015-11-17 12:26:00', '2015-11-17 12:26:00', '1', null, '2015-11-17 12:26:00');
INSERT INTO `devonline` VALUES ('73', '3', '2', '8', '2015-11-17 12:26:20', '2015-11-17 12:26:20', '1', null, '2015-11-17 12:26:20');
INSERT INTO `devonline` VALUES ('74', '3', '2', '8', '2015-11-17 12:26:40', '2015-11-17 12:26:40', '1', null, '2015-11-17 12:26:40');
INSERT INTO `devonline` VALUES ('75', '3', '2', '8', '2015-11-17 12:27:00', '2015-11-17 12:27:00', '1', null, '2015-11-17 12:27:00');
INSERT INTO `devonline` VALUES ('76', '3', '2', '8', '2015-11-17 12:27:20', '2015-11-17 12:27:20', '1', null, '2015-11-17 12:27:20');
INSERT INTO `devonline` VALUES ('77', '3', '2', '8', '2015-11-17 12:27:40', '2015-11-17 12:27:40', '1', null, '2015-11-17 12:27:40');
INSERT INTO `devonline` VALUES ('78', '3', '2', '8', '2015-11-17 12:28:00', '2015-11-17 12:28:00', '1', null, '2015-11-17 12:28:00');
INSERT INTO `devonline` VALUES ('79', '3', '2', '8', '2015-11-17 12:28:20', '2015-11-17 12:28:20', '1', null, '2015-11-17 12:28:20');
INSERT INTO `devonline` VALUES ('80', '3', '2', '8', '2015-11-17 12:28:40', '2015-11-17 12:28:40', '1', null, '2015-11-17 12:28:40');
INSERT INTO `devonline` VALUES ('81', '3', '2', '8', '2015-11-17 12:29:00', '2015-11-17 12:29:00', '1', null, '2015-11-17 12:29:00');
INSERT INTO `devonline` VALUES ('82', '3', '2', '8', '2015-11-17 12:29:20', '2015-11-17 12:29:20', '1', null, '2015-11-17 12:29:20');
INSERT INTO `devonline` VALUES ('83', '3', '2', '8', '2015-11-17 12:29:40', '2015-11-17 12:29:40', '1', null, '2015-11-17 12:29:40');
INSERT INTO `devonline` VALUES ('84', '3', '2', '8', '2015-11-17 12:30:00', '2015-11-17 12:30:00', '1', null, '2015-11-17 12:30:00');
INSERT INTO `devonline` VALUES ('85', '3', '2', '8', '2015-11-17 12:30:20', '2015-11-17 12:30:20', '1', null, '2015-11-17 12:30:20');
INSERT INTO `devonline` VALUES ('86', '3', '2', '8', '2015-11-17 12:30:40', '2015-11-17 12:30:40', '1', null, '2015-11-17 12:30:40');
INSERT INTO `devonline` VALUES ('87', '3', '2', '8', '2015-11-17 12:31:00', '2015-11-17 12:31:00', '1', null, '2015-11-17 12:31:00');
INSERT INTO `devonline` VALUES ('88', '3', '2', '8', '2015-11-17 12:31:20', '2015-11-17 12:31:20', '1', null, '2015-11-17 12:31:20');
INSERT INTO `devonline` VALUES ('89', '3', '2', '8', '2015-11-17 12:31:40', '2015-11-17 12:31:40', '1', null, '2015-11-17 12:31:40');
INSERT INTO `devonline` VALUES ('90', '3', '2', '8', '2015-11-17 12:32:00', '2015-11-17 12:32:00', '1', null, '2015-11-17 12:32:00');
INSERT INTO `devonline` VALUES ('91', '3', '2', '8', '2015-11-17 12:32:20', '2015-11-17 12:32:20', '1', null, '2015-11-17 12:32:20');
INSERT INTO `devonline` VALUES ('92', '3', '2', '8', '2015-11-17 12:32:40', '2015-11-17 12:32:40', '1', null, '2015-11-17 12:32:40');
INSERT INTO `devonline` VALUES ('93', '3', '2', '8', '2015-11-17 12:33:00', '2015-11-17 12:33:00', '1', null, '2015-11-17 12:33:00');
INSERT INTO `devonline` VALUES ('94', '3', '2', '8', '2015-11-17 12:33:20', '2015-11-17 12:33:20', '1', null, '2015-11-17 12:33:20');
INSERT INTO `devonline` VALUES ('95', '3', '2', '8', '2015-11-17 12:33:40', '2015-11-17 12:33:40', '1', null, '2015-11-17 12:33:40');
INSERT INTO `devonline` VALUES ('96', '3', '2', '8', '2015-11-17 12:34:00', '2015-11-17 12:34:00', '1', null, '2015-11-17 12:34:00');
INSERT INTO `devonline` VALUES ('97', '3', '2', '8', '2015-11-17 12:34:20', '2015-11-17 12:34:20', '1', null, '2015-11-17 12:34:20');
INSERT INTO `devonline` VALUES ('98', '3', '2', '8', '2015-11-17 12:34:40', '2015-11-17 12:34:40', '1', null, '2015-11-17 12:34:40');
INSERT INTO `devonline` VALUES ('99', '3', '2', '8', '2015-11-17 12:35:00', '2015-11-17 12:35:00', '1', null, '2015-11-17 12:35:00');
INSERT INTO `devonline` VALUES ('100', '3', '2', '8', '2015-11-17 12:35:20', '2015-11-17 12:35:20', '1', null, '2015-11-17 12:35:20');
INSERT INTO `devonline` VALUES ('101', '3', '2', '8', '2015-11-17 12:35:40', '2015-11-17 12:35:40', '1', null, '2015-11-17 12:35:40');
INSERT INTO `devonline` VALUES ('102', '3', '2', '8', '2015-11-17 12:36:00', '2015-11-17 12:36:00', '1', null, '2015-11-17 12:36:00');
INSERT INTO `devonline` VALUES ('103', '3', '2', '8', '2015-11-17 12:36:20', '2015-11-17 12:36:20', '1', null, '2015-11-17 12:36:20');
INSERT INTO `devonline` VALUES ('104', '3', '2', '8', '2015-11-17 12:36:40', '2015-11-17 12:36:40', '1', null, '2015-11-17 12:36:40');
INSERT INTO `devonline` VALUES ('105', '3', '2', '8', '2015-11-17 12:37:00', '2015-11-17 12:37:00', '1', null, '2015-11-17 12:37:00');
INSERT INTO `devonline` VALUES ('106', '3', '2', '8', '2015-11-17 12:37:20', '2015-11-17 12:37:20', '1', null, '2015-11-17 12:37:20');
INSERT INTO `devonline` VALUES ('107', '3', '2', '8', '2015-11-17 12:37:40', '2015-11-17 12:37:40', '1', null, '2015-11-17 12:37:40');
INSERT INTO `devonline` VALUES ('108', '3', '2', '8', '2015-11-17 12:38:00', '2015-11-17 12:38:00', '1', null, '2015-11-17 12:38:00');
INSERT INTO `devonline` VALUES ('109', '3', '2', '8', '2015-11-17 12:38:20', '2015-11-17 12:38:20', '1', null, '2015-11-17 12:38:20');
INSERT INTO `devonline` VALUES ('110', '3', '2', '8', '2015-11-17 12:38:40', '2015-11-17 12:38:40', '1', null, '2015-11-17 12:38:40');
INSERT INTO `devonline` VALUES ('111', '3', '2', '8', '2015-11-17 12:39:00', '2015-11-17 12:39:00', '1', null, '2015-11-17 12:39:00');
INSERT INTO `devonline` VALUES ('112', '3', '2', '8', '2015-11-17 12:39:20', '2015-11-17 12:39:20', '1', null, '2015-11-17 12:39:20');
INSERT INTO `devonline` VALUES ('113', '3', '2', '8', '2015-11-17 12:39:40', '2015-11-17 12:39:40', '1', null, '2015-11-17 12:39:40');
INSERT INTO `devonline` VALUES ('114', '3', '2', '8', '2015-11-17 12:40:00', '2015-11-17 12:40:00', '1', null, '2015-11-17 12:40:00');
INSERT INTO `devonline` VALUES ('115', '3', '2', '8', '2015-11-17 12:40:20', '2015-11-17 12:40:20', '1', null, '2015-11-17 12:40:20');
INSERT INTO `devonline` VALUES ('116', '3', '2', '8', '2015-11-17 12:40:40', '2015-11-17 12:40:40', '1', null, '2015-11-17 12:40:40');
INSERT INTO `devonline` VALUES ('117', '3', '2', '8', '2015-11-17 12:41:00', '2015-11-17 12:41:00', '1', null, '2015-11-17 12:41:00');
INSERT INTO `devonline` VALUES ('118', '3', '2', '8', '2015-11-17 12:41:20', '2015-11-17 12:41:20', '1', null, '2015-11-17 12:41:20');
INSERT INTO `devonline` VALUES ('119', '3', '2', '8', '2015-11-17 12:41:40', '2015-11-17 12:41:40', '1', null, '2015-11-17 12:41:40');
INSERT INTO `devonline` VALUES ('120', '3', '2', '8', '2015-11-17 12:42:00', '2015-11-17 12:42:00', '1', null, '2015-11-17 12:42:00');
INSERT INTO `devonline` VALUES ('121', '3', '2', '8', '2015-11-17 12:42:20', '2015-11-17 12:42:20', '1', null, '2015-11-17 12:42:20');
INSERT INTO `devonline` VALUES ('122', '3', '2', '8', '2015-11-17 12:42:40', '2015-11-17 12:42:40', '1', null, '2015-11-17 12:42:40');
INSERT INTO `devonline` VALUES ('123', '3', '2', '8', '2015-11-17 12:43:00', '2015-11-17 12:43:00', '1', null, '2015-11-17 12:43:00');
INSERT INTO `devonline` VALUES ('124', '3', '2', '8', '2015-11-17 12:43:20', '2015-11-17 12:43:20', '1', null, '2015-11-17 12:43:20');
INSERT INTO `devonline` VALUES ('125', '3', '2', '8', '2015-11-17 12:43:40', '2015-11-17 12:43:40', '1', null, '2015-11-17 12:43:40');
INSERT INTO `devonline` VALUES ('126', '3', '2', '8', '2015-11-17 12:44:00', '2015-11-17 12:44:00', '1', null, '2015-11-17 12:44:00');
INSERT INTO `devonline` VALUES ('127', '3', '2', '8', '2015-11-17 12:44:20', '2015-11-17 12:44:20', '1', null, '2015-11-17 12:44:20');
INSERT INTO `devonline` VALUES ('128', '3', '2', '8', '2015-11-17 12:44:40', '2015-11-17 12:44:40', '1', null, '2015-11-17 12:44:40');
INSERT INTO `devonline` VALUES ('129', '3', '2', '8', '2015-11-17 12:45:00', '2015-11-17 12:45:00', '1', null, '2015-11-17 12:45:00');
INSERT INTO `devonline` VALUES ('130', '3', '2', '8', '2015-11-17 12:45:20', '2015-11-17 12:45:20', '1', null, '2015-11-17 12:45:20');
INSERT INTO `devonline` VALUES ('131', '3', '2', '8', '2015-11-17 12:45:40', '2015-11-17 12:45:40', '1', null, '2015-11-17 12:45:40');
INSERT INTO `devonline` VALUES ('132', '3', '2', '8', '2015-11-17 12:46:00', '2015-11-17 12:46:00', '1', null, '2015-11-17 12:46:00');
INSERT INTO `devonline` VALUES ('133', '3', '2', '8', '2015-11-17 12:46:20', '2015-11-17 12:46:20', '1', null, '2015-11-17 12:46:20');
INSERT INTO `devonline` VALUES ('134', '3', '2', '8', '2015-11-17 12:46:40', '2015-11-17 12:46:40', '1', null, '2015-11-17 12:46:40');
INSERT INTO `devonline` VALUES ('135', '3', '2', '8', '2015-11-17 12:47:00', '2015-11-17 12:47:00', '1', null, '2015-11-17 12:47:00');
INSERT INTO `devonline` VALUES ('136', '3', '2', '8', '2015-11-17 12:47:20', '2015-11-17 12:47:20', '1', null, '2015-11-17 12:47:20');
INSERT INTO `devonline` VALUES ('137', '3', '2', '8', '2015-11-17 12:47:40', '2015-11-17 12:47:40', '1', null, '2015-11-17 12:47:40');
INSERT INTO `devonline` VALUES ('138', '3', '2', '8', '2015-11-17 12:48:00', '2015-11-17 12:48:00', '1', null, '2015-11-17 12:48:00');
INSERT INTO `devonline` VALUES ('139', '3', '2', '8', '2015-11-17 12:48:20', '2015-11-17 12:48:20', '1', null, '2015-11-17 12:48:20');
INSERT INTO `devonline` VALUES ('140', '3', '2', '8', '2015-11-17 12:48:40', '2015-11-17 12:48:40', '1', null, '2015-11-17 12:48:40');
INSERT INTO `devonline` VALUES ('141', '3', '2', '8', '2015-11-17 12:49:00', '2015-11-17 12:49:00', '1', null, '2015-11-17 12:49:00');
INSERT INTO `devonline` VALUES ('142', '3', '2', '8', '2015-11-17 12:49:20', '2015-11-17 12:49:20', '1', null, '2015-11-17 12:49:20');
INSERT INTO `devonline` VALUES ('143', '3', '2', '8', '2015-11-17 12:49:40', '2015-11-17 12:49:40', '1', null, '2015-11-17 12:49:40');
INSERT INTO `devonline` VALUES ('144', '3', '2', '8', '2015-11-17 12:50:00', '2015-11-17 12:50:00', '1', null, '2015-11-17 12:50:00');
INSERT INTO `devonline` VALUES ('145', '3', '2', '8', '2015-11-17 12:50:20', '2015-11-17 12:50:20', '1', null, '2015-11-17 12:50:20');
INSERT INTO `devonline` VALUES ('146', '3', '2', '8', '2015-11-17 12:50:40', '2015-11-17 12:50:40', '1', null, '2015-11-17 12:50:40');
INSERT INTO `devonline` VALUES ('147', '3', '2', '8', '2015-11-17 12:51:00', '2015-11-17 12:51:00', '1', null, '2015-11-17 12:51:00');
INSERT INTO `devonline` VALUES ('148', '3', '2', '8', '2015-11-17 12:51:20', '2015-11-17 12:51:20', '1', null, '2015-11-17 12:51:20');
INSERT INTO `devonline` VALUES ('149', '3', '2', '8', '2015-11-17 12:51:40', '2015-11-17 12:51:40', '1', null, '2015-11-17 12:51:40');
INSERT INTO `devonline` VALUES ('150', '3', '2', '8', '2015-11-17 12:52:00', '2015-11-17 12:52:00', '1', null, '2015-11-17 12:52:00');
INSERT INTO `devonline` VALUES ('151', '3', '2', '8', '2015-11-17 12:52:20', '2015-11-17 12:52:20', '1', null, '2015-11-17 12:52:20');
INSERT INTO `devonline` VALUES ('152', '3', '2', '8', '2015-11-17 12:52:40', '2015-11-17 12:52:40', '1', null, '2015-11-17 12:52:40');
INSERT INTO `devonline` VALUES ('153', '3', '2', '8', '2015-11-17 12:53:00', '2015-11-17 12:53:00', '1', null, '2015-11-17 12:53:00');
INSERT INTO `devonline` VALUES ('154', '3', '2', '8', '2015-11-17 12:53:20', '2015-11-17 12:53:20', '1', null, '2015-11-17 12:53:20');
INSERT INTO `devonline` VALUES ('155', '3', '2', '8', '2015-11-17 12:53:40', '2015-11-17 12:53:40', '1', null, '2015-11-17 12:53:40');
INSERT INTO `devonline` VALUES ('156', '3', '2', '8', '2015-11-17 12:54:00', '2015-11-17 12:54:00', '1', null, '2015-11-17 12:54:00');
INSERT INTO `devonline` VALUES ('157', '3', '2', '8', '2015-11-17 12:54:20', '2015-11-17 12:54:20', '1', null, '2015-11-17 12:54:20');
INSERT INTO `devonline` VALUES ('158', '3', '2', '8', '2015-11-17 12:54:40', '2015-11-17 12:54:40', '1', null, '2015-11-17 12:54:40');
INSERT INTO `devonline` VALUES ('159', '3', '2', '8', '2015-11-17 12:55:00', '2015-11-17 12:55:00', '1', null, '2015-11-17 12:55:00');
INSERT INTO `devonline` VALUES ('160', '3', '2', '8', '2015-11-17 12:55:20', '2015-11-17 12:55:20', '1', null, '2015-11-17 12:55:20');
INSERT INTO `devonline` VALUES ('161', '3', '2', '8', '2015-11-17 12:55:40', '2015-11-17 12:55:40', '1', null, '2015-11-17 12:55:40');
INSERT INTO `devonline` VALUES ('162', '3', '2', '8', '2015-11-17 12:56:00', '2015-11-17 12:56:00', '1', null, '2015-11-17 12:56:00');
INSERT INTO `devonline` VALUES ('163', '3', '2', '8', '2015-11-17 12:56:20', '2015-11-17 12:56:20', '1', null, '2015-11-17 12:56:20');
INSERT INTO `devonline` VALUES ('164', '3', '2', '8', '2015-11-17 12:56:40', '2015-11-17 12:56:40', '1', null, '2015-11-17 12:56:40');
INSERT INTO `devonline` VALUES ('165', '3', '2', '8', '2015-11-17 12:57:00', '2015-11-17 12:57:00', '1', null, '2015-11-17 12:57:00');
INSERT INTO `devonline` VALUES ('166', '3', '2', '8', '2015-11-17 12:57:20', '2015-11-17 12:57:20', '1', null, '2015-11-17 12:57:20');
INSERT INTO `devonline` VALUES ('167', '3', '2', '8', '2015-11-17 12:57:40', '2015-11-17 12:57:40', '1', null, '2015-11-17 12:57:40');
INSERT INTO `devonline` VALUES ('168', '3', '2', '8', '2015-11-17 12:58:00', '2015-11-17 12:58:00', '1', null, '2015-11-17 12:58:00');
INSERT INTO `devonline` VALUES ('169', '3', '2', '8', '2015-11-17 12:58:20', '2015-11-17 12:58:20', '1', null, '2015-11-17 12:58:20');
INSERT INTO `devonline` VALUES ('170', '3', '2', '8', '2015-11-17 12:58:40', '2015-11-17 12:58:40', '1', null, '2015-11-17 12:58:40');
INSERT INTO `devonline` VALUES ('171', '3', '2', '8', '2015-11-17 12:59:00', '2015-11-17 12:59:00', '1', null, '2015-11-17 12:59:00');
INSERT INTO `devonline` VALUES ('172', '3', '2', '8', '2015-11-17 12:59:20', '2015-11-17 12:59:20', '1', null, '2015-11-17 12:59:20');
INSERT INTO `devonline` VALUES ('173', '3', '2', '8', '2015-11-17 12:59:40', '2015-11-17 12:59:40', '1', null, '2015-11-17 12:59:40');
INSERT INTO `devonline` VALUES ('174', '3', '2', '8', '2015-11-17 13:00:00', '2015-11-17 13:00:00', '1', null, '2015-11-17 13:00:00');
INSERT INTO `devonline` VALUES ('175', '3', '2', '8', '2015-11-17 13:00:20', '2015-11-17 13:00:20', '1', null, '2015-11-17 13:00:20');
INSERT INTO `devonline` VALUES ('176', '3', '2', '8', '2015-11-17 13:00:40', '2015-11-17 13:00:40', '1', null, '2015-11-17 13:00:40');
INSERT INTO `devonline` VALUES ('177', '3', '2', '8', '2015-11-17 13:01:00', '2015-11-17 13:01:00', '1', null, '2015-11-17 13:01:00');
INSERT INTO `devonline` VALUES ('178', '3', '2', '8', '2015-11-17 13:01:20', '2015-11-17 13:01:20', '1', null, '2015-11-17 13:01:20');
INSERT INTO `devonline` VALUES ('179', '3', '2', '8', '2015-11-17 13:01:40', '2015-11-17 13:01:40', '1', null, '2015-11-17 13:01:40');
INSERT INTO `devonline` VALUES ('180', '3', '2', '8', '2015-11-17 13:02:00', '2015-11-17 13:02:00', '1', null, '2015-11-17 13:02:00');
INSERT INTO `devonline` VALUES ('181', '3', '2', '8', '2015-11-17 13:02:20', '2015-11-17 13:02:20', '1', null, '2015-11-17 13:02:20');
INSERT INTO `devonline` VALUES ('182', '3', '2', '8', '2015-11-17 13:02:40', '2015-11-17 13:02:40', '1', null, '2015-11-17 13:02:40');
INSERT INTO `devonline` VALUES ('183', '3', '2', '8', '2015-11-17 13:03:00', '2015-11-17 13:03:00', '1', null, '2015-11-17 13:03:00');
INSERT INTO `devonline` VALUES ('184', '3', '2', '8', '2015-11-17 13:03:20', '2015-11-17 13:03:20', '1', null, '2015-11-17 13:03:20');
INSERT INTO `devonline` VALUES ('185', '3', '2', '8', '2015-11-17 13:03:40', '2015-11-17 13:03:40', '1', null, '2015-11-17 13:03:40');
INSERT INTO `devonline` VALUES ('186', '3', '2', '8', '2015-11-17 13:04:00', '2015-11-17 13:04:00', '1', null, '2015-11-17 13:04:00');
INSERT INTO `devonline` VALUES ('187', '3', '2', '8', '2015-11-17 13:04:20', '2015-11-17 13:04:20', '1', null, '2015-11-17 13:04:20');
INSERT INTO `devonline` VALUES ('188', '3', '2', '8', '2015-11-17 13:04:40', '2015-11-17 13:04:40', '1', null, '2015-11-17 13:04:40');
INSERT INTO `devonline` VALUES ('189', '3', '2', '8', '2015-11-17 13:05:00', '2015-11-17 13:05:00', '1', null, '2015-11-17 13:05:00');
INSERT INTO `devonline` VALUES ('190', '3', '2', '8', '2015-11-17 13:05:20', '2015-11-17 13:05:20', '1', null, '2015-11-17 13:05:20');
INSERT INTO `devonline` VALUES ('191', '3', '2', '8', '2015-11-17 13:05:40', '2015-11-17 13:05:40', '1', null, '2015-11-17 13:05:40');
INSERT INTO `devonline` VALUES ('192', '3', '2', '8', '2015-11-17 13:06:00', '2015-11-17 13:06:00', '1', null, '2015-11-17 13:06:00');
INSERT INTO `devonline` VALUES ('193', '3', '2', '8', '2015-11-17 13:06:20', '2015-11-17 13:06:20', '1', null, '2015-11-17 13:06:20');
INSERT INTO `devonline` VALUES ('194', '3', '2', '8', '2015-11-17 13:06:40', '2015-11-17 13:06:40', '1', null, '2015-11-17 13:06:40');
INSERT INTO `devonline` VALUES ('195', '3', '2', '8', '2015-11-17 13:07:00', '2015-11-17 13:07:00', '1', null, '2015-11-17 13:07:00');
INSERT INTO `devonline` VALUES ('196', '3', '2', '8', '2015-11-17 13:07:20', '2015-11-17 13:07:20', '1', null, '2015-11-17 13:07:20');
INSERT INTO `devonline` VALUES ('197', '3', '2', '8', '2015-11-17 13:07:40', '2015-11-17 13:07:40', '1', null, '2015-11-17 13:07:40');
INSERT INTO `devonline` VALUES ('198', '3', '2', '8', '2015-11-17 13:08:00', '2015-11-17 13:08:00', '1', null, '2015-11-17 13:08:00');
INSERT INTO `devonline` VALUES ('199', '3', '2', '8', '2015-11-17 13:08:20', '2015-11-17 13:08:20', '1', null, '2015-11-17 13:08:20');
INSERT INTO `devonline` VALUES ('200', '3', '2', '8', '2015-11-17 13:08:40', '2015-11-17 13:08:40', '1', null, '2015-11-17 13:08:40');
INSERT INTO `devonline` VALUES ('201', '3', '2', '8', '2015-11-17 13:09:00', '2015-11-17 13:09:00', '1', null, '2015-11-17 13:09:00');
INSERT INTO `devonline` VALUES ('202', '3', '2', '8', '2015-11-17 13:09:20', '2015-11-17 13:09:20', '1', null, '2015-11-17 13:09:20');
INSERT INTO `devonline` VALUES ('203', '3', '2', '8', '2015-11-17 13:09:40', '2015-11-17 13:09:40', '1', null, '2015-11-17 13:09:40');
INSERT INTO `devonline` VALUES ('204', '3', '2', '8', '2015-11-17 13:10:00', '2015-11-17 13:10:00', '1', null, '2015-11-17 13:10:00');
INSERT INTO `devonline` VALUES ('205', '3', '2', '8', '2015-11-17 13:10:20', '2015-11-17 13:10:20', '1', null, '2015-11-17 13:10:20');
INSERT INTO `devonline` VALUES ('206', '3', '2', '8', '2015-11-17 13:10:40', '2015-11-17 13:10:40', '1', null, '2015-11-17 13:10:40');
INSERT INTO `devonline` VALUES ('207', '3', '2', '8', '2015-11-17 13:11:00', '2015-11-17 13:11:00', '1', null, '2015-11-17 13:11:00');
INSERT INTO `devonline` VALUES ('208', '3', '2', '8', '2015-11-17 13:11:20', '2015-11-17 13:11:20', '1', null, '2015-11-17 13:11:20');
INSERT INTO `devonline` VALUES ('209', '3', '2', '8', '2015-11-17 13:11:40', '2015-11-17 13:11:40', '1', null, '2015-11-17 13:11:40');
INSERT INTO `devonline` VALUES ('210', '3', '2', '8', '2015-11-17 13:12:00', '2015-11-17 13:12:00', '1', null, '2015-11-17 13:12:00');
INSERT INTO `devonline` VALUES ('211', '3', '2', '8', '2015-11-17 13:12:20', '2015-11-17 13:12:20', '1', null, '2015-11-17 13:12:20');
INSERT INTO `devonline` VALUES ('212', '3', '2', '8', '2015-11-17 13:12:40', '2015-11-17 13:12:40', '1', null, '2015-11-17 13:12:40');
INSERT INTO `devonline` VALUES ('213', '3', '2', '8', '2015-11-17 13:13:00', '2015-11-17 13:13:00', '1', null, '2015-11-17 13:13:00');
INSERT INTO `devonline` VALUES ('214', '3', '2', '8', '2015-11-17 13:13:20', '2015-11-17 13:13:20', '1', null, '2015-11-17 13:13:20');
INSERT INTO `devonline` VALUES ('215', '3', '2', '8', '2015-11-17 13:13:40', '2015-11-17 13:13:40', '1', null, '2015-11-17 13:13:40');
INSERT INTO `devonline` VALUES ('216', '3', '2', '8', '2015-11-17 13:14:00', '2015-11-17 13:14:00', '1', null, '2015-11-17 13:14:00');
INSERT INTO `devonline` VALUES ('217', '3', '2', '8', '2015-11-17 13:14:20', '2015-11-17 13:14:20', '1', null, '2015-11-17 13:14:20');
INSERT INTO `devonline` VALUES ('218', '3', '2', '8', '2015-11-17 13:14:40', '2015-11-17 13:14:40', '1', null, '2015-11-17 13:14:40');
INSERT INTO `devonline` VALUES ('219', '3', '2', '8', '2015-11-17 13:15:00', '2015-11-17 13:15:00', '1', null, '2015-11-17 13:15:00');
INSERT INTO `devonline` VALUES ('220', '3', '2', '8', '2015-11-17 13:15:20', '2015-11-17 13:15:20', '1', null, '2015-11-17 13:15:20');
INSERT INTO `devonline` VALUES ('221', '3', '2', '8', '2015-11-17 13:15:40', '2015-11-17 13:15:40', '1', null, '2015-11-17 13:15:40');
INSERT INTO `devonline` VALUES ('222', '3', '2', '8', '2015-11-17 13:16:00', '2015-11-17 13:16:00', '1', null, '2015-11-17 13:16:00');
INSERT INTO `devonline` VALUES ('223', '3', '2', '8', '2015-11-17 13:16:20', '2015-11-17 13:16:20', '1', null, '2015-11-17 13:16:20');
INSERT INTO `devonline` VALUES ('224', '3', '2', '8', '2015-11-17 13:16:40', '2015-11-17 13:16:40', '1', null, '2015-11-17 13:16:40');
INSERT INTO `devonline` VALUES ('225', '3', '2', '8', '2015-11-17 13:17:00', '2015-11-17 13:17:00', '1', null, '2015-11-17 13:17:00');
INSERT INTO `devonline` VALUES ('226', '3', '2', '8', '2015-11-17 13:17:20', '2015-11-17 13:17:20', '1', null, '2015-11-17 13:17:20');
INSERT INTO `devonline` VALUES ('227', '3', '2', '8', '2015-11-17 13:17:40', '2015-11-17 13:17:40', '1', null, '2015-11-17 13:17:40');
INSERT INTO `devonline` VALUES ('228', '3', '2', '8', '2015-11-17 13:18:00', '2015-11-17 13:18:00', '1', null, '2015-11-17 13:18:00');
INSERT INTO `devonline` VALUES ('229', '3', '2', '8', '2015-11-17 13:18:20', '2015-11-17 13:18:20', '1', null, '2015-11-17 13:18:20');
INSERT INTO `devonline` VALUES ('230', '3', '2', '8', '2015-11-17 13:18:40', '2015-11-17 13:18:40', '1', null, '2015-11-17 13:18:40');
INSERT INTO `devonline` VALUES ('231', '3', '2', '8', '2015-11-17 13:19:00', '2015-11-17 13:19:00', '1', null, '2015-11-17 13:19:00');
INSERT INTO `devonline` VALUES ('232', '3', '2', '8', '2015-11-17 13:19:20', '2015-11-17 13:19:20', '1', null, '2015-11-17 13:19:20');
INSERT INTO `devonline` VALUES ('233', '3', '2', '8', '2015-11-17 13:19:40', '2015-11-17 13:19:40', '1', null, '2015-11-17 13:19:40');
INSERT INTO `devonline` VALUES ('234', '3', '2', '8', '2015-11-17 13:20:00', '2015-11-17 13:20:00', '1', null, '2015-11-17 13:20:00');
INSERT INTO `devonline` VALUES ('235', '3', '2', '8', '2015-11-17 13:20:20', '2015-11-17 13:20:20', '1', null, '2015-11-17 13:20:20');
INSERT INTO `devonline` VALUES ('236', '3', '2', '8', '2015-11-17 13:20:40', '2015-11-17 13:20:40', '1', null, '2015-11-17 13:20:40');
INSERT INTO `devonline` VALUES ('237', '3', '2', '8', '2015-11-17 13:21:00', '2015-11-17 13:21:00', '1', null, '2015-11-17 13:21:00');
INSERT INTO `devonline` VALUES ('238', '3', '2', '8', '2015-11-17 13:21:20', '2015-11-17 13:21:20', '1', null, '2015-11-17 13:21:20');
INSERT INTO `devonline` VALUES ('239', '3', '2', '8', '2015-11-17 13:21:40', '2015-11-17 13:21:40', '1', null, '2015-11-17 13:21:40');
INSERT INTO `devonline` VALUES ('240', '3', '2', '8', '2015-11-17 13:22:00', '2015-11-17 13:22:00', '1', null, '2015-11-17 13:22:00');
INSERT INTO `devonline` VALUES ('241', '3', '2', '8', '2015-11-17 13:22:20', '2015-11-17 13:22:20', '1', null, '2015-11-17 13:22:20');
INSERT INTO `devonline` VALUES ('242', '3', '2', '8', '2015-11-17 13:22:40', '2015-11-17 13:22:40', '1', null, '2015-11-17 13:22:40');
INSERT INTO `devonline` VALUES ('243', '3', '2', '8', '2015-11-17 13:23:00', '2015-11-17 13:23:00', '1', null, '2015-11-17 13:23:00');
INSERT INTO `devonline` VALUES ('244', '3', '2', '8', '2015-11-17 13:23:20', '2015-11-17 13:23:20', '1', null, '2015-11-17 13:23:20');
INSERT INTO `devonline` VALUES ('245', '3', '2', '8', '2015-11-17 13:23:40', '2015-11-17 13:23:40', '1', null, '2015-11-17 13:23:40');
INSERT INTO `devonline` VALUES ('246', '3', '2', '8', '2015-11-17 13:24:00', '2015-11-17 13:24:00', '1', null, '2015-11-17 13:24:00');
INSERT INTO `devonline` VALUES ('247', '3', '2', '8', '2015-11-17 13:24:20', '2015-11-17 13:24:20', '1', null, '2015-11-17 13:24:20');
INSERT INTO `devonline` VALUES ('248', '3', '2', '8', '2015-11-17 13:24:40', '2015-11-17 13:24:40', '1', null, '2015-11-17 13:24:40');
INSERT INTO `devonline` VALUES ('249', '3', '2', '8', '2015-11-17 13:25:00', '2015-11-17 13:25:00', '1', null, '2015-11-17 13:25:00');
INSERT INTO `devonline` VALUES ('250', '3', '2', '8', '2015-11-17 13:25:20', '2015-11-17 13:25:20', '1', null, '2015-11-17 13:25:20');
INSERT INTO `devonline` VALUES ('251', '3', '2', '8', '2015-11-17 13:25:40', '2015-11-17 13:25:40', '1', null, '2015-11-17 13:25:40');
INSERT INTO `devonline` VALUES ('252', '3', '2', '8', '2015-11-17 13:26:00', '2015-11-17 13:26:00', '1', null, '2015-11-17 13:26:00');
INSERT INTO `devonline` VALUES ('253', '3', '2', '8', '2015-11-17 13:26:20', '2015-11-17 13:26:20', '1', null, '2015-11-17 13:26:20');
INSERT INTO `devonline` VALUES ('254', '3', '2', '8', '2015-11-17 13:26:40', '2015-11-17 13:26:40', '1', null, '2015-11-17 13:26:40');
INSERT INTO `devonline` VALUES ('255', '3', '2', '8', '2015-11-17 13:27:00', '2015-11-17 13:27:00', '1', null, '2015-11-17 13:27:00');
INSERT INTO `devonline` VALUES ('256', '3', '2', '8', '2015-11-17 13:27:20', '2015-11-17 13:27:20', '1', null, '2015-11-17 13:27:20');
INSERT INTO `devonline` VALUES ('257', '3', '2', '8', '2015-11-17 13:27:40', '2015-11-17 13:27:40', '1', null, '2015-11-17 13:27:40');
INSERT INTO `devonline` VALUES ('258', '3', '2', '8', '2015-11-17 13:28:00', '2015-11-17 13:28:00', '1', null, '2015-11-17 13:28:00');
INSERT INTO `devonline` VALUES ('259', '3', '2', '8', '2015-11-17 13:28:20', '2015-11-17 13:28:20', '1', null, '2015-11-17 13:28:20');
INSERT INTO `devonline` VALUES ('260', '3', '2', '8', '2015-11-17 13:28:40', '2015-11-17 13:28:40', '1', null, '2015-11-17 13:28:40');
INSERT INTO `devonline` VALUES ('261', '3', '2', '8', '2015-11-17 13:29:00', '2015-11-17 13:29:00', '1', null, '2015-11-17 13:29:00');
INSERT INTO `devonline` VALUES ('262', '3', '2', '8', '2015-11-17 13:29:20', '2015-11-17 13:29:20', '1', null, '2015-11-17 13:29:20');
INSERT INTO `devonline` VALUES ('263', '3', '2', '8', '2015-11-17 13:29:40', '2015-11-17 13:29:40', '1', null, '2015-11-17 13:29:40');
INSERT INTO `devonline` VALUES ('264', '3', '2', '8', '2015-11-17 13:30:00', '2015-11-17 13:30:00', '1', null, '2015-11-17 13:30:00');
INSERT INTO `devonline` VALUES ('265', '3', '2', '8', '2015-11-17 13:30:20', '2015-11-17 13:30:20', '1', null, '2015-11-17 13:30:20');
INSERT INTO `devonline` VALUES ('266', '3', '2', '8', '2015-11-17 13:30:40', '2015-11-17 13:30:40', '1', null, '2015-11-17 13:30:40');
INSERT INTO `devonline` VALUES ('267', '3', '2', '8', '2015-11-17 13:31:00', '2015-11-17 13:31:00', '1', null, '2015-11-17 13:31:00');
INSERT INTO `devonline` VALUES ('268', '3', '2', '8', '2015-11-17 13:31:20', '2015-11-17 13:31:20', '1', null, '2015-11-17 13:31:20');
INSERT INTO `devonline` VALUES ('269', '4', '2', '9', '2015-11-17 15:38:30', '2015-11-17 15:38:42', '0', null, '2015-11-17 15:38:51');
INSERT INTO `devonline` VALUES ('270', '4', '2', '9', '2015-11-17 15:40:29', '2015-11-17 15:40:30', '0', null, '2015-11-17 15:40:31');
INSERT INTO `devonline` VALUES ('271', '4', '2', '9', '2015-11-17 15:47:06', '2015-11-17 15:47:10', '0', null, '2015-11-17 15:47:11');
INSERT INTO `devonline` VALUES ('272', '4', '2', '9', '1970-01-01 00:00:05', '2015-11-17 16:04:47', '0', null, '2015-11-17 16:04:51');
INSERT INTO `devonline` VALUES ('273', '4', '2', '9', '1970-01-01 00:00:02', '2015-11-17 16:05:54', '0', null, '2015-11-17 16:06:01');
INSERT INTO `devonline` VALUES ('274', '4', '2', '9', '1970-01-01 00:00:02', '2015-11-17 16:07:57', '0', null, '2015-11-17 16:08:01');
INSERT INTO `devonline` VALUES ('275', '4', '2', '9', '2015-11-17 16:13:11', '2015-11-17 16:13:14', '0', null, '2015-11-17 16:13:21');
INSERT INTO `devonline` VALUES ('276', '4', '2', '9', '2015-11-17 16:16:00', '2015-11-17 16:16:01', '0', null, '2015-11-17 16:16:11');
INSERT INTO `devonline` VALUES ('277', '4', '2', '9', '2015-11-17 16:26:18', '2015-11-17 16:26:18', '0', null, '2015-11-17 16:26:20');
INSERT INTO `devonline` VALUES ('278', '4', '2', '9', '2015-11-17 16:27:59', '2015-11-17 16:28:00', '0', null, '2015-11-17 16:28:01');
INSERT INTO `devonline` VALUES ('279', '4', '2', '9', '1970-01-01 00:00:02', '2015-11-17 17:08:11', '0', null, '2015-11-17 17:08:21');
INSERT INTO `devonline` VALUES ('280', '4', '2', '9', '1970-01-01 00:00:02', '2015-11-17 17:12:19', '0', null, '2015-11-17 17:12:21');
INSERT INTO `devonline` VALUES ('281', '4', '2', '9', '1970-01-01 00:00:05', '2015-11-17 17:15:02', '0', null, '2015-11-17 17:15:11');
INSERT INTO `devonline` VALUES ('282', '4', '2', '9', '1970-01-01 00:00:05', '2015-11-17 17:23:18', '0', null, '2015-11-17 17:23:21');
INSERT INTO `devonline` VALUES ('283', '4', '2', '9', '1970-01-01 00:00:05', '2015-11-18 10:50:57', '0', null, '2015-11-18 10:51:01');

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
INSERT INTO `energytype` VALUES ('1', '1', '1', '1', '2015-12-15 22:01:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='05 仪表信息表';

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
INSERT INTO `meter` VALUES ('8', '/jj2/com/1', null, null, null, null, '3', null, '1', null, '2015-11-17 11:43:40', '2015-11-17 11:43:40');
INSERT INTO `meter` VALUES ('9', '/test/ele/2', null, null, null, null, '4', null, '1', null, '2015-11-17 15:38:42', '2015-11-17 15:38:42');
INSERT INTO `meter` VALUES ('10', '/test/mt2', null, null, null, null, '5', null, '1', null, '2015-12-16 09:47:11', '2015-12-16 09:47:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='08 仪表型号信息表';

-- ----------------------------
-- Records of metertype
-- ----------------------------
INSERT INTO `metertype` VALUES ('1', '/e/dae/smb350_8', 'SMB350-8路多回路电表', null, '2', '0', '2015-11-03 10:19:07', '2015-11-03 10:19:11');
INSERT INTO `metertype` VALUES ('2', '/e/dae/smb350_4', 'SMB350-4路多回路电表', null, '2', '0', '2015-11-03 10:20:02', '2015-11-03 10:20:05');
INSERT INTO `metertype` VALUES ('3', '/e/lckj/ex8', 'EX8综合电力监控仪表', null, '1', '0', '2015-11-03 10:22:36', '2015-11-03 10:22:39');
INSERT INTO `metertype` VALUES ('4', '/watt/wxj-pv-i', '/watt/wxj-pv-i', null, '0', '1', '2015-12-15 17:25:39', '2015-12-15 17:25:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='07 仪表厂家信息表';

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
INSERT INTO `restserver` VALUES ('1', 'http://localhost:8080/EosEnv/rest', '2015-09-28 22:56:12', '2015-09-28 22:56:16');

-- ----------------------------
-- Table structure for subsysinfo
-- ----------------------------
DROP TABLE IF EXISTS `subsysinfo`;
CREATE TABLE `subsysinfo` (
  `subsysId` int(11) NOT NULL AUTO_INCREMENT COMMENT '子系统ID',
  `subsysName` varchar(200) NOT NULL COMMENT '子系统名称',
  PRIMARY KEY (`subsysId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='11 子系统信息';

-- ----------------------------
-- Records of subsysinfo
-- ----------------------------
INSERT INTO `subsysinfo` VALUES ('1', '机场电力');
INSERT INTO `subsysinfo` VALUES ('2', '远程抄表');
INSERT INTO `subsysinfo` VALUES ('3', '电力监控');
INSERT INTO `subsysinfo` VALUES ('4', '能耗监测');
INSERT INTO `subsysinfo` VALUES ('5', '楼宇自控系统');
INSERT INTO `subsysinfo` VALUES ('6', '机房群控系统');
INSERT INTO `subsysinfo` VALUES ('7', '照明控制系统');

-- ----------------------------
-- View structure for v_dataontime
-- ----------------------------
DROP VIEW IF EXISTS `v_dataontime`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_dataontime` AS SELECT
	A.doId,
  A.currentTime,
	B.dataUrl,
  A.receTime,
  A.bpSign,
  A.ivSign,
  A.p1Pv,
  A.p1Err,
  A.p1Dv,
  A.p1Rsz
FROM
	dataontime AS A
left JOIN dataurl AS B ON A.dataId = B.dataId ;

-- ----------------------------
-- View structure for v_dataquality
-- ----------------------------
DROP VIEW IF EXISTS `v_dataquality`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_dataquality` AS SELECT
  A.qualityId,
	B.dataUrl,
	A.qualityTime,
	A.planCollectCnt,
	A.realCollectCnt,
	A.realNormalCnt,
	A.retranNormalCnt,
	A.dataRepairCnt,
	A.dataErrCnt,
	A.dataLoseCnt,
	A.realCollectCnt AS commValid,
	(
		A.realNormalCnt + A.retranNormalCnt
	) AS dataValid,
	(
		A.realNormalCnt + A.retranNormalCnt + A.dataRepairCnt
	) AS dataQuality
FROM
	dataquality AS A
LEFT JOIN dataurl AS B ON A.dataId = B.dataId ;
