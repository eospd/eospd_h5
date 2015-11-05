package com.eospd.bean;

import java.sql.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Index;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.entity.annotation.TableIndexes;

/*
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
  `p1Pv` decimal(18,4) DEFAULT NULL COMMENT '属性1当前值',
  `p1Err` int(11) DEFAULT NULL COMMENT '属性1错误标志，0-正常',
  `p1Dv` decimal(18,4) DEFAULT NULL COMMENT '属性1插值',
  `p1Rsz` int(11) DEFAULT NULL COMMENT '属性1数据满刻度归0标志',
  `insertTime` datetime NOT NULL COMMENT '入库时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间',
  `p2Pv` decimal(18,4) DEFAULT NULL,
  `p2Err` int(11) DEFAULT NULL,
  `p2Dv` decimal(18,4) DEFAULT NULL,
  `p2Rsz` int(11) DEFAULT NULL,
  PRIMARY KEY (`doId`),
  KEY `ctIndex` (`currentTime`) USING BTREE,
  KEY `dlIndex` (`dataLayer`) USING BTREE,
  KEY `didIndex` (`dataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='2 数据历史记录';

 */

@Table("dataontime")
@TableIndexes(value = { @Index(fields = { "currentTime" }, name = "ctIndex"),
		@Index(fields = { "dataLayer" }, name = "dlIndex"), @Index(fields = { "dataId" }, name = "didIndex") })

public class DataOnTime {
	@Id
	private int doId;

	@Column
	private int dataLayer;

	@Column
	private int dcId;

	@One(target = Dc.class, field = "dcId")
	private Dc dc;

	@Column
	private Date currentTime;
	@Column
	private Date receTime;
	@Column
	private int timeInterval;
	@Column
	private int bpSign;
	@Column
	private int dataId;
	@Column
	private int dataTypeId;
	@Column
	private int ivSign;
	@Column
	private double p1Pv;
	@Column
	private int p1Err;
	@Column
	private double p1Dv;
	@Column
	private int p1Rsz;
	@Column
	private Date insertTime;
	@Column
	private Date updateTime;
	@Column
	private double p2Pv;
	@Column
	private int p2Err;
	@Column
	private double p2Dv;
	@Column
	private int p2Rsz;

	public Dc getDc() {
		return dc;
	}

	public void setDc(Dc dc) {
		this.dc = dc;
	}

	public int getDoId() {
		return doId;
	}

	public void setDoId(int doId) {
		this.doId = doId;
	}

	public int getDataLayer() {
		return dataLayer;
	}

	public void setDataLayer(int dataLayer) {
		this.dataLayer = dataLayer;
	}

	public int getDcId() {
		return dcId;
	}

	public void setDcId(int dcId) {
		this.dcId = dcId;
	}

	public Date getCurrentTime() {
		return currentTime;
	}

	public void setCurrentTime(Date currentTime) {
		this.currentTime = currentTime;
	}

	public Date getCreceTime() {
		return receTime;
	}

	public void setCreceTime(Date creceTime) {
		this.receTime = creceTime;
	}

	public int getTimeInterval() {
		return timeInterval;
	}

	public void setTimeInterval(int timeInterval) {
		this.timeInterval = timeInterval;
	}

	public int getBpSign() {
		return bpSign;
	}

	public void setBpSign(int bpSign) {
		this.bpSign = bpSign;
	}

	public int getDataId() {
		return dataId;
	}

	public void setDataId(int dataId) {
		this.dataId = dataId;
	}

	public int getDataTypeId() {
		return dataTypeId;
	}

	public void setDataTypeId(int dataTypeId) {
		this.dataTypeId = dataTypeId;
	}

	public int getIvSign() {
		return ivSign;
	}

	public void setIvSign(int ivSign) {
		this.ivSign = ivSign;
	}

	public double getP1Pv() {
		return p1Pv;
	}

	public void setP1Pv(double p1Pv) {
		this.p1Pv = p1Pv;
	}

	public int getP1Err() {
		return p1Err;
	}

	public void setP1Err(int p1Err) {
		this.p1Err = p1Err;
	}

	public double getP1Dv() {
		return p1Dv;
	}

	public void setP1Dv(double p1Dv) {
		this.p1Dv = p1Dv;
	}

	public int getP1Rsz() {
		return p1Rsz;
	}

	public void setP1Rsz(int p1Rsz) {
		this.p1Rsz = p1Rsz;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public double getP2Pv() {
		return p2Pv;
	}

	public void setP2Pv(double p2Pv) {
		this.p2Pv = p2Pv;
	}

	public int getP2Err() {
		return p2Err;
	}

	public void setP2Err(int p2Err) {
		this.p2Err = p2Err;
	}

	public double getP2Dv() {
		return p2Dv;
	}

	public void setP2Dv(double p2Dv) {
		this.p2Dv = p2Dv;
	}

	public int getP2Rsz() {
		return p2Rsz;
	}

	public void setP2Rsz(int p2Rsz) {
		this.p2Rsz = p2Rsz;
	}

}
