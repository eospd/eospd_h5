package com.eospd.bean;

import java.sql.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Index;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.entity.annotation.TableIndexes;

/*
 * CREATE TABLE `devonline` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='6 设备在线状态历史记录表';
 */
@Table("devonline")
@TableIndexes(value = { @Index(fields = { "deviceType" }, name = "dtIndex"),
		@Index(fields = { "deviceId" }, name = "didIndex"), @Index(fields = { "currentTime" }, name = "ctIndex") })
public class DevOnline {
	@Id
	private int devolId;
	@Column
	private int dcId;
	@Column
	private int deviceType;
	@Column
	private int deviceId;
	@Column
	private Date currentTime;
	@Column
	private int deviceStatus;
	@Column
	private int bpSign;
	@Column
	private Date insertTime;
	
	public int getDevolId() {
		return devolId;
	}
	public void setDevolId(int devolId) {
		this.devolId = devolId;
	}
	public int getDcId() {
		return dcId;
	}
	public void setDcId(int dcId) {
		this.dcId = dcId;
	}
	public int getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(int deviceType) {
		this.deviceType = deviceType;
	}
	public int getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}
	public Date getCurrentTime() {
		return currentTime;
	}
	public void setCurrentTime(Date currentTime) {
		this.currentTime = currentTime;
	}
	public int getDeviceStatus() {
		return deviceStatus;
	}
	public void setDeviceStatus(int deviceStatus) {
		this.deviceStatus = deviceStatus;
	}
	public int getBpSign() {
		return bpSign;
	}
	public void setBpSign(int bpSign) {
		this.bpSign = bpSign;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
}
