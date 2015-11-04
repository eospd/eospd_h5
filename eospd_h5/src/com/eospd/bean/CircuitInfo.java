package com.eospd.bean;
/*
 
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
  PRIMARY KEY (`circuitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='3 电支路信息';
 */

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("circuitinfo")
public class CircuitInfo {
	@Id
	private int circuitId;
	@Column
	private String circuitUrl;
	@Column
	private String circuitName;
	@Column
	private String location;
	@Column
	private int switchRatedC;
	@Column
	private int levelV;
	@Column
	private Double designPower;
	@Column
	private int powerPhase;
	@Column
	private int parentId;
	@Column
	private int dynamicParent1Id;
	@Column
	private int dynamicParent2Id;
	public int getCircuitId() {
		return circuitId;
	}
	public void setCircuitId(int circuitId) {
		this.circuitId = circuitId;
	}
	public String getCircuitUrl() {
		return circuitUrl;
	}
	public void setCircuitUrl(String circuitUrl) {
		this.circuitUrl = circuitUrl;
	}
	public String getCircuitName() {
		return circuitName;
	}
	public void setCircuitName(String circuitName) {
		this.circuitName = circuitName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getSwitchRatedC() {
		return switchRatedC;
	}
	public void setSwitchRatedC(int switchRatedC) {
		this.switchRatedC = switchRatedC;
	}
	public int getLevelV() {
		return levelV;
	}
	public void setLevelV(int levelV) {
		this.levelV = levelV;
	}
	public Double getDesignPower() {
		return designPower;
	}
	public void setDesignPower(Double designPower) {
		this.designPower = designPower;
	}
	public int getPowerPhase() {
		return powerPhase;
	}
	public void setPowerPhase(int powerPhase) {
		this.powerPhase = powerPhase;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getDynamicParent1Id() {
		return dynamicParent1Id;
	}
	public void setDynamicParent1Id(int dynamicParent1Id) {
		this.dynamicParent1Id = dynamicParent1Id;
	}
	public int getDynamicParent2Id() {
		return dynamicParent2Id;
	}
	public void setDynamicParent2Id(int dynamicParent2Id) {
		this.dynamicParent2Id = dynamicParent2Id;
	}
}
