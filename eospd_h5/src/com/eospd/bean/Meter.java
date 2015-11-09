package com.eospd.bean;

import java.sql.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/*
 * CREATE TABLE `meter` (
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
 */
@Table("meter")
public class Meter {

	@Id
	private int deviceId;
	@Column
	private String deviceUrl;
	@Column
	private int dataTypeId;
	@Column
	private String deviceCommAddr;
	@Column
	private String location;
	@Column
	private String desc;
	@Column
	private int dcId;
	@Column
	private int dcChannelSn;
	@Column
	private int autoSign;
	@Column
	private Date installTime;
	@Column
	private Date insertTime;
	@Column
	private Date updateTime;

	public int getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}

	public String getDeviceUrl() {
		return deviceUrl;
	}

	public void setDeviceUrl(String deviceUrl) {
		this.deviceUrl = deviceUrl;
	}

	public int getDataTypeId() {
		return dataTypeId;
	}

	public void setDataTypeId(int dataTypeId) {
		this.dataTypeId = dataTypeId;
	}

	public String getDeviceCommAddr() {
		return deviceCommAddr;
	}

	public void setDeviceCommAddr(String deviceCommAddr) {
		this.deviceCommAddr = deviceCommAddr;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getDcId() {
		return dcId;
	}

	public void setDcId(int dcId) {
		this.dcId = dcId;
	}

	public int getDcChannelSn() {
		return dcChannelSn;
	}

	public void setDcChannelSn(int dcChannelSn) {
		this.dcChannelSn = dcChannelSn;
	}

	public int getAutoSign() {
		return autoSign;
	}

	public void setAutoSign(int autoSign) {
		this.autoSign = autoSign;
	}

	public Date getInstallTime() {
		return installTime;
	}

	public void setInstallTime(Date installTime) {
		this.installTime = installTime;
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
}
